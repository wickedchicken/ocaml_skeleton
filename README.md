ocaml skeleton
==============

`ocaml_skeleton` is a scaffolding framework to get up and running build OCaml
applications quickly. It provides a filesystem structure, Makefile, and example
unit tests.

OCaml is relatively difficult to navigate as a new user. While the language has
ample online documentation, the development environment itself can be remarkably
opaque. The problem is compounded by numerous sites providing half-working
snippets of code that range from fresh to very, very old. The only way to
discover 'the modern way of doing things' is through mailing lists or IRC. Since
I hate interacting with humans and know others do as well, I thought it would be
nice to provide a jumpstart environment for someone to get code up-and-running.
An example application with unit tests seems to be a nice sandbox for language
discovery.

*Caveat Emptor*: The system I've provided here works for me but I am still
inexperienced with the language -- especially with respect to the module system
and how ocamlbuild discovers dependencies. If you are more familiar with OCaml
and have input on how larger, more established build systems operate than I
would be grateful for any feedback.

instructions
============

os dependencies
---------------

For debian/ubuntu, running the following should work:

```bash
> sudo apt-get install aptitude` # if you don't have it already

> sudo aptitude install ocaml-base-nox ocaml-nox ocaml-batteries-included
ocaml-findlib ocaml-interp libounit-ocaml-dev
```

If you manage to get set up on other OSes (other Linuxen, OSX, BSD) please send
me your strings!

usage
-----

The `Makefile` contains 5 targets: `main-native`, `main`, `tests-native`, `tests`, and
`clean`. `-native` are natively compiled (but not necessarily optimized)
versions of the binaries while the others are byte-code versions. Binaries are
copied into bin/ after being built with `ocamlbuild`.

In short:

```bash
  > make
  > bin/main.native

  > make tests
```

The source for the application is in `src/main.ml` and any subdirectories. If you
add subdirectories, make sure you add an 'include' tag in the `_tags` file in
the top directory (see the tag for `src/calc`). Tags are one per line and
multiple lines are allowed for a target. More documentation on `_tags` can be
found at the [ocamlbuild user
manual](http://nicolaspouillard.fr/ocamlbuild/ocamlbuild-user-guide.html#htoc15)

The `myocamlbuild.ml` plugin contains code to look up and link OCaml packages
registered with `ocamlfind`. Let's say you want to use the
[PCRE](http://www.pcre.org/) package installed with `sudo aptitude install
libpcre-ocaml-dev`. You add `open Pcre;;` in `src/calc/calc.ml`, then add the
following line to `_tags`:
```
"src/calc/calc.ml": pkg_pcre
```

To find what you need to put after `pkg_`, run `ocamlfind list`, i.e. `pkg_unix`
or `pkg_num`.

*Note*: there is a bug related to this, look in the bugs section if you want to
add a package to `main.ml` or `tests.ml`.

Tests are written in `tests/tests.ml`. Make sure the `OUnit` package is opened,
open up your module, and write some tests using the
[OUnit](http://ounit.forge.ocamlcore.org/api) framework. For a reference, here
is a list of [available testing
methods](http://ounit.forge.ocamlcore.org/api/OUnit.html).  Note that you must
add your tests to the `suite` for them to run. I tried adding in the code found
at [Skydeck](http://skydeck.com/blog/programming/unit-test-in-ocaml-with-ounit)
but I couldn't make it work nicely with separate testing modules. However,
having the tests hand-added gives you the full flexibility of OUnit.

todo
====

see the GitHub issues page, but:

* instructions for OSX/BSD/other distros
* make tests nicer (separate test files?)
* add optimized builds
* make ocamlbuild integration less hacky
* automatically make a library

bugs
====

see the GitHub issues page, but:

* _tags file, specifically the `pkg_` integration, doesn't apply to 'top level
  targets,' these being `main.ml` and `tests.ml`. If you want to add packages to
  these, you can currently give them to `ocamlbuild` directly on the commandline
  via `-tag`, see the `Makefile` for how `pkg_oUnit` is passes to `tests.byte`.

resources
=========

* OCaml style guide: http://www.cs.caltech.edu/~cs20/a/style.html
* Sample OCaml code (cross-referenced with other languages):
  http://pleac.sourceforge.net/pleac_ocaml/
* The default vim plugin for .ml files has an annoying textwidth setting. Try
  this to turn that off: `echo "set tw=0" >> ~/.vim/after/indent/ocaml.vim`

thanks
======

The OCaml community has a lot of high quality software written by high quality
people. It's my hope that providing this starter kit will lure in many more.

If you'd like to contribute, branch off next and send a pull req.
