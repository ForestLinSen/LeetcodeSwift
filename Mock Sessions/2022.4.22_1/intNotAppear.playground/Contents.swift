class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        var dict = [Int: Int]()
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        var result = [Int]()
        for i in 1...nums.count{
            if dict[i] == nil{
                result.append(i)
            }
        }
        
        return result
    }
}
