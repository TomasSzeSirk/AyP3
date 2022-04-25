!classDefinition: #ElHabitatDeLasAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitatDeLasAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitatDeLasAvispas class' category: 'AvispasYAbejasParte2'!
ElHabitatDeLasAvispas class
	instanceVariableNames: 'diccionarioDeHuevosDeAvispas cantidadDeOrugas cantidadDePolillas'!

!ElHabitatDeLasAvispas class methodsFor: 'verificadores de presencia: publico' stamp: 'NC 4/23/2022 16:07:56'!
hayHuevosDeOriana
	^  self cantidadDeHuevosDeOriana >0.! !

!ElHabitatDeLasAvispas class methodsFor: 'verificadores de presencia: publico' stamp: 'NC 4/23/2022 16:09:33'!
hayHuevosDeOrnella
	^  self cantidadDeHuevosDeOrnella >0.! !

!ElHabitatDeLasAvispas class methodsFor: 'verificadores de presencia: publico' stamp: 'NC 4/23/2022 16:09:39'!
hayHuevosDePolly
	^  self cantidadDeHuevosDePolly >0.! !

!ElHabitatDeLasAvispas class methodsFor: 'verificadores de presencia: publico' stamp: 'NC 4/23/2022 15:06:14'!
hayOrugas
	^  cantidadDeOrugas>0.! !

!ElHabitatDeLasAvispas class methodsFor: 'verificadores de presencia: publico' stamp: 'NC 4/23/2022 15:06:17'!
hayPolillas
	^ cantidadDePolillas > 0.! !


!ElHabitatDeLasAvispas class methodsFor: 'restar al habitat: publico' stamp: 'NC 4/23/2022 16:03:33'!
restarHuevoDeOriana
	| cantidadDeHuevosOriana |.
	
	cantidadDeHuevosOriana := diccionarioDeHuevosDeAvispas at: 'Oriana'.
	cantidadDeHuevosOriana := cantidadDeHuevosOriana - 1.
	diccionarioDeHuevosDeAvispas at: 'Oriana' put: cantidadDeHuevosOriana.
	! !

!ElHabitatDeLasAvispas class methodsFor: 'restar al habitat: publico' stamp: 'NC 4/23/2022 16:03:46'!
restarHuevoDeOrnella
	| cantidadDeHuevosOrnella |.
	
	cantidadDeHuevosOrnella := diccionarioDeHuevosDeAvispas at: 'Ornella'.
	cantidadDeHuevosOrnella := cantidadDeHuevosOrnella - 1.
	diccionarioDeHuevosDeAvispas at: 'Ornella' put: cantidadDeHuevosOrnella.
	! !

!ElHabitatDeLasAvispas class methodsFor: 'restar al habitat: publico' stamp: 'NC 4/23/2022 16:03:57'!
restarHuevoDePolly
	| cantidadDeHuevosPolly |.
	
	cantidadDeHuevosPolly := diccionarioDeHuevosDeAvispas at: 'Polly'.
	cantidadDeHuevosPolly := cantidadDeHuevosPolly - 1.
	diccionarioDeHuevosDeAvispas at: 'Polly' put: cantidadDeHuevosPolly.! !

!ElHabitatDeLasAvispas class methodsFor: 'restar al habitat: publico' stamp: 'NC 4/23/2022 15:06:35'!
restarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!ElHabitatDeLasAvispas class methodsFor: 'restar al habitat: publico' stamp: 'NC 4/23/2022 15:06:38'!
restarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !


!ElHabitatDeLasAvispas class methodsFor: 'agregar al habitat: publico' stamp: 'NC 4/23/2022 15:58:02'!
agregarHuevoDeLara
	| cantidadDeHuevosLara |.
	
	cantidadDeHuevosLara := diccionarioDeHuevosDeAvispas at: 'Lara'.
	cantidadDeHuevosLara := cantidadDeHuevosLara + 1.
	diccionarioDeHuevosDeAvispas at: 'Lara' put: cantidadDeHuevosLara.! !

!ElHabitatDeLasAvispas class methodsFor: 'agregar al habitat: publico' stamp: 'NC 4/23/2022 15:32:04'!
agregarHuevoDeOriana
	| cantidadDeHuevosOriana |.
	
	cantidadDeHuevosOriana := diccionarioDeHuevosDeAvispas at: 'Oriana'.
	cantidadDeHuevosOriana := cantidadDeHuevosOriana + 1.
	diccionarioDeHuevosDeAvispas at: 'Oriana' put: cantidadDeHuevosOriana.
	! !

