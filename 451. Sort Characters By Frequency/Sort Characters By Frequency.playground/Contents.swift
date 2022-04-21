class Solution {
    func frequencySort(_ s: String) -> String {
        
        if s.count == 1{ return s}
        
        var dict: [Character: Int] = [:]
        
        for char in s{
            dict[char, default: 0] += 1
        }
        
        var result = ""
        
        dict.sorted{$0.value > $1.value}.forEach { keyVal in
            result += String(repeating: keyVal.key, count: keyVal.value)
        }

        return result
    }
}

let solver = Solution()
solver.frequencySort("tree")
