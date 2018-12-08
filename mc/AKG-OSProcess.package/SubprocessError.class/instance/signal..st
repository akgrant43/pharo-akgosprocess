signaling
signal: anAkgProcess
	"Signal the supplied process"

	| msg |

	process := anAkgProcess.
	msg := (process stderr size between: 1 and: 132) ifTrue: 
		[ process stderr ]
	ifFalse: [ (process stdout between: 1 and: 132) ifTrue: 
		[ process stdout ]
	ifFalse:
		[ 'subprocess failed' ] ].
	self messageText: msg.
	self signal