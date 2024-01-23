
(* Enter your code here. Read input from STDIN. Print output to STDOUT *)

let polynomial coefs exps x =
  let zip = List.combine coefs exps in
  List.fold_left ( +. ) 0.0 (List.map (fun (coef, exp) -> coef *. (x ** exp)) zip)

let definite_integral ~f_poly ~a ~b ~interval =
  let rec range lower upper step=
    if lower > upper then []
    else lower :: range (lower +. step) upper step
  in
  let intervals = range a b interval
  in
  List.fold_left ( +. ) 0.0 (List.map (fun x -> f_poly x *. interval) intervals)

let volume_integral ~f_poly ~a ~b ~interval =
  let rec range lower upper step=
    if lower > upper then []
    else lower :: range (lower +. step) upper step
  in
  let intervals = range a b interval
  in
  let pi = 4.0 *. atan 1.0
  in
  List.fold_left ( +. ) 0.0 (List.map (fun x -> pi *. (f_poly x ** 2.0)*. interval) intervals)


let coefs = stdin |> input_line |> String.split_on_char ' ' |> List.map float_of_string
let exps = stdin |> input_line |> String.split_on_char ' ' |> List.map float_of_string
let limits = stdin |> input_line |> String.split_on_char ' ' |> List.map float_of_string
let (a, b) =
 match limits with
 | [a; b] -> (a, b)
 | _ -> failwith "Limit must be only two arguments"
 
let auc = definite_integral ~f_poly:(polynomial coefs exps) ~a:a ~b:b ~interval:0.001
let vuc = volume_integral ~f_poly:(polynomial coefs exps) ~a:a ~b:b ~interval:0.001

let () = print_endline (string_of_float auc)
let () = print_endline (string_of_float vuc)
