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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:20:14'!
test12APortfoliosBalanceStartsAtZero 

	| portfolio |
	
	portfolio := Portfolio new.
		
	self assert: portfolio balance = (0 * peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:24:17'!
test13TheBalanceOfAPortfolioWithOneAccountMatchesTheBalanceOfThatAccount

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio add: account.
	
	self assert: portfolio balance = (100 * peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:24:10'!
test14TheBalanceOfAPortfolioIsTheSumOfTheBalancesOfItsAccounts

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	portfolio add: account1.
	portfolio add: account2.
		 
	self assert: portfolio balance = (200 * peso).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:24:03'!
test15APortfolioCanStoreAnotherPortfolioInside

	| portfolio1 portfolio2 account1 account2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	portfolio1 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.
	
	self assert: portfolio1 balance = (200 * peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:28:44'!
test16

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	
	self deny: portfolio anyAccountMadeATransaction.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:32:17'!
test17

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 1500 * peso on: account.
	portfolio add: account.
	
	self assert: portfolio anyAccountMadeATransaction.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:34:15'!
test18

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 1500 * peso on: account.
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	
	self assert: portfolio1 anyAccountMadeATransaction.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 20:55:20'!
test19

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 1500 * peso on: account.
	portfolio add: account.
	
	self assert: portfolio transactions equals: account transactions
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 21:20:46'!
test20

	| portfolio1 portfolio2 account1 account2 listOfTransactions|
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	listOfTransactions := OrderedCollection new.
	
	Withdraw register: 100 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	portfolio1 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.
	
	listOfTransactions addAll: account1 transactions.
	listOfTransactions addAll: portfolio2 transactions.
	
	self assert: portfolio1 transactions equals: listOfTransactions ! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 21:28:40'!
test01CanTransferMoneyFromAnAccountToAnother

	| receptiveAccount emmitingAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: emmitingAccount.
	TransferenceBetweenAccounts register: 50 * peso from: emmitingAccount to: receptiveAccount.
	
	self assert: (emmitingAccount balance = (50 * peso) and: [receptiveAccount balance = (50 * peso)])
	
	
	

! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 21:29:01'!
test02CannotTransferMoneyToSameAccount

	| account|
	
	account := ReceptiveAccount new.
	
	self should: [TransferenceBetweenAccounts register: 50 * peso from: account to: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferenceBetweenAccounts sameAccountErrorDescription]	
	
	

! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 21:29:26'!
test03CannotTransferANegativeValueToAnAccount

	|emmitingAccount receptiveAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	self should: [TransferenceBetweenAccounts register: (-50) * peso from: emmitingAccount to: receptiveAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferenceBetweenAccounts negativeValueErrorDescription]	
		
	
	 
	

! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 21:29:43'!
test04TheDepositSideAndTheWithdrawSideOfATransferenceKnowEachOther

	|emmitingAccount receptiveAccount transference deposit withdraw|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
		
	Deposit register: 100 * peso on: emmitingAccount.
	transference := TransferenceBetweenAccounts register: 100 * peso from: emmitingAccount to: receptiveAccount.
	
	deposit := transference depositOperation.
	withdraw := transference withdrawOperation.
	
	self assert: (deposit relatedWithdraw = withdraw and: [ withdraw relatedDeposit = deposit]).
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:47:40'!
balance
	self subclassResponsibility ! !

!Account methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:47:00'!
hasMadeTransactions
	self subclassResponsibility.! !

!Account methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:48:19'!
initialize
	self subclassResponsibility ! !

!Account methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:55:55'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:42:47'!
add: anAccount 
	accounts add: anAccount .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:43:40'!
anyAccountMadeATransaction
	
	
	^accounts anySatisfy: [:anAccount | anAccount hasMadeTransactions].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 21:27:43'!
balance
	| balance |
	balance := 0.
	accounts do: [:anAccount | balance := balance + anAccount balance].
	^balance! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:40:33'!
hasMadeTransactions
	^accounts anySatisfy: [:anAccount| anAccount hasMadeTransactions]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:09:33'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 21:18:35'!
transactions
	|transactions|
	transactions := OrderedCollection new.
	accounts do: [:anAccount| transactions addAll: anAccount transactions].
	^transactions ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:52:45'!
transactionsFromAccount: aReceptiveAccount 
	self shouldBeImplemented.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'TSS 6/6/2022 20:41:45'!
hasMadeTransactions
	^self transactions isEmpty not! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'TSS 6/2/2022 21:21:58'!
applyTransactionTo: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'a 6/5/2022 23:04:25'!
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


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'TSS 6/2/2022 21:31:35'!
applyTransactionTo: aBalance

	^ aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #TransferenceDeposit
	instanceVariableNames: 'linkedWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'a 6/5/2022 23:13:46'!
linkRelatedOperation: anOperation

	linkedWithdraw := anOperation.! !


!TransferenceDeposit methodsFor: 'accessing' stamp: 'a 6/5/2022 23:15:36'!
relatedWithdraw
	^linkedWithdraw.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'TSS 6/2/2022 21:31:20'!
applyTransactionTo: aBalance

	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #TransferenceWithdraw
	instanceVariableNames: 'linkedDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'initialization' stamp: 'a 6/5/2022 23:13:55'!
linkRelatedOperation: anOperation

	linkedDeposit := anOperation.! !


!TransferenceWithdraw methodsFor: 'accessing' stamp: 'a 6/5/2022 23:16:41'!
relatedDeposit
	^linkedDeposit.! !


!classDefinition: #TransferenceBetweenAccounts category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceBetweenAccounts
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccounts methodsFor: 'initialization' stamp: 'a 6/5/2022 23:12:28'!
for: aQuantityOfMoney withEmittingAccount: anEmittingAccount withReceptiveAccount: aReceptiveAccount
	
	withdraw := TransferenceWithdraw register: aQuantityOfMoney on: anEmittingAccount .
	deposit := TransferenceDeposit register: aQuantityOfMoney on: aReceptiveAccount .
	
	deposit linkRelatedOperation: withdraw.
	withdraw linkRelatedOperation: deposit.! !


!TransferenceBetweenAccounts methodsFor: 'getter' stamp: 'a 6/5/2022 23:14:21'!
depositOperation
	^deposit! !

!TransferenceBetweenAccounts methodsFor: 'getter' stamp: 'TSS 6/3/2022 18:42:02'!
value
	
	^value! !

!TransferenceBetweenAccounts methodsFor: 'getter' stamp: 'a 6/5/2022 23:14:27'!
withdrawOperation
	^withdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceBetweenAccounts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceBetweenAccounts class
	instanceVariableNames: ''!

!TransferenceBetweenAccounts class methodsFor: 'instance creation' stamp: 'TSS 6/6/2022 21:25:42'!
register: anAmountOfMoney from: anEmittingAccount to: aReceptiveAccount 
	
	| transference |
	
	self verifyThatAnAmountOfMoney: anAmountOfMoney isPositiveAndTheAccount: aReceptiveAccount isDifferentFromAccount: anEmittingAccount.

	transference := self new for: anAmountOfMoney withEmittingAccount: anEmittingAccount withReceptiveAccount: aReceptiveAccount .
	^transference .
	
	
	! !


!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'TSS 6/3/2022 18:34:22'!
negativeValueErrorDescription

	^'No se puede pasar un valor negativo para hacer la transaccion'! !

!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'TSS 6/3/2022 18:15:54'!
sameAccountErrorDescription
	^'La cuenta que recibe no puede ser igual a la que emite la plata'! !


!TransferenceBetweenAccounts class methodsFor: 'verifier' stamp: 'TSS 6/6/2022 21:25:14'!
verifyThatAnAmountOfMoney:  anAmountOfMoney isPositiveAndTheAccount: aReceptiveAccount isDifferentFromAccount: anEmittingAccount

	anEmittingAccount == aReceptiveAccount ifTrue: [self error: self sameAccountErrorDescription ].
	(anAmountOfMoney negative) ifTrue: [self error: self negativeValueErrorDescription ]! !
