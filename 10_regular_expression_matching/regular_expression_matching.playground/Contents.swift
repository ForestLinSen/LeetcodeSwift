import Cocoa

func isMatch(_ s: String, _ p: String) -> Bool {
    // declare arraies and a table
    let target: [Character] = Array(s)
    let pattern: [Character] = Array(p)

    var table = Array(repeating: Array.init(repeating: false, count: pattern.count+1), count: target.count+1)

    table[0][0] = true
    
    for j in 1...pattern.count{
        if(pattern[j-1] == "*"){
            table[0][j] = table[0][j-2]
        }
    }

    for i in 1...target.count{
        for j in 1...pattern.count{
            if (target[i-1] == pattern[j-1] || pattern[j-1] == "."){
                table[i][j] = table[i-1][j-1]
            }else if(pattern[j-1] == "*"){
                
                table[i][j] = table[i][j-2]
      
                if(pattern[j-2] == target[i-1] || pattern[j-2] == "."){
                    table[i][j] = table[i][j] || table[i-1][j]
                }
                
            }
        }
    }

    print(table)
    return table[target.count][pattern.count]
}

isMatch("aaaaa", "a*")
