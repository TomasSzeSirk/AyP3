!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolioA portfolioB accountA accountB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'TSS 6/6/2022 21:43:47'!
test04APortfolioCanStoreAnotherPortfolioInside

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


!PortfolioTest methodsFor: 'initializing' stamp: 'a 6/8/2022 18:45:37'!
setUp
	
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
! !


!PortfolioTest methodsFor: 'balance tests' stamp: 'a 6/8/2022 18:45:54'!
test01APortfoliosBalanceStartsAtZero 

	self assert: portfolioA balance = (0 * peso).
! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'a 6/8/2022 18:46:06'!
test02TheBalanceOfAPortfolioWithOneAccountMatchesTheBalanceOfThatAccount

	
	Deposit register: 100 * peso on: accountA.
	
	portfolioA add: accountA.
	
	self assert: portfolioA balance = (100 * peso).
! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'a 6/8/2022 18:46:17'!
test03TheBalanceOfAPortfolioIsTheSumOfTheBalancesOfItsAccounts
	
	Deposit register: 100 * peso on: accountA.
	Deposit register: 100 * peso on: accountB.
	
	portfolioA add: accountA.
	portfolioA add: accountB.
		 
	self assert: portfolioA balance = (200 * peso).! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'a 6/8/2022 18:48:23'!
test04APortfolioCanStoreAnotherPortfolio
	
	Deposit register: 100 * peso on: accountA.
	Deposit register: 100 * peso on: accountB.
	
	portfolioA add: accountA.
	portfolioB add: accountB.
	portfolioA add: portfolioB.
	
	self assert: portfolioA balance = (200 * peso).
! !


!PortfolioTest methodsFor: 'accessing tests' stamp: 'a 6/8/2022 18:47:00'!
test05NoTransactionsHaveBeenDoneAtTheBeginning

	portfolioA add: accountA.
	
	self deny: portfolioA anyAccountMadeATransaction.
! !

!PortfolioTest methodsFor: 'accessing tests' stamp: 'a 6/8/2022 18:48:45'!
test06CanSeeTransactionsMadeByAnAccountInsideAPortfolio
	
	Deposit register: 1500 * peso on: accountA.
	portfolioA add: accountA.
	
	self assert: portfolioA anyAccountMadeATransaction.
! !

!PortfolioTest methodsFor: 'accessing tests' stamp: 'a 6/8/2022 18:48:50'!
test07CanSeeTransactionsFromAPortfolioInsideAPortfolio
	
	Deposit register: 1500 * peso on: accountA.
	portfolioB add: accountA.
	portfolioA add: portfolioB.
	
	self assert: portfolioA anyAccountMadeATransaction.
! !

!PortfolioTest methodsFor: 'accessing tests' stamp: 'a 6/8/2022 18:49:05'!
test08TransactionsFromAPortfolioAndItsAccountAreTheSame

	Deposit register: 1500 * peso on: accountA.
	portfolioA add: accountA.
	
	self assert: portfolioA transactions equals: accountA transactions
! !

!PortfolioTest methodsFor: 'accessing tests' stamp: 'a 6/8/2022 18:49:50'!
test09TransactionsFromAPortfolioAndItsPorfolioAreTheSame

	| listOfTransactions |
	listOfTransactions := OrderedCollection new.

	Withdraw register: 100 * peso on: accountA.
	Deposit register: 100 * peso on: accountB.
	
	portfolioA add: accountA.
	portfolioB add: accountB.
	portfolioA add: portfolioB.
	
	listOfTransactions addAll: accountA transactions.
	listOfTransactions addAll: portfolioB transactions.
	
	self assert: portfolioA transactions equals: listOfTransactions ! !


!PortfolioTest methodsFor: 'extra tests' stamp: 'a 6/8/2022 20:06:27'!
test10CannotAddSameAccountTwiceToAPortfolio

	portfolioA add: accountA.
	
	self should: [portfolioA add: accountA]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyExistsErrorDescription ].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'a 6/8/2022 19:04:13'!
test11PortfolioCannotAddItself

	self should: [portfolioA add: portfolioA.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio PortfolioAddingItselfErrorDescription].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'a 6/8/2022 20:04:41'!
