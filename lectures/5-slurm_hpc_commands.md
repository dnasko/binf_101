# Commands for interacting with UMIACS Grid

The computing resources for CBCB are hosted through the UMIACS grid and are to be accessed via SLURM commands

### Setting up a connection with the server (login node)

You would need to connect your computer to the UMIACS grid through [secure shell](https://wiki.umiacs.umd.edu/umiacs/index.php/SecureShell).

Through Mac or Linux terminals, you can use the commands

```ssh username@cbcbsub00.umiacs.umd.edu``` or ```ssh username@cbcbsub01.umiacs.umd.edu```.

Windows users can download [GitBash](https://gitforwindows.org/) to use linux/Mac terminal commands through windows, or use [Putty](https://www.putty.org/) or ```pscp``` command through command prompt to connect.

You would be required to provide your password to complete this login request. The 'cbcbsub00' and 'cbcbsub01' are UMIACS's 'hosts' which represent 'login nodes' for CBCB server.


### SLURM commands for accessing compute resources

In order to execute your programs on the grid, you would be submitting a 'job' on the UMIACS grid. The 'job' would typically be your usual Python or Matlab program accompanied with appropriate slurm parameters. These parameters would allow you to determine the type and quantities of computing resources (CPU memory, execution time, type of CPU, etc.) and other optional parameters that you would require for your program execution.

Following are the links to a few resources that would hopefully help you fetch the type of SLURM commands and parameters you would want for your program execution:
* [Introductory examples](https://www.hpc.kaust.edu.sa/sites/default/files/files/public/20160710%20SlurmCommands.pdf)
* [Bird's eye view for most of the commands](https://slurm.schedmd.com/pdfs/summary.pdf)
* [SLURM sbatch command documentation](https://slurm.schedmd.com/sbatch.html)
