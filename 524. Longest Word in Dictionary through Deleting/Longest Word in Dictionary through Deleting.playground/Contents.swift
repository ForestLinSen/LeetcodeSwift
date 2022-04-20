class Solution {
    func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
        var longestWord = ""
        
        for target in dictionary{
            if target.count > longestWord.count || (target.count == longestWord.count && target.compare(longestWord) == .orderedAscending){
                if isMatched(s: s, target: target){
                    longestWord = target
                }
            }
        }
        
        return longestWord
    }
    
    func isMatched(s: String, target: String) -> Bool{
        var i = 0
        var j = 0 // used for checking matching state
        
        let charS = [Character](s)
        let charTarget = [Character](target)
        
        while i < charS.count && j < charTarget.count{
            if charS[i] == charTarget[j]{
                j += 1
            }
            
            i += 1
        }
        
        return j == target.count
    }
}

let solver = Solution()
solver.isMatched(s: "abpcplea", target: "apple")

import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test1(){
        let result = solver.findLongestWord("abpcplea", ["ale","apple","monkey","plea"])
        XCTAssertEqual(result, "apple")
    }
    
    func test2(){
        let result = solver.findLongestWord("abpcplea", ["a", "b", "c"])
        XCTAssertEqual(result, "a")
    }

}

Test.defaultTestSuite.run()
