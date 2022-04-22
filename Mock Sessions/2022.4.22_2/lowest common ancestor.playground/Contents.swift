/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    var currentNums = [Int]()
    var checkCount = 0
    var currentNode: TreeNode?
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var root = root
        
        while true{
            if check(root?.left, p, q){
                root = root?.left
            }else if check(root?.right, p, q){
                root = root?.right
            }else{
                return root
            }
        }

    }
    
    func check(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?)->Bool{
        checkCount = 0
        dfsTraverse(root, p, q)
        
        if checkCount == 2{
            return true
        }else{
            return false
        }
    }
    
    
    func dfsTraverse(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?){
        guard let root = root else {
            return
        }
        
        dfsTraverse(root.left, p, q)
        dfsTraverse(root.right, p, q)
        
        if root.val == p?.val || root.val == q?.val{
            checkCount += 1
        }
    }
}
