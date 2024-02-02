
open System

let readDomain n =
    [ 1..n ]
    |> List.map (fun _ -> (Console.ReadLine().Split ' ').[0])

let validate domain =
    domain
    |> List.distinct
    |> List.length
    |> (=) (List.length domain)

[<EntryPoint>]
let main argv =
    let t = Console.ReadLine() |> int

    [ 1..t ]
    |> List.iter (fun _ ->
        Console.ReadLine()
        |> int
        |> readDomain
        |> validate
        |> (fun isValid -> if isValid then "YES" else "NO")
        |> Console.WriteLine)

    0
