import Cocoa

func isPalindrome(_ x: Int) -> Bool {
    let a:[Character] = Array(String(x))
    
    if(a.count <= 1){
        return true
    }
    
    var left = 0
    var right = a.count - 1
    
    while(left <= right){
        
        print("left: \(left), right: \(right)")
        
        if(a[left] == a[right]){
            left += 1
            right -= 1
        }else{
            return false
        }
    }
    
    return true
}

isPalindrome(-101)


121 / 10 % 10
