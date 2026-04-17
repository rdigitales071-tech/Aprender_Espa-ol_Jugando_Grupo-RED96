# 📚 EduRepositorio - Integración con Supabase

Portal web educativo integrado con Supabase para gestión de contenidos en tiempo real.

## 🌟 Características

- ✅ **Autenticación segura** con Supabase Auth
- ☁️ **Base de datos en la nube** totalmente gestionada
- ⚡ **Sincronización en tiempo real** entre todos los dispositivos
- 🔒 **Row Level Security (RLS)** para protección de datos
- 📱 **Responsive** - funciona en cualquier dispositivo
- 🎨 **Interfaz moderna** con diseño profesional

## 🚀 Configuración Paso a Paso

### 1. Crear Proyecto en Supabase

1. Ve a [https://supabase.com](https://supabase.com)
2. Crea una cuenta o inicia sesión
3. Haz clic en **"New Project"**
4. Completa los datos:
   - **Name**: EduRepositorio (o el nombre que prefieras)
   - **Database Password**: Crea una contraseña segura (guárdala)
   - **Region**: Selecciona la más cercana a Colombia (idealmente South America)
   - **Pricing Plan**: Puedes empezar con el plan gratuito
5. Haz clic en **"Create new project"**
6. Espera 1-2 minutos mientras se crea tu proyecto

### 2. Configurar la Base de Datos

1. En tu proyecto de Supabase, ve a **SQL Editor** (icono de base de datos en el menú lateral)
2. Haz clic en **"New query"**
3. Abre el archivo `supabase-setup.sql` incluido en este proyecto
4. Copia TODO el contenido del archivo SQL
5. Pégalo en el editor de Supabase
6. Haz clic en **"Run"** (o presiona `Ctrl+Enter`)
7. Deberías ver el mensaje **"Success. No rows returned"**

### 3. Habilitar Realtime

1. Ve a **Database** > **Replication** en el menú lateral
2. Busca la tabla `portals` y activa el toggle en la columna **"Realtime"**
3. Busca la tabla `resources` y activa el toggle en la columna **"Realtime"**

Esto permite que los cambios se sincronicen automáticamente entre todos los usuarios conectados.

### 4. Configurar Autenticación por Email

1. Ve a **Authentication** > **Providers** en el menú lateral
2. Busca **"Email"** en la lista
3. Asegúrate de que esté **habilitado** (toggle activado)
4. Configuración recomendada:
   - ✅ Enable email confirmations: **Desactivado** (para desarrollo rápido)
   - ✅ Enable email signup: **Activado**
   - ✅ Enable sign in with email: **Activado**

> **Nota**: En producción, deberías habilitar la confirmación por email para mayor seguridad.

### 5. Obtener las Credenciales

1. Ve a **Settings** > **API** en el menú lateral
2. Encontrarás dos valores importantes:

   **Project URL**:
   ```
   https://tu-proyecto.supabase.co
   ```

   **anon public key**:
   ```
   eyJhbGciOaaaaaaaaaaaaaaaaaaaaaaaaaa...
   ```

3. Copia estos dos valores (los necesitarás en el siguiente paso)

### 6. Configurar el Archivo HTML

1. Abre el archivo `index-supabase.html`
2. Busca las líneas (aproximadamente línea 627-628):

```javascript
const SUPABASE_URL = 'TU_SUPABASE_URL_AQUI';
const SUPABASE_ANON_KEY = 'TU_SUPABASE_ANON_KEY_AQUI';
```

3. Reemplaza con tus valores reales:

```javascript
const SUPABASE_URL = 'https://tu-proyecto.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGssssssssssssssssssssssssssss...';
```

4. Guarda el archivo

### 7. ¡Listo! Abre la Aplicación

1. Abre el archivo `index-supabase.html` en tu navegador
2. Crea una cuenta nueva:
   - Nombre completo
   - Email
   - Contraseña (mínimo 6 caracteres)
   - Rol (Admin, Docente o Estudiante)
   - Institución
3. Haz clic en **"Crear Cuenta"**
4. ¡Ya puedes empezar a usar la aplicación!

## 🧪 Probar la Sincronización en Tiempo Real

Para ver la magia de la sincronización en tiempo real:

1. Abre la aplicación en **dos navegadores diferentes** o en **dos pestañas en modo incógnito**
2. Inicia sesión con el mismo usuario o con usuarios diferentes
3. En una ventana, crea un nuevo portal
4. **¡Observa cómo aparece automáticamente en la otra ventana sin refrescar!**
5. Prueba editar o eliminar portales y recursos - ¡todo se sincroniza al instante!

## 📊 Estructura de la Base de Datos

### Tabla `users`
- Perfiles extendidos de usuarios
- Roles: admin, teacher, student
- Información de institución

### Tabla `portals`
- Contenedores de recursos educativos
- Creados por admins y teachers
- Visibles para todos los usuarios

### Tabla `resources`
- Recursos educativos de diferentes tipos:
  - 📹 **Video**: Videos educativos (YouTube)
  - 🖼️ **Imagen**: Imágenes con leyendas
  - 📝 **Texto**: Contenido HTML
  - 📖 **Lectura múltiple**: Texto + preguntas
  - ✅ **Quiz**: Evaluaciones interactivas

## 🔒 Seguridad

La aplicación utiliza **Row Level Security (RLS)** de Supabase:

- ✅ **Todos pueden ver** portales y recursos
- ✅ **Solo admins y teachers** pueden crear portales
- ✅ **Solo el propietario** puede editar o eliminar sus portales
- ✅ **Los recursos heredan** los permisos del portal al que pertenecen
- ✅ **Las contraseñas se cifran** automáticamente con Supabase Auth

## 🌐 Despliegue en Producción

### Opción 1: GitHub Pages (Gratis)
1. Crea un repositorio en GitHub
2. Sube los archivos (solo necesitas `index-supabase.html`)
3. Ve a Settings > Pages
4. Selecciona la rama main y guarda
5. ¡Tu sitio estará en `https://tu-usuario.github.io/tu-repo`!

### Opción 2: Netlify (Gratis)
1. Ve a [netlify.com](https://netlify.com)
2. Arrastra y suelta la carpeta con tu archivo HTML
3. ¡Listo! Obtendrás un dominio automático

### Opción 3: Vercel (Gratis)
1. Ve a [vercel.com](https://vercel.com)
2. Importa tu proyecto desde GitHub
3. Despliega con un clic

## 📝 Roles y Permisos

### Administrador
- Crear y gestionar portales
- Agregar y editar recursos
- Ver todos los portales y recursos

### Docente
- Crear y gestionar sus propios portales
- Agregar y editar recursos en sus portales
- Ver todos los portales y recursos

### Estudiante
- Ver todos los portales y recursos
- Realizar actividades y evaluaciones
- No puede crear ni editar contenido

## 🐛 Solución de Problemas

### Error: "Invalid JWT"
- Verifica que copiaste correctamente la `anon public key`
- Asegúrate de no tener espacios extra al inicio o final

### Error: "Failed to fetch"
- Verifica que la `SUPABASE_URL` sea correcta
- Comprueba tu conexión a internet
- Revisa la consola del navegador para más detalles

### No se sincronizan los cambios
- Verifica que activaste Realtime para las tablas `portals` y `resources`
- Refresca la página
- Comprueba el indicador de sincronización en el header (punto verde)

### No puedo crear portales
- Verifica que tu rol sea `admin` o `teacher`
- Los estudiantes no tienen permiso para crear portales

## 💡 Funcionalidades Avanzadas

### Agregar Recursos a un Portal (Próximamente)
El código está preparado para permitir agregar recursos desde la interfaz. Para implementarlo:

1. Agrega un botón "Agregar Recurso" en la vista de portal
2. Crea un modal con un formulario para cada tipo de recurso
3. Usa `supabase.from('resources').insert()` para guardar

### Seguimiento de Progreso
Puedes extender la base de datos para trackear:
- Recursos completados por estudiante
- Respuestas a evaluaciones
- Tiempo dedicado a cada actividad

### Notificaciones en Tiempo Real
Usa los eventos de Realtime para mostrar:
- "Nuevo portal creado por [nombre]"
- "Recurso actualizado"
- Mensajes entre usuarios

## 📚 Recursos Adicionales

- [Documentación de Supabase](https://supabase.com/docs)
- [Realtime con Supabase](https://supabase.com/docs/guides/realtime)
- [Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)
- [Supabase Auth](https://supabase.com/docs/guides/auth)

## 🤝 Soporte

Si tienes problemas con la configuración:

1. Revisa la consola del navegador (F12 > Console)
2. Verifica los logs en Supabase Dashboard > Logs
3. Asegúrate de seguir todos los pasos en orden

## 📄 Licencia

Este proyecto es de código abierto y está disponible para uso educativo.

---

**¡Disfruta de tu portal educativo con sincronización en tiempo real!** 🎉
