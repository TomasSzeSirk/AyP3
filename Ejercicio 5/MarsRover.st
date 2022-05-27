!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 18:15:42'!
test01
	|marsRover|
	marsRover := MarsRover new.
	self assert: (marsRover position = (0@0))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 18:56:31'!
test02
	
	|marsRover|
	marsRover := MarsRover new.
	marsRover sendComands: 'f'.
	self assert: (marsRover position = (0@1))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 18:56:23'!
test03

	|marsRover|
	marsRover := MarsRover new.
	marsRover sendComands: 'b'.
	self assert: (marsRover position = (0@-1))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 18:43:39'!
test04
	|marsRover|
	marsRover := MarsRover new.
	marsRover sendComands: 'fbf'.
	self assert: (marsRover position = (0@1))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:06:54'!
test05
	|aMarsRover|
	aMarsRover := MarsRover new.
	self assert: (aMarsRover cardinalPoint = 'N')! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:08:54'!
test06
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'l'.
	self assert: (aMarsRover cardinalPoint = 'W')! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:26:11'!
test07
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'r'.
	self assert: (aMarsRover cardinalPoint = 'E')! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:26:54'!
test08
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'lr'.
	self assert: (aMarsRover cardinalPoint = 'N')! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #East category: 'MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:18:56'!
symbol
	^'E'! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:18:11'!
symbol
	^'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:16:15'!
symbol! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:18:23'!
symbol
	^'S'! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:18:40'!
symbol
	^'W'! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:17:35'!
cardinalPoint
	^direction symbol! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:13:55'!
initialize
	position := 0@0.
	direction := North new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 18:22:11'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:17:23'!
sendComand: aCommand 
	aCommand = $f ifTrue: [position := position + (0@1)].
	aCommand = $b ifTrue: [position := position + (0@-1)].
	aCommand = $l ifTrue: [direction := West new].
	aCommand = $r ifTrue: [direction := East new].
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 18:41:43'!
sendComands: aLineOfCommands
	
	aLineOfCommands do: [:aCommand| self sendComand: aCommand ]
	
! !
