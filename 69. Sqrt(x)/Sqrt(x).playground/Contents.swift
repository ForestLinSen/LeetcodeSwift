class Solution {
    func mySqrt(_ x: Int) -> Int {
        
        if x <= 1{
            return x
        }
        
        var left = 1
        var right = x
        
        while left <= right{
            let mid = (left + right)/2
            let sqrt = x/mid
            
            if sqrt == mid{
                return sqrt
            }else if mid > sqrt{
                right = mid-1
            }else{
                left = mid+1
            }
        }
        
        return right
        
    }
}

let solver = Solution()
solver.mySqrt(5)
