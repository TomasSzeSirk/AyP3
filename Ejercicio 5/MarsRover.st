!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:07:28'!
test01MarsRoverStartsAtOrigin
	|marsRover|
	marsRover := MarsRover new.
	self assert: (marsRover position = (0@0))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:07:52'!
test02MarsRoverCanMoveForward
	
	|marsRover|
	marsRover := MarsRover new.
	marsRover sendComands: 'f'.
	self assert: (marsRover position = (0@1))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:08:12'!
test03MarsRoverCanMoveBackwards

	|marsRover|
	marsRover := MarsRover new.
	marsRover sendComands: 'b'.
	self assert: (marsRover position = (0@-1))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:10:11'!
test04MarsRoverCanMoveBackwardsAndForward
	|marsRover|
	marsRover := MarsRover new.
	marsRover sendComands: 'fbf'.
	self assert: (marsRover position = (0@1))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:38:31'!
test05MarsRoverStartsPointingNorth
	|aMarsRover|
	aMarsRover := MarsRover new.
	self assert: (aMarsRover directionSymbol = #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:38:26'!
test06MarsRoverCanTurnLeft
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'l'.
	self assert: (aMarsRover directionSymbol = #West)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:38:21'!
test07MarsRoverCanTurnRight
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'r'.
	self assert: (aMarsRover directionSymbol = #East)
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:38:13'!
test08MarsRoverCanChangeDirectionMoreThanOnce
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'lr'.
	self assert: (aMarsRover directionSymbol = #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:40:13'!
test09MarsRoverCanMoveForwardInADifferentDirection
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'lf'.
	self assert: (aMarsRover position = (-1@0))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:40:43'!
test10MarsRoverCanMoveBackwardsInADifferentDirection
	|aMarsRover|
	aMarsRover := MarsRover new.
	aMarsRover sendComands: 'lb'.
	self assert: (aMarsRover position = (1@0))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:41:38'!
test11MarsRoverSendsErrorMessageWhenInexistentCommandIsSent
	|aMarsRover|
	aMarsRover := MarsRover new.
	
	self should: [ aMarsRover sendComands: 'x'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText =MarsRover inexistentCommandErrorDescription]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TSS 5/31/2022 17:42:23'!
test12MarsRoverCutTheCommandChainWhenInexistentCommandSent
	|aMarsRover|
	aMarsRover := MarsRover new.
	
	self should: [ aMarsRover sendComands: 'fxf'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText =MarsRover inexistentCommandErrorDescription.
			self assert: aMarsRover position = (0@1)]! !


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


!MarsRover methodsFor: 'movement' stamp: 'a 5/27/2022 20:06:16'!
moveEast

	^ position := position + (1@0)! !

!MarsRover methodsFor: 'movement' stamp: 'a 5/27/2022 19:56:45'!
moveNorth

	^ position := position + (0@1)! !

!MarsRover methodsFor: 'movement' stamp: 'a 5/27/2022 19:57:05'!
moveSouth

	^ position := position + (0@-1)! !

!MarsRover methodsFor: 'movement' stamp: 'a 5/27/2022 20:06:12'!
moveWest

	^ position := position + (-1@0)! !


!MarsRover methodsFor: 'rotation' stamp: 'a 5/27/2022 19:57:23'!
faceEast

	^ direction := East new! !

!MarsRover methodsFor: 'rotation' stamp: 'a 5/27/2022 20:06:30'!
faceNorth

	^ direction := North new! !

!MarsRover methodsFor: 'rotation' stamp: 'a 5/27/2022 20:06:25'!
faceSouth

	^ direction := South new! !

!MarsRover methodsFor: 'rotation' stamp: 'a 5/27/2022 20:05:36'!
faceWest

	^ direction := West new! !


!MarsRover methodsFor: 'getter' stamp: 'TSS 5/31/2022 16:56:13'!
direction
	^direction! !

!MarsRover methodsFor: 'getter' stamp: 'TSS 5/31/2022 17:37:58'!
directionSymbol
	^(direction asSymbol)! !

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

!East methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:04:02'!
turnLeft: aMarsRover
	aMarsRover faceNorth.! !

!East methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:05:53'!
turnRight: aMarsRover
	aMarsRover faceSouth! !


!East methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:23:57'!
moveBackwards: aMarsRover
	aMarsRover moveWest ! !

!East methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:14:51'!
moveForward: aMarsRover
	aMarsRover moveEast.! !


!East methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:31'!
asSymbol
	^#East! !


!classDefinition: #North category: 'MarsRover'!
MarsRoverDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:03:52'!
turnLeft: aMarsRover
	aMarsRover faceWest ! !

!North methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:06:14'!
turnRight: aMarsRover
	aMarsRover faceEast ! !


!North methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:24:13'!
moveBackwards: aMarsRover
	aMarsRover moveSouth ! !

!North methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:15:26'!
moveForward: aMarsRover
	aMarsRover moveNorth ! !


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

!South methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:04:18'!
turnLeft: aMarsRover
	aMarsRover faceEast ! !

!South methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:06:29'!
turnRight: aMarsRover
	aMarsRover faceWest ! !


!South methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:24:34'!
moveBackwards: aMarsRover
	aMarsRover moveNorth ! !

!South methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:18:09'!
moveForward: aMarsRover
	aMarsRover moveSouth ! !


!South methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:23'!
asSymbol
	^#South! !


!classDefinition: #West category: 'MarsRover'!
MarsRoverDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:05:10'!
turnLeft: aMarsRover
	aMarsRover faceSouth ! !

!West methodsFor: 'rotation' stamp: 'TSS 5/31/2022 17:06:50'!
turnRight: aMarsRover
	aMarsRover faceNorth ! !


!West methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:24:48'!
moveBackwards: aMarsRover
	aMarsRover moveEast! !

!West methodsFor: 'movement' stamp: 'TSS 5/31/2022 17:18:33'!
moveForward: aMarsRover
	aMarsRover moveWest! !


!West methodsFor: 'getter' stamp: 'a 5/27/2022 19:50:20'!
asSymbol
	^#West! !
