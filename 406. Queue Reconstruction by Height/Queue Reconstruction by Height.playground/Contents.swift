
class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        // people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]
        let sorted = people.sorted {
            if $0[0] == $1[0]{
                return $0[1] < $1[1]
            }
            return $0[0] > $1[0]
        }
        
        var result = [[Int]]()
        
        for p in sorted{
            result.insert(p, at: p[1])
        }
        
        return result
    }
}

let solver = Solution()
solver.reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]])
