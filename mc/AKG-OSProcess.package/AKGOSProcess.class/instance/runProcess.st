private
runProcess

	process := [ | outStream errStream |
		outStream := String new writeStream.
		errStream := String new writeStream.
		osProcess := PipeableOSProcess 
			forkAndExec: self command 
			arguments: self arguments
			environment: nil
			descriptors: nil
			workingDir: nil
			errorPipelineStream: InternalPipe nonBlockingPipe.
		osProcess value.
		(Delay forMilliseconds: 500) wait.
"		[ osProcess atEnd and: [ osProcess isComplete ] ] whileFalse:"
		[ osProcess isComplete ] whileFalse:
			[
			outStream nextPutAll: osProcess upToEnd.
			errStream nextPutAll: osProcess errorUpToEnd.
			(Delay forMilliseconds: 500) wait.
			].
			outStream nextPutAll: osProcess upToEnd.
			errStream nextPutAll: osProcess errorUpToEnd.
			stdout := outStream contents.
			stderr := errStream contents.
			semaphore
				ifNil: [ (errorBlock isNotNil and: [ self isSuccess not ])
					ifTrue: [ errorBlock value: self ] ]
				ifNotNil: [ semaphore signal ].
		] fork.