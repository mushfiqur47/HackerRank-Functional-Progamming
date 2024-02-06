
open System

let readPoint _ =
    Console.ReadLine().Split ' '
    |> Array.toList
    |> List.map float

let glue list = List.append list [ list.Head ]

let readPoints n = [ 1..n ] |> List.map readPoint |> glue

let calulateArea points =
    points
    |> List.map (fun ([ x1; y1 ], [ x2; y2 ]) ->
        (abs x1 * y2 - y1 * x2) / 2.)
    |> List.sum

[<EntryPoint>]
let main argv =
    Console.ReadLine()
    |> int
    |> readPoints
    |> List.pairwise
    |> calulateArea
    |> Console.WriteLine

    0
