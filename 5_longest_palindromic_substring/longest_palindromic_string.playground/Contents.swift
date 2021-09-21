import Cocoa

// there is a huge performance difference between s.count and stringArray.count
func longestPalindrome(_ s: String) -> String {

    let stringArray: [Character] = Array(s)

    var center = 0, length = 0, start = 0

    while center < stringArray.count{
  
        var left = center, right = center

        // deal with the even situation: aabb
        // then left is 1, right is 2
        // example : aaabbbaaa
        // left = aa(a)bbbaaa, center = aaa(b)bbaaa, right = aaabbb(a)aa
        while right < stringArray.count - 1 && stringArray[left] == stringArray[right + 1] {
            right += 1
        }
        
        // update center for every iteration
        center = right+1

        while(left > 0 && right < stringArray.count-1 && stringArray[left-1] == stringArray[right+1]){
            left -= 1
            right += 1
        }

        //print("center character: \(stringArray[center]) left: \(left), right: \(right)")

        // update the longest length
        if(length < right - left + 1){
            length = right - left + 1
            start = left
        }

    }

    return String(s.prefix(start+length).suffix(length))
}

//longestPalindrome("bananas")
longestPalindrome("aaabbbaaa")

// Version 1: O(N^2)
//func longestPalindrome(_ s: String) -> String {
//
//    if(s.count <= 1){
//        return s
//    }
//
//    var result = ""
//    var tmp = ""
//
//    for i in 0..<s.count-1{
//
//        tmp = findString(left: i, right: i , string: s)
//        if tmp.count > result.count {
//            result = tmp
//        }
//
//        tmp = findString(left: i, right: i+1, string: s)
//        if tmp.count > result.count {
//            result = tmp
//        }
//    }
//
//
//    return result
//}
//
//func findString(left: Int, right: Int, string: String) -> String{
//
//    var result = ""
//
//    let stringArray: [Character] = Array(string)
//    var left = left
//    var right = right
//
//    while(left >= 0 && right < string.count && stringArray[left] == stringArray[right]){
//        left -= 1
//        right += 1
//    }
//
//
//    for i in left+1..<right{
//        result += String(stringArray[i])
//    }
//
//    print(result)
//
//    return result
//}

//longestPalindrome("abba")

