import Foundation


// MARK: - Approach 1: Check all Indices Using a Hash Table
// important things: all elements in words have the same length
// valid substring: words.count * words[0].count

// Helper function logic:
    // 1) iterate from the starting index to the starting index + valid string size
    // 2) iterate words[0].length characters at a time. Return false if not found
    // 3) Use a hash table to keep an updated count of the words

// Algorithm
    // 1) Initialize some variables
    // 2) Create a function `check` that takes a starting index `i` and returns if a valid substring

// MARK: - Old solution

//extension String{
//    subscript(_ range: CountableRange<Int>) -> String{
//        let startIndex = self.index(self.startIndex, offsetBy: max(0, range.lowerBound))
//        let endIndex = self.index(startIndex, offsetBy: min(self.count - range.lowerBound, range.upperBound - range.lowerBound))
//
//        return String(self[startIndex..<endIndex])
//    }
//
//    subscript(_ range: CountablePartialRangeFrom<Int>) -> String{
//        let startIndex = self.index(self.startIndex, offsetBy: min(range.lowerBound, self.count))
//
//        return String(self[startIndex...])
//    }
//}
//
//
//class Solution {
//    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
//        guard !(s.isEmpty) || !(words.isEmpty) else { return [] }
//
//        let lenS = s.count, chars = Array(s)
//        let size = words[0].count, count = words.count * size
//
//        guard lenS >= count else { return [] }
//
//        var wordDict = [[Character]:Int]()
//
//        for word in words {
//            let arr: [Character] = word.map({$0})
//            wordDict[arr, default: 0] = (wordDict[arr] ?? 0) + 1
//        }
//
//        print("wordDict: \(wordDict)")
//        print("---")
//
//        var result = [Int]()
//
//        for i in 0..<size {
//            var val = i
//            while val <= (lenS - count) {
//
//                print("lens: \(lenS), count: \(count)")
//
//                var diff = (val + count)
//                var dict = [[Character]:Int]()
//                var equal: Bool = true
//                while val < diff {
//                    let temp: [Character] = chars[(diff - size)..<diff].map({$0})
//                    print("tmp: \(temp)")
//                    dict[temp] = (dict[temp] ?? 0) + 1
//                    if let char = dict[temp], char > (wordDict[temp] ?? 0) {
//                        equal = false
//                        break
//                    }
//                    diff -= size
//                }
//
//                print(dict)
//
//                if dict == wordDict { result.append(val) }
//                if equal { val += size } else { val = diff }
//            }
//        }
//        return result
//    }
//}

//let solver = Solution()
//solver.findSubstring("ababababab", ["ababa","babab"])
//solver.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"])
//solver.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"])
//solver.findSubstring("", [])
//solver.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"])
//solver.findSubstring("lingmindraboofooowingdingbarrwingmonkeypoundcake", ["fooo","barr","wing","ding","wing"])
//solver.findSubstring("ababaab", ["ab","ba","ba"])
//solver.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"])
