class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 1 { return [nums] }
        
        var results: Set<[Int]> = []
        
        func backTracking(_ curr: [Int], _ remain: [Int]){
            
            if curr.count == nums.count{
                results.insert(curr)
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
        
        return Array(results)
    }
}

let solver = Solution()
solver.permuteUnique([1,1,2])
