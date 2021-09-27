// course url: https://www.youtube.com/watch?v=oBt53YbR9Kk
import Cocoa

// ### Part 1: Memorization ###

// 1.1 Fibonacci
struct Dynamic_fib{
    
    // 1.1.1 fibonacci number: normal recurrsion
    /// Time complexity: O(2^N)
    static func normal_fib(_ n:Int) -> Int{
        guard n > 0 else {return -1}
        
        if(n <= 2){
            return 1
        }
        return normal_fib(n-1) + normal_fib(n-2)
    }
    
    /// fibonacci: in the middle
        /// dib(n-1) + dib(n-1)
        /// fib(n-1) + fib(n-2)
        /// lib(n-2) + lib(n-2)
    
    // 1.1.2 Dynamic fibonacci
    static var memo  = [Int:Int]()
    
    static func dynamic_fib(_ n: Int) -> Int{
        
        if(n <= 2){
            return 1
        }
        
        if let num = memo[n]{
            return num
        }else{
            memo[n] = dynamic_fib(n-1) + dynamic_fib(n-2)
            return memo[n]!
        }
    }
    
}


Dynamic_fib.dynamic_fib(18)


// 1.2 gridTraveler
/// down -> func(2, 3) becomes (1, 3)
/// right -> func(2, 3) becomes (2, 2)

struct Dynamic_gridTraveler{
    static func normal_gridTraveler(_ m: Int, _ n: Int) -> Int{
        
        if(m == 0 || n == 0){
            return 0
        }else if(m == 1 && n == 1){
            return 1
        }
        
        return normal_gridTraveler(m-1, n) + normal_gridTraveler(m, n-1)
    }
    
    static var memo = [String: Int]()
    
    static func dynamic_gridTraveler(_ m: Int, _ n: Int) -> Int{
        
        if(m == 0 || n == 0){
            return 0
        }else if(m == 1 && n == 1){
            return 1
        }
        
        let key = String(m) + "," + String(n)
        
        if let num = memo[key]{
            return num
        }else{
            memo[key] = dynamic_gridTraveler(m-1, n) + dynamic_gridTraveler(m, n-1)
            return memo[key]!
        }
    }
}

Dynamic_gridTraveler.dynamic_gridTraveler(12,5)

// 1.3 Memorization recipe
/// 1) make it work
///     * visualize the problem as tree
///     * implement the tree using recursion
///     * test is
/// 2) make it efficient
///     * add a memo object
///     * add a base case to reutrn memo value
///     * store return values into the memo


// 1.4 canSum
struct CanSum{
    
    // 1.4.1 normal recurrsive function
    // time complexity: O(n^m)  ( n: array.count; m: target )
    static func normal_canSum(_ target: Int, _ array: [Int]) -> Bool{
        
        if(target == 0){return true}
        if(target < 0){return false}
        
        for num in array{
            let remainder = target - num
            if normal_canSum(remainder, array){
                return true
            }
        }
        
        /// if any of the value become true we return true
        /// else we return false
        return false
        
    }
    
    // 1.4.2 dynamic function with memorization
    static var memo = [Int: Bool]()
    
    static func dynamic_canSum(_ target: Int, _ array: [Int]) -> Bool{
        
        if let canSum = memo[target]{
            return canSum
        }
        
        if(target == 0){return true}
        if(target < 0){return false}
        
        for num in array{
            
            let reminder = target - num
            
            if(dynamic_canSum(reminder, array)){
                memo[reminder] = dynamic_canSum(reminder, array)
                return memo[reminder]!
            }
   
        }
        
        memo[target] = false
        return false
        
    }
}

CanSum.dynamic_canSum(151, [11,16])


// 1.5 How sum

struct HowSum{
    
    // normal solution
    // time complexity: O(n^m * m) -- cause we need copy the array every time
    static func normal_howsum(_ target: Int, _ array: [Int]) -> [Int]? {
        
        if(target == 0){return []}
        if(target < 0){return nil}
        
        for num in array{
            let remainder = target - num
            
            var result = normal_howsum(remainder, array)
            
            // add the edge
            if(result != nil){
                result?.append(num)
                return result
            }
        }
        
        return nil
    }
    
