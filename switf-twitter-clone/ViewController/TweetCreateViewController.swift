import UIKit

protocol TweetCreateDelegate {
    func didAdd(tweet: Tweet)
}

class TweetCreateViewController: UIViewController {

    var delegate: TweetCreateDelegate?

    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var tweetButton: UIButton!

    @IBOutlet weak var scrollView: UIScrollView!

    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "default-profile-avatar")

        return imageView
    }()

    let textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false

        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        cancelButton.addTarget(self, action: #selector(didTouchUpInsideCancelButton), for: .touchUpInside)

        tweetButton.layer.cornerRadius = tweetButton.frame.height / 2
        tweetButton.layer.masksToBounds = true
        tweetButton.addTarget(self, action: #selector(didTouchUpInsideTweetButton), for: .touchUpInside)

        textView.delegate = self

        scrollView.addSubview(avatarImageView)
        scrollView.addSubview(textView)

        scrollView.contentSize = scrollView.frame.size
        avatarImageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        textView.frame = CGRect(x: 44, y: 0, width: scrollView.contentSize.width - 44, height: scrollView.contentSize.height)
    }

    @objc func didTouchUpInsideCancelButton() {
        dismiss(animated: true)
    }

    @objc func didTouchUpInsideTweetButton() {
        delegate?.didAdd(tweet: Tweet(name: "Hugh", username: "shavenking", content: textView.text.trimmingCharacters(in: .whitespacesAndNewlines)))
        dismiss(animated: true)
    }
}

extension TweetCreateViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        tweetButton.isEnabled = !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        tweetButton.backgroundColor = tweetButton.isEnabled ? #colorLiteral(red: 0.143989861, green: 0.291764468, blue: 0.6212821603, alpha: 1) : #colorLiteral(red: 0.723852694, green: 0.7805123925, blue: 0.8710712194, alpha: 1)
        textView.sizeToFit()
        textView.frame.size.width = scrollView.frame.width - avatarImageView.frame.width
        scrollView.contentSize.height = textView.frame.height
    }
}
