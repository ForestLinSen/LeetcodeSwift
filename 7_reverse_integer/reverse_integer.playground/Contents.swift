import Cocoa

// Version 1
func reverse(_ x: Int) -> Int {

    var intArray = [Int]()
    let positive = x>0 ? true : false
    var divisor = 1
    var result = 0
    
    let x = abs(x)
    
    while x/divisor != 0 {
        intArray.append(x/divisor % 10)
        divisor *= 10
    }
    
    print(intArray)
    
    var multiplier = intArray.count-1
    for i in 0...intArray.count-1{
        result += intArray[i] * Int(pow(10.0, Double(multiplier)))
        
        // avoid integer overflow
        if(result > Int32.max || result < Int32.min){
            return 0
        }
        
        multiplier -= 1
    }
    
    return positive ? result : -1 * result
}


reverse(-1534236469)
