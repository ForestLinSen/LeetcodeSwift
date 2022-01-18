class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        
        if dividend == Int(Int32.min) && divisor == -1 {
            return Int(Int32.max)
        }
        
        let negative = (dividend * divisor) < 0
        
        var dividend = Int64(abs(dividend))
        let divisor = Int64(abs(divisor))
        
        var count = 0
        
        while divisor <= dividend {
            dividend -= divisor
            count += 1
            print(dividend, count)
        }
        
        
        return negative ? -count : count
    }
}

let solver = Solution()
solver.divide(-2147483648, 2)
