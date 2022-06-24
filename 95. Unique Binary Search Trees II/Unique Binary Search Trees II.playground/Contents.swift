
public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init() { self.val = 0; self.left = nil; self.right = nil; }
 public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
     self.val = val
     self.left = left
     self.right = right
 }
}

//    Input: 3
//    Output:
//    [
//      [1,null,3,2],
//      [3,2,null,1],
//      [3,1,null,null,2],
//      [2,1,3],
//      [1,null,2,null,3]
//    ]
//    Explanation:
//    The above output corresponds to the 5 unique BST's shown below:
//
//       1         3     3      2      1
//        \       /     /      / \      \
//         3     2     1      1   3      2
//        /     /       \                 \
//       2     1         2                 3

class Solution {
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        recurGenerateTrees(1, n)

    }
    
    func recurGenerateTrees(_ start: Int, _ end: Int) -> [TreeNode?]{
        
        var results = [TreeNode?]()
        
        if start > end{
            results.append(nil)
            return results
        }
        
        for node in start...end{
            let leftNodes = recurGenerateTrees(start, node-1)
            let rightNodes = recurGenerateTrees(node+1, end)
            
            for l in leftNodes{
                for r in rightNodes{
                    let node = TreeNode(node)
                    node.left = l
                    node.right = r
                    results.append(node)
                }
            }
        }
        
        return results
    }
}
