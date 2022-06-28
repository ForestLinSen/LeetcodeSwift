// abcdefghijklmnopqrstvuwxyz

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var queue: [String] = [beginWord]
        var wordSet = Set(wordList)
        var count = 1
        
        while !queue.isEmpty {

            count += 1
            var lists = [String]()
            
            for _ in 0..<queue.count{
                let currentWord = queue.removeFirst()
                lists += nextWords(currentWord, &wordSet)
                
                if lists.contains(endWord){
                    return count
                }
            }
     
            queue = lists
        }
        
        return 0
        
    }
    
    func nextWords(_ word: String, _ wordSet: inout Set<String>) -> [String]{
        let alphabet = Array("abcdefghijklmnopqrstvuwxyz")
        var chars = Array(word)
        var results = [String]()
        
        // Loop through every char in the current word
        for (i, char) in chars.enumerated(){
            // Match every char in alphabet
            for letter in alphabet{
                if char == letter{
                    continue
                }else{
                    chars[i] = letter
                    let newString = String(chars)
                    if wordSet.contains(newString){
                        results.append(newString)
                        wordSet.remove(newString)
                    }
                    
                }
            }
            
            // restore the original chars after each iteration
            chars[i] = char
            
        }
        
        return results
        
        
    }
    
}

let solver = Solution()
solver.ladderLength("red", "tax", ["ted","tex","red","tax","tad","den","rex","pee"])
