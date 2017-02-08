# SCIP.jl
Julia interface to [SCIP](http://scip.zib.de) solver.

[![Build Status](https://travis-ci.org/SCIP-Interfaces/SCIP.jl.svg?branch=master)](https://travis-ci.org/SCIP-Interfaces/SCIP.jl)

## Related Projects

- [SCIP](http://scip.zib.de): actual solver (implemented in C) that is wrapped
  for Julia.
- [CSIP](https://github.com/SCIP-Interfaces/CSIP): restricted and simplified C
  interface to SCIP which our wrapper is based on.
- [SCIP.jl](https://github.com/ryanjoneil/SCIP.jl): previous attempt to
  interface SCIP from Julia, using autogenerated wrapper code for all public
  functions.
- [MathProgBase](https://github.com/JuliaOpt/MathProgBase.jl): We aim to
  implement MPB's abstract solver interfaces, so that one can use SCIP.jl
  through [JuMP](https://github.com/JuliaOpt/JuMP.jl). For now, the
  `LinearQuadraticModel` interface is implemented, supporting lazy constraint
  and heuristic callbacks.

## Installation

The SCIP.jl package requires [SCIP](http://scip.zib.de/) to be installed.

[Download](http://scip.zib.de/download.php?fname=scipoptsuite-3.2.1.tgz) the
SCIP Optimization Suite, untar it and, build the shared library with

```
make SHARED=true GMP=false READLINE=false ZLIB=false OPT=opt scipoptlib
```

Next set the **environment variable `SCIPOPTDIR`** to point to the directory that contains the `scipoptsuite` sources. 

```
export SCIPOPTDIR=/path/to/scipoptdirsuite/sources
Example: export SCIPOPTDIR=/home/hduser/Downloads/scipoptsuite-3.2.1
```
CSIP needs the library in `${SCIPOPTDIR}/lib/scipoptlib.so` and the C header files in `${SCIPOPTDIR}/scip-*/src/`.

Clone the SCIP github repository in your local machine and build it in Julia with

```
Pkg.clone("https://github.com/SCIP-Interfaces/SCIP.jl.git")
Pkg.build("SCIP")
```

## Setting Parameters

SCIP has a [long list of parameters](http://scip.zib.de/doc/html/PARAMETERS.php)
that can all be set through SCIP.jl, by passing them to the constructor of
`SCIPSolver`. To set a value `val` to a parameter `name`, pass the two
parameters `(name, val)`. For example, let's set two parameters, to disable
output and increase the gap limit to 0.05:
```
solver = SCIPSolver("display/verblevel", 0, "limits/gap", 0.05)
```
