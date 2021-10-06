import Cocoa

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else { return [] }
    
    let nums = nums.sorted()
    var result: [[Int]] = []
    
//    if(nums.reduce(0, +) == 0 && nums.count == 3){
//        return [nums]
//    }
    
    for i in 0...nums.count-1{
        //print(i)
        if(i>0 && nums[i] == nums[i-1]){ continue }
        
        
        let num = nums[i]
        let target = 0 - num
        var left = i+1, right = nums.count - 1
        
        while(left < right){
            
            let sum = nums[left] + nums[right]
            
            if(sum == target){
                
                print(i, left, right)
                
                result.append([nums[i], nums[left], nums[right]])

                left += 1; right -= 1
            }else{
                if(sum > target){
                    right -= 1
                }else{
                    left += 1
                }
            }
        }
    }
    
    return Array(Set(result))
}


let nums = [-1,0,1,2,-1,-4]
let numsTwo = [-2,0,0,2,2]
let numsThree = [1,2,-2,-1]


threeSum(numsTwo)
