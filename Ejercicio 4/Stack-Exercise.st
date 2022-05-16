!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:05:34'!
test01StackShouldBeEmptyWhenCreated


	| stack |
	
	
	stack := OOStackLimitless new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:05:27'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStackLimitless new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:04:07'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStackLimitless new.
	stack push: 'something'.
	stack pop.
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:05:40'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackLimitless new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:05:45'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStackLimitless new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:05:51'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackLimitless new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:06:23'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStackLimitless new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:07:03'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackLimitless new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimitless stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:06:46'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects
	| stack  |
	
	stack := OOStackLimitless new.
	stack push: 'something'.
	stack pop.
	
	self should: [ stack pop ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: anError messageText = OOStackLimitless stackEmptyErrorDescription ]! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:06:56'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackLimitless new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimitless stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TSS 5/16/2022 17:51:46'!
test11CanNotPushWhenTheStackIsStack


	| stack |
	
	
	stack := OOStackWithLimit withLimit: 1.
	stack push: 'something'.
	
	self should: [ stack push: 'something else']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimitless stackFullErrorDescription ]
	
	
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

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'TSS 5/16/2022 19:12:51'!
createStack
	stack := OOStackLimitless new.
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

!OOEstado methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:21:50'!
anPushSuccesfully: aStack with: aString
	self subclassResponsibility ! !

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

!OOEstado class methodsFor: 'create initialization' stamp: 'TSS 5/16/2022 17:11:42'!
withStack: aStack
	^(self subclasses detect: [:subclass| subclass detectIfItIsTheCorrectState: aStack ]) new.! !


!classDefinition: #OOLleno category: 'Stack-Exercise'!
OOEstado subclass: #OOLleno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLleno methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:08:14'!
canPopSuccesfully: aStack
	^aStack canPop.	! !

!OOLleno methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:53:08'!
canPushSuccesfully: aStack with: aString
	aStack cantRealizeAddingOperation .! !

!OOLleno methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:08:29'!
canTopSuccesfully: aStack
	^aStack canTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLleno class' category: 'Stack-Exercise'!
OOLleno class
	instanceVariableNames: ''!

!OOLleno class methodsFor: 'detect' stamp: 'TSS 5/16/2022 17:14:40'!
detectIfItIsTheCorrectState: aStack
	^aStack isFull.! !


!classDefinition: #OONiVacioNiLleno category: 'Stack-Exercise'!
OOEstado subclass: #OONiVacioNiLleno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONiVacioNiLleno methodsFor: 'verifier' stamp: 'TSS 5/12/2022 19:45:17'!
canPopSuccesfully: aStack
	^aStack canPop.	! !

!OONiVacioNiLleno methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:22:33'!
canPushSuccesfully: aStack with: aString
	aStack canPush: aString! !

!OONiVacioNiLleno methodsFor: 'verifier' stamp: 'TSS 5/12/2022 19:45:10'!
canTopSuccesfully: aStack
	^aStack canTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONiVacioNiLleno class' category: 'Stack-Exercise'!
OONiVacioNiLleno class
	instanceVariableNames: ''!

!OONiVacioNiLleno class methodsFor: 'detect' stamp: 'TSS 5/16/2022 17:13:17'!
detectIfItIsTheCorrectState: aStack
	^aStack isEmpty not and: [aStack isFull not].! !


!classDefinition: #OOVacio category: 'Stack-Exercise'!
OOEstado subclass: #OOVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOVacio methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:56:57'!
canPopSuccesfully: aStack
	^aStack cantRealizeEliminationOperation.! !

!OOVacio methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:23:27'!
canPushSuccesfully: aStack with: aString
	aStack canPush: aString ! !

!OOVacio methodsFor: 'verifier' stamp: 'TSS 5/16/2022 17:56:58'!
canTopSuccesfully: aStack
	^aStack cantRealizeEliminationOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOVacio class' category: 'Stack-Exercise'!
OOVacio class
	instanceVariableNames: ''!

!OOVacio class methodsFor: 'detect' stamp: 'TSS 5/16/2022 17:12:23'!
detectIfItIsTheCorrectState: aStack
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

!OOStack methodsFor: 'testing' stamp: 'TSS 5/16/2022 17:54:14'!
isFull
	self subclassResponsibility.! !


!OOStack methodsFor: 'initialization' stamp: 'TSS 5/16/2022 16:11:58'!
initialize
	contents := OrderedCollection new.
	stackState := OOVacio new.! !


!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/13/2022 22:37:48'!
canPop
	| lastElement |
	
	lastElement := contents removeLast.
	
	stackState := OOEstado withStack: self.
	
	^lastElement ! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/13/2022 22:37:48'!
canTop
	^contents last.! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 17:57:33'!
cantRealizeEliminationOperation
	self error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/12/2022 19:41:19'!
pop
	^stackState canPopSuccesfully: self.
	! !

!OOStack methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 17:02:39'!
push: aString

	self subclassResponsibility.
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


!classDefinition: #OOStackLimitless category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimitless
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimitless methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 17:02:57'!
push: aString
	
	contents addLast: aString.
	
	stackState := OOEstado withStack: self.! !


!OOStackLimitless methodsFor: 'testing' stamp: 'TSS 5/16/2022 17:55:16'!
isFull
	^false! !


!classDefinition: #OOStackWithLimit category: 'Stack-Exercise'!
OOStack subclass: #OOStackWithLimit
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackWithLimit methodsFor: 'initialization' stamp: 'TSS 5/16/2022 17:38:37'!
initializeWith: anInteger
	limit := 	anInteger! !


!OOStackWithLimit methodsFor: 'testing' stamp: 'TSS 5/16/2022 17:30:56'!
isFull
	^self size = limit! !


!OOStackWithLimit methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 17:31:22'!
canPush: aString
	contents addLast: aString.
	
	stackState := OOEstado withStack: self.! !

!OOStackWithLimit methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 17:53:08'!
cantRealizeAddingOperation
	self error: OOStack stackFullErrorDescription.! !

!OOStackWithLimit methodsFor: 'basic operations' stamp: 'TSS 5/16/2022 17:36:15'!
push: aString

	stackState canPushSuccesfully: self with: aString 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackWithLimit class' category: 'Stack-Exercise'!
OOStackWithLimit class
	instanceVariableNames: ''!

!OOStackWithLimit class methodsFor: 'create initialization' stamp: 'TSS 5/16/2022 17:37:50'!
withLimit: anInteger
	^self new initializeWith: anInteger.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack auxiliarStack answers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialiazation' stamp: 'TSS 5/16/2022 17:43:48'!
initialize
	auxiliarStack := OOStackLimitless new.
	answers := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'initialiazation' stamp: 'TSS 5/16/2022 17:43:55'!
initializeWith: aLimitlessStack
	stack := aLimitlessStack.! !


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


!SentenceFinderByPrefix methodsFor: 'getter' stamp: 'TSS 5/16/2022 17:18:56'!
returnStack
	^stack ! !


!SentenceFinderByPrefix methodsFor: 'filtering' stamp: 'TSS 5/16/2022 17:19:09'!
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


!SentenceFinderByPrefix class methodsFor: 'create initialization' stamp: 'TSS 5/16/2022 17:46:49'!
withAStack: aLimitlessStack
	^self new initializeWith: aLimitlessStack.! !