!ElHabitatDeLasAvispas class methodsFor: 'agregar al habitat: publico' stamp: 'NC 4/23/2022 15:33:09'!
agregarHuevoDeOrnella
	| cantidadDeHuevosOrnella |.
	
	cantidadDeHuevosOrnella := diccionarioDeHuevosDeAvispas at: 'Ornella'.
	cantidadDeHuevosOrnella := cantidadDeHuevosOrnella + 1.
	diccionarioDeHuevosDeAvispas at: 'Ornella' put: cantidadDeHuevosOrnella.
	! !

!ElHabitatDeLasAvispas class methodsFor: 'agregar al habitat: publico' stamp: 'NC 4/23/2022 15:57:09'!
agregarHuevoDePolly
	| cantidadDeHuevosPolly |.
	
	cantidadDeHuevosPolly := diccionarioDeHuevosDeAvispas at: 'Polly'.
	cantidadDeHuevosPolly := cantidadDeHuevosPolly + 1.
	diccionarioDeHuevosDeAvispas at: 'Polly' put: cantidadDeHuevosPolly.! !

!ElHabitatDeLasAvispas class methodsFor: 'agregar al habitat: publico' stamp: 'NC 4/23/2022 15:05:58'!
agregarPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !

!ElHabitatDeLasAvispas class methodsFor: 'agregar al habitat: publico' stamp: 'NC 4/23/2022 15:06:02'!
agregarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !


!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 15:42:38'!
cantidadDeHuevosDeAvispas
	| listaDeHuevos |
	listaDeHuevos := diccionarioDeHuevosDeAvispas values.
	^listaDeHuevos sum: [ :cantidadDeHuevos | cantidadDeHuevos] ifEmpty: [ 0 ].
	
	! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 15:59:19'!
cantidadDeHuevosDeLara
	^diccionarioDeHuevosDeAvispas at: 'Lara'.! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 16:02:12'!
cantidadDeHuevosDeOriana
	^diccionarioDeHuevosDeAvispas at: 'Oriana'.! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 15:42:20'!
cantidadDeHuevosDeOrianaYOrnella
	| cantidadDeHuevosDeOriana cantidadDeHuevosDeOrnella|
	cantidadDeHuevosDeOriana := diccionarioDeHuevosDeAvispas at: 'Oriana'.
	cantidadDeHuevosDeOrnella := diccionarioDeHuevosDeAvispas at: 'Ornella'.
	^cantidadDeHuevosDeOriana + cantidadDeHuevosDeOrnella.! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 16:02:21'!
cantidadDeHuevosDeOrnella
	^diccionarioDeHuevosDeAvispas at: 'Ornella'.! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 15:51:33'!
cantidadDeHuevosDePolly
	^diccionarioDeHuevosDeAvispas at: 'Polly'! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 15:06:09'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidades: privado' stamp: 'NC 4/23/2022 15:06:12'!
cantidadDePolillas
	^cantidadDePolillas .! !


!ElHabitatDeLasAvispas class methodsFor: 'inicializar valores del habitat: privado' stamp: 'NC 4/23/2022 15:06:27'!
inicializarCantidadDeOrugas
	cantidadDeOrugas := 0.! !

!ElHabitatDeLasAvispas class methodsFor: 'inicializar valores del habitat: privado' stamp: 'NC 4/23/2022 15:06:31'!
inicializarCantidadDePolillas
	cantidadDePolillas := 0.! !

!ElHabitatDeLasAvispas class methodsFor: 'inicializar valores del habitat: privado' stamp: 'NC 4/23/2022 15:57:39'!
inicializarDiccionarioDeHuevos
	diccionarioDeHuevosDeAvispas := Dictionary new.
	diccionarioDeHuevosDeAvispas at: 'Oriana' put: 0.
	diccionarioDeHuevosDeAvispas at: 'Ornella' put: 0.
	diccionarioDeHuevosDeAvispas at: 'Polly' put: 0.
	diccionarioDeHuevosDeAvispas at: 'Lara' put: 0.! !


!ElHabitatDeLasAvispas class methodsFor: '--** private fileout/in **--' stamp: 'NC 4/23/2022 18:05:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	diccionarioDeHuevosDeAvispas := ((Dictionary new) add: ('Lara'->0); add: ('Oriana'->0); add: ('Ornella'->0); add: ('Polly'->0); yourself).
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: ''!

!LaAvispaLara class methodsFor: 'reproduccion: publico' stamp: 'NC 4/23/2022 18:05:11'!
intentarReproducirse
	
	self sePuedeReproducirConHuevoDeOriana ifTrue: [ ^self ].
	
	self sePuedeReproducirConHuevoDeOrnella ifTrue: [ ^self ].
	
	self sePuedeReproducirConHuevoDePolly ifTrue: [ ^self ].! !


