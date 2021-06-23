/*
 * @lc app=leetcode.cn id=641 lang=swift
 *
 * [641] 设计循环双端队列
 */

// @lc code=start

class MyCircularDeque {

    private var array = [Int]()
    private var size : Int
    private var front : Int
    private var rear : Int
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        size = k + 1
        array = Array.init(repeating: 0, count: size)
        front = 0
        rear = 0
    }
        
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if self.isFull() {
            return false
        }
        // 头插，先向前移动 头指针，再插入数据
        front = (front - 1 + size) % size
        array[front] = value
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if self.isFull() {
            return false
        }
        // 尾插，先插入数据，再向后移动尾指针
        array[rear] = value
        rear = (rear + 1) % size
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        // 头指针向前移动
        front = (front + 1) % size
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        rear = (rear - 1 + size) % size
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return array[front]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        return array[(rear - 1 + size) % size]
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return front == rear
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        if front == (rear + 1) % size {
            return true
        }
        return false
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
// @lc code=end

