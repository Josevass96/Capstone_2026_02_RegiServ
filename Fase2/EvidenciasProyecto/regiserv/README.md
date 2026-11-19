# RegiServ 🧹

**Sistema de gestión, registro y supervisión de labores de aseo y mantenimiento.**

RegiServ es una aplicación multiplataforma desarrollada con Flutter, orientada a digitalizar y optimizar la gestión de labores de aseo y mantenimiento en instalaciones. El sistema permite administrar usuarios, asignar tareas, registrar actividades mediante tecnología NFC, supervisar su ejecución y mantener la información sincronizada con una base de datos centralizada.

La aplicación contempla distintos perfiles de usuario, proporcionando funcionalidades específicas según las responsabilidades de cada funcionario.

---

## 📌 Características principales

### 👥 Gestión de usuarios y roles

RegiServ contempla cuatro perfiles principales:

- **Auxiliar:** consulta sus labores asignadas, inicia y ejecuta actividades, registra su finalización y consulta su historial.
- **Supervisor:** supervisa las actividades, revisa registros y gestiona incidencias y solicitudes excepcionales.
- **Supervisor Jefe:** dispone de herramientas de administración, gestión de usuarios, infraestructura, asignaciones y reportes.
- **Mantención:** cuenta con funcionalidades orientadas a la gestión y ejecución de labores de mantenimiento.

### 📱 Registro de labores mediante NFC

- Identificación de espacios mediante etiquetas NFC.
- Inicio y seguimiento de labores.
- Validación de la finalización de actividades.
- Registro de información y evidencias.
- Gestión de registros de labores.

### 🔄 Funcionamiento offline y sincronización

RegiServ incorpora mecanismos para mantener la continuidad operacional cuando no existe conexión a Internet.

- Almacenamiento local mediante Hive.
- Conservación de labores en curso.
- Registro de actividades pendientes de sincronización.
- Sincronización automática con Supabase cuando el backend vuelve a estar disponible.
- Recuperación de labores después de cerrar y volver a abrir la aplicación.
- Manejo de errores para evitar la pérdida de registros pendientes.

### 📊 Supervisión y administración

- Gestión de edificios, pisos, sectores y espacios.
- Administración de usuarios y asignaciones.
- Consulta de registros de aseo.
- Gestión de incidencias de mantenimiento.
- Gestión de solicitudes excepcionales.
- Panel de supervisión y reportes.

### 🔔 Notificaciones push

Integración con Firebase Cloud Messaging para gestionar notificaciones push en Android.

Actualmente, el registro de dispositivos está implementado para los perfiles Supervisor, Supervisor Jefe y Mantención.

### 🔐 Autenticación y seguridad

- Autenticación mediante Supabase Auth.
- Restauración de sesiones.
- Navegación diferenciada según el rol.
- Recuperación y restablecimiento de contraseñas.
- Validación del estado de los funcionarios.

---

## 🛠️ Tecnologías utilizadas

| Tecnología | Utilización |
|---|---|
| Flutter | Desarrollo de la aplicación multiplataforma. |
| Dart | Lenguaje de programación. |
| Supabase | Backend, autenticación y base de datos. |
| Supabase Auth | Gestión de autenticación y sesiones. |
| Hive | Almacenamiento local y persistencia offline. |
| Firebase Cloud Messaging | Notificaciones push en Android. |
| Firebase Core | Inicialización de servicios Firebase. |
| NFC | Identificación de espacios y registro de labores. |
| Docker | Contenerización de la aplicación (implementación prevista). |
| Nginx | Servidor web para la versión contenerizada (implementación prevista). |

---

## 🏗️ Arquitectura del proyecto

El proyecto utiliza una organización modular que separa las pantallas, los servicios, el almacenamiento local y la comunicación con los servicios externos.

```text
lib/
│
├── config/
│   └── supabase_config.dart
│
├── core/
│   ├── labor/
│   │   ├── labor_context.dart
│   │   └── labor_operacion_service.dart
│   │
│   ├── push/
│   │   └── notificaciones_push_service.dart
│   │
│   ├── remote/
│   │   ├── remote_backend.dart
│   │   └── supabase_remote_backend.dart
│   │
│   ├── storage/
│   │   ├── local_storage.dart
│   │   └── hive_local_storage.dart
│   │
│   └── sync/
│       ├── cache_operacional_service.dart
│       ├── registro_final_fallback_service.dart
│       ├── sincronizacion_automatica_service.dart
│       └── sincronizacion_service.dart
│
├── data/
│   └── sesion_data.dart
│
├── pages/
│   ├── auxiliar_home_page.dart
│   ├── supervisor_home_page.dart
│   ├── supervisor_jefe_home_page.dart
│   ├── mantencion_home_page.dart
│   └── ... (demás pantallas)
│
├── utils/
│   └── rut_formatter.dart
│
├── widgets/
│   └── ... (componentes reutilizables)
│
├── firebase_options.dart
└── main.dart
```

