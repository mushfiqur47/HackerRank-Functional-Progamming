def f(num:Int): List[Int] = {
  var l = scala.collection.mutable.ListBuffer.empty[Int]
  (1 to num).foreach(i=> {
    l += i
  })
  l.toList
}