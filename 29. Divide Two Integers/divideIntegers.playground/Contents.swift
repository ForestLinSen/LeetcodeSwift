class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        
        let negative = (dividend < 0) == (divisor < 0)
        var _dividend = Int64(abs(dividend))
        let _divisor = Int64(abs(divisor))
        
        var count = 0, t = 1, divisor = _divisor
        
        while divisor < _dividend {
            divisor = divisor << 1
            t = t << 1
            
            print("Divisor: \(divisor)")
        }
        
        print("--")
        
        while divisor > 0, divisor > _divisor {
            
            while divisor > _dividend {
                divisor = divisor >> 1
                t = t >> 1
            }
            
            print(count, t)
            
            _dividend -= divisor
            count += t
        }
        if _dividend == _divisor { count += 1 }
        return negative ? min(count, Int(Int32.max)) : max(-count, Int(Int32.min))
    }
}

let solver = Solution()
solver.divide(-2147483647, 2)
