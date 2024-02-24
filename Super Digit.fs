
open System

let rec reduce k (n: string) =
    match n with
    | n when String.length n = 1 -> n
    | n ->
        n
        |> Seq.map string
        |> Seq.map (fun c -> (int64 c) * k)
        |> Seq.sum
        |> string
        |> reduce 1L


let [| n; k |] = Console.ReadLine().Split(' ')

reduce (int64 k) n |> Console.WriteLine
