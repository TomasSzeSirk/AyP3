!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 16:17:48'!
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

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/13/2022 23:30:28'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects
	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self should: [ stack pop ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: anError messageText = OOStack stackEmptyErrorDescription ]! !

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
	instanceVariableNames: 'sentenceFinderByPrefixes stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:29:09'!
test01CannotSearchIfPrefixIsEmpty
	|prefix|
	
	self createStack.
	self createSentenceFInderByPrefix.
	
	prefix := ''.
	
	self verifyIfException: [ :anError | self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription.] for: [ sentenceFinderByPrefixes find: prefix ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:29:47'!
test02CannotSearchIfPrefixHasABlankSpace
	|prefix|
	
	self createStack.
	self createSentenceFInderByPrefix.
	
	prefix := 'Bo '.

	self verifyIfException: [ :anError | self assert: anError messageText = SentenceFinderByPrefix  	prefixHasBlankSpaceErrorDescription.] for: [ sentenceFinderByPrefixes find: prefix ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:21:33'!
test03AnswersColectionEmptyIfNotFound

	|prefix answers|
	
	self createStack.
	self createSentenceFInderByPrefix.
	
	prefix := 'Ri'.
	answers := sentenceFinderByPrefixes find: prefix.
	
	self assert: answers isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:21:14'!
test04ReturnTheFoundPhrase

	|prefix answers|
	
	self createStack.
	self createSentenceFInderByPrefix.
	
	prefix := 'Bo'.
	answers := sentenceFinderByPrefixes find: prefix.
	
	self assert: (answers size = 1 and: (answers at: 1) = 'Boca').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:20:56'!
test05StackUsedIsNotDifferentAtTheEnd

	|prefix finalStack|
	
	self createStack.
	self createSentenceFInderByPrefix.
	
	prefix := 'Bo'.
	sentenceFinderByPrefixes find: prefix.
	
	finalStack := sentenceFinderByPrefixes returnStack.
	
	self assert: stack = finalStack .! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:20:46'!
test06AnswersColectionEmptyIfStackIsEmpty

	|prefix answers|
	
	stack := OOStack new.
	self createSentenceFInderByPrefix.
	
	prefix := 'Bo'.
	answers := sentenceFinderByPrefixes find: prefix.
	
	self assert: answers isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TSS 5/16/2022 14:20:30'!
test07SentenceFinderByPrefixesIsCaseSensitive

	|prefix answers|
	
	self createStack.
	self createSentenceFInderByPrefix.
	
	prefix := 'bo'.
	answers := sentenceFinderByPrefixes find: prefix.
	
	self assert: answers isEmpty.! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'TSS 5/16/2022 14:20:12'!
createSentenceFInderByPrefix
	sentenceFinderByPrefixes := SentenceFinderByPrefix new.
	sentenceFinderByPrefixes initializeWith: stack .! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'TSS 5/16/2022 14:17:30'!
createStack
	stack := OOStack new.
	stack push: 'Boca'.
	stack push: 'San Lorenzo'.
	stack push: 'Racing'.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'TSS 5/16/2022 14:27:47'!
verifyIfException: anErrorBlock for: aBlock
	self should: aBlock 
	raise: Error - MessageNotUnderstood
	withExceptionDo: anErrorBlock.! !


!classDefinition: #OOEstado category: 'Stack-Exercise'!
Object subclass: #OOEstado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEstado methodsFor: 'verifier' stamp: 'TSS 5/16/2022 15:19:57'!
canPopSuccesfully: aStack
	self subclassResponsibility.! !

!OOEstado methodsFor: 'verifier' stamp: 'NC 5/11/2022 23:57:36'!
canTopSuccesfully: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEstado class' category: 'Stack-Exercise'!
OOEstado class
	instanceVariableNames: ''!

!OOEstado class methodsFor: 'as yet unclassified' stamp: 'TSS 5/12/2022 20:11:13'!
withStack: aStack
	^(self subclasses detect: [:subclass| subclass detectIfItIsEmpty: aStack ]) new.! !


!classDefinition: #OONoVacio category: 'Stack-Exercise'!
OOEstado subclass: #OONoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONoVacio methodsFor: 'verifier' stamp: 'TSS 5/12/2022 19:45:17'!
canPopSuccesfully: aStack
	^aStack canPop.	! !

!OONoVacio methodsFor: 'verifier' stamp: 'TSS 5/16/2022 16:00:50'!
canPushSuccesfully: aStack with: aString
	self subclassResponsibility ! !

!OONoVacio methodsFor: 'verifier' stamp: 'TSS 5/12/2022 19:45:10'!
canTopSuccesfully: aStack
	^aStack canTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONoVacio class' category: 'Stack-Exercise'!
OONoVacio class
	instanceVariableNames: ''!

!OONoVacio class methodsFor: 'as yet unclassified' stamp: 'TSS 5/12/2022 20:11:12'!
detectIfItIsEmpty: aStack
	^aStack isEmpty not.! !

!OONoVacio class methodsFor: 'as yet unclassified' stamp: 'TSS 5/16/2022 15:26:43'!
detectIfItIsFull: aStackWithLimit
	
	self subclassResponsibility.! !


!classDefinition: #OOVacio category: 'Stack-Exercise'!
OOEstado subclass: #OOVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOVacio methodsFor: 'verifier' stamp: 'TSS 5/13/2022 22:38:56'!
canPopSuccesfully: aStack
	^aStack cantRealizeOperation.! !

!OOVacio methodsFor: 'verifier' stamp: 'TSS 5/13/2022 22:38:56'!
canTopSuccesfully: aStack
	^aStack cantRealizeOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOVacio class' category: 'Stack-Exercise'!
OOVacio class
	instanceVariableNames: ''!

!OOVacio class methodsFor: 'as yet unclassified' stamp: 'TSS 5/12/2022 20:11:13'!
detectIfItIsEmpty: aStack
	^aStack isEmpty.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents stackState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'TSS 5/13/2022 22:37:58'!
isEmpty
	^contents size = 0.! !


!OOStack methodsFor: 'private' stamp: 'TSS 5/13/2022 22:37:48'!
canPop
	| lastElement |
	
	lastElement := contents removeLast.
	
	stackState := OOEstado withStack: self.
	
	^lastElement ! !

!OOStack methodsFor: 'private' stamp: 'TSS 5/13/2022 22:37:48'!
canTop
	^contents last.! !

!OOStack methodsFor: 'private' stamp: 'TSS 5/13/2022 22:38:56'!
cantRealizeOperation
	self error: OOStack stackEmptyErrorDescription.! !


!OOStack methodsFor: 'initialization' stamp: 'TSS 5/16/2022 16:11:58'!
initialize
	contents := OrderedCollection new.
	stackState := OOVacio new.! !


!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/12/2022 19:41:19'!
pop
	^stackState canPopSuccesfully: self.
	! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 16:27:16'!
push: aString

	contents addLast: aString.
	
	stackState := OOEstado withStack: self.
	! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/13/2022 22:37:48'!
size
	^contents size.! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/12/2022 19:41:27'!
top
	^stackState canTopSuccesfully: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'TSS 5/13/2022 22:54:48'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'TSS 5/16/2022 15:52:26'!
stackFullErrorDescription
	^ 'Stack is full'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack auxiliarStack answers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialiazation' stamp: 'TSS 5/14/2022 22:52:37'!
initializeWith: aStack
	stack := aStack.
	auxiliarStack := OOStack new.
	answers := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'TSS 5/14/2022 23:22:28'!
passElementsFrom: firstStack to: secondStack evaluating: aBlock
	|phrase|
	
	firstStack size timesRepeat: 
	[phrase := self popFrom: 	firstStack toPushTo: secondStack.
		aBlock value: phrase.].
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'TSS 5/14/2022 22:56:47'!
popFrom: firstStack toPushTo: secondStack
	|phrase|
	
	phrase := firstStack pop.
	secondStack push: phrase.
	
	^phrase ! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'TSS 5/14/2022 23:32:59'!
verify: aPrefix
	
	aPrefix isEmpty ifTrue: [self error: SentenceFinderByPrefix prefixEmptyErrorDescription].
	(aPrefix includes: $ ) ifTrue: [self error: SentenceFinderByPrefix prefixHasBlankSpaceErrorDescription ].! !


!SentenceFinderByPrefix methodsFor: 'getter' stamp: 'TSS 5/14/2022 22:44:52'!
returnStack
	^stack ! !


!SentenceFinderByPrefix methodsFor: 'filtering' stamp: 'TSS 5/14/2022 23:32:42'!
find: aPrefix
	
	self verify: aPrefix.
		
	self passElementsFrom: stack to: auxiliarStack  evaluating: [:phrase| (phrase beginsWith: aPrefix ) ifTrue: [answers  	add: phrase.]].
	
	self passElementsFrom: stack to: auxiliarStack  evaluating: [^self].
	
	^answers 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'TSS 5/14/2022 00:39:55'!
prefixEmptyErrorDescription

	^'El prefijo esta vacio'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'TSS 5/14/2022 00:39:50'!
prefixHasBlankSpaceErrorDescription

	^'El prefijo tiene un espacio vacio'! !
