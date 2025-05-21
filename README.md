# E-commerce Anly - Flutter

Una aplicación móvil de comercio electrónico desarrollada en Flutter, que permite a los usuarios explorar productos, agregarlos a favoritos y realizar compras de manera rápida y sencilla.

---

## 🚀 Características

- 🛍️ Listado de productos con imágenes y precios
- ❤️ Favoritos personalizados por usuario
- 🔍 Búsqueda por título
- 👤 Autenticación de usuarios con Firebase
- 🌓 Soporte para tema oscuro
- 📦 Arquitectura limpia con uso de Cubit y Repositorios
- 🧪 Validaciones de formulario
- 🌐 Backend con Firebase Firestore

---

## 📸 Capturas de pantalla


| Inicio de sesión | Verificación |
|-----------------------|---------------------|
| ![Home](images/sesion.png) | ![Login](images/contraseña.png) |

| Registro de usuarios | Datos adicionales  |
|----------------------|------------------------|
| ![Products](images/registro.png) | ![Product Detail](images/genero.png) |

| Visualizacion de productos | Detalles del producto  |
|----------------------|------------------------|
| ![Products](images/inicio.png) | ![Product Detail](images/detalle.png) |

| Buqueda de productos | Busqueda por categorias  |
|----------------------|------------------------|
| ![Products](images/buscador.png) | ![Product Detail](images/categorias.png) |

| Carrito de compras | Creacion de pedidos  |
|----------------------|------------------------|
| ![Products](images/carro.png) | ![Product Detail](images/realizados.png) |

| Lista de pedidos | Seguimiento del pedido  |
|----------------------|------------------------|
| ![Products](images/seguimiento.png) | ![Product Detail](images/pedido.png) |


---

## 🛠️ Tecnologías y paquetes usados

- Flutter
- Firebase (Auth, Firestore)
- Bloc/Cubit (flutter_bloc)
- dartz
- get_it
- cached_network_image
- google_fonts

---

## ⚙️ Instalación

1. Clona este repositorio:

git clone https://github.com/davidmarint/Ecommerce-anly.git

2. Navega al directorio del proyecto

3. instala las dependencias de Flutter desde el terminal 

 - flutter pub get

4. Configura Firebase
Asegúrate de tener un proyecto en Firebase Console y sigue estos pasos:

🔹 Android:
Coloca tu archivo google-services.json en:

- android/app/google-services.json

🔹 iOS:
Coloca tu archivo GoogleService-Info.plist en:

- ios/Runner/GoogleService-Info.plist

5. Corre la aplicación
Conecta un emulador o dispositivo físico y ejecuta:

- flutter run

---

## ✅ Estado actual
- Pantalla de inicio

- Visualización de productos

- Funcionalidad de favoritos

- Autenticación

- Carrito de compras

-  Pasarela de pago (pendiente)

---
