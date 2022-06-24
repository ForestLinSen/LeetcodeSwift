class Solution {
    
    let operators: [Character: (Int, Int) -> Int] = [
        "+" : {$0 + $1},
        "-" : {$0 - $1},
        "*" : {$0 * $1},
    ]
    
    var memo = [String: [Int]]()
    
    
    func diffWaysToCompute(_ expression: String) -> [Int] {
        if let num = Int(expression) {
            return [num]
        }
        
        if let val = memo[expression]{
            return val
        }
        
        var results = [Int]()
        
        for i in 0..<expression.count{
            let index = expression.index(expression.startIndex, offsetBy: i)
            let nextIndex = expression.index(after: index)
            
            let left = diffWaysToCompute(String(expression[..<index]))
            let right = diffWaysToCompute(String(expression[nextIndex...]))
            
            if let op = operators[expression[index]]{
                for l in left{
                    for r in right{
                        results.append(op(l, r))
                    }
                }
            }
        }
        
        memo[expression] = results
        
        return results
        
    }
}