### Descripción de los módulos

- **config:** configuración de servicios externos.
- **core/labor:** contexto y operaciones relacionadas con las labores.
- **core/remote:** comunicación con el backend remoto.
- **core/storage:** abstracción y administración del almacenamiento local.
- **core/sync:** mecanismos de sincronización y recuperación de registros.
- **core/push:** administración de notificaciones push.
- **data:** información de sesión del usuario.
- **pages:** interfaces y pantallas de cada módulo.
- **utils:** funciones auxiliares.
- **widgets:** componentes reutilizables.

---

## ⚙️ Requisitos previos

Para ejecutar el proyecto en un entorno de desarrollo se requiere:

- Flutter SDK.
- Dart SDK (incluido con Flutter).
- Visual Studio Code o Android Studio.
- Git.
- Una cuenta y proyecto configurado en Supabase.
- Proyecto Firebase configurado para Android, si se utilizarán notificaciones push.

Para comprobar la instalación de Flutter:

```bash
flutter doctor
```

---

## 🚀 Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/Josevass96/Capstone_2026_02_RegiServ.git
```

### 2. Ingresar al proyecto

```bash
cd Regiserv
```

### 3. Instalar dependencias

```bash
flutter pub get
```

### 4. Configurar Supabase

Configurar las credenciales correspondientes en:

```text
lib/config/supabase_config.dart
```

Se requiere la URL del proyecto Supabase y su clave publicable.

**Importante:** no incluir claves secretas ni credenciales `service_role` en el código cliente o en el repositorio.

### 5. Configurar Firebase

Para habilitar las notificaciones push en Android, configurar Firebase y generar el archivo de opciones correspondiente:

```text
lib/firebase_options.dart
```

También se debe configurar el proyecto Firebase para Android.

### 6. Ejecutar la aplicación

Para Android:

```bash
flutter run
```

Para ejecutar en Chrome:

```bash
flutter run -d chrome
```

Para generar una compilación Android:

```bash
flutter build apk --release
```

Para generar una compilación web:

```bash
flutter build web --release
```

---

## 🐳 Docker

Se contempla incorporar Docker para contenerizar la versión web de RegiServ.

La propuesta utiliza:

- **Docker:** construcción y ejecución de contenedores.
- **Nginx:** publicación de los archivos compilados de Flutter Web.
- **Docker Compose:** administración del servicio.

La arquitectura prevista es:

```text
          Usuario
             |
             v
       Navegador Web
             |
             v
       Docker Container
             |
             v
           Nginx
             |
             v
        Flutter Web
             |
             v
          Supabase
```

La contenerización permite disponer de un entorno de despliegue reproducible, facilitando la ejecución y distribución de la aplicación web.

**Nota:** esta sección describe la integración prevista. Los archivos Docker y su configuración deben incorporarse al repositorio para considerar esta funcionalidad implementada.

---

## 🔄 Funcionamiento general

El flujo principal de trabajo de RegiServ contempla las siguientes etapas:

1. El funcionario ingresa a la aplicación mediante sus credenciales.
2. El sistema valida su identidad y recupera su perfil y rol.
3. Se muestra la interfaz correspondiente a sus permisos.
4. El funcionario accede a las labores o funcionalidades disponibles.
5. El auxiliar puede identificar el espacio mediante NFC e iniciar una labor.
6. La aplicación registra el desarrollo y la finalización de la actividad.
7. Los datos se almacenan localmente cuando corresponde.
8. Los registros pendientes se sincronizan automáticamente con Supabase cuando existe conexión.
9. Los supervisores pueden consultar y gestionar la información registrada.

---

## 📂 Backend y servicios externos

RegiServ utiliza Supabase como infraestructura backend para centralizar la información y gestionar la autenticación.

Firebase se utiliza para las notificaciones push en Android.

Estos servicios funcionan de manera independiente de la aplicación Flutter y no requieren ser ejecutados dentro del contenedor Docker propuesto.

---

## 🎯 Objetivo del proyecto

Digitalizar y optimizar los procesos de registro, ejecución y supervisión de labores de aseo y mantenimiento, proporcionando trazabilidad de las actividades, acceso diferenciado según roles, disponibilidad de información y continuidad operacional mediante mecanismos de almacenamiento local y sincronización automática.

---

## 👨‍💻 Desarrollo

Proyecto desarrollado con Flutter y Dart.

**Nombre:** RegiServ  
**Tipo:** Aplicación multiplataforma de gestión de labores de aseo y mantenimiento.  
**Backend:** Supabase.  
**Almacenamiento local:** Hive.

---

## 📄 Licencia

Este proyecto se encuentra destinado a fines académicos y de desarrollo. La licencia de distribución deberá definirse según las condiciones de sus autores y responsables.
