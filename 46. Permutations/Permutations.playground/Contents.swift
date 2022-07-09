class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 1 { return [nums] }
        
        var results: [[Int]] = []
        
        func backTracking(_ curr: [Int], _ remain: [Int]){
            
            if curr.count == nums.count{
                results.append(curr)
                return
            }
            
            if remain.isEmpty{ return }
            
            for i in 0..<remain.count{
                var newRemain = remain
                var curr = curr
                curr.append(newRemain.remove(at: i))
                backTracking(curr, newRemain)
            }
        }

        
        for i in 0..<nums.count{
            var remain = nums
            let curr = [remain.remove(at: i)]
            backTracking(curr, remain)
        }
        
        return results
    }
}

let solver = Solution()
solver.permute([1,2,3])
