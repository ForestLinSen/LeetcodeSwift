import Cocoa

func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count-1
    var maxArea = 0
    
    while(left < right){
        let area = (right - left) * min(height[left], height[right])
        print(area)
        maxArea = max(maxArea, area)
        
        if(height[left] > height[right]){
            right -= 1
        }else{
            left += 1
        }
        
    }
    
    return maxArea
}

maxArea([4,3,2,1,4])
