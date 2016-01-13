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

### Linux


### Mac OS




Usage
===




[iFM 2016]: http://en.ru.is/ifm/
[ZeroMQ]: http://zeromq.org/
[ZeroMQC]: http://zeromq.org/bindings:c
[LTSmin]: http://fmt.cs.utwente.nl/tools/ltsmin/
[LTSmin ProB Branch]: https://github.com/Meijuh/ltsmin/tree/prob
[ProB]: https://www3.hhu.de/stups/prob/index.php/Main_Page
[ProBNightly]: http://nightly.cobra.cs.uni-duesseldorf.de/ltsmin/

[Abstract]: #abstract
[Prerequisites]: #prerequisites
[Installation]: #installation
[Linux]: #linux
[Mac OS]: #mac-os
[Usage]: #usage
[Experiments]: Experiments.md


