import UIKit

protocol TweetCreateDelegate {
    func didAdd(tweet: Tweet)
}

class TweetButton: UIButton {
    override var isEnabled: Bool {
        get { return super.isEnabled }
        set {
            super.isEnabled = newValue

            if super.isEnabled {
                super.backgroundColor = #colorLiteral(red: 0.143989861, green: 0.291764468, blue: 0.6212821603, alpha: 1)
            } else {
                super.backgroundColor = #colorLiteral(red: 0.723852694, green: 0.7805123925, blue: 0.8710712194, alpha: 1)
            }
        }
    }
}

class TweetCreateViewController: UIViewController {

    var delegate: TweetCreateDelegate?

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

    let tweetButton = TweetButton(frame: CGRect(x: 0, y: 0, width: 70, height: 34))

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-x"), style: .plain, target: self, action: #selector(didTouchUpInsideCancelButton))

        tweetButton.setTitle("Tweet", for: .normal)
        tweetButton.layer.cornerRadius = tweetButton.frame.height / 2
        tweetButton.layer.masksToBounds = true
        tweetButton.addTarget(self, action: #selector(didTouchUpInsideTweetButton), for: .touchUpInside)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: tweetButton)
        navigationItem.rightBarButtonItem?.isEnabled = false

        textView.delegate = self

        scrollView.addSubview(avatarImageView)
        scrollView.addSubview(textView)

        scrollView.contentSize = scrollView.frame.size
        avatarImageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        textView.frame = CGRect(x: 44, y: 0, width: scrollView.contentSize.width - 44, height: scrollView.contentSize.height)

        textView.font = .preferredFont(forTextStyle: .body)
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
        navigationItem.rightBarButtonItem?.isEnabled = !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        textView.sizeToFit()
        textView.frame.size.width = scrollView.frame.width - avatarImageView.frame.width
        scrollView.contentSize.height = textView.frame.height
    }
}
