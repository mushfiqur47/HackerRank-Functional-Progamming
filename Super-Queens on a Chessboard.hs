
import Control.Monad (guard)

import qualified Data.IntSet as Set

placeNSuperQueens :: Int -> Int
placeNSuperQueens n
    = length (go Set.empty Set.empty Set.empty
                 (100, 100) -- y value of last two columns. For first column,
                            -- represents nonsense value that passes knight check.
                 n)
    where go _ _ _ _ 0
              = return () -- If go had an extra argument that accumulated y
                          -- positions, it could return valid placements easily.
                          -- The tuple of the last two columns would then
                          -- be unnecessary. It currently returns unit as this
                          -- information is not needed.
          go horizontals diagonals antidiagonals (y1, y2) left = do
              y <- [1..n]
              let x = n - left
                  -- These next two variables are key. To the right, a mapping
                  -- from board position to diagonals (\) and antidiagonals (/).
                  currentDiagonal = y - x
                  currentAntidiagonal = y + x
              -- Perform knight checks first, as they are quicker.
              guard $ abs (y2 - y) /= 2 
              guard $ abs (y1 - y) /= 1
              -- Queen operations use sets, and are thus slower.
              -- We want to discard failing placements quickly.
              guard $ y `Set.notMember` horizontals
              guard $ currentDiagonal `Set.notMember` diagonals
              guard $ currentAntidiagonal `Set.notMember` antidiagonals
              go (Set.insert y horizontals)
                 (Set.insert currentDiagonal diagonals)
                 (Set.insert currentAntidiagonal antidiagonals)
                 (y2, y)
                 (left - 1)

main :: IO ()
main = interact $ show . placeNSuperQueens . read
