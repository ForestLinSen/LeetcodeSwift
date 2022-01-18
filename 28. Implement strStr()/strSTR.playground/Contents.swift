class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        
        var i = 0
        let h = Array(haystack.utf8) // haystack
        let n = Array(needle.utf8) // needle
        
        while i <= h.count - n.count {
            var j = 0
            var tmp = 0
            if h[i] == n[j] { // check rest of string...
                
                j = n.count - 1
                
                while h[i+j] == n[j] {
                    guard j != 0 else { return i }
                    if h[i+j] == n[0] { tmp = j }
                    j -= 1
                }
            }
            
            i += tmp > 0 ? n.count - tmp : 1
        }
        
        return -1
    }
}

let solver = Solution()
solver.strStr("aabaaabaaac", "aabaaac")
