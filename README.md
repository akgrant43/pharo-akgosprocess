AKGOSProcess provides a common interface to run a command a get the contents of stdout and stderr.

AKGOSProcess will use either OSProcess or OSSubprocess to do the actual work of forking and executing the process.

Unfortunately both have some limitations, thus the desire for a common interface:

- OSProcess appears to block the VM while reading stdout and stderr
- OSSubprocess doesn't yet support 64 bit VMs

## Installing

TBS
