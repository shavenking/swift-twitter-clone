import Foundation

class Tweet {
    var name: String
    var username: String
    var content: String
    var createdAt: Date
    var updatedAt: Date
    var likes: [String: Bool]
    var isLiked: Bool

    init(name: String, username: String, content: String, createdAt: Date, updatedAt: Date, likes: [String: Bool], isLiked: Bool) {
        self.name = name
        self.username = username
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.likes = likes
        self.isLiked = isLiked
    }
}
