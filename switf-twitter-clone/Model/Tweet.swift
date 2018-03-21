import Foundation

class Tweet {
    var name: String
    var username: String
    var content: String
    var createdAt: Date
    var updatedAt: Date

    init(name: String, username: String, content: String, createdAt: Date, updatedAt: Date) {
        self.name = name
        self.username = username
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
