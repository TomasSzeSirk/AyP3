!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:47:47'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook timeItTakes |

	customerBook := CustomerBook new.
	
	timeItTakes := self timeItTakesToDo: [customerBook addCustomerNamed:'John Lennon' ].
			
	self assert: (timeItTakes < (50 * millisecond))
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:48:27'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	|customerBook timeItTakes |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Paul McCartney'.
	
	timeItTakes := self timeItTakesToDo: [customerBook removeCustomerNamed: 'Paul McCartney'].
	
	self assert: (timeItTakes) < (100 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:23:03'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	customerBook := CustomerBook new.
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 01:42:00'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	
	self verifyThatItIsPossibleToRemove: 'Paul McCartney' CorretlyFrom: customerBook WithoutDeleting: 'John Lennon'.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 01:32:57'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self verifyThatTheNumberOfActiveClientsIs: 0 andTheNumberOfSuspendedClientsIs: 1 in: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 01:33:16'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self verifyThatTheNumberOfActiveClientsIs: 0 andTheNumberOfSuspendedClientsIs: 0 in: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:43:26'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.	

	self verifyThat: 'Ringo Starr' canBeSuspendedCorrectlyFrom: customerBook withoutDeleting: johnLennon.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:42:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self verifyThat: johnLennon canBeSuspendedCorrectlyFrom: customerBook withoutDeleting: johnLennon.! !


!CustomerBookTest methodsFor: 'private' stamp: 'TSS 5/2/2022 00:46:21'!
timeItTakesToDo: AClosure
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	AClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning - millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'private' stamp: 'TSS 5/2/2022 01:01:17'!
verifyThat: name1 canBeSuspendedCorrectlyFrom: aCustomerBook withoutDeleting: name2
    [ aCustomerBook suspendCustomerNamed: name1.
    self fail ]
        on: CantSuspend 
        do: [ :anError | 
            self assert: aCustomerBook numberOfCustomers = 1.
            self assert: (aCustomerBook includesCustomerNamed: name2) ]

! !

!CustomerBookTest methodsFor: 'private' stamp: 'TSS 5/2/2022 01:38:10'!
verifyThatItIsPossibleToRemove: name1 CorretlyFrom: aCustomerBook WithoutDeleting: name2

	self verifyThatTheSignal: NotFound isBeingSentAnd: name2 isStillIn:  aCustomerBook afterExecuting: [ aCustomerBook removeCustomerNamed: name1.
	self fail ].! !

!CustomerBookTest methodsFor: 'private' stamp: 'TSS 5/2/2022 01:39:45'!
verifyThatItIsPossibleToSuspend: name1 CorrectlyFrom: aCustomerBook WithoutDeleting: name2
self verifyThatTheSignal: CantSuspend isBeingSentAnd: name2 isStillIn:  aCustomerBook afterExecuting: [ aCustomerBook removeCustomerNamed: name1.
	self fail ].! !

!CustomerBookTest methodsFor: 'private' stamp: 'TSS 5/2/2022 01:31:33'!
verifyThatTheNumberOfActiveClientsIs: ActiveClients andTheNumberOfSuspendedClientsIs: SuspendedClients in: aCustomerBook
	
	| totalClients |
	
	totalClients := ActiveClients + SuspendedClients .
	
	self assert: ActiveClients equals: aCustomerBook numberOfActiveCustomers.
	self assert: SuspendedClients equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalClients equals: aCustomerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'private' stamp: 'TSS 5/2/2022 01:34:33'!
verifyThatTheSignal: aSignal isBeingSentAnd: aName isStillIn: aCustomerBook afterExecuting: aBlock
	aBlock
		on: aSignal
		do: [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aName) ]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:00:15'!
includesCustomerNamed: aName
	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'TSS 5/2/2022 00:00:27'!
isEmpty
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'TSS 5/2/2022 00:00:41'!
initialize
	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:04:49'!
addCustomerNamed: aName
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:00:53'!
numberOfActiveCustomers
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:01:39'!
numberOfCustomers
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:01:45'!
numberOfSuspendedCustomers
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 01:43:47'!
removeCustomerNamed: aName 
	active remove: aName ifAbsent: 
			[
				suspended remove: aName ifAbsent: [ ^NotFound signal ] 
			].! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:02:42'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:02:49'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'TSS 5/2/2022 00:03:53'!
suspendCustomerNamed: aName 
	active remove: aName ifAbsent: [ ^CantSuspend signal ].
	suspended add: aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'TSS 5/2/2022 00:05:07'!
customerAlreadyExistsErrorMessage
	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'TSS 5/2/2022 00:05:12'!
customerCanNotBeEmptyErrorMessage
	^'Customer Name Cannot Be Empty'! !
