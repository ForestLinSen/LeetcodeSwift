import Cocoa

func romanToInt(_ s: String) -> Int {
    
    if(s == "") {return 0}
    
    let romanValues = [1000, 900, 500, 400, 100, 90, 50, 40 , 10 , 9 , 5 , 4, 1]
    let romanSymbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    var index = 0

    while !s.hasPrefix(romanSymbols[index]){
        index += 1
    }
    
    return romanToInt(String(s.suffix(s.count - romanSymbols[index].count))) + romanValues[index]
}

romanToInt("MCMXCIV")
