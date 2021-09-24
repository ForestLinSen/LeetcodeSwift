// course url: https://www.youtube.com/watch?v=oBt53YbR9Kk
import Cocoa

// Part 1: Memorization

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


Dynamic_fib.dynamic_fib(50)


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

Dynamic_gridTraveler.dynamic_gridTraveler(42,20)
//Dynamic_gridTraveler.normal_gridTraveler(20,20)


// Part 2: Tabulation
