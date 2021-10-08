import Cocoa

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    
    var closest = abs(nums[0] + nums[1] + nums[2] - target)
    var closeSum = nums[0] + nums[1] + nums[2]
    let nums = nums.sorted()
    
    for i in 0..<nums.count{
        //print("Closest: \(closest)")
        let num = nums[i]
        
        var left = i + 1
        var right = nums.count - 1
        
        while(left < right){
            
            let sum = nums[left] + nums[right] + nums[i]
            
            if(abs(target - sum) < closest){
                
                closest = abs(target - sum)
                closeSum = sum
            }
            
            if (target - sum) < 0{ /// bigger
                right -= 1
            }else if (target - sum) > 0{ /// smaller
                left += 1
            }else{ /// equals
                return sum
            }
        }
        
        
    }
    
    return closeSum
}

//threeSumClosest([-3,-2,-5,3,-4], -1) // -2
//threeSumClosest([-1,2,1,-4], 1) // 2
threeSumClosest([1,2,5,10,11], 12) // 13
