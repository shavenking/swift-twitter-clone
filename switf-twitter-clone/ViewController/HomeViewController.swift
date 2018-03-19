import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let tweets = [
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie"),
        Tweet(name: "Hugh", content: "hello"),
        Tweet(name: "Andy", content: "wow\nqowiejqowi qowiejqwoie\nqwoiejqw qwoeijqwoiejqwoie qjwoei jqoiwe \noqiwej qowie jqwoiej qowiej qoiwej \nqwopie jqwoie jqwoie jqwoiej qwjeio \noq ijweqoiw jeqiowej qoiwej qoie")
    ]

    private func setupNavigationItem() {
        navigationItem.title = "Home"

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-pencil"), style: .plain, target: nil, action: nil)
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
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TweetTableViewCell.self)) as! TweetTableViewCell
        cell.nameLabel.text = tweets[indexPath.row].name
        cell.tweetLabel.text = tweets[indexPath.row].content
        return cell
    }
}
