/*
 * @lc app=leetcode.cn id=811 lang=swift
 *
 * [811] 子域名访问计数
 */

// @lc code=start
class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {

        var mapDomain = [String : Int]()

        for item in cpdomains {
            ///  分解count 与 domains
            let subFront = item.split(separator: " ")
            let front = subFront.compactMap { "\($0)" }

            /// domains分解为子域名
            let domainsT = front[1] 
            let t = domainsT.split(separator: ".")
            let domains: [String] = t.compactMap { "\($0)" }
            print(domains)

            let count = Int(front[0])!
            print(count)
            var cur = ""
            /// 子域名组装，key 为域名，value 为域名计数
            for index in (0..<domains.count).reversed() {
                cur = domains[index] + (index < domains.count-1 ? "." : "") + cur
                print(cur)
                if let value = mapDomain[cur] {
                    mapDomain[cur] = value + count
                } else {
                    mapDomain[cur] = count
                }
            }
                     
        }
        print(mapDomain)
        var ans = [String]()
        /// 组装输出结果
        for (key, value) in mapDomain {
            var r = String(value)
            r.append(" \(key)")
            ans.append(r)
        }
        return ans
    }
}
// @lc code=end

