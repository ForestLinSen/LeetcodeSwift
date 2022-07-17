// https://leetcode.com/problems/palindrome-partitioning/description/

class Solution {
    func partition(_ s: String) -> [[String]] {
        var results: [[String]] = []
        var curr: [String] = []
        doPartition(&curr, &results, Array(s))
        return results

    }
    
    private func doPartition(_ curr: inout [String], _ results: inout [[String]], _ characters: [Character]){
        if characters.count == 0{
            results.append(curr)
            return
        }
        
        for i in 0..<characters.count{
            if isPalindrome(characters, 0, i){
                curr.append(String(characters[0..<i+1]))
                doPartition(&curr, &results, Array(characters[(i+1)...]))
                curr.removeLast()
            }
        }
    }
    
    private func isPalindrome(_ characters: [Character], _ start: Int, _ end: Int) -> Bool{
        var start = start
        var end = end
        while start < end{
            if characters[start] != characters[end]{
                return false
            }
            
            start += 1
            end -= 1
        }
        
        return true
    }
}

let solver = Solution()
solver.partition("aab")
