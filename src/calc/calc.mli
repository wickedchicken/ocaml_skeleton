(* The interface file for the Calc module.
 * This defines the exported (public) types, exceptions,
 * and methods of the Calc class
 *
 * Note: OCaml modules rely on the filename for lookup.
 * This file must be named calc.mli
 *)

module Calc :
  sig
    (* we want to tell the world about a function
      * that takes two ints and returns an int *)
    val add : int -> int -> int;;
  end
