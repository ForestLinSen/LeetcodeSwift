// https://leetcode.com/problems/perfect-squares/description/

import Foundation


class Solution {
    
    enum OceanType{
        case Pacific
        case Atlantic
    }
    
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
        var log: [[Int]] = Array(repeating: Array(repeating: 0, count: heights[0].count), count: heights.count)
        var finalLog: [[Int]] = Array(repeating: Array(repeating: 0, count: heights[0].count), count: heights.count)
        var results = [[Int]]()
        
        // start from the Pacific Ocean
        for col in 0..<heights[0].count{
            //print(0, col)
            visited[0][col] = true
            dfs(heights, 0, col, &visited, &log, &results)
        }
        
        for row in 0..<heights.count{
            //print(row, 0)
            visited[row][0] = true
            dfs(heights, row, 0, &visited, &log, &results)
        }
        
        // change the visited to default
        print("End all loop")
    
        for i in 0..<heights.count{
            for j in 0..<heights[0].count{
                if log[i][j] == 1{
                    finalLog[i][j] = 1
                }
            }
        }
        
        
        
        //print(finalLog)
        
        visited = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
        log = Array(repeating: Array(repeating: 0, count: heights[0].count), count: heights.count)
        
        // start from the Atlantic Ocean
        for col in 0..<heights[0].count{
            //print(heights.count-1, col)
            visited[heights.count-1][col] = true
            dfs(heights, heights.count-1, col, &visited, &log, &results)
        }
        
        for row in 0..<heights.count{
            //print(row, heights[0].count-1)
            visited[row][heights[0].count-1] = true
            dfs(heights, row, heights[0].count-1, &visited, &log, &results)
        }
        
        
        for i in 0..<heights.count{
            for j in 0..<heights[0].count{
                if log[i][j] == 1{
                    finalLog[i][j] += 1
                    if finalLog[i][j] == 2{
                        results.append([i, j])
                    }
                }
            }
        }
        
        return results
        
    }
    
    func dfs(_ heights: [[Int]],
             _ i: Int, _ j: Int,
             _ visited: inout [[Bool]],
             _ log: inout [[Int]],
             _ results: inout [[Int]]
    ){
        print(i, j)

        // add a log record
        log[i][j] = 1
        visited[i][j] = true
        
        // recur
        for delta in [(-1,0), (1, 0), (0, -1), (0, 1)]{
            let newX = i + delta.0
            let newY = j + delta.1

            // boundary check
            if  newX < 0 || newY < 0 || newX >= heights.count || newY >= heights[0].count {
                continue
            }

            if !visited[newX][newY] && heights[i][j] <= heights[newX][newY]{
                //print(newX, newY)
                dfs(heights, newX, newY, &visited, &log, &results)
            }
            
        }
        
        
    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()

    func test0(){
        let result = solver.pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])
        XCTAssertEqual(result, [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]])
    }
    
}

Test.defaultTestSuite.run()


// [[1, 0], *[3, 0], *[4, 0], *[0, 4], *[1, 4], [3, 4]]
// *[[0, 4], [1, 3], *[1, 4], [2, 2], *[3, 0], [3, 1], *[4, 0]]


// [[1, 0], [3, 0], [4, 0], [4, 2], [3, 2], [2, 2], [3, 1], [3, 3], [3, 4], [0, 4], [1, 4], [1, 3]]
// [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]]
