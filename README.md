# CodigoAzul

Codigo azul es un sistema desarrollado con el objetivo de que los distintos pacientes y personal de un establecimiento medico puedan pedir una alerta facilmente.
Para poder lograr esto, el proyecto se divide en tres partes.

* Pantalla o mando de alerta (Arduino)
* Aplicacion movil (Android)
* Sistema de gestion web

El sistema esta interconectado entre si. Desde la pantalla o mando de alerta se pueden presionar dos tipos de botones, alerta urgente o alerta normal. Una vez se activa la alerta,
esta se actualiza tanto en el dispositivo movil como en el sistema de gestion web, informando el caso. Ademas, la pantalla se mantendra con un mensaje de alerta y realizando un sonido indicando que hay una urgencia.

La alarma puede desactivarse apretando otra vez el boton de alerta. Si una alerta urgente esta sucediendo, no sucedera nada al apretar el boton de alerta normal. En cambio, si hubiese una alerta normal, y se presionara el boton de alerta urgente **esta la suplantaria**.

*El codigo necesario para ejecutar arduino se encuentra dentro de la carpeta con su mismo nombre.*

En el sistema de gestion, se pueden realizar diversas tareas respecto a los miembros de la organizacion. Se puede gestionar:
* Pacientes
* Personal hospitalario
* Areas
* Usuarios 
> Los usuarios son necesarios para el ingreso, tanto a la aplicacion como al sistema web. Es necesario la creacion de un usuario a traves de la base de datos para ser el primero, el cual es administrador.

__Las llamadas no pueden ser modificadas ni eliminadas de ninguna manera.__

Por ultimo, la aplicacion, luego de realizar el login, actualiza las llamadas constantemente cada segundo. Solo trae las ultimas diez llamadas, tanto urgentes como normales, atendidas y no atendidas.

*El codigo necesario para android se encuentra en la carpeta Android*

