import Foundation

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
    var matrix: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: n+1), count: m+1)
    
    matrix[1][1] = 1
    
    for i in 1...m{
        for j in 1...n{
            matrix[i][j] += matrix[i-1][j] + matrix[i][j-1]
        }
    }
    print(matrix)
    
    return matrix[m][n]
}

gridTraveler(m: 3, n: 3)
