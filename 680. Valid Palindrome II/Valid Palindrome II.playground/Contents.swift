import Foundation

class Solution {
    
    func validPalindrome(_ s: String) -> Bool {
        var left = 0
        var right = s.count-1
        let chars = [Character](s)
        
        let result = isPalindrome(chars: chars, left: left, right: right)
        let palindrome = result["result"] as! Bool
        
        if palindrome{
            return true
        }else{
            left = result["left"] as! Int
            right = result["right"] as! Int
            
            return isPalindrome(chars: chars, left: left+1, right: right)["result"] as! Bool || isPalindrome(chars: chars, left: left, right: right-1)["result"] as! Bool
        }

    }
    
    func isPalindrome(chars: [Character], left: Int, right: Int) -> [String: Any]{
        var left = left
        var right = right
        
        while left < right{
            if chars[left] != chars[right]{
                return ["result": false, "left": left, "right": right]
            }
            
            left += 1
            right -= 1
        }
        
        return ["result": true]
    }
}

import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test1(){
        let result = solver.validPalindrome("abc")
        XCTAssertEqual(result, false)
    }
    
    func test2(){
        let result = solver.validPalindrome("abca")
        XCTAssertEqual(result, true)
    }
    
    func test3(){
        let result = solver.validPalindrome("aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga")
        XCTAssertEqual(result, true)
    }
}

Test.defaultTestSuite.run()
