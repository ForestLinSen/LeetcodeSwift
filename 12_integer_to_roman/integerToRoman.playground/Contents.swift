import Cocoa

/// solution 3: recurence combined with for loop
func intToRoman_v3(_ num: Int) -> String{
    if(num == 0){return ""}
    
    let romanValues = [1000, 900, 500, 400, 100, 90, 50, 40 , 10 , 9 , 5 , 4, 1]
    let romanSymbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    var index = 0
    while(num < romanValues[index]){
        index += 1
    }
    
    return romanSymbols[index] + intToRoman_v3(num-romanValues[index])

}

intToRoman_v3(58)


/// solution 2: for loop
func intToRoman_v2(_ num: Int) -> String {

    let romanValues = [1000, 900, 500, 400, 100, 90, 50, 40 , 10 , 9 , 5 , 4, 1]
    let romanSymbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

    var num = num
    var result = ""

    var i = 0
    while num > 0{
        if (num >= romanValues[i]){
            result += romanSymbols[i]
            num -= romanValues[i]
            print(num)
        }else{
            i += 1
        }
    }

    for i in 0..<romanValues.count{
        let value = romanValues[i]
        while num >= value{
            result += romanSymbols[i]
            num -= value
        }
    }

    return result
}

//intToRoman(58)


//intToRoman(1000)

/// Solution 1: recurence
func intToRoman(_ num: Int) -> String {

    if(num <= 0){return ""}

    if(num >= 1000){
        return "M" + intToRoman(num-1000)
    }else if(num >= 900){
        return "CM" + intToRoman(num-900)
    }

    else if(num >= 500){
        return "D" + intToRoman(num-500)
    }else if(num >= 400){
        return "CD" + intToRoman(num-400)
    }

    else if(num >= 100){
        return "C" + intToRoman(num-100)
    }else if(num >= 90){
        return "XC" + intToRoman(num-90)
    }

    else if(num >= 50){
        return "L" + intToRoman(num-50)
    }else if(num >= 40){
        return "XL" + intToRoman(num-40)
    }

    else if(num >= 10){
        return "X" + intToRoman(num-10)
    }else if(num >= 9){
        return "IX" + intToRoman(num-9)
    }

    else if(num >= 5){
        return "V" + intToRoman(num-5)
    }else if(num >= 4){
        return "IV" + intToRoman(num-4)
    }

    else {
        return "I" + intToRoman(num-1)
    }

}


