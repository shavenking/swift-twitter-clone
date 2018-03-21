import UIKit

fileprivate func makeTweets(number: Int) -> [Tweet] {
    let names = ["Hugh", "Andy", "Tsai", "孔子"]
    let usernames = ["gymnastneedy", "burysurgery", "cramponsbasalt", "chevroletancestor"]
    let sentences = ["I didn't go to school yesterday.", "Excuse me, but I feel sick.", "Where is she from?", "學而時習之，不亦說乎？有朋自遠方來，不亦樂乎？人不知而不慍，不亦君子乎？", "其為人也孝弟，而好犯上者，鮮矣；不好犯上，而好作亂者，未之有也。君子務本，本立而道生。孝弟也者，其為仁之本與！"]
    let dates = [Date(timeIntervalSince1970: 100), Date(timeIntervalSince1970: 200), Date(timeIntervalSince1970: 300), Date(timeIntervalSince1970: 400)]

    func random<T>(_ source: [T]) -> T {
        return source[Int(arc4random_uniform(UInt32(source.count)))]
    }

    var tweets = [Tweet]()

    for _ in 0..<number {
        tweets.append(
            Tweet(name: random(names), username: random(usernames), content: random(sentences), createdAt: random(dates), updatedAt: random(dates))
        )
    }

    return tweets
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tweets = makeTweets(number: 10)

    private func setupNavigationItem() {
        navigationItem.title = "Home"

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-pencil"), style: .plain, target: self, action: #selector(presentTweetCreateViewController))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "default-profile-avatar")!.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
    }

    private func setupTabBarItem() {
        tabBarItem.title = nil
        tabBarItem.image = UIImage(named: "icon-home")
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setupNavigationItem()
        setupTabBarItem()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupNavigationItem()
        setupTabBarItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: TweetTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TweetTableViewCell.self))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tweets.sort {
            return $0.createdAt > $1.createdAt
        }
    }

    @objc func presentTweetCreateViewController() {
        let tweetCreateViewController = TweetCreateViewController()
        tweetCreateViewController.delegate = self

        present(UINavigationController(rootViewController: tweetCreateViewController), animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TweetTableViewCell.self)) as! TweetTableViewCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
}

extension HomeViewController: TweetCreateDelegate {
    func didAdd(tweet: Tweet) {
        tweets.insert(tweet, at: 0)
        tableView.reloadData()
    }
}
