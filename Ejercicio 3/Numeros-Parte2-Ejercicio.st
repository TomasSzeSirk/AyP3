!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'TSS 5/5/2022 21:00:41'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 22:45:31'!
beAddedToAnEntero: anEnteroAugend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 22:47:01'!
beMultipliedByAnEntero: anEnteroMultiplicand

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 22:52:55'!
divideAnEntero: anEnteroDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 22:48:02'!
sustractAnEntero: anEnteroMinuend

	self subclassResponsibility ! !


!Numero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 22:43:28'!
beAddedToAFraccion: aFractionAugend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 22:46:46'!
beMultipliedByAFraccion: aFraccionMultiplicand

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 22:52:40'!
divideAFraccion: aFraccionDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 22:47:46'!
sustractAFraccion: aFraccionMinuend

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'TSS 5/5/2022 20:44:38'!
* aMultiplier 
	
	^aMultiplier beMultipliedByAnEntero: self.

	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TSS 5/5/2022 20:31:20'!
+ anAdder 
	^anAdder beAddedToAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TSS 5/6/2022 20:43:22'!
- aSubtrahend

	^aSubtrahend sustractAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TSS 5/6/2022 20:48:13'!
/ aDivisor 
	
	^ aDivisor divideAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NC 5/8/2022 23:07:31'!
fibonacci
	
	self subclassResponsibility.
	! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NC 5/8/2022 23:17:46'!
isNegative
	
	self subclassResponsibility .! !

!Entero methodsFor: 'testing' stamp: 'NC 5/8/2022 23:16:45'!
isOne
	
	self subclassResponsibility .! !

!Entero methodsFor: 'testing' stamp: 'NC 5/8/2022 23:13:10'!
isZero
	
	self subclassResponsibility.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/5/2022 20:28:22'!
beAddedToAnEntero: anEnteroAugend
	
	^self class with: anEnteroAugend integerValue + self integerValue ! !

!Entero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/5/2022 20:41:52'!
beMultipliedByAnEntero: anEnteroMultiplicand
	
	^self class with: self integerValue * anEnteroMultiplicand integerValue! !

!Entero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 22:51:59'!
divideAnEntero: anEnteroDividend
	^Fraccion with: anEnteroDividend over: self! !

!Entero methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 20:20:07'!
sustractAnEntero: anEnteroMinuend
	^ self class with: anEnteroMinuend integerValue - self integerValue! !


!Entero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/5/2022 20:35:40'!
beAddedToAFraccion: aFractionAugend
	^ self value * aFractionAugend denominator + aFractionAugend numerator / aFractionAugend denominator.
	! !

!Entero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/5/2022 20:51:50'!
beMultipliedByAFraccion: aFraccionMultiplicand
	
	^self * aFraccionMultiplicand numerator / aFraccionMultiplicand denominator! !

!Entero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 22:52:11'!
divideAFraccion: aFraccionDividend
	^aFraccionDividend numerator / (self * aFraccionDividend denominator)! !

!Entero methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 20:19:11'!
sustractAFraccion: aFraccionMinuend
	^ aFraccionMinuend numerator  -  (self * aFraccionMinuend denominator) 
	/ aFraccionMinuend denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'NC 5/8/2022 23:23:44'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	
	"Para eliminar los ifTrue del mensaje de fibonacci, convertimos la clase Entero en una clase 
	abstracta y creamos las subclases EnteroCero, EnteroNegativo, EnteroPositivo y EnteroUno.
	 Entendemos que esto conceptualmente está mal, ya que estos entes deberían ser instancias de la clase entero y no subclases 
	en sí mismas, pero fue la única forma de eliminar los ifTrue de fibonacci que encontramos.
	 Como consecuencia de esto, tuvimos que usar If Statements en esta parte para instanciar correctamente los enteros que se crean en el setUp de las pruebas."
	aValue = 0 ifTrue: [^EnteroCero new initializeWith: aValue].
	aValue = 1 ifTrue: [^EnteroUno new initializeWith: aValue].
	aValue < 0 ifTrue: [^EnteroNegativo new initializeWith: aValue].
	
	^EnteroPositivo new initializeWith: aValue.! !


!classDefinition: #EnteroCero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroCero methodsFor: 'testing' stamp: 'NC 5/8/2022 23:17:57'!
isNegative
	
	^false.! !

!EnteroCero methodsFor: 'testing' stamp: 'NC 5/8/2022 23:16:53'!
isOne
	
	^false.! !

