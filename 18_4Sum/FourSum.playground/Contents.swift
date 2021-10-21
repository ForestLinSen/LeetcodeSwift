import Cocoa


class Solution {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        
        return Array(Set(kSum(nums, 0, target, 4)))

    }
    
    func kSum(_ nums: [Int], _ start: Int, _ target: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        if(k == 2){
            return twoSum(nums, start, target)
        }
        
        for i in start..<nums.count{
            
            if(i == start || nums[i] != nums[i-1]){
                let num = nums[i]
                for seq in kSum(nums, i+1, target-num, k-1){
                    var tmp = seq
                    tmp.append(num)
                    result.append(tmp)
                    
                }
            }
     
        }
        
        return result
    }
    
    func twoSum(_ nums: [Int], _ start: Int, _ target: Int) -> [[Int]] {
        var left = start;
        var right = nums.count-1
 
        var result:[[Int]] = []
        
        while(left < right){
            let sum = nums[left] + nums[right]
            if(sum == target){
                result.append([nums[left], nums[right]])
                left += 1
                right -= 1
            }else if(sum > target){
                right -= 1
            }else{
                left += 1
            }
        }
        
        return result
    }
}







//kSum([4,1,5,6,2,3], 0, 8, 3)
kSum([-3,-2,-1,0,0,1,2,3], 0, 0, 4)
//twoSum([2,3,5,6], 0, 4)


//class Solution {
//
//    // Two Pointers
//    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
//
//    let nums = nums.sorted()
//    return kSum(nums, target, 0, 4)
//}
//
//func kSum(_ nums: [Int],_ target: Int, _ start: Int, _ k: Int) -> [[Int]] {
//    var res: [[Int]] = []
//    if (start == nums.count) || (nums[start] * k > target) || (target > nums[nums.count - 1] * k) {
//        return res
//    }
//    if k == 2 {
//        return twoSum(nums, target, start)
//    }
//
//    for i in start..<nums.count {
//        if i == start || nums[i-1] != nums[i] {
//
//            for seq in kSum(nums, target - nums[i], i+1, k-1) {
//                res.append([nums[i]])
//                res[res.count - 1].append(contentsOf: seq)
//            }
//        }
//    }
//    return res
//}
//
//func twoSum(_ nums: [Int], _ target: Int, _ start: Int) -> [[Int]] {
//    var res: [[Int]] = []
//    var lo = start
//    var hi = nums.count - 1
//
//    while lo < hi {
//        let sum = nums[lo] + nums[hi]
//        if sum < target || (lo > start && nums[lo] == nums[lo - 1]) {
//            lo += 1
//        } else if sum > target || (hi < (nums.count - 1) && nums[hi] == nums[hi + 1]) {
//            hi -= 1
//        } else {
//            res.append([nums[lo], nums[hi]])
//            lo += 1
//            hi -= 1
//        }
//    }
//
//    return res
//}
//}




//class Solution {
//
//    var index = 0
//    var memo: [Int: [[Int]]] = [:]
//    var checkMemo: [Int: [[Int]]] = [:]
//
//    func mainCalculate(_ nums: [Int], _ target: Int) -> [[Int]] {
//        //result already in the memo
//        if let r = memo[target] {
//            if(r.count > 4){return []}
//
//            if(checkMemo[target]!.contains(nums)){
//                return r
//            }
//        }
//
//        if(target == 0 && index != 0){ return [[]]}
//
//        let max = nums.map{abs($0)}.reduce(0, +)
//        for i in 0..<nums.count{
//            let num = nums[i]
//            let remainder = target - num
//
//            // not possible
//
//            if(remainder < -max){ return []}
//
//            var tmp = nums
//            //print("Before: \(tmp), num: \(num)")
//            tmp.remove(at: i)
//            //print("After: \(tmp)")
//
//            let result = mainCalculate(tmp, remainder)
//
//            if(result.first != nil){
//
//                if(checkMemo[target] == nil){ checkMemo[target] = []}
//                checkMemo[target]!.append(nums)
//
//                result.forEach { intArray in
//                    var tmp = intArray
//                    tmp.append(num)
//
//                    if tmp.count > 4 { return }
//
//                    if(memo[target] == nil){ memo[target] = []}
//                    memo[target]?.append(tmp)
//
//                }
//
//
//            }
//        }
//
//        index += 1
//
//        //print(memo[target])
//        return memo[target] ?? []
//    }
//
//
//    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
//        let nums = nums.sorted()
//        let duplicates = Array(Set(nums.filter({ (i: Int) in nums.filter({ $0 == i }).count > 1})))
//        var result = mainCalculate(nums, target).filter({$0.count == 4})
//
//        result = result.map { s -> [Int] in
//            return s.sorted()
//        }
//
//        //print(duplicates)
//
//        return Array(Set(result))
//    }
//}
//
//let s = Solution()
////let result = s.fourSum([-3,-2,-1,0,0,1,2,3], 0)
//let result = s.fourSum([-3,-1,0,2,4,5], 0)
////let result = s.fourSum([0,0,0,0], 0)
//print(result)


