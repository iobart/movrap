
# MovRap 🎬

Aplicación Flutter de películas implementando Clean Architecture, Riverpod como gestor de estado y Freezed para modelos inmutables.

![Logo Flutter](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*r7RTPXPSl1wRGJ6zexqzGQ.png)

## Características ✨
- Listado de películas
- Detalle de películas
- Búsqueda de películas
- Gestión de estado con Riverpod
- Arquitectura limpia con separación de capas
- Inyección de dependencias con Injectable
- Enrutamiento modular

## Estructura del Proyecto 🏗️
├──lib/
├── core/
│ ├── injection/ # Configuración de inyección de dependencias (Injectable)
│ ├── paths/ # rutas de .env
│ └── routes/ # Configuración de navegación y enrutamiento

├── features/
│ └── movie/ # Feature Module Principal
│ ├── data/
│ │ ├── api/ # Implementación de API (Datasources)
│ │ └── data_sources/ # Fuentes de datos (local/remote)
│ │
│ ├── domain/
│ │ ├── models/ # Modelos de dominio (con Freezed)
│ │ ├── repositories/ # Repositorios abstractos
│ │ └── use_cases/ # Casos de uso
│ │
│ └── presentation/
│ ├── providers/ # Providers de Riverpod
│ ├── screens/ # Pantallas principales
│ └── widgets/ # Componentes UI reutilizables

## Tecnologías Utilizadas 🛠️
- **Flutter Riverpod**: Gestión de estado
- **Freezed**: Modelos inmutables y union classes
- **Injectable**: Inyección de dependencias
- **Http**: Cliente HTTP

## Requisitos Previos 📋
- Flutter SDK >=  3.27.3 • channel stable
- Dart >=  Dart 3.6.1

## Instalación ⚙️
1. Clonar el repositorio
2. Ejecutar `flutter pub get` para instalar las dependencias
3. Ejecutar `flutter run` para  generar los modelos  :  dart run build_runner build  --delete-conflicting-outputs


## Referencias 📚
- [The Clean Architecture](https://medium.com/@authfy/building-flutter-app-with-clean-architecture-and-bloc-pattern-96a1b2df708a)
