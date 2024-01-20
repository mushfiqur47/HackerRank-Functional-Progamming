def f(arr:List[Int]):List[Int] = {
    arr match {
        case Nil => Nil
        case h::t => f(t):::h::Nil
    }
}