test12CannotAddAnAccountThatAlreadyExistsInsideAnotherPortfolio
	
	
	portfolioB add: accountA.
	portfolioA add: portfolioB.
	
	self should: [portfolioA add: accountA]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyExistsErrorDescription ].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'a 6/8/2022 20:05:26'!
test13CannotAddAPortfolioWithAnAlreadyExistingAccount
	
	
	portfolioA add: accountA.
	portfolioB add: accountA.
	
	self should: [portfolioA add: portfolioB]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyExistsErrorDescription ].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'a 6/8/2022 20:05:36'!
test14CannotAddAnAccountToAChildPortfolioThatAlreadyExistsInsideItsFather
	
	
	portfolioA add: accountA.
	portfolioA add: portfolioB.
	
	self should: [portfolioB add: accountA]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyExistsErrorDescription ].! !


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


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'issuingAccount receivingAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'a 6/8/2022 18:41:57'!
test01CanTransferMoneyFromAnAccountToAnother

	Deposit register: 100 * peso on: issuingAccount.
	TransferenceBetweenAccounts register: 50 * peso from: issuingAccount to: receivingAccount .
	
	self assert: (issuingAccount balance = (50 * peso) and: [receivingAccount balance = (50 * peso)])
	
	
	

! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 6/8/2022 18:42:39'!
test02CannotTransferMoneyToSameAccount

	self should: [TransferenceBetweenAccounts register: 50 * peso from: issuingAccount to: issuingAccount]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferenceBetweenAccounts sameAccountErrorDescription]	
	
	

! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 6/8/2022 18:42:53'!
test03CannotTransferANegativeValueToAnAccount

	self should: [TransferenceBetweenAccounts register: (-50) * peso from: issuingAccount to: receivingAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferenceBetweenAccounts negativeValueErrorDescription]	
		
	
	 
	

! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 6/8/2022 18:44:14'!
test04TheDepositSideAndTheWithdrawSideOfATransferenceKnowEachOther

	| transference deposit withdraw |

	Deposit register: 100 * peso on: issuingAccount.
	transference := TransferenceBetweenAccounts register: 100 * peso from: issuingAccount to: receivingAccount.
	
	deposit := transference depositOperation.
	withdraw := transference withdrawOperation.
	
	self assert: (deposit relatedWithdraw = withdraw and: [ withdraw relatedDeposit = deposit]).
	! !


!TransferenceTest methodsFor: 'initializing' stamp: 'a 6/8/2022 18:41:24'!
setUp
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	
	
	

! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!Account methodsFor: 'main protocol' stamp: 'TSS 6/6/2022 20:47:40'!
balance
	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'TSS 6/6/2022 20:55:55'!
transactions
	self subclassResponsibility ! !


!Account methodsFor: 'testing' stamp: 'TSS 6/6/2022 20:47:00'!
hasMadeTransactions
	self subclassResponsibility.! !

!Account methodsFor: 'testing' stamp: 'a 6/8/2022 19:51:31'!
isDuplicateOf: anAccount
	self subclassResponsibility.! !


!Account methodsFor: 'initialization' stamp: 'TSS 6/6/2022 20:48:19'!
initialize
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Ejercicio'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'error description' stamp: 'a 6/8/2022 18:54:28'!
AccountAlreadyInPortfolioErrorDescription
	^'The account already exists inside the portfolio'! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts fatherPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'a 6/8/2022 18:20:41'!
anyAccountMadeATransaction
	^accounts anySatisfy: [:anAccount | anAccount hasMadeTransactions].
	! !

!Portfolio methodsFor: 'testing' stamp: 'a 6/8/2022 19:15:36'!
hasMadeTransactions
	^accounts anySatisfy: [:anAccount | anAccount hasMadeTransactions]! !

!Portfolio methodsFor: 'testing' stamp: 'a 6/8/2022 19:49:41'!
isDuplicateOf: anAccount
	^accounts anySatisfy: [:anExistingAccount| anExistingAccount isDuplicateOf: anAccount ].! !

