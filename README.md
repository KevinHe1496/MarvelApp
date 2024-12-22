
# Marvel App

Marvel App es una aplicación desarrollada en **SwiftUI**, diseñada para mostrar los personajes de Marvel junto con las series en las que han actuado. El proyecto utiliza **Grid** para presentar la información de manera organizada. Además, integra una **API REST** para obtener los datos de los personajes e incluye **Unit Testing** para garantizar la calidad del código.

![MarvelApp](https://i.postimg.cc/hjWk92TD/Marvel-Screens.png)

## Características
- **Grid**: Organiza vistas de manera ordenada en filas y columnas.
- **API REST**: La aplicación interactúa con una API REST para obtener información sobre los personajes y sus series.
- **Testing**: El proyecto incluye pruebas unitarias y de integración para asegurar la correcta funcionalidad de las principales características.
- **MVVM**: Se ha utilizado el patrón de diseño MVVM para organizar el código, separando la lógica de negocio (Model), la representación de la interfaz de usuario (View) y el manejo de los datos (ViewModel).
- **Combine**: Implementación de Combine para manejar la reactividad de los datos.
- **Async/Await**: Uso de async/await para realizar solicitudes a la API de manera eficiente.
- **Swift Packages**: Uso de **ViewInspector** para testear nuestras vistas y sub-vistas.
- **TipKit**: Implementación de TipKit para proporcionar consejos útiles al usuario de manera dinámica dentro de la aplicación.

## Tecnologías
- SwiftUI
- Xcode
- Grid
- API REST
- Unit Testing
- MVVM
- Combine
- Async/Await
- Swift Packages
- TipKit

## Instalación

1. Clona este repositorio:
   ```bash
   https://github.com/KevinHe1496/MarvelApp.git
   ```
2. Abre el proyecto en Xcode.
3. Ejecuta el proyecto en un simulador o dispositivo físico.

## Uso

1. **Listado de personajes:**  
   Al iniciar la aplicación, podrás ver una lista de personajes de **Marvel**.  

2. **Información de personajes:**  
   Selecciona un personaje para ver información sobre las series en las que ha participado.  

3. **Configuración**  
   - Si al iniciar la aplicación no aparece ningún héroe en el listado, asegúrate de configurar los parámetros `hash`, `ts` y `apikey` en el archivo **NetworkHeroes.swift**.  
   - Si al hacer tap en un héroe no aparece información sobre las series en las que participó, también debes configurar estos parámetros en el archivo **NetworkSeries.swift**.  
   - **Nota:** Los valores de `hash`, `ts` y `apikey` se encuentran en el archivo **ConstantsApp.swift** del proyecto.  

   ### Ejemplos:  
   - **Configuración en NetworkHeroes.swift:**  
     ```swift
     let urlString = "\(ConstantsApp.CONS_API_URL)\(EndPoints.heros.rawValue)?hash=\(ConstantsApp.CONS_HASH)&ts=\(ConstantsApp.CONS_TS)&apikey=\(ConstantsApp.CONS_PUBLIC_KEY)"
     ```  
   - **Configuración en NetworkSeries.swift:**  
     ```swift
     let urlString = "\(ConstantsApp.CONS_API_URL)\(EndPoints.series.rawValue)\(id)/series?hash=\(ConstantsApp.CONS_HASH)&ts=\(ConstantsApp.CONS_TS)&apikey=\(ConstantsApp.CONS_PUBLIC_KEY)"
     ```  

## Pruebas

Para ejecutar las pruebas del proyecto, sigue estos pasos:

1. Abre el proyecto en Xcode.
2. Presiona `Cmd + U` para ejecutar las pruebas.

## Conecta conmigo

- [LinkedIn](https://www.linkedin.com/in/kevin-heredia-esparza/)
- [GitHub](https://github.com/KevinHe1496)
