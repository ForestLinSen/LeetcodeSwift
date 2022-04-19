class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels: [Character: Int] = ["a": 0, "e": 0, "i": 0, "o": 0, "u": 0,
                                        "A": 0, "E": 0, "I": 0, "O": 0, "U": 0]
        var chars = [Character](s)
        
        var left = 0
        var right = chars.count-1
        
        while left < right{
  
            while vowels[chars[left]] == nil && left < right{
                left += 1
            }
            
            while vowels[chars[right]] == nil && left < right{
                right -= 1
            }

            // Swap
            let temp = chars[left]
            chars[left] = chars[right]
            chars[right] = temp
            
            left += 1
            right -= 1
            
        }
        
        return String(chars)
        
    }
}


import XCTest

class Test:XCTestCase{
    private let solver = Solution()
    
    func test1(){
        let result = solver.reverseVowels("hello")
        XCTAssertEqual(result, "holle")
    }
    
    func test2(){
        let result = solver.reverseVowels("leetcode")
        XCTAssertEqual(result, "leotcede")
    }
    
    func test3(){
        let result = solver.reverseVowels("aA")
        XCTAssertEqual(result, "Aa")
    }
}

Test.defaultTestSuite.run()
