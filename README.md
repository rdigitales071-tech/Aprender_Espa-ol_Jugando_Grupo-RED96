# 📚 EduRepositorio Colombia
### Recursos digitales de Español para 4° y 5° Grado · Zona Rural

[![GitHub Pages](https://img.shields.io/badge/Publicado%20en-GitHub%20Pages-brightgreen)](https://TU_USUARIO.github.io/edurepo-colombia)

---

## 🌿 ¿Qué es este repositorio?

EduRepositorio Colombia es una plataforma educativa de **una sola página HTML** diseñada para docentes y estudiantes de básica primaria (4° y 5° grado) en zonas rurales colombianas.

Los recursos están contextualizados con:
- 🏔️ Leyendas colombianas (río Magdalena, El Dorado, leyendas muiscas)
- 🐊 Fauna y flora de Colombia (caimanes, chigüiros, guadua, borojó)
- ☕ Cultura campesina (Eje Cafetero, Llanos, Pacífico, Costa Caribe, Amazonía)
- 📜 Literatura colombiana (María de Jorge Isaacs)
- 🗺️ Contexto regional y refranes populares colombianos

---

## 🚀 Cómo publicarlo en GitHub Pages

### Paso 1 — Crear el repositorio en GitHub
1. Ve a [github.com](https://github.com) e inicia sesión
2. Haz clic en **"New repository"** (botón verde)
3. Nombre sugerido: `edurepo-colombia`
4. Selecciona **Public**
5. Haz clic en **"Create repository"**

### Paso 2 — Subir los archivos
**Opción A — Desde el navegador (más fácil):**
1. En tu repositorio vacío, haz clic en **"uploading an existing file"**
2. Arrastra el archivo `index.html` y el `README.md`
3. Haz clic en **"Commit changes"**

**Opción B — Con Git (si tienes instalado):**
```bash
git clone https://github.com/TU_USUARIO/edurepo-colombia.git
cd edurepo-colombia
# Copia aquí los archivos index.html y README.md
git add .
git commit -m "🎉 EduRepositorio Colombia - versión inicial"
git push origin main
```

### Paso 3 — Activar GitHub Pages
1. En tu repositorio, ve a **Settings** (⚙️)
2. En el menú izquierdo, haz clic en **Pages**
3. En *"Source"*, selecciona **"Deploy from a branch"**
4. En *"Branch"*, selecciona **`main`** y carpeta **`/ (root)`**
5. Haz clic en **Save**
6. Espera 1-2 minutos y tu sitio estará en:
   ```
   https://TU_USUARIO.github.io/edurepo-colombia
   ```

---

## 👤 Acceso inicial (admin)

| Campo | Valor |
|-------|-------|
| Correo | `admin@edurepo.co` |
| Contraseña | `Admin2024*` |

> ⚠️ **Cambia la contraseña** desde el panel de Administración → Perfil después del primer acceso.

---

## 💾 Sobre los datos

Los datos (usuarios y portales) se guardan en el **localStorage del navegador** de cada computador. Esto significa:

- ✅ No necesita servidor ni internet para funcionar
- ✅ Los datos persisten aunque se cierre el navegador
- ⚠️ Los datos son **locales** — cada dispositivo tiene los suyos
- ⚠️ Si se borra el caché del navegador, se pierden los datos

### Para no perder datos:
1. Entra como administrador
2. Ve a **Administración → Respaldo de Datos**
3. Haz clic en **"Exportar datos (JSON)"** regularmente
4. Guarda el archivo `.json` en un lugar seguro
5. Para restaurar, usa **"Importar datos"**

---

## 📂 Estructura del proyecto

```
edurepo-colombia/
├── index.html     ← Toda la aplicación (una sola página)
└── README.md      ← Este archivo
```

---

## 📋 Recursos incluidos

| # | Recurso | Categoría |
|---|---------|-----------|
| 1 | El origen del río Magdalena (leyenda andina) | Lectura |
| 2 | El caimán y el cocodrilo (fábula llanera) | Lectura |
| 3 | María de Jorge Isaacs (fragmento adaptado) | Lectura |
| 4 | Escribir un cuento de misterio (selva amazónica) | Escritura |
| 5 | Carta formal (petición al alcalde) | Escritura |
| 6 | Reglas de acentuación | Gramática |
| 7 | Tiempos verbales: pretérito y futuro | Gramática |
| 8 | Aumentativos y diminutivos colombianos | Gramática |
| 9 | Frutas y plantas de Colombia | Vocabulario |
| 10 | Emociones y refranes colombianos | Vocabulario |
| 11 | El Dorado: la leyenda colombiana (video) | Video |
| 12 | Las palabras homófonas (video) | Video |
| 13 | Memory: sinónimos del español colombiano | Juego |
| 14 | Ahorcado: animales de Colombia | Juego |
| 15 | Quiz: Diptongos e hiatos | Juego |

---

## 🛠️ Roles del sistema

| Rol | Permisos |
|-----|----------|
| 🎓 Administrador | Gestionar usuarios, ver todos los portales, exportar datos |
| 👩‍🏫 Docente | Crear y compartir portales, acceder a todos los recursos |
| 🎒 Estudiante | Explorar recursos e interactuar con actividades |

---

## 📐 Alineación curricular (MEN Colombia)

Diseñado con base en los **Estándares Básicos de Competencias en Lenguaje** del Ministerio de Educación Nacional de Colombia para grados 4° y 5°:

- Comprensión e interpretación textual
- Producción textual
- Literatura
- Medios de comunicación y otros sistemas simbólicos
- Ética de la comunicación

---

*Desarrollado con ❤️ para las escuelas rurales de Colombia*
