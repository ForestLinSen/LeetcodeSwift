class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        
        var currentStock = prices[0]
        var profit = 0
        
        //  if a <= b <= c <= d, then the maximum profit is d - a
        // d - a = (d - c) + (c - b) + (b - a)
        for i in 1..<prices.count{
            if prices[i] > currentStock{
                profit += prices[i] - currentStock
            }
            
            currentStock = prices[i]
        }
        
        return profit
    }
}


let solver = Solution()
solver.maxProfit([7,1,5,3,6,4])
