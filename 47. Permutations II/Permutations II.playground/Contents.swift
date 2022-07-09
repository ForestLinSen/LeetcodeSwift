class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.count == 1 { return [nums] }
        
        let nums = nums.sorted()
        
        var results: [[Int]] = []
        
        func backTracking(_ curr: [Int], _ remain: [Int]){
            
            if curr.count == nums.count{
                results.append(curr)
                return
            }
            
            if remain.isEmpty{ return }
            
            for i in 0..<remain.count{
                var newRemain = remain
                
                if i != 0 && newRemain[i-1] == newRemain[i] {
                    newRemain.remove(at: i)
                    continue
                }
                
                var curr = curr
                curr.append(newRemain.remove(at: i))
                backTracking(curr, newRemain)
            }
        }

        
        for i in 0..<nums.count{
            var remain = nums
            if i != 0 && remain[i] == remain[i-1]{
                remain.remove(at: i)
                continue
            }
            let curr = [remain.remove(at: i)]
            backTracking(curr, remain)
        }
        
        return results
    }
}

let solver = Solution()
solver.permuteUnique([1,1,2])
