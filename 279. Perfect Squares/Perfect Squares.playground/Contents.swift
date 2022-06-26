// https://leetcode.com/problems/perfect-squares/description/

import Foundation


class Solution {
    func numSquares(_ n: Int) -> Int {

        var queue: [Int] = [n]
        var count = 0
        var visited: [Int: Bool] = [n: true]
        
        while !queue.isEmpty{
            
            // Loop throught every element in the current queue
            for _ in 0..<queue.count{
                
                let currentNum = queue.removeFirst()
                
                var i = 1
                
                if currentNum == 0 {
                    return count
                }

                while (currentNum - i*i) >= 0 {
                    
                    let residual = currentNum - i*i
                    
                    if !visited[residual, default: false]{
                        queue.append(residual)
                        visited[residual] = true
                    }

                    i += 1
                }
                
            }
            
            print(queue)
            count += 1
        }
        
        return -1
    }

}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
//    func test0(){
//        let result = solver.numSquares(12)
//        XCTAssertEqual(result, 3)
//    }
//
//    func test1(){
//        let result = solver.numSquares(13)
//        XCTAssertEqual(result, 2)
//    }
//
    func test2(){
        let result = solver.numSquares(17)
        XCTAssertEqual(result, 2)
    }

    func test3(){
        let result = solver.numSquares(43)
        XCTAssertEqual(result, 3)
    }
}

Test.defaultTestSuite.run()