!LaAvispaLara class methodsFor: 'verificacion de reproduccion: privado' stamp: 'NC 4/23/2022 18:04:10'!
sePuedeReproducirConHuevoDeOriana
	ElHabitatDeLasAvispas hayHuevosDeOriana ifTrue:
	[ElHabitatDeLasAvispas restarHuevoDeOriana.
	ElHabitatDeLasAvispas agregarHuevoDeLara.
	^true].
	^false.
! !

!LaAvispaLara class methodsFor: 'verificacion de reproduccion: privado' stamp: 'NC 4/23/2022 18:04:21'!
sePuedeReproducirConHuevoDeOrnella
	ElHabitatDeLasAvispas hayHuevosDeOrnella ifTrue:
	[ElHabitatDeLasAvispas restarHuevoDeOrnella.
	ElHabitatDeLasAvispas agregarHuevoDeLara.
	^true].
	^false.
! !

!LaAvispaLara class methodsFor: 'verificacion de reproduccion: privado' stamp: 'NC 4/23/2022 18:04:28'!
sePuedeReproducirConHuevoDePolly
	ElHabitatDeLasAvispas hayHuevosDePolly ifTrue:
	[ElHabitatDeLasAvispas restarHuevoDePolly.
	ElHabitatDeLasAvispas agregarHuevoDeLara.
	^true].
	^false.
! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: ''!

!LaAvispaOriana class methodsFor: 'reproduccion' stamp: 'TSS 4/22/2022 00:47:34'!
intentarReproducirse
	ElHabitatDeLasAvispas hayOrugas ifTrue:
	[ElHabitatDeLasAvispas restarUnaOruga.
	ElHabitatDeLasAvispas agregarHuevoDeOriana.]! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOrnella class' category: 'AvispasYAbejasParte2'!
LaAvispaOrnella class
	instanceVariableNames: ''!

!LaAvispaOrnella class methodsFor: 'reproduccion' stamp: 'TSS 4/22/2022 00:48:53'!
intentarReproducirse
	ElHabitatDeLasAvispas hayOrugas ifTrue:
	[ElHabitatDeLasAvispas restarUnaOruga.
	ElHabitatDeLasAvispas agregarHuevoDeOrnella.]! !


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: ''!

!LaAvispaPolly class methodsFor: 'reproduccion' stamp: 'NC 4/23/2022 15:48:53'!
intentarReproducirse
	ElHabitatDeLasAvispas hayPolillas ifTrue:
	[ElHabitatDeLasAvispas restarUnaPolilla.
	ElHabitatDeLasAvispas agregarHuevoDePolly.]! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 15:59:03'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ElHabitatDeLasAvispas cantidadDeHuevosDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 15:40:51'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ ElHabitatDeLasAvispas cantidadDeHuevosDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 15:53:48'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ElHabitatDeLasAvispas cantidadDeHuevosDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 15:53:00'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ElHabitatDeLasAvispas cantidadDeHuevosDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/21/2022 23:40:21'!
habitat
	^ElHabitatDeLasAvispas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 16:09:06'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas.
	self queElHabitatTengaDosPolillasMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 15:58:44'!
laAvispaLara
	^LaAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/21/2022 23:43:07'!
laAvispaOriana
	^ LaAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/22/2022 00:24:38'!
laAvispaOrnella
	^LaAvispaOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/22/2022 00:27:43'!
laAvispaPolly
	^LaAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/22/2022 00:18:42'!
queElHabitatTengaDosOrugasMas
	ElHabitatDeLasAvispas agregarUnaOruga.
	ElHabitatDeLasAvispas agregarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/22/2022 00:37:39'!
queElHabitatTengaDosPolillasMas
	ElHabitatDeLasAvispas agregarPolilla .
	ElHabitatDeLasAvispas agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/22/2022 00:16:02'!
queElHabitatTengaUnaOrugaMas
	ElHabitatDeLasAvispas agregarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'TSS 4/22/2022 00:28:51'!
queElHabitatTengaUnaPolillaMas
	ElHabitatDeLasAvispas agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/23/2022 15:10:17'!
retrocederElHabitatAlInicioDeLosTiempos
	ElHabitatDeLasAvispas inicializarDiccionarioDeHuevos.
	ElHabitatDeLasAvispas inicializarCantidadDeOrugas.
	ElHabitatDeLasAvispas inicializarCantidadDePolillas.! !

ElHabitatDeLasAvispas initializeAfterFileIn!
