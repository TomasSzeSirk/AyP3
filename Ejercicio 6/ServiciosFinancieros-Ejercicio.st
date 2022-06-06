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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'a 6/5/2022 23:17:45'!
test08CanTransferMoneyFromAnAccountToAnother

	| receptiveAccount emmitingAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: emmitingAccount.
	TransferenceBetweenAccounts register: 50 * peso from: emmitingAccount to: receptiveAccount.
	
	self assert: (emmitingAccount balance = (50 * peso) and: [receptiveAccount balance = (50 * peso)])
	
	
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'a 6/5/2022 23:18:06'!
test09CannotTransferMoneyToSameAccount

	| account|
	
	account := ReceptiveAccount new.
	
	self should: [TransferenceBetweenAccounts register: 50 * peso from: account to: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferenceBetweenAccounts sameAccountErrorDescription]	
	
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'a 6/5/2022 23:18:18'!
test10CannotTransferAValueNegativeToAnAccount

	|emmitingAccount receptiveAccount|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	self should: [TransferenceBetweenAccounts register: (-50) * peso from: emmitingAccount to: receptiveAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TransferenceBetweenAccounts negativeValueErrorDescription]	
		
	
	 
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'a 6/5/2022 23:22:48'!
test11TheDepositSideAndTheWithdrawSideOfATransferenceKnowEachOther

	|emmitingAccount receptiveAccount transference deposit withdraw|
	
	emmitingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
		
	Deposit register: 100 * peso on: emmitingAccount.
	transference := TransferenceBetweenAccounts register: 100 * peso from: emmitingAccount to: receptiveAccount.
	
	deposit := transference depositOperation.
	withdraw := transference withdrawOperation.
	
	self assert: (deposit relatedWithdraw = withdraw and: [ withdraw relatedDeposit = deposit]).
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


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #TransferenceDeposit
	instanceVariableNames: 'linkedWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'as yet unclassified' stamp: 'a 6/5/2022 23:13:46'!
linkRelatedOperation: anOperation

	linkedWithdraw := anOperation.! !

!TransferenceDeposit methodsFor: 'as yet unclassified' stamp: 'a 6/5/2022 23:15:36'!
relatedWithdraw
	^linkedWithdraw.! !


!classDefinition: #TransferenceBetweenAccounts category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceBetweenAccounts
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'a 6/5/2022 23:12:28'!
for: aQuantityOfMoney withEmittingAccount: anEmittingAccount withReceptiveAccount: aReceptiveAccount
	
	withdraw := TransferenceWithdraw register: aQuantityOfMoney on: anEmittingAccount .
	deposit := TransferenceDeposit register: aQuantityOfMoney on: aReceptiveAccount .
	
	deposit linkRelatedOperation: withdraw.
	withdraw linkRelatedOperation: deposit.! !

!TransferenceBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'TSS 6/3/2022 18:42:02'!
value
	
	^value! !


!TransferenceBetweenAccounts methodsFor: 'getter' stamp: 'a 6/5/2022 23:14:21'!
depositOperation
	^deposit! !

!TransferenceBetweenAccounts methodsFor: 'getter' stamp: 'a 6/5/2022 23:14:27'!
withdrawOperation
	^withdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceBetweenAccounts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceBetweenAccounts class
	instanceVariableNames: ''!

!TransferenceBetweenAccounts class methodsFor: 'instance creation' stamp: 'a 6/5/2022 23:07:31'!
register: aQuantityOfMoney from: anEmittingAccount to: aReceptiveAccount 
	
	| transference |
	anEmittingAccount == aReceptiveAccount ifTrue: [self error: self sameAccountErrorDescription ].
	(aQuantityOfMoney negative) ifTrue: [self error: self negativeValueErrorDescription ].
	
	"Withdraw register: aQuantityOfMoney on: anEmittingAccount .
	Deposit register: aQuantityOfMoney on: aReceptiveAccount."
	
	transference := self new for: aQuantityOfMoney withEmittingAccount: anEmittingAccount withReceptiveAccount: aReceptiveAccount .
	^transference .
	
	
	! !


!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'TSS 6/3/2022 18:34:22'!
negativeValueErrorDescription

	^'No se puede pasar un valor negativo para hacer la transaccion'! !

!TransferenceBetweenAccounts class methodsFor: 'error description' stamp: 'TSS 6/3/2022 18:15:54'!
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


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #TransferenceWithdraw
	instanceVariableNames: 'linkedDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'as yet unclassified' stamp: 'a 6/5/2022 23:13:55'!
linkRelatedOperation: anOperation

	linkedDeposit := anOperation.! !

!TransferenceWithdraw methodsFor: 'as yet unclassified' stamp: 'a 6/5/2022 23:16:41'!
relatedDeposit
	^linkedDeposit.! !


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