!Portfolio methodsFor: 'testing' stamp: 'a 6/8/2022 20:04:15'!
verifyThereIsNoDuplicateOf: anAccount
	fatherPortfolio isNil not ifTrue: [ fatherPortfolio verifyThereIsNoDuplicateOf: anAccount ].
	(accounts anySatisfy: [:anExistingAccount | anExistingAccount isDuplicateOf: anAccount]) ifTrue: [self error: Portfolio AccountAlreadyExistsErrorDescription].
	(accounts anySatisfy: [:anExistingAccount | anAccount isDuplicateOf: anExistingAccount]) ifTrue: [self error: Portfolio AccountAlreadyExistsErrorDescription].! !


!Portfolio methodsFor: 'main protocol' stamp: 'a 6/8/2022 20:08:20'!
add: anAccount 

	self verifyCurrentPortfolioIsDifferentFrom: anAccount.
	self verifyThereIsNoDuplicateOf: anAccount.
	
	accounts add: anAccount.
	(anAccount isKindOf: Portfolio) ifTrue: [anAccount assignFatherPortfolio: self].! !

!Portfolio methodsFor: 'main protocol' stamp: 'TSS 6/6/2022 21:27:43'!
balance
	| balance |
	balance := 0.
	accounts do: [:anAccount | balance := balance + anAccount balance].
	^balance! !

!Portfolio methodsFor: 'main protocol' stamp: 'TSS 6/6/2022 20:52:45'!
transactionsFromAccount: aReceptiveAccount 
	self shouldBeImplemented.! !


!Portfolio methodsFor: 'initialization' stamp: 'TSS 6/6/2022 20:09:33'!
initialize
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'testing - private' stamp: 'a 6/8/2022 20:08:19'!
verifyCurrentPortfolioIsDifferentFrom: anAccount

	^ (self == anAccount) ifTrue: [self error: Portfolio PortfolioAddingItselfErrorDescription]! !


!Portfolio methodsFor: 'getter' stamp: 'a 6/8/2022 18:21:20'!
transactions
	|transactions|
	transactions := OrderedCollection new.
	accounts do: [:anAccount| transactions addAll: anAccount transactions].
	^transactions! !


!Portfolio methodsFor: 'initialization - private' stamp: 'a 6/8/2022 20:01:21'!
assignFatherPortfolio: aPortfolio

	fatherPortfolio := aPortfolio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'a 6/8/2022 20:04:23'!
AccountAlreadyExistsErrorDescription
	^'The account already exists'! !

!Portfolio class methodsFor: 'error description' stamp: 'a 6/8/2022 19:06:25'!
PortfolioAddingItselfErrorDescription
	^'A portfolio cannot add itself'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


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


!ReceptiveAccount methodsFor: 'testing' stamp: 'TSS 6/6/2022 20:41:45'!
hasMadeTransactions
	^self transactions isEmpty not! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'a 6/8/2022 19:51:20'!
isDuplicateOf: anAccount
	^self == anAccount.! !


!ReceptiveAccount methodsFor: 'getter' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


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

!TransferenceBetweenAccounts methodsFor: 'initialization' stamp: 'a 6/8/2022 18:55:48'!
for: aQuantityOfMoney withEmittingAccount: anIssuingAccount withReceptiveAccount: aReceivingAccount
	
	withdraw := TransferenceWithdraw register: aQuantityOfMoney on: anIssuingAccount .
	deposit := TransferenceDeposit register: aQuantityOfMoney on: aReceivingAccount .
	
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


!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'a 6/8/2022 18:55:02'!
negativeValueErrorDescription
	^'Cannot use a negative value for a transaction'! !

!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'a 6/8/2022 18:55:18'!
sameAccountErrorDescription
	^'issuing and receiving account cannot be the same'! !


!TransferenceBetweenAccounts class methodsFor: 'verifier' stamp: 'TSS 6/6/2022 21:25:14'!
verifyThatAnAmountOfMoney:  anAmountOfMoney isPositiveAndTheAccount: aReceptiveAccount isDifferentFromAccount: anEmittingAccount

	anEmittingAccount == aReceptiveAccount ifTrue: [self error: self sameAccountErrorDescription ].
	(anAmountOfMoney negative) ifTrue: [self error: self negativeValueErrorDescription ]! !
