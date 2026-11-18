# Respuestas

## 1. Mantener D durante dos segundos y soltarla

El contador de cuadros con la accion pulsada sube mas. El sondeo revisa el estado de `move_right` en cada actualizacion de fisica, mientras que el otro contador registra sus eventos de pulsacion y liberacion. El eco del teclado se ignora.

A 60 actualizaciones de fisica por segundo, dos segundos producen aproximadamente 120 cuadros pulsados y dos eventos: presionar y soltar. La cifra de cuadros puede variar con el tiempo real que se mantenga la tecla. Los contadores son acumulados: se puede reiniciar con F8 y F6 para comparar desde cero.

## 2. Mantener A

`Input.get_axis("move_left", "move_right")` muestra **-1.00**, mientras que `Input.get_action_strength("move_right")` muestra **0.00**.

El eje combina las dos direcciones: fuerza de la derecha menos fuerza de la izquierda. Con solo A, el resultado es 0 - 1 = -1. La fuerza de `move_right` solo consulta D; como D no esta pulsada, vale cero.

## 3. Girar la rueda del raton

La clase del evento es **InputEventMouseButton**. El indice del boton identifica el paso de la rueda. El panel lo muestra como **Digital (paso de rueda)**, diferenciandolo de **Digital (clic)**.

La comprobacion de rueda debe ir antes que el caso general de clic porque ambos pertenecen a la misma clase. Si todos los InputEventMouseButton se trataran primero como clics, la rueda quedaria clasificada incorrectamente.

El panel conserva el ultimo evento de teclado o raton. Para observar la rueda, no muevas el raton despues de girarla: un movimiento posterior mostrara InputEventMouseMotion.
