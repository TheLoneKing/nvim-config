# nvim
Personal neovim configurations

Building neovim from source

## Pre-requisites
Some of the plugins configured here require some third-party packages to be installed on the machine.

### Install ripgrep
The nvim-telescope plugin requires ripgrep to be installed on the system. To install it on debian systems, `sudo apt install ripgrep`.

### Install OpenJDK 17+
nvim-jdtls requires at least JDK 17. So make sure you have installed JDK v17+.

### nvim-jdtls for Java development
`nvim-jdtls` provides interfacing with the Java LSP. It requires eclipse.jdt.ls to be installed.

**To install eclipse.jdt.ls**
For manual installation you can download precompiled binaries from the official downloads site (http://download.eclipse.org/jdtls/milestones/ for milestone releases) and extract the archive. Ensure that the PATH variable contains the bin directory of the extracted archive.

