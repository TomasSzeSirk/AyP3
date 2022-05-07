# Preguntas teóricas

## Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

### El primer llamado aporta la clase del objeto al que se le envía el mensaje, con un segundo objeto como colaborador (de clase desconocida). El segundo mensaje se envia al segundo objeto (cuya clase todavía desconocemos) utilizando al primer objeto como colaborador para determinar qué método le corresponde usar al segundo objeto según su clase.

## Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

### Nos parece mejor plantear la lógica de cómo instanciar cada objeto dentro de la clase del objeto que se busca instanciar. Si se creara desde otra clase (como por ejemplo, una superclase), estaríamos instanciando desde una clase abstracta que no debería ser instanciada. Si esto sucediera intentaríamos delegarle la responsabilidad de hacerlo a la clase del objeto correspondiente.

## Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

### Primero, los categorizamos diferenciando entre privado y público, teniendo en cuenta si estos mensajes se utilizan desde fuera o dentro del modelo. Luego, los agrupamos por función teniendo en cuénta la clase del objeto con el que trabajan los métodos (Entero o Fracción en este caso).

## Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

### Si crearamos otro objeto dentro del modelo tendría que tener esos mensajes, y tendríamos que implementar los métodos que correspondan para que funcione. Además, que todas las subclases tengan el mismo método que su superclase reafirma que el "qué" del mensaje en cuestión debe ser el mismo para cualquier clase, dejando el "cómo" en manos de las subclases. Esto es esencial (según Bobby Woolf) para crear una jerarquía polimórfica.

## No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

### Al romper encapsulamiento se pierde la noción de las responsabilidades de cada clase y hace más confuso el código.