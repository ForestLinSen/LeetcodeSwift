import Cocoa


// Version 2: hash table O(N)
func lengthOfLongestSubstring(_ s: String) -> Int {
    
    // hash table
    var hashTable: [Character: Int] = [:]
    let stringArray = Array(s)
    var startIndex = 0
    var maxLength = 0
    
    for i in 0..<stringArray.count{
        let character = stringArray[i]
        
        if let index = hashTable[character]{
            //make sure the index won't go back
            startIndex = max(startIndex, index + 1)
        }
        
        print(startIndex)
        
        hashTable[character] = i
        maxLength = max(maxLength, i-startIndex+1)
        
    }
    
    return maxLength
}


lengthOfLongestSubstring("qrsvbspk")


// Version 1 : O(N^2)
//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    var currentArray = [Character]()
//    var longestLength = 0
//
//    if(s.count == 0){
//        return 0
//    }
//
//    // iterate every character
//    s.forEach { character in
//        if(!currentArray.contains(character)){
//            currentArray.append(character)
//
//        }else{
//            // the index of the repeated character
//            let repeatIndex = currentArray.firstIndex(of: character)
//            // return the array start from the repeated index
//            currentArray = currentArray.suffix(currentArray.count-repeatIndex!-1)
//            currentArray.append(character)
//        }
//
//        longestLength = (longestLength > currentArray.count) ? longestLength : currentArray.count
//
//        print("\(currentArray) ")
//
//    }
//
//    return longestLength
//}
