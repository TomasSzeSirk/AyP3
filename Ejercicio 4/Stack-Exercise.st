!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOEstado category: 'Stack-Exercise'!
Object subclass: #OOEstado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEstado methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:57:40'!
canPopSuccesfully: aStack

	self subclassResponsibility.! !

!OOEstado methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:57:36'!
canTopSuccesfully: aStack

	self subclassResponsibility.! !


!classDefinition: #OONoVacio category: 'Stack-Exercise'!
OOEstado subclass: #OONoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONoVacio methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:53:16'!
canPopSuccesfully: aStack

	^aStack canPop.

	! !

!OONoVacio methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:57:11'!
canTopSuccesfully: aStack

	^aStack canTop.

	! !


!classDefinition: #OOVacio category: 'Stack-Exercise'!
OOEstado subclass: #OOVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOVacio methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:53:16'!
canPopSuccesfully: aStack

	^aStack cantPop.! !

!OOVacio methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:56:12'!
canTopSuccesfully: aStack

	^aStack cantTop.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack stackState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'NC 5/11/2022 23:21:42'!
isEmpty
	^stack size = 0.! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/12/2022 00:00:10'!
canPop
	| lastElement |
	
	lastElement := stack removeLast.
	self isEmpty ifTrue: 
		[ stackState := OOVacio new. ].
	^lastElement ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:56:35'!
canTop

	^stack at: stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:50:07'!
cantPop
	
	self error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:55:59'!
cantTop
	
	self error: OOStack stackEmptyErrorDescription
	
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:32:28'!
initialize
	stack := OrderedCollection new.
	stackState := OOVacio new.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:53:16'!
pop

	^stackState canPopSuccesfully: self.
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:33:09'!
push: aString
	stack addLast: aString.
	stackState := OONoVacio new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:22:10'!
size
	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'NC 5/11/2022 23:57:57'!
top
	
	^stackState canTopSuccesfully: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
