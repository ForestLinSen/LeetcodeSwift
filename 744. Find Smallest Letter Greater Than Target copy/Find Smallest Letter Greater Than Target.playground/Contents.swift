class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        
        var left = 0
        var right = letters.count-1
        
        while left <= right{
            let mid = left + (right - left)/2
            
            if letters[mid] > target{
                right -= 1
            }else{
                left += 1
            }
        }
        
        if left == letters.count { return letters[0] }
        
        return letters[left]
    }
}


let solver = Solution()
solver.nextGreatestLetter(["c","f","j"], "j")

import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.nextGreatestLetter(["c","f","j"], "a")
        XCTAssertEqual(result, "c")
    }
    
    func test1(){
        let result = solver.nextGreatestLetter(["c","f","j"], "c")
        XCTAssertEqual(result, "f")
    }
    
    func test2(){
        let result = solver.nextGreatestLetter(["c","f","j"], "d")
        XCTAssertEqual(result, "f")
    }
    
    func test3(){
        let result = solver.nextGreatestLetter(["c","f","j"], "d")
        XCTAssertEqual(result, "f")
    }
    
    func test4(){
        let result = solver.nextGreatestLetter(["c","f","j"], "j")
        XCTAssertEqual(result, "c")
    }
}


Test.defaultTestSuite.run()
