-- Enter your code here. Read input from STDIN. Print output to STDOUT

totalColumns = 100
totalRows = 63
emptySpace = '_'
filledSpace = '1'
centralStemIndex = 49
firstBranchHeight = 16
firstBranchOffset = 32
maxIterations = 5

getTotalEmptyRows :: Int -> Int
getTotalEmptyRows iterations =
  foldl (\acc e -> acc + (2 ^ e) ) 1 [1..(maxIterations - iterations)]

getIterationStemHeight :: Int -> Int
getIterationStemHeight iteration = 2 ^ (maxIterations - iteration)

generateEmptySpace :: Int -> [Char]
generateEmptySpace width = replicate width emptySpace

generateRow :: [Int] -> [Char]
generateRow spacesToFill =
  foldl (\acc e -> if e `elem` spacesToFill
    then acc ++ [filledSpace] else acc ++ [emptySpace]) "" [0..99]

createIterationOffsetIndex :: Int -> Int
createIterationOffsetIndex 1 = 0
createIterationOffsetIndex iteration =
  foldl (\acc e -> acc + ((2 ^ (maxIterations - e)))) 0 [1 .. iteration - 1]

getStemLocationsForCurrentIteration :: Int -> [Int]
getStemLocationsForCurrentIteration iteration =
  let totalStems = 2 ^ (iteration - 1)
      stemOffsets = (2 * firstBranchOffset) `div` (2 ^ (iteration - 1))
      firstIndexOffset = (centralStemIndex - createIterationOffsetIndex iteration)
  in zipWith (\x y -> x + stemOffsets * y) (replicate totalStems firstIndexOffset) [0..]

generateYStem :: Int -> [[Char]]
generateYStem iteration =
  let stemHeight = getIterationStemHeight iteration 
      stemLocations = getStemLocationsForCurrentIteration iteration
  in replicate stemHeight (generateRow stemLocations)

generateYBranches :: Int -> [[Char]]
generateYBranches iteration =
  let stemHeight = getIterationStemHeight iteration
      rootPoints = getStemLocationsForCurrentIteration iteration
      completeMatrix = foldl (\acc e -> acc ++ [(map (\x -> [x - e, x + e]) rootPoints)]) [] [1..stemHeight]
  in map generateRow $ map concat (reverse completeMatrix)
  

generateYForIteration :: Int -> [[Char]]
generateYForIteration iteration =
  let stems = generateYStem iteration
      branches = generateYBranches iteration
  in branches ++ stems

generateFractal :: Int -> [[Char]]
generateFractal iterations =
   concat $ map (\i -> generateYForIteration i) (reverse [1.. iterations])

main = do
  input <- getContents
  let n = read input :: Int
      emptyRows = getTotalEmptyRows n
      emptyRowMatrix = foldl (\acc e -> acc ++ [(generateRow [])]) [] [1..emptyRows]
  putStr $ unlines $ emptyRowMatrix
  putStr $ unlines $ generateFractal n
