# Preguntas Teoricas

## Sobre implementar funcionalidad:
### ¿Esos tests pasaron (los tres) de una?

No, fuimos de a poco implementando lo necesario para cada test.

### ¿Podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03?

Si.

### ¿Se te ocurre cómo?

Intentando responder lo que pedia cada test, sumandole el siguiente test cuando funcionaba el/los anterior/es.

### Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

Programar de esta forma permite un codigo mas prolijo y con menos chance a errores pasando de paso a paso.


## Sobre código repetido:
### ¿Les quedó código repetido? 

Si.

### ¿Dónde? 

En los metodos del mensaje #intentarReproducirse de los obejtos que representan las avispas Ornella y Oriana 
(y podriamos incluir a Polly ya que su codigo es muy similar al de esos 2).

### ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? 

Creemos que como la firma genetica de los huevos de Oriana y Ornella son iguales, 
podriamos haberlos hecho como si fueran un solo tipo de huevo en vez de separarlos por avispa.

## Responsabilidad de dejar un huevo consumiendo otro insecto 
### ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat?

La avispa le pregunta Habitat y este comprueba si hay suficientes polillas u orugas para poder dejar un huevo.

### ¿Por qué? 

Porque el encargado de saber cuantas polillas u orugas hay es el Habitat.

### ¿Por qué tendría sentido que fuera de la otra forma?

Porque la Avispa en cuestion podria "buscar" dentro del habitat si hay o preguntarle a un posible objeto grupoDeOrugas si tiene miembros.

### ¿Con cuál nos quedamos?

En nuestra opinion creemos que es más sencillo preguntarle al Habitat las cantidades de polillas u orugas.


## Sobre código repetido 2:
### Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? 

Si hubieramos implementado a Ornella como hija de Orianna (o viceversa) era mas sencillo porque ambas comparten mensaje y 
segun el modelo su firma genetica es igual entonces el codigo podria llegar a ser el mismo.

### Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? 

Usamos un diccionario indexado por los nombres de cada una de las Avispas. 
Tambien usamos una coleccion a la hora de hacer la suma total de los huevos de todas las avispas.

### Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Se podria haber hecho menos pero con el diccionario se simplifica el codigo y 
es mas claro al no tener que almacenar las cantidades en distintos colaboradores internos.
