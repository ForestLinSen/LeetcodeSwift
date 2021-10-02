import Foundation

// Course: https://www.youtube.com/watch?v=oBt53YbR9Kk
// Tabulation Recipe
    /// 1. Visualize the problem as a table
    /// 2. Size the table based on the inputs
    /// 3. Initialize the table with the default value
    /// * 4. seed the trivial answer into the table *
    /// 5. iterate through the table
    /// 6. fill further position based on the current position

// 2.1 tabulation of fibonacci problem
func fib(_ num: Int) -> Int{
    
    var table: [Int] = Array.init(repeating: 0, count: num+1)
    table[1] = 1
    
    for i in 2...num{
        table[i] = table[i-1] + table[i-2]
    }
    
    return table[num]
}

fib(12)

// 2.2 grideTraveler tabulation
func gridTraveler(m: Int, n: Int) -> Int{
    
    if(m<=0 || n<=0){
        return -1
    }
    
    var matrix: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: n+1), count: m+1)
    matrix[1][1] = 1
    
    for i in 1...m{
        for j in 1...n{
            matrix[i][j] += matrix[i-1][j] + matrix[i][j-1]
        }
    }
    
    return matrix[m][n]
}

gridTraveler(m: 5, n: 5)


// 2.3 canSum tabulation
func canSum(_ target: Int, _ array: [Int]) -> Bool{
    /// initialize the table
    var table = Array.init(repeating: false, count: target+1)
    table[0] = true
    
    for i in 0..<table.count{
        if(table[i] == true){
            for num in array{
                if(i+num <= target){
                    table[i+num] = true
                }
            }
        }
    }
    return table[target]
}

canSum(15, [7,14])

// 2.4 howSum tabulation
/// time complexity : O(m*n*m) -- because we need copy the array so additional *m
/// m = targetSum, n = numbers.length
func howSum(_ target: Int, _ array: [Int]) -> [Int]?{
    var table = Array<[Int]?>.init(repeating: nil, count: target+1)
    table[0] = []
    
    for i in 0...target{
        if(table[i] != nil){
            for num in array{
                /// purpose of &&: do not override
                if(i+num <= target && table[i+num] == nil){
                    table[i+num] = table[i]
                    table[i+num]!.append(num)
                }
            }
        }
    }
    
    return table[target]
}

howSum(25, [7,3,4])


// 2.5 Best sum
/// time complexity : O(m*n*m)
/// m = targetSum, n = numbers.length
func bestSum(_ target: Int, _ array: [Int]) -> [Int]?{
    var table = Array<[Int]?>.init(repeating: nil, count: target+1)
    table[0] = []
    
    for i in 0...target{
        if(table[i] != nil){
            for num in array{
                if(i+num <= target){
                    /// make sure it is the shortest array
                    if(table[i+num] == nil || table[i+num]!.count > table[i]!.count+1){
                        table[i+num] = table[i]
                        table[i+num]!.append(num)
                    }
                }
            }
        }
    }
    
    return table[target]
}

bestSum(25, [7,3,4,8,9])


// 2.6 Can construct
/// time complexity: O(m^2 * n) time
/// space complexity: O(m)
func canConstruct(_ target: String, _ wordBank: [String]) -> Bool{
    var table = Array.init(repeating: false, count: target.count+1)
    table[0] = true
    
    for i in 0..<target.count{
        if(table[i] == true){
            for word in wordBank{
                /// if the word matches the characters starts at the position i
                if(target.prefix(i+word.count).suffix(word.count) == word
                    && i+word.count <= target.count){
                    table[i + word.count] = true
                }
            }
        }
    }
    return table[target.count]
}

/// [f] [e] [d] [c] [a]
canConstruct("fegca", ["f", "edc", "a"])

// 2.7 Count construct
/// time complexity: O(m^2 * n) time
/// space complexity: O(m)
func countConstruct(_ target: String, _ wordBank: [String]) -> Int{
    var table = Array.init(repeating: 0, count: target.count + 1)
    table[0] = 1
    
    for i in 0...target.count{
        if(table[i] > 0){
            for word in wordBank{
                if(target.prefix(i+word.count).suffix(word.count) == word
                    && i+word.count <= target.count){
                    table[i+word.count] += table[i]
                    
                }
            }
        }
    }
    
    return table[target.count]
}

countConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"])


// 2.8 all construct
/// time complexity: O(n^m)
/// space complexity: O(n^m)
func allConstruct(_ target: String, _ wordBank: [String]) -> [[String]?]{
    var table = Array<[[String]?]>.init(repeating: [], count: target.count + 1)
    table[0] = [[]]

    for i in 0...target.count{
        if(table[i].first != nil){
            for word in wordBank{
                let index = i+word.count
                if(index <= target.count && target.prefix(index).suffix(word.count) == word){
                    
                    let tmp = table[i].map({ s -> [String]? in
                        var ss = s
                        ss?.append(word)
                        return ss
                    })
                    
                    table[index].append(contentsOf: tmp)

                }
            }

        }
    }
    return table[target.count]
}


allConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"])
allConstruct("purple", ["purp", "p", "ur", "le", "purpl"])

//let a: [[String]?] = [[]]
//a.first
