Symbolic Reachability Analysis of B through ProB and LTSmin
===

This repository hosts the models of the experimental section in the paper and a guide on how to build and run the tools.

Please note the implementation **ONLY** works on [Linux] and [Mac OS].

Submitted and accepted to [iFM 2016], Springer LNCS Volume 9681.

Authors version available at [arXiv.org].

Authors:
---

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
---

* [Abstract]
* [Prerequisites]
* [Installation]
    - [Linux]
    - [Mac OS]
* [Usage]
    - [ProB CLI]
    - [ProB to LTSmin link]
    - [LTSmin Symbolic]
* [Experiments]

Abstract
---

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
---

*[ProB]* is an animator, constraint solver and model checker for the B-Method. It allows fully automatic animation of B specifications, and can be used to systematically check a specification.

*[LTSmin]* is a high-performance language-independent model checker that allows
numerous modelling language front-ends to be connected to various analysis algorithms, through a common interface known as PINS. It offers a wide spectrum of parallel and symbolic algorithms.

Installation
---

In order to clone this repository you will require `git` to be set up and installed on your machine. If you experience any issues please also consult the [LTSmin] website for further instructions. 

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
$ brew tap homebrew/science
$ brew install asciidoc xmlto boost popt lzlib flex ant doxygen automake autoconf libtool zeromq czmq hwloc
```

Once all the dependencies have been installed above we can now continue to build LTSmin ProB link tools:

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
---

### ProB CLI

To run model checks using only ProB you can use the following commands. From the ProB folder run the following:

```
$ LD_LIBRARY_PATH=./lib ./probcli [PATH TO MACHINE FILE] --model_check -cs
```

Where `[PATH TO MACHINE FILE]` is the machine file you want to run.

You can then add the following flags to customise the model checking process:

```
PROPERTIES
----------

-nodead     Disables deadlock checking
-noinv      Disables invariant checking
-noass      Disables assertion checks
-nogoal     GOALS not checked


OTHER
-----

--model_check   Starts the ProB model checker with the supplied machine
-cs             Shows coverage statistics after when model check complete
-log            ProB writes logs of the model check that took place
-bf             Sets the exploration algorithm to Breadth-first Search
-h              Shows a list of all available command line options

```

With the `-cs` flag enabled you will see information about the model check, similar to the following:

```
ALL OPERATIONS COVERED

% All open nodes visited
Model Checking Time: 320 ms (320 ms walltime)
States analysed: 243
Transitions fired: 946
No Counter Example found. ALL nodes visited.
Coverage:
 States: 244
 Transitions: 946
 Uninitialised states: 1 (root and constants only)
 All 5 possible operations have been covered
```

Where all the statistics are self explanatory. More info can be found at the [ProB CLI Documentation].

### ProB to LTSmin link

To run model checks using LTSmin we need to open a connection to ProB. The following commands open the link.

```
$ LD_LIBRARY_PATH=./lib ./probcli -ltsmin2 ~/ltsmin.probz [PATH TO MACHINE FILE] 
```

Where `[PATH TO MACHINE FILE]` is the machine file you want to run.

Once this loads and shows `Starting LTSmin Server...` open a new terminal and continue with the steps below. 

### LTSmin Symbolic 

To run model checks using LTSmin you can use the following commands.

```
$ ~/bin/ltsmin/bin/prob2lts-sym --vset=lddmc --lace-workers=1 ~/ltsmin.probz
```

This will run the model checking process with LTSmin using the Symbolic model checking algorithms. You can then add the following flags to customise the model checking process:

```
-v              increase verbosity and show matrix information
--labels        print state variable, type names, and state and action labels
--matrix        print dependency matrix on exit 
--deadlock      detect deadlocks
-r              apply transformations to the dependency matrix
--no-close      Keep the ProB connection open
-h              Shows a full list of all available options. 
```

Upon completion of the process if a deadlock is found it will look similar to the following:

```
prob2lts-sym: deadlock found
prob2lts-sym: deadlock detection took 0.730 real 0.090 user 0.160 sys
prob2lts-sym: exiting now
prob2lts-sym: terminating ProB connection
```

If no deadlock is found and the model checking is complete then metrics you want to look for are:

```
prob2lts-sym: connecting to zocket ipc:///home/user/ltsmin.probz
prob2lts-sym: state vector length is 17; there are 12 groups
...
prob2lts-sym: Exploration took 180 group checks and 180 next state calls
prob2lts-sym: reachability took 0.940 real 0.180 user 0.170 sys
prob2lts-sym: counting visited states...
prob2lts-sym: counting took 0.000 real 0.000 user 0.000 sys
prob2lts-sym: state space has 80719 states, 3118 nodes
prob2lts-sym: group_next: 714 nodes total
prob2lts-sym: group_explored: 465 nodes, 588 short vectors total
```

Where:

* **Groups** are *Events*, minus one ( -1 ) as the Initialisation event is counted from ProB.
* **Reachability**:
    - Real is the Wall clock time in Milliseconds (ms)
    - User is the time the CPU took to compute the model check in Milliseconds (ms)
* **State Space** "has *X* states" is the number of states, not the nodes.
* **Short vectors** is the total number of Next State Calls from the model checking process.  

Running `man ~/bin/ltsmin/bin/prob2lts-sym` will show you the manual pages for the tool. 



[iFM 2016]: http://en.ru.is/ifm/
[arXiv.org]: https://arxiv.org/abs/1603.04401
[ZeroMQ]: http://zeromq.org/
[ZeroMQC]: http://zeromq.org/bindings:c
[LTSmin]: http://fmt.cs.utwente.nl/tools/ltsmin/
[LTSmin ProB Branch]: https://github.com/Meijuh/ltsmin/tree/prob
[ProB]: https://www3.hhu.de/stups/prob/index.php/Main_Page
[ProBNightly]: http://nightly.cobra.cs.uni-duesseldorf.de/ltsmin/
[Homebrew]: http://brew.sh/
[Xcode]: https://developer.apple.com/xcode/
[ProB CLI Documentation]: https://www3.hhu.de/stups/prob/index.php/ProB_Cli

[Abstract]: #abstract
[Prerequisites]: #prerequisites
[Installation]: #installation
[Linux]: #linux
[Mac OS]: #mac-os
[Usage]: #usage
[ProB CLI]: #prob-cli
[ProB to LTSmin link]: #prob-to-ltsmin-link
[LTSmin Symbolic]: #ltsmin-symbolic
[Experiments]: Experiments.md
[install_ubuntu.sh]: install_ubuntu.sh
[install_mac.sh]: install_mac.sh


