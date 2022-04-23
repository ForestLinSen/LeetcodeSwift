class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        
        let sorted = points.sorted(by: {$0[1] < $1[1]})
        
        var end = sorted[0][1]
        var count = 1
        
        for i in 1..<sorted.count{
            if end < sorted[i][0]{
                end = sorted[i][1]
                count += 1
            }
        }
        
        return count

    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])
        XCTAssertEqual(result, 2)
    }
    
    func test1(){
        let result = solver.findMinArrowShots([[1,2],[3,4],[5,6],[7,8]])
        XCTAssertEqual(result, 4)
    }
    
    func test2(){
        let result = solver.findMinArrowShots([[2,3],[2,3]])
        XCTAssertEqual(result, 1)
    }
    
    func test3(){
        let result = solver.findMinArrowShots([[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]])
        XCTAssertEqual(result, 2)
    }
    
    func test4(){
        let result = solver.findMinArrowShots([[1,2],[2,3],[3,4],[4,5]])
        XCTAssertEqual(result, 2)
    }
}

Test.defaultTestSuite.run()

