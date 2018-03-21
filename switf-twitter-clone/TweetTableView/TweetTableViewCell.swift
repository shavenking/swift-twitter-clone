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

        heartButton.addTarget(self, action: #selector(didTouchUpInsideHeartButton), for: .touchUpInside)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        render(nil)
    }

    private func render(_ tweet: Tweet?) {
        guard let tweet = tweet else { return }

        nameLabel.text = tweet.name
        usernameLabel.text = "@\(tweet.username)"
        tweetLabel.text = tweet.content

        commentButton.tintColor = UIColor(red: 0.450936, green: 0.451016, blue: 0.450926, alpha: 1)
        shareButton.tintColor = UIColor(red: 0.450936, green: 0.451016, blue: 0.450926, alpha: 1)
        heartButton.tintColor = !tweet.isLiked ? UIColor(red: 0.450936, green: 0.451016, blue: 0.450926, alpha: 1) : .red
    }

    @objc func didTouchUpInsideHeartButton() {
        heartButton.tintColor = .red
        tweet?.isLiked = true
        tweet?.likes["Hugh"] = true
    }
}
