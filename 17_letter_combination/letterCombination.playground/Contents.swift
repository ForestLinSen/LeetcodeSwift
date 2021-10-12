import Cocoa

func letterCombinations(_ digits: String) -> [String] {
    
    guard digits != "" else { return [] }
    
    var dict: [String: [String]] = ["2": ["a", "b", "c"],
                                    "3": ["d", "e", "f"],
                                    "4": ["g", "h", "i"],
                                    "5": ["j", "k", "l"],
                                    "6": ["m", "n", "o"],
                                    "7": ["p", "q", "r", "s"],
                                    "8": ["t", "u", "v"],
                                    "9": ["w", "x", "y", "z"]]

    if let result = dict[digits] { return result }
    
    for i in 1...digits.count{
        
        let prefix = String(digits.prefix(i))
        let suffix = String(digits.prefix(i+1).suffix(1))
        
        if(dict[prefix] == nil){ dict[prefix] = [] }
            
        dict[prefix + suffix] = helper(a: dict[prefix]!, b: dict[suffix]!)
        
    }

    return dict[digits]!
}


func helper(a: [String], b: [String]) -> [String]{
    var result: [String] = []
    
    for x in a{
        for y in b{
            result.append(x+y)
        }
    }
    
    return result
}

print(letterCombinations("2583"))

