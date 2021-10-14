import Cocoa

class Solution {
    
    var index = 0
    var memo: [Int: [[Int]]] = [:]
    
    func mainCalculate(_ nums: [Int], _ target: Int) -> [[Int]] {
        if(target == 0 && index != 0){ return [[]]}
        
        //result already in the memo
        if let r = memo[target] {
            //if(r.count > 4){return []}
            return r
        }
 
        for i in 0..<nums.count{
            let num = nums[i]
            let remainder = target - num

            // not possible
            if(remainder < nums.min()!-1 && remainder < 0){ return []}

            var tmp = nums
            tmp.remove(at: i)

            let result = mainCalculate(tmp, remainder)
            
            if(result.first != nil){
                result.forEach { intArray in
                    var tmp = intArray
                    tmp.insert(num, at: 0)
                    
                    if(memo[target] == nil){ memo[target] = []}
                    memo[target]?.append(tmp)
                    //print(tmp)
                }
            }
        }
        
        index += 1

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
let result = s.fourSum([1,0,-1,0,-2,2], 0)
print(result)


//func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
//
//    var table: [[[Int]]] = Array(repeating: [], count: target+1)
//
//
//    for num in nums{
//        table[num].append([num])
//    }
//
//    for i in 1..<table.count{
//        if(table[i].first != nil){
//            for num in nums{
//                if i+num < table.count{
//                    table[i].forEach { intArray in
//
//                        if(intArray.filter({$0 == num}).count < nums.filter({$0 == num}).count){
//                            var tmp = intArray
//                            tmp.insert(num, at: 0)
//                            table[i+num].append(tmp)
//                        }
//
//                    }
//                }
//            }
//        }
//    }
//
//
//    var result = [[Int]]()
//
//    table[target] = Array(Set(table[target]))
//
//    for array in table[target]{
//        if(array.count == 4){
//            result.append(array.sorted())
//        }
//    }
//
//    return result
//}
//
//fourSum([2,2,2,2,2], 8)
