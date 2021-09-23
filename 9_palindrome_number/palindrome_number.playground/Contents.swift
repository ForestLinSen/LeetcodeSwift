import Cocoa

// version 2:
func isPalindrome(_ x: Int) -> Bool {
    
    if x < 0 {
        return false
    }
    
    let x = x
    var result = 0
    var divisor = 1
    
    while x/divisor != 0{
        result *= 10
        result += x / divisor % 10
        divisor *= 10
        print(result)
    }
    
    return result == x
}

isPalindrome(1234321)

// version 1: using array
//func isPalindrome(_ x: Int) -> Bool {
//    let a:[Character] = Array(String(x))
//
//    if(a.count <= 1){
//        return true
//    }
//
//    var left = 0
//    var right = a.count - 1
//
//    while(left <= right){
//
//        print("left: \(left), right: \(right)")
//
//        if(a[left] == a[right]){
//            left += 1
//            right -= 1
//        }else{
//            return false
//        }
//    }
//
//    return true
//}
//
//isPalindrome(-101)
//
