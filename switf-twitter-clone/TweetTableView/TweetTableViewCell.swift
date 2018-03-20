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

    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.masksToBounds = true

        commentButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        shareButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        heartButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        commentButton.setImage(commentButton.image(for: .normal)?.withRenderingMode(.alwaysOriginal), for: .normal)
        shareButton.setImage(shareButton.image(for: .normal)?.withRenderingMode(.alwaysOriginal), for: .normal)
        heartButton.setImage(heartButton.image(for: .normal)?.withRenderingMode(.alwaysOriginal), for: .normal)
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
