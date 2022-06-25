// https://leetcode.com/problems/perfect-squares/description/

import Foundation

//let nums = [2,1,5,6]
//
//nums.reduce(0) { partialResult, num in
//    return partialResult + num*num
//}

class Solution {
    func numSquares(_ n: Int) -> Int {
        var queue = [[Int]]()
        var initSqrt = Int(sqrt(Double(n)))
        queue.append([initSqrt])
        
        var results = [Int]()
        
        
        while !queue.isEmpty{
            var size = queue.count
            
            while size > 0{
                var currentNums = queue.removeFirst()
                
                let result = currentNums.reduce(0) { partialResult, num in
                    return partialResult + num*num
                }
                
                // find
                if result == n { results.append(currentNums.count) }
                
                initSqrt -= 1
                
                if result > n{
                    let lastNum = currentNums.removeLast()
                    if lastNum > 1{
                        currentNums.append(lastNum - 1)
                        queue.append(currentNums)
                    }
                    
                    
                    if initSqrt > 0{
                        queue.append([initSqrt])
                    }
                    
                }else{
                    currentNums.append(currentNums.last!)
                    queue.append(currentNums)
                }
                
//                initSqrt -= 1
//                if initSqrt > 0{
//                    queue.append([initSqrt])
//                }
                
                print(currentNums, initSqrt)
                
                size -= 1
            }
        }
        
        
        return results.min() ?? -1
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
//    func test2(){
//        let result = solver.numSquares(17)
//        XCTAssertEqual(result, 2)
//    }
    
    func test3(){
        let result = solver.numSquares(43)
        XCTAssertEqual(result, 3)
    }
}

Test.defaultTestSuite.run()
