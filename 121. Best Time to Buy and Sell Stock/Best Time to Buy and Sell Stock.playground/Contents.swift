class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0}
        var profit = 0
        var minPrice = prices[0]
        
        for i in 1..<prices.count{
            if prices[i] < minPrice{
                minPrice = prices[i]
            }else{
                profit = max(profit, prices[i]-minPrice)
            }
        }
        
        return profit
    }
}


import XCTest

class Test: XCTestCase{
    private let sovler = Solution()
    
    func test0(){
        let result = sovler.maxProfit([7,1,5,3,6,4])
        XCTAssertEqual(result, 5)
    }
    
    func test1(){
        let result = sovler.maxProfit([7,6,4,3,1])
        XCTAssertEqual(result, 0)
    }
}

Test.defaultTestSuite.run()