!EnteroCero methodsFor: 'testing' stamp: 'NC 5/8/2022 23:13:45'!
isZero
	
	^true.! !


!EnteroCero methodsFor: 'arithmetic operations' stamp: 'NC 5/8/2022 23:07:42'!
fibonacci
	
	^Entero with: 1.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'testing' stamp: 'NC 5/8/2022 23:18:04'!
isNegative
	
	^true.! !

!EnteroNegativo methodsFor: 'testing' stamp: 'NC 5/8/2022 23:17:15'!
isOne
	
	^false.! !

!EnteroNegativo methodsFor: 'testing' stamp: 'NC 5/8/2022 23:13:54'!
isZero
	
	^false.! !


!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'NC 5/8/2022 23:07:42'!
fibonacci

	^self error: Entero negativeFibonacciErrorDescription! !


!classDefinition: #EnteroPositivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivo methodsFor: 'testing' stamp: 'NC 5/8/2022 23:18:12'!
isNegative
	
	^false.! !

!EnteroPositivo methodsFor: 'testing' stamp: 'NC 5/8/2022 23:17:21'!
isOne
	
	^false.! !

!EnteroPositivo methodsFor: 'testing' stamp: 'NC 5/8/2022 23:13:58'!
isZero
	
	^false.! !


!EnteroPositivo methodsFor: 'arithmetic operations' stamp: 'NC 5/8/2022 23:07:42'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.! !


!classDefinition: #EnteroUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroUno methodsFor: 'testing' stamp: 'NC 5/8/2022 23:18:17'!
isNegative
	
	^false.! !

!EnteroUno methodsFor: 'testing' stamp: 'NC 5/8/2022 23:17:27'!
isOne
	
	^true.! !

!EnteroUno methodsFor: 'testing' stamp: 'NC 5/8/2022 23:14:01'!
isZero
	
	^false.! !


!EnteroUno methodsFor: 'arithmetic operations' stamp: 'NC 5/8/2022 23:07:42'!
fibonacci

	^Entero with: 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TSS 5/5/2022 20:49:47'!
* aMultiplier 
	
	^aMultiplier beMultipliedByAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TSS 5/5/2022 20:36:37'!
+ anAdder 

	^anAdder beAddedToAFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TSS 5/6/2022 20:18:32'!
- aSubtrahend 
	
	^ aSubtrahend sustractAFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TSS 5/6/2022 20:50:13'!
/ aDivisor 
	
	^aDivisor divideAFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/5/2022 20:17:25'!
beAddedToAnEntero: anEnteroAugend
	
	^ (anEnteroAugend * self denominator + self numerator)/ self denominator! !

!Fraccion methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/5/2022 20:41:28'!
beMultipliedByAnEntero: anEnteroMultiplicand
	
	^ self numerator * anEnteroMultiplicand / self denominator! !

!Fraccion methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 22:51:43'!
divideAnEntero: anEnteroDividend
	^(anEnteroDividend * self denominator)/ self numerator ! !

!Fraccion methodsFor: 'arithmetic operations with enteros - private' stamp: 'TSS 5/6/2022 20:19:53'!
sustractAnEntero: anEnteroMinuend
	^ anEnteroMinuend * self denominator - self numerator/ 	self denominator! !


!Fraccion methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/5/2022 20:34:07'!
beAddedToAFraccion: aFractionAugend

	|newNumerator newDenominator|
	
	newNumerator := (self numerator * aFractionAugend denominator) + (self denominator * aFractionAugend numerator).
	newDenominator := self denominator * aFractionAugend denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/5/2022 20:49:06'!
beMultipliedByAFraccion: aFraccionMultiplicand
	
	^(self numerator * aFraccionMultiplicand numerator) / (self denominator * aFraccionMultiplicand denominator)! !

!Fraccion methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 22:51:33'!
divideAFraccion: aFraccionDividend
	^(aFraccionDividend numerator * self denominator) / (aFraccionDividend denominator * self numerator)! !

!Fraccion methodsFor: 'arithmetic operations with fracciones - private' stamp: 'TSS 5/6/2022 20:19:40'!
sustractAFraccion: aFraccionMinuend
	| newNumerator newDenominator |
	
	newNumerator := (aFraccionMinuend numerator * self denominator) - (aFraccionMinuend denominator * self numerator).
	newDenominator := aFraccionMinuend denominator * self denominator.
	
	^newNumerator / newDenominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'TSS 5/6/2022 20:22:14'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
