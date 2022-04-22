import Foundation
import Darwin

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var i = 0
        var val: Int = Int(pow(Double(2), Double(i)))
        
        while true{
            if val == n{
                return true
            }else if val > n{
                return false
            }else{
                i += 1
                val = Int(pow(Double(2), Double(i)))
            }
        }
        
    }
}
