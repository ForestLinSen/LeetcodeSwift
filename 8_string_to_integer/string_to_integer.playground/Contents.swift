import Cocoa

func myAtoi(_ s: String) -> Int {
    if(s.contains("+ ")){return 0}
    let num = (s as NSString).integerValue
    return num >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), num)
}


// This is the wrong answer but I think this problem is ridiculous
//func myAtoi(_ s: String) -> Int {
//
//    if s.contains("+ ") { return 0 }
//
//    let positive = s.contains("-") ? false : true
//
//    if let number = Int(s.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
//
//        if number > Int32.max {
//            return positive ? Int(Int32.max) : Int(Int32.min)
//        }
//
//        return positive ? number : -1 * number
//    }
//
//    return 0
//}

myAtoi("words and 987")
