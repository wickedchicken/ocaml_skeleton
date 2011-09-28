open OUnit;;
open Calc;;

let test1 () = assert_equal (Calc.add 0 0) 0;;
let test2 () = assert_equal (Calc.add 1 2) 3;;

(* make sure to add your tests to the suite! *)

let suite =
  "suite">:::
    ["test1">:: test1;
    "test2">:: test2;]
;;

let _ =
  run_test_tt_main suite
;;
