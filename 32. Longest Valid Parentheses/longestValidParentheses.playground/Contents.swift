import SwiftUI

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let charsArray = Array(s)
        var countArray = [Int]()
        
        var i = 0
        //var j = 0
        
        var count = 0
        
        while i < charsArray.count-1{
            
            
            // cannot start here
            if charsArray[i] == ")" {
                i += 1
                countArray.append(count)
                count = 0
            }else{
                var j = i
                while(charsArray[j+1] == "("){
                    j += 1
                }
                
                if(j > i){
                    var k = j
                    
                    while(k+1 <= charsArray.count-1 && charsArray[k+1] == ")"){
                        k += 1
                    }
                    
                    print("Count before \(count)")
                    
                    if (k-j > j-i){
                        let step = j-i+1
                        count += step*2
                        i += step
                    }else{
                        count = 0
                        count += (k-j)*2
                        i = k+1
                    }
                    
                    print(" Count +=: \(count)")
                }else{
                    count += 2
                    i += 2
                }

            }
            
            countArray.append(count)
        }
        
        print(countArray)
        return countArray.max() ?? 0
    }
}

// Input: s = ")()())"
// Output: 4

import XCTest

class Tests: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let s = ")()()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(4, result)
    }

    func test1(){
        let s = "(()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(2, result)
    }

    func test2(){
        let s = ""
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(0, result)
    }

    func test3(){
        let s = ")()()()()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(8, result)
    }

    func test4(){
        let s = "()(())"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(6, result)
    }
    
    func test5(){
        let s = "()(()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(2, result)
    }
    
    func test6(){
        let s = "(()())"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(6, result)
    }
}

Tests.defaultTestSuite.run()
