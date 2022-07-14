class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        
        func backtracking(_ curr: inout [Int], _ size: Int, _ start: Int){
            if curr.count == size{
                results.append(curr)
                return
            }
            
            for i in start..<nums.count{
                curr.append(nums[i])
                backtracking(&curr, size, i+1)
                curr.removeLast()
            }
        }
        
        var curr: [Int] = []
        for i in 0...nums.count{
            backtracking(&curr, i, 0)
        }
        
        return results
    }
}

let sovler = Solution()
sovler.subsets([1,2,3])
