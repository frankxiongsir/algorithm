/*
 * @lc app=leetcode.cn id=355 lang=swift
 *
 * [355] 设计推特
 */

// @lc code=start

class Twitter {

    struct tweet {
        var usrId : Int
        var tweetId : Int
    }

    /// 用户关注列表
    /// 例如用户1 关注了用户2、3
    /// [1 : [2,3]]
    var followMap = [Int : [Int]]()
    /// 用户推文列表
    /// 例如用户1发送了推文5
    /// [tweet{1 5}]
    var tweets = [tweet]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let newTweet = tweet.init(usrId: userId, tweetId: tweetId)
        tweets.append(newTweet)
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {

        var index = 0;
        var feedUser = [Int]()
        var feeds = [Int]()
        if let followeeIds = followMap[userId] {
            feedUser = followeeIds
        }
        /// 将自己添加进取feed用户列表
        feedUser.append(userId)
        /// 倒序取最新的十条
        for item in tweets.reversed() {
            /// 超过十条
            if index == 10 {
                break;
            }
            
            if feedUser.contains(item.usrId)  {
                feeds.append(item.tweetId)
                index = index + 1
            }
            
        }
        return feeds
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        if let followeeIds = followMap[followerId] {
            var temp = followeeIds
            temp.append(followeeId)
            followMap[followerId] = temp
        } else {
            followMap[followerId] = [followeeId]
        }
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        if let followeeIds = followMap[followerId] {
            var temp = followeeIds
            temp.removeAll(where: { $0 == followeeId})
            followMap[followerId] = temp
        } 
    }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
// @lc code=end

