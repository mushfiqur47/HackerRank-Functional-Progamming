//Enter your code here. Read input from STDIN. Print output to STDOUT

open System

let testBST input =
    let rec test input stack root =
        match input,stack with
        //whenever current number is smalller than root return false
        |(h::t),_ when h < root -> false
        //when top of stack is smaller then current number
        //make the top of stack the new root and pop the stack
        |(h::t),(x::s) when x < h -> test input s x 
        //if input is not empty and other states are not matched
        //push current number into stack
        |(h::t),_ -> test t (h::stack) root 
        //if all numbers a processed
        //means input is valid pre-order sequence of BST return true
        |[],_ -> true
        //if anything else happen throw an error
        |_ -> failwith "something goes wrong"
    test input [] -1

[<EntryPoint>]
let main argv =
    let num = Console.ReadLine()|>int
    let input = [
        for i in 1..num do
            //no need to know how many nodes in the tree so ignore it
            Console.ReadLine()|>ignore
            let temp = Console.ReadLine()
            yield temp.Split(" ")|>List.ofArray|>List.map(fun x -> x|>int)
    ]
    for i in input do
        if (testBST i) then printfn "%s" "YES"
        else printfn "%s" "NO"
    0 // return an integer exit code
