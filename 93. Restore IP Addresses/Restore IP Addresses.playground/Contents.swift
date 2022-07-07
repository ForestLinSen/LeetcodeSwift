import Foundation

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var results = [String]()
        
        func backTracking(_ count: Int, _ curr: String, _ remainS: String){
            
            // check if the current string is valid
            if count == 4 || remainS == ""{
                // valid result
                if count == 4 && remainS == ""{
                    results.append(curr)
                }

                return
            }
            
            for i in 1...3{
                if i > remainS.count { continue }
                if i != 1 && remainS.prefix(1) == "0" { continue }
                
                var stringPart = String(remainS.prefix(i))
                if Int(stringPart)! <= 255{
                    if !curr.isEmpty {
                        stringPart = "." + stringPart
                    }
                    
                    let curr = curr + stringPart
                    backTracking(count+1,
                                 curr,
                                 String(remainS.suffix(remainS.count-i)))
                }
            }
   
        }
        
        backTracking(0, "", s)
        
        return results
        
    }
}

let solver = Solution()
solver.restoreIpAddresses("101023")
