import Cocoa

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var currentArray = [Character]()
    var longestLength = 0

    if(s.count == 0){
        return 0
    }
    
    // iterate every character
    s.forEach { character in
        
        
        if(!currentArray.contains(character)){
            currentArray.append(character)
            
        }else{
            // the index of the repeated character
            let repeatIndex = currentArray.firstIndex(of: character)
            // return the array start from the repeated index
            currentArray = currentArray.suffix(currentArray.count-repeatIndex!-1)
            currentArray.append(character)
        }

        longestLength = (longestLength > currentArray.count) ? longestLength : currentArray.count
        
        print("\(currentArray) ")
        
    }
    
    return longestLength
}

lengthOfLongestSubstring("qrsvbspk")

//"qrsvbspk"
//"aabaab!bb"
