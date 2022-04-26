class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 { return true}
        
        var count = 0
        var flowerbed = flowerbed
        
        for i in 0..<flowerbed.count{
            if flowerbed[i] == 0 && (i == 0 || flowerbed[i-1] == 0) && (i == flowerbed.count-1 || flowerbed[i+1] == 0){
                flowerbed[i] = 1
                count += 1
                if count == n { return true}
            }
        }
        
        return false
    }
}

let solver = Solution()
solver.canPlaceFlowers([1,0,0,0,1], 2)
