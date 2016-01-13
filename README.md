Symbolic Reachability Analysis of the B-Method through ProB and LTSmin
---

This repository hosts the models of the experimental section in the paper and a guide on how to build and run the tools.

Please note the implementation **ONLY** works on [Linux] and [Mac OS]. 

Submitted to [iFM 2016]. 

Authors:
===

* Institut für Informatik, Heinrich Heine University Düsseldorf, Germany
    - Jens Bendisposto:      [<bendisposto@cs.uni-duesseldorf.de>](mailto:bendisposto@cs.uni-duesseldorf.de)
    - Philipp Körner:        [<p.koerner@uni-duesseldorf.de>](mailto:p.koerner@uni-duesseldorf.de)
    - Michael Leuschel:      [<leuschel@cs.uni-duesseldorf.de>](mailto:leuschel@cs.uni-duesseldorf.de)
* Formal Methods and Tools, University of Twente, The Netherlands
    - Jeroen Meijer*:        [<j.j.g.meijer@utwente.nl>](mailto:j.j.g.meijer@utwente.nl)
    - Jaco van de Pol:       [<j.c.vandepol@utwente.nl>](mailto:j.c.vandepol@utwente.nl)
* Department of Computer Science, University of Surrey, United Kingdom
    - Helen Treharne:        [<h.treharne@surrey.ac.uk>](mailto:h.treharne@surrey.ac.uk)
    - Jorden Whitefield†:    [<j.whitefield@surrey.ac.uk>](mailto:j.whitefield@surrey.ac.uk)

\* Supported by STW SUMBAT grant: 13859

† Partly supported by EPSRC grant: EP/M506655/1

Table of Contents
===

* [Abstract]
* [Prerequisites]
* [Installation]
    - [Linux]
    - [Mac OS]
* [Usage]
* [Experiments]

Abstract
===

*We present a symbolic reachability analysis for the B-method,
which can provide a significant speed up over traditional explicit state model
checking. The symbolic analysis is implemented by linking ProB to LTSmin,
a high-performance language independent model checker. The link is achieved
via LTSmin’s Pins interface, allowing ProB to benefit from LTSmin’s analysis
algorithms, while only writing a few hundred lines of glue-code, along with
a bridge between ProB and C using ZMQ. ProB supports model checking
of several formal specification languages such as B, Event-B, Z and Tla+ .
Our experiments are based on a wide variety of B and Event-B models to
demonstrate the efficiency of the new link. Among the tested categories
are state space generation and deadlock detection; but action detection and
invariant checking are also feasible in principle. In many cases we observe
speedups of several orders of magnitude. We also compare the results with
other approaches for improving model checking, such as partial order reduction
or symmetry reduction. We thus provide a new scalable, symbolic analysis
algorithm for the B-method, along with a platform to integrate other model
checking improvements via LTSmin in the future*

Prerequisites
===

*[ProB]* is...

*[LTSmin]* is...

Installation
===

In order to clone this repository you will require `git` to be set up and installed on your machine. 

### Linux

Firstly for Ubuntu we need to install the following dependencies: 

```
$ sudo apt-get install build-essential automake autoconf libtool 
libzmq3 libzmq3-dev libczmq libczmq-dev libboost-all-dev libpopt-dev 
zlib1g-dev zlib1g flex ant asciidoc xmlto doxygen wget git
```

Once these are installed we can now begin to build the required components for the integration.

1. Clone the repository:
    * `$ git clone git@github.com:lordqwerty/ProB-LTSmin-iFM16.git`
2. Change directory:
    * `$ cd ProB-LTSmin-iFM16`
3. Get the latest ProB LTSmin development tool: 
    * `$ wget http://nightly.cobra.cs.uni-duesseldorf.de/ltsmin/ProB.linux64.tar.gz`
4. Unpack ProB:
    * `$ tar xvf ProB.linux64.tar.gz`
5. Clone the LTSmin ProB Branch:
    * `git submodule update --init`
6. Change directory to ltsmin:
    * `cd ltsmin`
7. Get the latest modules for ltsmin:
    * `git submodule update --init`
8. Run `ltsminreconf`:
    * `./ltsminreconf`
9. Configure the LTSmin build:
    * `./configure --without-spins --without-scoop --prefix ~/bin/ltsmin`
    * Change the prefix location. At current it will install to your `$HOME` directory under `bin/ltsmin`.
10. Make and install:
    * `make all install`

We have automated the above process in [install_ubuntu.sh] if you would rather
run a shell script. 

### Mac OS

Before beginning the installation process on Mac we recommend having [Xcode], [Developer Command Line tools](https://apple.stackexchange.com/questions/88535/how-to-download-the-command-line-tools-for-xcode-without-the-downloads-for-devel) and [Homebrew] installed. 

Before we can build the LTSmin ProB link we need to install required dependencies: 

```
$ 
```

1. Clone the repository:
    * `$ git clone git@github.com:lordqwerty/ProB-LTSmin-iFM16.git`
2. Change directory:
    * `$ cd ProB-LTSmin-iFM16`
3. Get the latest ProB LTSmin development tool: 
    * `$ wget http://nightly.cobra.cs.uni-duesseldorf.de/ltsmin/ProB.mac_os.10.7.5.x86_64.tar.gz`
4. Unpack ProB:
    * `$ tar xvf ProB.mac_os.10.7.5.x86_64.tar.gz`
5. Clone the LTSmin ProB Branch:
    * `git submodule update --init`
6. Change directory to ltsmin:
    * `cd ltsmin`
7. Get the latest modules for ltsmin:
    * `git submodule update --init`
8. Run `ltsminreconf`:
    * `./ltsminreconf`
9. Configure the LTSmin build:
    * `./configure --without-spins --without-scoop --prefix ~/bin/ltsmin`
    * Change the prefix location. At current it will install to your `$HOME` directory under `bin/ltsmin`.
10. Make and install:
    * `make all install`

We have automated the above process in [install_mac.sh] if you would rather
run a shell script. 

Usage
===




[iFM 2016]: http://en.ru.is/ifm/
[ZeroMQ]: http://zeromq.org/
[ZeroMQC]: http://zeromq.org/bindings:c
[LTSmin]: http://fmt.cs.utwente.nl/tools/ltsmin/
[LTSmin ProB Branch]: https://github.com/Meijuh/ltsmin/tree/prob
[ProB]: https://www3.hhu.de/stups/prob/index.php/Main_Page
[ProBNightly]: http://nightly.cobra.cs.uni-duesseldorf.de/ltsmin/
[Homebrew]: http://brew.sh/
[Xcode]: https://developer.apple.com/xcode/

[Abstract]: #abstract
[Prerequisites]: #prerequisites
[Installation]: #installation
[Linux]: #linux
[Mac OS]: #mac-os
[Usage]: #usage
[Experiments]: Experiments.md
[install_ubuntu.sh]: install_ubuntu.sh
[install_mac.sh]: install_mac.sh


