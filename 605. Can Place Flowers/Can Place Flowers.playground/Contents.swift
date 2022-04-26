class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count == 0{ return true}
        
        let s = Array(s)
        let t = Array(t)
        
        var i = 0
        var j = 0
        var count = 0
        
        while j < t.count{
            if s[i] == t[j]{
                count += 1
                i += 1
                if count == s.count { return true}
            }
            j += 1
        }
        return false
    }
}


let solver = Solution()
solver.isSubsequence("abc", "ahbgdc")
