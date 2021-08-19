/*
 * @lc app=leetcode.cn id=1091 lang=swift
 *
 * [1091] 二进制矩阵中的最短路径
 */

// @lc code=start
class Solution {
  //!   左下，左，左上，上，右上，右，右下，下
  let dxArr = [-1, -1, -1, 0, 1, 1, 1, 0]
  let dyArr = [-1, 0, 1, -1, 1, 0, -1, 1]

  func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    let n = grid.count
    var q = [[0, 0, 1]]
    var grid = grid
    //! 左上和右下 都是1，则无法走
    if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 {
      return -1
    }
    //! 左上右下都可以走的时候，直接斜角过去
    if n <= 2 {
      return n
    }

    func isVilid(_ x: Int, _ y: Int) -> Bool {
      if x >= 0, x < n, y >= 0, y < n, grid[x][y] != 1 {
        return true
      } else {
        return false
      }
    }

    while !q.isEmpty {
      let array = q.removeFirst()
      let i = array[0]
      let j = array[1]
      let d = array[2]

      for (dx, dy) in zip(dxArr, dyArr) {
        let x = i + dx
        let y = j + dy
        if isVilid(x, y) {
          if x == y, x == n - 1 {
            return d + 1
          }
          q.append([x, y, d + 1])
          //! 标记当前不可走
          grid[x][y] = 1
        }
      }
    }
    return -1
  }
}

// @lc code=end
