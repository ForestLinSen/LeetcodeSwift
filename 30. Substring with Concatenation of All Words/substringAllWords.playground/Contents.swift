import Foundation

extension String{
    subscript(_ range: CountableRange<Int>) -> String{
        let startIndex = self.index(self.startIndex, offsetBy: max(0, range.lowerBound))
        let endIndex = self.index(startIndex, offsetBy: min(self.count - range.lowerBound, range.upperBound - range.lowerBound))
        
        return String(self[startIndex..<endIndex])
    }
    
    subscript(_ range: CountablePartialRangeFrom<Int>) -> String{
        let startIndex = self.index(self.startIndex, offsetBy: min(range.lowerBound, self.count))
        
        return String(self[startIndex...])
    }
}


class Solution {
    
//    func createRange(s:String, _ a:Int, _ b: Int) -> Range<String.Index>{
//        let startIndex = s.index(s.startIndex, offsetBy: a)
//        let endIndex = s.index(<#T##i: String.Index##String.Index#>, offsetBy: <#T##String.IndexDistance#>)
//    }
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {

        if s.isEmpty || words.isEmpty { return [Int]() }
        
        var results = [Int]()
        let wordLength = words[0].count
 
        let totalLength = words.reduce(0) { partialResult, s in
            return partialResult + s.count
        }
 
        var i = 0
        
        while i < s.count{
            
            print("")
            
            if (i+totalLength > s.count){
                return results
            }
            
            var currS = String(s[i..<i+totalLength])
  
            var indexArray = [Int]()
            
            for x in words{
                
                
                // Find the character
                var left = 0

                while left+wordLength <= currS.count{
                    print(currS, x)

                    if(left+wordLength <= currS.count && currS[left..<left+wordLength] == x){
                        indexArray.append(x.count)
                        let startIndex = currS.index(currS.startIndex, offsetBy: left)
                        let endIndex = currS.index(currS.startIndex, offsetBy: left + wordLength)
                        
                        print(left, left+wordLength)
                        
                        currS.removeSubrange(startIndex..<endIndex)
                        break
                    }
                    
                    left += wordLength
                }

            }

            if indexArray.count == words.count{
                results.append(i)
            }
            
            
            //i += max(1, indexArray.min() ?? 0)
            i += 1
        }
        
        return results
    }
}

let solver = Solution()
solver.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"])
solver.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"])
solver.findSubstring("", [])
solver.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"])
solver.findSubstring("lingmindraboofooowingdingbarrwingmonkeypoundcake", ["fooo","barr","wing","ding","wing"])
solver.findSubstring("ababaab", ["ab","ba","ba"])
solver.findSubstring("ababababab", ["ababa","babab"])
solver.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"])
