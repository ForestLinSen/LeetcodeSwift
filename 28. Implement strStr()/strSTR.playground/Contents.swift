class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if needle.count > haystack.count {
            return -1
        }
        
        if (needle == "" && haystack != "") || needle == haystack{
            return 0
        }

        
        let haystack = [Character](haystack)
        let char = [Character](needle)
        
        var i = 0
        var j = 0
      
        while(i < haystack.count){
            
            if haystack[i] == char[0]{
                for c in char {
                    if i+j < haystack.count && c == haystack[i+j]{
                        j += 1
                    }else{
                        j = 0
                        break
                    }
                }
                
                if j == char.count {
                    return i
                }
            }
            
            i = i+1
        }
        return -1
    }
}

let solver = Solution()
solver.strStr("aabaaabaaac", "aabaaac")
