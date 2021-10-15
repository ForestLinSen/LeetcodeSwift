import Cocoa

class Solution {
    
    var index = 0
    var memo: [Int: [[Int]]] = [:]
    var checkMemo: [Int: [[Int]]] = [:]
    
    func mainCalculate(_ nums: [Int], _ target: Int) -> [[Int]] {
        
        if(target == 0 && index != 0){ return [[]]}
        
        //result already in the memo
        if let r = memo[target] {
            if(r.count > 4){return []}
            
            if(checkMemo[target]!.contains(nums)){
                return r
            }else{
                return []
            }
        }
        
        let max = nums.map{abs($0)}.reduce(0, +)
        for i in 0..<nums.count{
            let num = nums[i]
            let remainder = target - num

            // not possible
            
            if(remainder < -max){ return []}
            
            var tmp = nums
            //print("Before: \(tmp), num: \(num)")
            tmp.remove(at: i)
            //print("After: \(tmp)")

            let result = mainCalculate(tmp, remainder)
            
            if(result.first != nil){
                result.forEach { intArray in
                    var tmp = intArray
                    tmp.append(num)
                    
                    if(memo[target] == nil){ memo[target] = []}
                    memo[target]?.append(tmp)
                    
                    if(checkMemo[target] == nil){ checkMemo[target] = []}
                    checkMemo[target]?.append(nums)
                }
            }
        }
        
        index += 1
        
        //print(checkMemo[target])

        return memo[target] ?? []
    }
    
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        var result = mainCalculate(nums, target).filter({$0.count == 4})
        
        result = result.map { s -> [Int] in
            return s.sorted()
        }

        return Array(Set(result))
    }
}

let s = Solution()
//let result = s.fourSum([-3,-2,-1,0,0,1,2,3], 0)
//let result = s.fourSum([-3,-1,0,2,4,5], 0)
let result = s.fourSum([0,0,0,0], 0)
print(result)


