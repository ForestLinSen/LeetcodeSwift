class Solution {
    private let operators: [Character: (Int, Int)->Int] = [
        "+" : {$0 + $1},
        "*" : {$0 * $1},
        "-" : {$0 - $1},
    ]
    
    var memos = [String: [Int]]()
    
    func diffWaysToCompute(_ expression: String) -> [Int] {
        
        if let val = memos[expression] {
            return val
        }
        
        if let num = Int(expression){
            return [num]
        }
        
        var results = [Int]()
        
        for i in 0..<expression.count{
            
            let index = expression.index(expression.startIndex, offsetBy: i)
            let char = expression[index]
            
            
            let left = diffWaysToCompute(String(expression[..<index]))
            let nextIndex = expression.index(after: index)
            let right = diffWaysToCompute(String(expression[nextIndex...]))
            
            if let op = operators[char]{
                for left in left{
                    for right in right{
                        results.append(op(left, right))
                    }
                }
            }
        }
        
        memos[expression] = results
        
        return results
    }
}


let solver = Solution()
solver.diffWaysToCompute("2*3-4*5")

