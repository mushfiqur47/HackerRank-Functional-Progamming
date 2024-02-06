
open System

let readPoint _ =
    Console.ReadLine().Split ' '
    |> Array.toList
    |> List.map float

let glue list = List.append list [ list.Head ]

let readPoints n = [ 1..n ] |> List.map readPoint |> glue

let toDistance ([ x1; y1 ], [ x2; y2 ]) =
    ((x2 - x1) ** 2.0 + (y2 - y1) ** 2.0) ** 0.5

[<EntryPoint>]
let main argv =
    Console.ReadLine()
    |> int
    |> readPoints
    |> List.pairwise
    |> List.map toDistance
    |> List.sum
    |> Console.WriteLine

    0
