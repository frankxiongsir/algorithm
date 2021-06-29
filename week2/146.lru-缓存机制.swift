/*
 * @lc app=leetcode.cn id=146 lang=swift
 *
 * [146] LRU 缓存机制
 */

// @lc code=start

class LRUCache {
    /// 双向链表
    class LinkNode : NSObject {
        /// 存储index
        public var key: Int
        /// 存储value
        public var val: Int
        /// 前置
        public var pre: LinkNode?
        /// 后置
        public var next: LinkNode?
        public init(_ val: Int, key: Int) {
            self.val = val
            self.key = key
            self.pre = nil
            self.next = nil
        }
    
        override init() {
            self.key = 0
            self.val = 0
        }
    }

    private var size : Int
    private var cache : [Int : LinkNode] = [:]
    private var front : LinkNode?
    private var rear : LinkNode?

    init(_ capacity: Int) {
        self.size = capacity
        self.front = LinkNode()
        self.rear = LinkNode()
        self.front?.next = self.rear
        self.rear?.pre = self.front
    }
    
    func get(_ key: Int) -> Int {
        /// 如果当前有此数据，则先删除此node，然后将node插入头部（为了刷新最常用）
        /// 如果没有，返回-1
        if let node = self.cache[key] {
            print(node.key, node.val)
            removeNode(node)
            pushToHead(node)
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        /// 如果当前有此数据，则先删除此node，然后将node插入头部
        /// 如果没有当前数据，将node插入头部
        /// 如果塞入size满了，则需要移除尾部最后一个元素
        var node = LinkNode()
        node.key = key
        node.val = value

        if let nodeT = self.cache[key] {
            /// 此处一定要注意删除老的，插入新的，调试报过错，key相同，value不同case
            removeNode(nodeT)
            pushToHead(node)
        } else {
            
            pushToHead(node)
            print("count: \(self.cache.count)")
            if (self.cache.count > self.size) {
                if let pre = self.rear?.pre  {
                    print("delete")
                    removeNode(pre)
                }
            }
        }
    }

    func removeNode(_ node: LinkNode) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
        self.cache.removeValue(forKey: node.key)
    }

    func pushToHead(_ node: LinkNode) {
        /// node 与 head 的下一个点建立联系
        node.next = self.front?.next
        self.front?.next?.pre = node
        /// node 与 head 之间建立联系
        self.front?.next = node
        node.pre = self.front
        self.cache[node.key] = node
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

