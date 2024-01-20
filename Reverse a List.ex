defmodule Solution do
   def reverse([]), do: []
   def reverse([hd|tl]) do
      reverse(tl)++[hd]
   end
end
