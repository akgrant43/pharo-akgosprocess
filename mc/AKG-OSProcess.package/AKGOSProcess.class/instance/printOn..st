printing
printOn: aStream

	osProcess ifNil: [ ^super printOn: aStream ].
	osProcess isRunning ifTrue:
		[ aStream nextPutAll: 'a Running AKGOSProcess' ]
	ifFalse:
		[ self isSuccess ifTrue: 
				[ aStream nextPutAll: 'a Successfull AKGOSProcess' ]
			ifFalse:
				[ aStream nextPutAll: 'an Unsuccessfull AKGOSProcess' ] ].