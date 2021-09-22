import Cocoa

func convert(_ s: String, _ numRows: Int) -> String {
    
    if(numRows == 1){
        return s
    }
    
    let stringArray = Array(s)
    var result = ""
    
    // create a matrix of n x ?
    var resultArray = Array(repeating: [Character](), count: numRows)
    
    var down = false
    var index = 0
    
    for character in stringArray {
        resultArray[index].append(character)
        
        if(index == 0){
            down = true
        }else if(index == numRows - 1){
            down = false
        }
        
        if(down){
            index += 1
        }else{
            index -= 1
        }
    }
    
    for a in resultArray{
        result += a
    }
    
    return result
}

convert("A", 1)
