//Enter your code here. Read input from STDIN. Print output to STDOUT
open System
open System.Collections.Generic

//reduce number of rotation here
let rotationReducer ms ns m n r =
    if r > (((m-ms)+(n-ns))*2) then
        let t = r % (((m-ms)+(n-ns))*2)
        t
    else 
        r

//Actual rotate function  
let doRotate matrix ms ns m n t =
    let rec rotator (matrix: List<List<string>>) ms ns m n t =
        match t with
        |0 -> matrix
        |_ when t>0 ->  let prev =  matrix.[ms].[ns]
                        //shift top row
                        for i in ns..n-1 do
                            matrix.[ms].[i] <- matrix.[ms].[i+1]
                        //shift right most column
                        for i in ms..m-1 do
                            matrix.[i].[n] <- matrix.[i+1].[n]
                        //shift bottom row
                        for i in n .. -1 ..ns+1 do
                            matrix.[m].[i] <- matrix.[m].[i-1]
                        //shift left most column
                        for i in m .. -1 ..ms+1 do
                            matrix.[i].[ns] <- matrix.[i-1].[ns]
                        matrix.[ms+1].[ns] <- prev
                        rotator matrix ms ns m n (t-1)
        |_ -> failwith "Number of rotation can not be negative"
    rotator matrix ms ns m n t

//Main matrix rotation function
let matrixRotate (matrix: List<List<string>>) r =
    let rec rotate (matrix: List<List<string>>) ms ns m n r =
        if ms < m && ns < n then
            //reduce number of rotation needed
            let t = rotationReducer ms ns m n r
            //perform actual rotation
            let interm = doRotate matrix ms ns m n t
            //go to inner layer and rotate 
            rotate interm (ms+1) (ns+1) (m-1) (n-1) r
        else
            matrix
    rotate matrix 0 0 (matrix.Count-1) (matrix.[0].Count-1) r

//build up a row from input
let buildList (x:string) (m: List<List<string>>) =
    let temp = List<string>()
    x.Split(" ")|>List.ofArray|>List.iter(fun x -> temp.Add(x))
    m.Add(temp)

//take input and build up the matrix
//to enable in place modification use .Net BCL List
let takeInput () =
    let matrix = new List<List<string>>()
    let input =seq{
        while true do
            yield Console.ReadLine()
    }
    input|>Seq.takeWhile(fun x -> x <> null)|>Seq.iter(fun x -> buildList x matrix)
    matrix

[<EntryPoint>]
let main argv =
    let rotate = Console.ReadLine().Split(" ").[2]|>int 
    let res = (takeInput(),rotate) ||>matrixRotate
    for i in res do
        for j in i do
            Console.Write(j + " ")
        Console.Write("\n")
    0 // return an integer exit code
