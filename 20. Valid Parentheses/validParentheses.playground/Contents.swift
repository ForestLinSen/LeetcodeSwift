class Solution {
    func isValid(_ s: String) -> Bool {
        let characters = [Character](s)
        var stack = [Character]()
        
        // )(
        // (]
        // ()[]
        let left: [Character] = ["(", "{", "["]
        let right: [Character] = [")", "}", "]"]
        
        var i = 0
        var j = 0
        
        for i in 0..<characters.count{
            let c = characters[i]
            
            if left.contains(c){
                stack.append(c)
            }else if right.contains(c){
                let index = right.firstIndex(of: c)!
                
                // corresponding character on the left
                let leftCharacter = left[index]
                guard let toRemoveIndex = stack.lastIndex(of: leftCharacter), toRemoveIndex == stack.count - 1
                      else{
                    return false
                }
                
                //print("to remove index: \(toRemoveIndex)")
                stack.remove(at: toRemoveIndex)
            }
            
            //print("stack: \(stack)")
        }
        return stack.count == 0 ? true : false
    }
}
