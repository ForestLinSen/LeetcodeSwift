import Cocoa

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var answer = [Int]()
    
    var record: [Int: Int] = [:]
    
    for i in 0...nums.count-1{
        record[nums[i]] = i
    }
    
    for i in 0...nums.count-1{
        let currentNum = nums[i]
        let dif = target - currentNum

        let searchValue = record[dif]
        
        if let index = searchValue{
            
            if(index != i){
                answer.append(i)
                answer.append(index)
                return answer
            }

        }
    }
    
    return answer
}

let array = [-1,-2,-3,-4,-5]

twoSum(array, -8)
