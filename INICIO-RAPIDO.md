# ⚡ Guía de Inicio Rápido - 5 Minutos

## 🎯 Lo que vas a lograr

Tendrás un portal educativo completamente funcional con:
- ✅ Base de datos en la nube
- ✅ Autenticación de usuarios
- ✅ Sincronización en tiempo real
- ✅ Acceso desde múltiples dispositivos

## 📋 Checklist de Configuración

### Paso 1: Crear Proyecto Supabase (2 min)
```
[ ] Ve a https://supabase.com
[ ] Haz clic en "New Project"
[ ] Nombre: EduRepositorio
[ ] Región: South America (Brazil)
[ ] Espera 1-2 minutos a que se cree
```

### Paso 2: Configurar Base de Datos (1 min)
```
[ ] Abre SQL Editor en Supabase
[ ] Copia todo el contenido de supabase-setup.sql
[ ] Pégalo en el editor
[ ] Haz clic en "Run"
[ ] Verifica que diga "Success"
```

### Paso 3: Activar Realtime (30 seg)
```
[ ] Ve a Database > Replication
[ ] Activa Realtime para tabla "portals"
[ ] Activa Realtime para tabla "resources"
```

### Paso 4: Obtener Credenciales (30 seg)
```
[ ] Ve a Settings > API
[ ] Copia "Project URL"
[ ] Copia "anon public key"
```

### Paso 5: Configurar HTML (1 min)
```
[ ] Abre index-supabase.html
[ ] Busca líneas 627-628
[ ] Pega tu SUPABASE_URL
[ ] Pega tu SUPABASE_ANON_KEY
[ ] Guarda el archivo
```

### Paso 6: ¡Probar! (30 seg)
```
[ ] Abre index-supabase.html en el navegador
[ ] Haz clic en "Registrarse"
[ ] Completa el formulario
[ ] ¡Listo! Ya estás dentro
```

## 🧪 Prueba de Sincronización en Tiempo Real

1. **Abre el archivo en DOS navegadores diferentes**
2. **Inicia sesión** en ambos (puede ser el mismo usuario)
3. **En uno, crea un portal** nuevo
4. **¡Mira cómo aparece instantáneamente en el otro!** ⚡

## ⚠️ Errores Comunes

### "Invalid JWT" o "Failed to authenticate"
❌ **Problema**: Credenciales incorrectas
✅ **Solución**: 
- Verifica que copiaste la anon key COMPLETA (es muy larga)
- No debe tener espacios al inicio ni al final
- Asegúrate de usar comillas simples o dobles correctamente

### "Failed to fetch" o "Network Error"
❌ **Problema**: URL incorrecta o problema de conexión
✅ **Solución**:
- Verifica que la URL sea exactamente como aparece en Supabase
- Debe empezar con `https://`
- Debe terminar con `.supabase.co`
- Ejemplo: `https://xyzabc123.supabase.co`

### "Not authorized" al crear portal
❌ **Problema**: Rol incorrecto
✅ **Solución**:
- Solo Admin y Teacher pueden crear portales
- Verifica tu rol en el registro
- Los Students solo pueden ver contenido

### No se sincronizan los cambios
❌ **Problema**: Realtime no está activado
✅ **Solución**:
- Ve a Database > Replication en Supabase
- Activa el toggle de Realtime para `portals` y `resources`
- Refresca la página del navegador

## 🎨 Primeros Pasos Después de Configurar

### Como Admin o Teacher:

1. **Crea tu primer portal**
   - Haz clic en "Mis Portales"
   - Botón "Crear Portal"
   - Completa: nombre, descripción, institución
   - ¡Guarda!

2. **Explora la estructura**
   - Ve a "Recursos" para ver todos los recursos
   - Usa los filtros para buscar por tipo
   - Cada recurso puede ser: video, imagen, texto, lectura o quiz

3. **Invita a otros usuarios**
   - Comparte el enlace de tu aplicación
   - Otros pueden registrarse como Students
   - Verán todos los portales que crees

### Como Student:

1. **Explora los portales disponibles**
   - Ve a "Mis Portales" para ver todos
   - Haz clic en "Abrir" para ver el contenido

2. **Navega por recursos**
   - Ve a "Recursos" para ver todo disponible
   - Filtra por tipo (videos, lecturas, quiz)
   - Haz clic en cualquier recurso para verlo

## 📊 Verifica que Todo Funcione

Marca cada punto después de probarlo:

```
[ ] Puedo crear cuenta nueva
[ ] Puedo iniciar sesión
[ ] Veo el indicador verde de sincronización
[ ] (Admin/Teacher) Puedo crear un portal
[ ] El portal aparece en la lista
[ ] Abro la consola (F12) y no hay errores rojos
[ ] Abro en otro navegador y veo lo mismo
```

## 🚀 Siguiente Nivel

Una vez que tengas todo funcionando, puedes:

1. **Personalizar el diseño**
   - Cambia colores en la sección `:root` del CSS
   - Modifica los degradientes del header
   - Ajusta tamaños de fuente

2. **Agregar funcionalidad**
   - Implementar formularios para crear recursos
   - Agregar sistema de notificaciones
   - Crear dashboard de estadísticas

3. **Desplegar en Internet**
   - Sube a GitHub Pages (gratis)
   - Usa Netlify o Vercel (gratis)
   - Comparte el enlace con tu institución

## 💾 Backup de Datos

Supabase hace backups automáticos, pero también puedes:

1. **Exportar datos desde Supabase**
   - Ve a Database > Tables
   - Selecciona una tabla
   - Exporta como CSV

2. **Ver logs de cambios**
   - Ve a Logs en Supabase
   - Revisa todas las operaciones realizadas

## 🎓 Casos de Uso Reales

### Para una Institución Educativa:
- Varios docentes crean portales (uno por materia/grado)
- Estudiantes se registran y acceden a todos los portales
- Los cambios se ven en tiempo real en todas las aulas

### Para un Docente Individual:
- Creas portales organizados por tema
- Compartes el enlace con tus estudiantes
- Actualizas contenido y ellos lo ven al instante

### Para Autoaprendizaje:
- Creas tu propio repositorio de recursos
- Organizas contenido por temas
- Accedes desde cualquier dispositivo

## 🆘 ¿Necesitas Ayuda?

Si algo no funciona:

1. **Revisa la consola del navegador**
   - Presiona F12
   - Ve a la pestaña "Console"
   - Copia el mensaje de error

2. **Verifica los logs de Supabase**
   - Ve a Logs > API Logs
   - Busca errores recientes
   - Los errores 401/403 = problema de permisos
   - Los errores 404 = recurso no encontrado

3. **Comprueba la configuración**
   - URL correcta
   - Key correcta
   - Tablas creadas
   - Realtime activado
   - Políticas de seguridad activas

## ✅ ¡Todo Listo!

Si completaste todos los pasos del checklist, tu aplicación está 100% funcional.

**Próximo paso**: ¡Empieza a crear contenido educativo! 🎉

---

📧 **¿Preguntas?** Revisa el archivo README.md para documentación completa.
