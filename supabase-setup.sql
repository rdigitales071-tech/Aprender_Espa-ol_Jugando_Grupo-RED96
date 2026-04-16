-- ════════════════════════════════════════════════════════════════════════════
-- CONFIGURACIÓN DE BASE DE DATOS PARA EDUREPOSITORIO
-- ════════════════════════════════════════════════════════════════════════════
-- Este archivo contiene todas las tablas y configuraciones necesarias
-- para ejecutar en Supabase SQL Editor

-- ════════════════════════════════════════════════════════════════════════════
-- 1. TABLA DE USUARIOS (Perfil extendido)
-- ════════════════════════════════════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('admin', 'teacher', 'student')),
  institution TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar Row Level Security (RLS)
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Políticas de seguridad para users
CREATE POLICY "Usuarios pueden ver todos los perfiles"
  ON public.users FOR SELECT
  USING (true);

CREATE POLICY "Usuarios pueden actualizar su propio perfil"
  ON public.users FOR UPDATE
  USING (auth.uid() = id);

CREATE POLICY "Usuarios pueden insertar su propio perfil"
  ON public.users FOR INSERT
  WITH CHECK (auth.uid() = id);

-- ════════════════════════════════════════════════════════════════════════════
-- 2. TABLA DE PORTALES
-- ════════════════════════════════════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS public.portals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  institution TEXT NOT NULL,
  owner_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar Row Level Security
ALTER TABLE public.portals ENABLE ROW LEVEL SECURITY;

-- Políticas de seguridad para portals
CREATE POLICY "Todos pueden ver portales"
  ON public.portals FOR SELECT
  USING (true);

CREATE POLICY "Solo admin y teachers pueden crear portales"
  ON public.portals FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.users
      WHERE id = auth.uid()
      AND role IN ('admin', 'teacher')
    )
  );

CREATE POLICY "Solo el propietario puede actualizar su portal"
  ON public.portals FOR UPDATE
  USING (auth.uid() = owner_id);

CREATE POLICY "Solo el propietario puede eliminar su portal"
  ON public.portals FOR DELETE
  USING (auth.uid() = owner_id);

-- ════════════════════════════════════════════════════════════════════════════
-- 3. TABLA DE RECURSOS
-- ════════════════════════════════════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS public.resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  portal_id UUID NOT NULL REFERENCES public.portals(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  type TEXT NOT NULL CHECK (type IN ('video', 'imagen', 'simple', 'lectura_multiple', 'quiz')),
  
  -- Campos específicos por tipo
  video_url TEXT,
  image_url TEXT,
  caption TEXT,
  html_content TEXT,
  text_content TEXT,
  questions JSONB,
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar Row Level Security
ALTER TABLE public.resources ENABLE ROW LEVEL SECURITY;

-- Políticas de seguridad para resources
CREATE POLICY "Todos pueden ver recursos"
  ON public.resources FOR SELECT
  USING (true);

CREATE POLICY "Solo el propietario del portal puede crear recursos"
  ON public.resources FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.portals
      WHERE id = portal_id
      AND owner_id = auth.uid()
    )
  );

CREATE POLICY "Solo el propietario del portal puede actualizar recursos"
  ON public.resources FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.portals
      WHERE id = portal_id
      AND owner_id = auth.uid()
    )
  );

CREATE POLICY "Solo el propietario del portal puede eliminar recursos"
  ON public.resources FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.portals
      WHERE id = portal_id
      AND owner_id = auth.uid()
    )
  );

-- ════════════════════════════════════════════════════════════════════════════
-- 4. ÍNDICES PARA MEJORAR RENDIMIENTO
-- ════════════════════════════════════════════════════════════════════════════
CREATE INDEX IF NOT EXISTS idx_portals_owner ON public.portals(owner_id);
CREATE INDEX IF NOT EXISTS idx_portals_created ON public.portals(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_resources_portal ON public.resources(portal_id);
CREATE INDEX IF NOT EXISTS idx_resources_type ON public.resources(type);
CREATE INDEX IF NOT EXISTS idx_resources_created ON public.resources(created_at DESC);

-- ════════════════════════════════════════════════════════════════════════════
-- 5. FUNCIONES PARA ACTUALIZAR TIMESTAMP AUTOMÁTICAMENTE
-- ════════════════════════════════════════════════════════════════════════════
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers para actualizar updated_at automáticamente
CREATE TRIGGER update_users_updated_at
  BEFORE UPDATE ON public.users
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_portals_updated_at
  BEFORE UPDATE ON public.portals
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_resources_updated_at
  BEFORE UPDATE ON public.resources
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ════════════════════════════════════════════════════════════════════════════
-- 6. DATOS DE EJEMPLO (OPCIONAL)
-- ════════════════════════════════════════════════════════════════════════════
-- Descomenta las siguientes líneas para insertar datos de ejemplo
-- Nota: Necesitarás reemplazar los UUIDs con los de tus usuarios reales

/*
-- Insertar un portal de ejemplo
INSERT INTO public.portals (name, description, institution, owner_id)
VALUES (
  'Portal de Español 4° Grado',
  'Recursos educativos para el aprendizaje del español en cuarto grado',
  'Institución Educativa Demo',
  'UUID_DE_TU_USUARIO_AQUI'
);

-- Insertar un recurso de video de ejemplo
INSERT INTO public.resources (portal_id, title, description, type, video_url)
VALUES (
  (SELECT id FROM public.portals WHERE name = 'Portal de Español 4° Grado' LIMIT 1),
  'Introducción a la Lectura Crítica',
  'Video explicativo sobre técnicas de lectura crítica',
  'video',
  'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
);

-- Insertar un recurso de quiz de ejemplo
INSERT INTO public.resources (portal_id, title, description, type, questions)
VALUES (
  (SELECT id FROM public.portals WHERE name = 'Portal de Español 4° Grado' LIMIT 1),
  'Quiz de Comprensión Lectora',
  'Evaluación de comprensión de lectura',
  'quiz',
  '[
    {
      "question": "¿Cuál es la idea principal del texto?",
      "options": ["Opción A", "Opción B", "Opción C", "Opción D"],
      "correct_option": 1
    },
    {
      "question": "¿Qué significa la palabra X en el contexto?",
      "options": ["Significado 1", "Significado 2", "Significado 3"],
      "correct_option": 0
    }
  ]'::jsonb
);
*/

-- ════════════════════════════════════════════════════════════════════════════
-- 7. HABILITAR REALTIME PARA SINCRONIZACIÓN AUTOMÁTICA
-- ════════════════════════════════════════════════════════════════════════════
-- Ejecuta esto en la sección de Realtime en Supabase Dashboard
-- O ejecuta estos comandos SQL:

ALTER PUBLICATION supabase_realtime ADD TABLE public.portals;
ALTER PUBLICATION supabase_realtime ADD TABLE public.resources;

-- ════════════════════════════════════════════════════════════════════════════
-- CONFIGURACIÓN COMPLETADA
-- ════════════════════════════════════════════════════════════════════════════
-- Tu base de datos está lista para usar con la aplicación EduRepositorio.
-- 
-- Próximos pasos:
-- 1. Copia todo este SQL y ejecútalo en el SQL Editor de Supabase
-- 2. Ve a Authentication > Settings y configura tu Email Auth
-- 3. Copia tu Project URL y anon key al archivo HTML
-- 4. ¡Listo! Tu aplicación está configurada para sincronización en tiempo real
