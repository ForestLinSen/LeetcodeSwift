// https://leetcode.com/problems/binary-tree-paths/description/

import Foundation

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


class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        if root?.left == nil && root?.right == nil {
            return ["\(root!.val)"]
        }
        
        
        var results = [String]()
        
        func backTracking(_ root: TreeNode?, _ curr: String){
    
            if root != nil && root?.left == nil && root?.right == nil{
                results.append("\(curr)->\(root!.val)")
                return
            }
            
            if root == nil{
                return
            }
            
            let curr = "\(curr)->\(root!.val)"
            
            if root?.left != nil {
                backTracking(root?.left, curr)
            }
            
            if root?.right != nil {
                backTracking(root?.right, curr)
            }
 
        }
        
        backTracking(root?.left, "\(root!.val)")
        backTracking(root?.right, "\(root!.val)")
        
        return results
    }
}
