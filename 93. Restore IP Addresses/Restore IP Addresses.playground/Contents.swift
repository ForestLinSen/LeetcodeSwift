import Foundation

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var results = [String]()
        
        func backTracking(_ count: Int, _ curr: String, _ remainInt: String){
            if count == 4 && remainInt.isEmpty{
                results.append(curr)
                return
            }
            
            if remainInt.count > 3{
                for i in 0..<3{
                    let curr = curr + "." +
                }
            }
            
            
        }
    }
}
