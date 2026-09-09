# Proyecto Integrador 3
# MIS JUEGOS FAVORITOS - desarrollo a continuación del integrador 2

PROGRAMACION IV
Desarrollo de aplicaciones móviles.

- Nombre del proyecto.

  Juegos KI
  
- Descripción de la aplicación.

  Muestra un catálogo de mis juegos preferidos
  
- Objetivo.

  Es una aplicación informativa que ofrece detalles de los juegos y agregarlos a una lista de favoritos.
  
- Funcionalidades principales.

  - Provider para agregar favoritos.
  - Navegación entre páginas.
  - Email de contacto
  - Notificaciones
    
- Tecnologías y paquetes utilizados.

  - Flutter, Dart, VS Code
  - Paquetes url_launcher
  - provider
  
- Estructura de carpetas del proyecto.

  Se estructuró de la siguiente manera:

  <img width="975" height="217" alt="image" src="https://github.com/user-attachments/assets/6acd5ff7-7eec-4b26-8a1a-cfb3b84fb67b" />

- Explicación breve del Provider implementado.

  Si marcas un juego como favorito dentro de la pantalla de detalles o en la tarjeta, el contador en la pantalla de inicio (HomeScreen) y la
  lista en Mis Favoritos se actualizan al instante sin necesidad de recargar manualmente la pantalla.
  
- Descripción de los widgets reutilizables creados.

  OpcionMenuWidget: Widget reutilizable que empaqueta un contenedor estilizado con un ícono, título, subtítulo y flecha de navegación (ListTile).
  Se utiliza en HomeScreen y GeneroScreen para mantener una interfaz limpia y uniforme.

  TarjetaJuegoWidget: Componente reutilizable para presentar cada videojuego dentro de una cuadrícula (GridView). Incluye la imagen, el título,
  un botón para ver el detalle y un botón interactivo flotante (IconButton) para marcar o desmarcar el juego como favorito en tiempo real.
  
- Instrucciones básicas para ejecutar el proyecto.

  - Flutter SDK (versión actualizada).
  - Dart SDK
  - Android Studio o Visual Studio Code con la extensión oficial de Flutter instalada.
  - Un Emulador (Android/iOS)

- Capturas de las principales pantallas.

  <img width="270" height="585" alt="Screenshot_1788924231" src="https://github.com/user-attachments/assets/38a583b7-e8e6-4b73-bbc7-b58c214fbb47" />
  <img width="270" height="585" alt="Screenshot_1788924236" src="https://github.com/user-attachments/assets/d2cad95d-9bb2-4e9d-84d2-8fb77125d142" />
  <img width="270" height="585" alt="Screenshot_1788924242" src="https://github.com/user-attachments/assets/0d0b5e64-0888-4213-988f-499f8af2afc5" />
  <img width="270" height="585" alt="Screenshot_1788924249" src="https://github.com/user-attachments/assets/a9dd7dd5-bd94-45f2-b5cc-a28de61d8e03" />
  <img width="270" height="585" alt="Screenshot_1788924254" src="https://github.com/user-attachments/assets/87635b6a-1fa3-4190-8084-9f31e65eee4d" />

- Captura o evidencia de la funcionalidad administrada mediante Provider.

  <img width="270" height="585" alt="Screenshot_1788925411" src="https://github.com/user-attachments/assets/8696ecec-6717-414c-85b4-5e4194becc0a" />
  <img width="270" height="585" alt="Screenshot_1788925438" src="https://github.com/user-attachments/assets/39890c3d-3b2f-4b46-83d1-939fde5d8d47" />
  <img width="270" height="585" alt="Screenshot_1788925446" src="https://github.com/user-attachments/assets/98afecfe-2577-4157-bdf1-472b7bce077b" />
  <img width="270" height="585" alt="Screenshot_1788925452" src="https://github.com/user-attachments/assets/462a3814-af79-4b92-9ba4-ac29c9d11980" />
  <img width="270" height="585" alt="Screenshot_1788925460" src="https://github.com/user-attachments/assets/4f47686b-0e86-4694-8920-10b03a432753" />
  <img width="270" height="585" alt="Screenshot_1788925466" src="https://github.com/user-attachments/assets/a32913d2-54d9-455f-b6de-beca3ba779cf" />


  

  

  


- Autor.

  Krystian Marcin Iwinski
  

# Proyecto Integrador 2
# MIS JUEGOS FAVORITOS

PROGRAMACION IV
Desarrollo de aplicaciones móviles.

# Herramientas utilizadas

- Android Studio
- Dart
- Flutter
- Visual Studio Code

# Ejecucion de flutter pub add url_launcher

<img width="813" height="135" alt="image" src="https://github.com/user-attachments/assets/2be6d17b-379f-4c68-92cd-e6121ed496a3" />

Mofificación del archivo pubspec.yaml

<img width="550" height="167" alt="image" src="https://github.com/user-attachments/assets/dccb8027-f742-400c-9eb0-7297492831b0" />


Cambiamos el nombre de la aplicación a "Juegos KI" y el ícono a:

<img width="92" height="92" alt="image" src="https://github.com/user-attachments/assets/6dd4805d-edf0-4cac-9a2c-9a391026805c" />

<img width="225" height="233" alt="image" src="https://github.com/user-attachments/assets/d510dacf-cc3b-4b2b-84d9-0578d61b9bca" />


# Pantallas de la aplicación:

<img width="591" height="431" alt="image" src="https://github.com/user-attachments/assets/a2eb2135-82f5-4a6d-9bad-19760e55f5c0" />


<img width="591" height="431" alt="image" src="https://github.com/user-attachments/assets/d7013948-0c91-4e62-bd41-284313a96cba" />


