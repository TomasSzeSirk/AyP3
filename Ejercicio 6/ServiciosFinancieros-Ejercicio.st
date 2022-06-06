!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/2/2022 21:25:32'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/2/2022 21:59:46'!
test08

	| receptiveAccount emmitingAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: emmitingAccount.
	TransferBetweenAccounts register: 50 * peso from: emmitingAccount to: receptiveAccount.
	
	self assert: (emmitingAccount balance = (50 * peso) and: [receptiveAccount balance = (50 * peso)])
	
	
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/3/2022 18:17:44'!
test09

	| account|
	
	account := ReceptiveAccount new.
	
	self should: [TransferBetweenAccounts register: 50 * peso from: account to: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferBetweenAccounts sameAccountErrorDescription]	
	
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/3/2022 18:33:10'!
test10

	|emmitingAccount receptiveAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	self should: [TransferBetweenAccounts register: (-50) * peso from: emmitingAccount to: receptiveAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferBetweenAccounts negativeValueErrorDescription]	
		
	
	 
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/3/2022 18:40:26'!
test11

	|emmitingAccount receptiveAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
		
	
	 
	

! !



!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'TSS 6/2/2022 21:21:58'!
applyTransactionTo: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'TSS 6/2/2022 21:13:46'!
register: aValue on: account
	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'TSS 6/2/2022 21:31:35'!
applyTransactionTo: aBalance

	^ aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferBetweenAccounts category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferBetweenAccounts
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'TSS 6/3/2022 18:42:02'!
value
	
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferBetweenAccounts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferBetweenAccounts class
	instanceVariableNames: ''!

!TransferBetweenAccounts class methodsFor: 'instance creation' stamp: 'TSS 6/3/2022 18:36:28'!
register: aQuantityOfMoney from: anEmittingAccount to: aReceptiveAccount 
	
	anEmittingAccount == aReceptiveAccount ifTrue: [self error: self sameAccountErrorDescription ].
	(aQuantityOfMoney negative) ifTrue: [self error: self negativeValueErrorDescription ].
	
	Withdraw register: aQuantityOfMoney on: anEmittingAccount .
	Deposit register: aQuantityOfMoney on: aReceptiveAccount .! !


!TransferBetweenAccounts class methodsFor: 'error description' stamp: 'TSS 6/3/2022 18:34:22'!
negativeValueErrorDescription

	^'No se puede pasar un valor negativo para hacer la transaccion'! !

!TransferBetweenAccounts class methodsFor: 'error description' stamp: 'TSS 6/3/2022 18:15:54'!
sameAccountErrorDescription
	^'La cuenta que recibe no puede ser igual a la que emite la plata'! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'TSS 6/2/2022 21:31:20'!
applyTransactionTo: aBalance

	^ aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'category-name' stamp: 'TSS 6/3/2022 18:21:11'!
= anAccount

	! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TSS 6/2/2022 21:22:38'!
balance
	|balance|
	balance := 0.
	transactions do: [ :aTransaction | balance := aTransaction applyTransactionTo: balance ]. 
	^balance! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
