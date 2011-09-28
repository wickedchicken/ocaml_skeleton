(* The source for our Calc module.
 * A .mli file is required export methods etc.
 * 
 * Note that OCaml relies on filenames for module lookup
 * This should be named calc.ml
 *
 * If this resides in a calc/ directory, you must add this line to _tags:
 * "src/calc": include
 * 
 * If you include a system package, say "open Pcre;;" then you will need to add
 * the following line to _tags:
 * "src/calc/calc.ml": pkg_pcre
 *
 * You should have one line per tag (you are allowed to specify multiple lines
 * targetting the same file). Run 'ocamlfind list' to see what to put after pkg_
 *)

(* The filename is called Calc and the module in here
 * is called Calc... this will yield a full module name of
 * Calc.Calc
 *)
module Calc =
  struct
    (* define an 'add' method *)
    (* will be seen by the world as Calc.Calc.add *)
    let add l r = l + r;;
  end  
