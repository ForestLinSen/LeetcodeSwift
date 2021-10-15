import Cocoa

class Solution {
    var index = 0
    
    func calculate(_ nums: [Int], _ target: Int) -> [[Int]] {
        if(target == 0 && nums.count == 4 && nums.reduce(0, +) == 0){return [nums]}
        if(target == 0 && index != 0){ return [[]]}
        
        var finalResult: [[Int]] = []
        
        for i in 0..<nums.count{
            let num = nums[i]
            
            let remainder = target - num

            // not possible
            if(remainder < nums.min()! && remainder < 0){ return []}

        
            var tmp = nums
            tmp.remove(at: i)

            let result = calculate(tmp, remainder)
            
            if(result.first != nil){
                result.forEach { intArray in
                    if intArray.count > 4 { return }
                    var tmp = intArray
                    tmp.append(num)
                    finalResult.append(tmp)
                }
            }
            
        }
        
        index += 1

        return finalResult
    }
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let arrays = calculate(nums, target)
        
        var result = [[Int]]()
    
        for array in arrays{
            if(array.count == 4){
                result.append(array.sorted())
            }
        }
        return Array(Set(result))
    }
}

let s = Solution()
s.fourSum([0,0,0,0], 0)


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
