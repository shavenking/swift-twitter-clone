import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweet: Tweet? {
        didSet {
            render(tweet)
        }
    }

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.masksToBounds = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        render(nil)
    }

    private func render(_ tweet: Tweet?) {
        nameLabel.text = tweet?.name
        usernameLabel.text = nil
        tweetLabel.text = tweet?.content

        if let tweet = tweet {
            usernameLabel.text = "@\(tweet.username)"
        }
    }
}
