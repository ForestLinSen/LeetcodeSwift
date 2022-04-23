class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted(by: {$0[0] < $1[0]})
        var end = sorted[0][1]
        var count = 0
        
        for i in 1..<sorted.count{
            if end > sorted[i][0]{
                end = min(sorted[i][1], end) // in senario like [1,2] and [1,3]
                count += 1
            }else{
                end = sorted[i][1]
            }
        }
        
        return count
    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])
        XCTAssertEqual(result, 1)
    }
    
    func test1(){
        let result = solver.eraseOverlapIntervals([[1,2],[1,2],[1,2]])
        XCTAssertEqual(result, 2)
    }
    
    func test2(){
        let result = solver.eraseOverlapIntervals([[1,2],[2,3]])
        XCTAssertEqual(result, 0)
    }
}

Test.defaultTestSuite.run()
