open Calc;;

print_endline "this is a test main application";
print_endline "it opens the 'Calc' module which has our calculator";
print_newline ();
print_endline ("the output of 1 + 2 is: " ^ (string_of_int (Calc.add 1 2)));
