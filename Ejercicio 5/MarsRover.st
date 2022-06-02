!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'aMarsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:18:57'!
test01MarsRoverStartsAtOrigin
	self assert: (aMarsRover position = (0@0))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test02MarsRoverCanMoveForward
	
	self sendCommandToMarsRover: 'f' andAssert: [aMarsRover position = (0@1)].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test03MarsRoverCanMoveBackwards
	
	self sendCommandToMarsRover: 'b' andAssert: [aMarsRover position = (0@-1)].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test04MarsRoverCanMoveBackwardsAndForward
	
	self sendCommandToMarsRover: 'fbf' andAssert: [aMarsRover position = (0@1)].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:18:49'!
test05MarsRoverStartsPointingNorth
	self assert: (aMarsRover directionSymbol = #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test06MarsRoverCanTurnLeft

	self sendCommandToMarsRover: 'l' andAssert: [aMarsRover directionSymbol = #West].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test07MarsRoverCanTurnRight
	
	self sendCommandToMarsRover: 'r' andAssert: [aMarsRover directionSymbol = #East].
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test08MarsRoverCanChangeDirectionMoreThanOnce
	
	self sendCommandToMarsRover: 'lr' andAssert: [aMarsRover directionSymbol = #North].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test09MarsRoverCanMoveForwardInADifferentDirection

	self sendCommandToMarsRover: 'lf' andAssert: [aMarsRover position = (-1@0)].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 20:16:34'!
test10MarsRoverCanMoveBackwardsInADifferentDirection
	
	self sendCommandToMarsRover: 'lb' andAssert: [aMarsRover position = (1@0)].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 6/1/2022 21:07:03'!
test11MarsRoverCutTheCommandChainWhenInexistentCommandSent
	
	self should: [ aMarsRover sendComands: 'fxf'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText =MarsRover inexistentCommandErrorDescription.
			self assert: aMarsRover position = (0@1)]! !


!MarsRoverTest methodsFor: 'private' stamp: 'TSS 6/1/2022 20:16:34'!
sendCommandToMarsRover: aChainOfCommands andAssert: aBlock
	aMarsRover sendComands: aChainOfCommands .
	self assert: aBlock ! !


!MarsRoverTest methodsFor: 'setup' stamp: 'TSS 6/1/2022 20:17:31'!
setUp
	aMarsRover := MarsRover new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'command sender' stamp: 'a 5/27/2022 19:54:28'!
sendComands: aLineOfCommands
	aLineOfCommands do: [:aCommand| self sendComand: aCommand ]
	
! !


!MarsRover methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:18:45'!
moveInDirectionOf: aVector

	^ position := position + aVector ! !


!MarsRover methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:25:20'!
faceToDirection: aDirection

	^ direction := aDirection ! !


!MarsRover methodsFor: 'getter' stamp: 'TSS 5/31/2022 16:56:13'!
direction
	^direction! !

!MarsRover methodsFor: 'getter' stamp: 'TSS 6/1/2022 21:07:42'!
directionSymbol
	^direction asSymbol! !

!MarsRover methodsFor: 'getter' stamp: 'TSS 5/27/2022 18:22:11'!
position
	^position! !


!MarsRover methodsFor: 'initialization' stamp: 'TSS 5/27/2022 19:13:55'!
initialize
	position := 0@0.
	direction := North new.! !


!MarsRover methodsFor: 'private' stamp: 'TSS 5/31/2022 17:35:36'!
sendComand: aCommand 
	aCommand = $f ifTrue: [^direction moveForward: self ].
	aCommand = $b ifTrue: [^direction moveBackwards: self].
	aCommand = $l ifTrue: [^direction turnLeft: self].
	aCommand = $r ifTrue: [^direction turnRight: self].
	
	self error: MarsRover inexistentCommandErrorDescription.
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'TSS 5/31/2022 17:30:44'!
inexistentCommandErrorDescription
	^'The command does not exist'! !


!classDefinition: #MarsRoverDirection category: 'MarsRover'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverDirection methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:01:24'!
turnLeft: aMarsRover
	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:01:30'!
turnRight: aMarsRover
	self subclassResponsibility ! !


!MarsRoverDirection methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:24:56'!
moveBackwards: aMarsRover 
	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'movement' stamp: 'TSS 5/31/2022 16:58:56'!
moveForward: aMarsRover
	self subclassResponsibility ! !


!MarsRoverDirection methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:42'!
asSymbol
	self subclassResponsibility .! !


!classDefinition: #East category: 'MarsRover'!
MarsRoverDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:25:49'!
turnLeft: aMarsRover
	aMarsRover faceToDirection: North new.! !

!East methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:26:10'!
turnRight: aMarsRover
	aMarsRover faceToDirection: South new.! !


!East methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:21:46'!
moveBackwards: aMarsRover
	aMarsRover moveInDirectionOf: (-1@0)! !

!East methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:22:01'!
moveForward: aMarsRover
	aMarsRover moveInDirectionOf: (1@0)! !


!East methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:31'!
asSymbol
	^#East! !


!classDefinition: #North category: 'MarsRover'!
MarsRoverDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:26:35'!
turnLeft: aMarsRover
	aMarsRover faceToDirection: West new.! !

!North methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:26:26'!
turnRight: aMarsRover
	aMarsRover faceToDirection: East new.! !


!North methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:22:16'!
moveBackwards: aMarsRover
	aMarsRover moveInDirectionOf: (0@-1)! !

!North methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:22:24'!
moveForward: aMarsRover
	aMarsRover moveInDirectionOf: (0@1)! !


!North methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:28'!
asSymbol
	^#North! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'a 5/27/2022 19:50:01'!
asSymbol! !

!North class methodsFor: 'as yet unclassified' stamp: 'TSS 5/27/2022 19:16:15'!
symbol! !


!classDefinition: #South category: 'MarsRover'!
MarsRoverDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:26:44'!
turnLeft: aMarsRover
	aMarsRover faceToDirection: East new.! !

!South methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:26:54'!
turnRight: aMarsRover
	aMarsRover faceToDirection: West new.! !


!South methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:22:34'!
moveBackwards: aMarsRover
	aMarsRover moveInDirectionOf: (0@1)! !

!South methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:22:48'!
moveForward: aMarsRover
	aMarsRover moveInDirectionOf: (0@-1)! !


!South methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:23'!
asSymbol
	^#South! !


!classDefinition: #West category: 'MarsRover'!
MarsRoverDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:27:03'!
turnLeft: aMarsRover
	aMarsRover faceToDirection: South new.! !

!West methodsFor: 'rotation' stamp: 'TSS 6/1/2022 19:27:07'!
turnRight: aMarsRover
	aMarsRover faceToDirection: North new.! !


!West methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:23:00'!
moveBackwards: aMarsRover
	aMarsRover moveInDirectionOf: (1@0)! !

!West methodsFor: 'movement' stamp: 'TSS 6/1/2022 19:23:13'!
moveForward: aMarsRover
	aMarsRover moveInDirectionOf: (-1@0)! !


!West methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:20'!
asSymbol
	^#West! !
