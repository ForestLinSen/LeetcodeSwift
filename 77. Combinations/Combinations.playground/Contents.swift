// MARK: - Solution 2
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        var results: [[Int]] = []
        
        func backtracking(_ curr: inout [Int], _ k: Int, _ start: Int){
            if k == 0{
                results.append(curr)
                return
            }
            
            for i in start...(n-k+1){
                curr.append(i)
                print(curr, curr[curr.count-1])
                backtracking(&curr, k-1, i+1)
                curr.removeLast()
            }
 
        }
        
        var curr = [Int]()
        backtracking(&curr, k, 1)
        
        return results
    }
}

let solver = Solution()
solver.combine(4, 2)


// MARK: - Solution 1
//class Solution {
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        var results: [[Int]] = []
//        let nums = Array(1...n)
//
//        func dfs(_ curr: [Int], _ remainNums: [Int]){
//            if curr.count == k{
//                results.append(curr)
//                return
//            }
//
//            if remainNums.isEmpty { return }
//
//            for i in 0..<remainNums.count{
//                var curr = curr
//                curr.append(remainNums[i])
//                dfs(curr, Array(remainNums[(i+1)...]))
//            }
//        }
//
//        for i in 0..<nums.count{
//            var array = Array((i+1)...n)
//            array.removeFirst()
//            dfs([nums[i]], array)
//        }
//
//        return results
//    }
//}
//
//let solver = Solution()
//solver.combine(5, 2)

