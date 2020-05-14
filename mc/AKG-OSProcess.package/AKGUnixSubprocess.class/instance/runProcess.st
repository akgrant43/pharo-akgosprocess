private
runProcess
	"Run the requested command as a separate process"

	[ | stdoutStream stderrStream |
	stdoutStream := String new writeStream.
	stderrStream := String new writeStream.
	self process
		command: command;
		arguments: arguments;
		redirectStdout;
		redirectStderr;
		runAndWaitPollingEvery: (Delay forMilliseconds: 500)
			doing: [ :proc :outStream :errStream | 
			stdoutStream nextPutAll: outStream upToEnd.
			stderrStream nextPutAll: errStream upToEnd ]
			onExitDo: [ :proc :outStream :errStream | 
				proc closeAndCleanStreams.
				stdout := stdoutStream contents.
				stderr := stderrStream contents.
				"Async processes have errors signalled here.
				If waiting, raise the error after signalling the semaphore (in #runAndWait)"
				semaphore
					ifNil: [ (errorBlock isNotNil and: [ self isSuccess not ])
							ifTrue: [ errorBlock value: self ] ]
					ifNotNil: [ semaphore signal ] ] ] fork