    // dynamic programming
    // time complexity: O(n*m^2)
    // space: O(m*m)
    static var memo = [Int: [Int]]()
    static func dynamic_howsum(_ target: Int, _ array: [Int]) -> [Int]?{
        
        if(memo[target] != nil) {return memo[target]}
        if(target == 0){return []}
        if(target < 0){return nil}
        
        for num in array{
            let remainder = target - num
            let previousResult = dynamic_howsum(remainder, array)
            
            if(previousResult != nil){
                
                if(memo[target] == nil) {memo[target] = []}
                
                memo[target]!.append(contentsOf: previousResult!)
                memo[target]!.append(num)

                return memo[target]
            }
        }
        
        memo[target] = nil
        
        return memo[target]
    }
}

//HowSum.normal_howsum(12, [10, 1])
HowSum.dynamic_howsum(15, [7,2])


// 1.5 Best sum
struct BestSum{
    // time complexity: O(n^m * m)
    // space: O(m^2)
    static func normal_bestSum(_ target: Int, _ array: [Int]) -> [Int]?{
        if(target == 0){return []}
        if(target < 0){return nil}
        
        var bestSum: [Int]? = nil
        
        for num in array{
            let remainder = target - num
            var currentResult = normal_bestSum(remainder, array)
            
            if(currentResult != nil){
                currentResult?.append(num)
                if(bestSum == nil || currentResult!.count < bestSum!.count){
                    bestSum = currentResult
                }
            }
        }
         
        return bestSum
    }
    
    // dynamic bestSum
    // time complexity: O(m*n * m) = O(m^2*n)
    // space: O(n^2)
    static var memo = [Int: [Int]]()
    static func dynamic_bestSum(_ target: Int, _ array: [Int]) -> [Int]?{
        if let result = memo[target] {return result}
        if(target == 0){return []}
        if(target < 0){return nil}
        
        var bestSum: [Int]? = nil
        
        for num in array{
            let remainder = target - num
            var currentResult = dynamic_bestSum(remainder, array)
            
            // possible
            if(currentResult != nil){
                currentResult?.append(num)
                
                if(bestSum == nil || currentResult!.count < bestSum!.count){
                    bestSum = currentResult
                }
            }
        }
        
        memo[target] = bestSum
        
        
        return bestSum
    }
}

BestSum.dynamic_bestSum(35, [8,3,2])
//BestSum.normal_bestSum(35, [8,3,2])

struct CanConstruct{
    
    // time complexity: O(n^m * m)
    // space complexity: O(m^2)
    static func normal_canConstruct(_ target: String, _ wordBank: [String]) -> Bool{
        if(target == ""){return true}
        
        for word in wordBank{
            if(target.prefix(word.count) == word){
                let suffix = target.suffix(target.count - word.count)
                if(normal_canConstruct(String(suffix), wordBank)){
                    return true
                }
            }
        }
        return false
    }
    
    
    // dynamic programming
    // time complexity: O(n*m^2)
    // space complexity: O(m^2)
    static var memo = [String: Bool]()
    static func dynamic_canConstruct(_ target: String, _ wordBank: [String]) -> Bool{
        if let result = memo[target] {return result}
        if(target == ""){return true}
        
        for word in wordBank{
            if(target.prefix(word.count) == word){
                memo[target] = true
                
                // target: hello; prefix: hel; suffix: lo
                let suffix = target.suffix(target.count - word.count)
                if(dynamic_canConstruct(String(suffix), wordBank)){
                    memo[String(suffix)] = true
                    return true
                }
            }
        }
        
        return false
    }
}


CanConstruct.dynamic_canConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"])


struct CountConstruct{
    static func normal_countConstruct(_ target: String, _ wordBank: [String]) -> Int{
        if(target == ""){return 1}
        
        var totalCount = 0
        
        for word in wordBank{
            if(target.prefix(word.count) == word){
                let suffix = String(target.suffix(target.count - word.count))
                let result = normal_countConstruct(suffix, wordBank)
                
                totalCount += result

            }
        }

        return totalCount
    }
}

CountConstruct.normal_countConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"])
//CountConstruct.normal_countConstruct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "ee", "eee", "eeee", "eeeee"])

// ### Part 2: Tabulation ###



