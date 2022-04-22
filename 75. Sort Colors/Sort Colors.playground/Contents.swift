class Solution {
    func sortColors(_ nums: inout [Int]) {
        var dict = [Int: Int]()
        
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        var result = [Int]()
        for i in 0...2{
            result.append(contentsOf: Array(repeating: i, count: dict[i] ?? 0))
        }
        
        nums = result

    }
}
