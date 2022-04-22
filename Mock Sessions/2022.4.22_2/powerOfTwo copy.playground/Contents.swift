class Solution {
    func romanToInt(_ s: String) -> Int {
        let dict: [String: Int] = [
            "I": 1,
            "IV": 4,
            "V": 5,
            "IX": 9,
            "X": 10,
            "XL": 40,
            "L": 50,
            "XC": 90,
            "C": 100,
            "CD": 400,
            "D": 500,
            "CM": 900,
            "M": 1000
        ]
        
        var result = 0
        
        let chars = Array(s)
        var index = 0
        while index < chars.count{
            let symbol = chars[index]
            var val: Int?
            
            if index+1 < chars.count{
                val = dict["\(symbol)\(chars[index+1])"]
            }
    
            if let val = val{
                result += val
                index += 1
            }else{
                result += dict["\(chars[index])"]!
            }
            
            index += 1
        }
        
        return result
    }
}

let solver = Solution()
solver.romanToInt("MCDLXXVI")
