import Foundation

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
func howSum(_ target: Int, _ array: [Int]) -> [Int]{
    var table = Array.init(repeating: [Int](), count: target+1)
    let min = array.min()!
    table[min] = [min]
    
    for i in min...target{
        if(table[i].count > 0){
            for num in array{
                let index = table[i].reduce(0, +)
                if(index+num <= target && table[index+num].count <= 0){
                    table[index+num].append(num)
                    table[index+num].append(contentsOf: table[i])
                }
            }
        }
    }
    
    print(table)
    return table[target]
}

howSum(22, [7,3,4])
