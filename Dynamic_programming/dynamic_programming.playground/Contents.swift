// course url: https://www.youtube.com/watch?v=oBt53YbR9Kk
import Cocoa

// Part 1: Memorization

struct Dynamic_fib{
    
    // 1.1 fibonacci number: normal recurrsion
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
    
    // 1.2 Dynamic fibonacci
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
//Dynamic_fib.normal_fib(50)

// Part 2: Tabulation
