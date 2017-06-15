AKGOSProcess provides a common interface to run a command a get the contents of stdout and stderr.

AKGOSProcess will use either OSProcess or OSSubprocess to do the actual work of forking and executing the process.

Unfortunately both have some limitations, thus the desire for a common interface:

- OSProcess appears to block the VM while reading stdout and stderr
- OSSubprocess doesn't yet support 64 bit VMs

## Installing

Note that AKGOSProcess does NOT load OSProcess or OSSubprocess, it is up to you to ensure that the appropriate package is loaded BEFORE using AKGOSProcess.

Load OSProcess:

```smalltalk
Metacello new
	configuration: 'OSProcess';
	version: #stable;
	repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main';
	load.
```

or OSSubprocess:

```smalltalk
Metacello new
	configuration: 'OSSubprocess';
	repository: 'github://marianopeck/OSSubprocess:master/repository';
	version: #stable;
	load.
```

Currently I use OSProcess with 64 bit images and OSSubprocess with 32 bit images.

And finally pharo-akgosprocess:

```smalltalk
Metacello new
	repository: 'github://akgrant43/pharo-akgosprocess/mc';
	baseline: 'AKGOSProcess';
	load.
```
