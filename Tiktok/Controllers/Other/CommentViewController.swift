//
//  CommentViewController.swift
//  Tiktok
//
//  Created by mustafa sabahy on 03/07/2022.
//
//
//import UIKit
//
//
//protocol CommentsViewControllerDelegate: AnyObject{
//    func didTapCloseForComments(with viewController: CommentViewController)
//}
//
//class CommentViewController: UIViewController {
//
//
//    private let post: PostModel
//
//
//    weak var delegate : CommentsViewControllerDelegate?
//    private var comments = [PostComment]()
//
//
//    private let closeButton : UIButton = {
//
//        let button = UIButton()
//        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
//        return button
//    }()
//
//    private let tableView : UITableView = {
//       let tableview = UITableView()
////        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableview.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
//        return tableview
//    }()
//
//
//
//
//
//    init(post : PostModel){
//
//        self.post = post
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(closeButton)
//        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
//        view.backgroundColor = .white
//        fetchPostComment()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        closeButton.frame = CGRect(x: view.width - 45, y: 10, width: 35, height: 35)
//        tableView.frame = CGRect(x: 0,
//                                 y: closeButton.bottom,
//                                 width: view.width,
//                                 height: view.width - closeButton.bottom)
//
//    }
//
//    @objc private func didTapClose(){
//        delegate?.didTapCloseForComments(with: self)
//    }
//
//    func fetchPostComment(){
//
//        self.comments = PostComment.mockComments()
//    }
//
//}
//
//
//extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return comments.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let comment = comments[indexPath.row]
////2        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        guard let cell  = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else {
//            return UITableViewCell()
//        }
//
//  //2      cell.textLabel?.text = comment.text
//        cell.configure(with: comment)
//
//
//
////1        cell.textLabel?.text = "this is a great post!"
//        return cell
//    }
//
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//      return 80
// }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}





import UIKit

protocol CommentsViewControllerDelegate: AnyObject {
    func didTapCloseForComments(with viewController: CommentsViewController)
}

class CommentsViewController: UIViewController {
    private let post: PostModel

    weak var delegate: CommentsViewControllerDelegate?

    private var comments = [PostComment]()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.register(
            CommentTableViewCell.self,
            forCellReuseIdentifier: CommentTableViewCell.identifier
        )
        return tableView
    }()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .label
        return button
    }()

    init(post: PostModel) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        view.backgroundColor = .secondarySystemBackground
        fetchPostComments()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        closeButton.frame = CGRect(x: view.width - 45, y: 10, width: 35, height: 35)
        tableView.frame = CGRect(x: 0,
                                 y: closeButton.bottom,
                                 width: view.width,
                                 height: view.width - closeButton.bottom)
    }

    @objc private func didTapClose() {
        delegate?.didTapCloseForComments(with: self)
    }

    func fetchPostComments() {
//        DatabaseManager.shared.fetchCOment
        self.comments = PostComment.mockComments()
    }
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CommentTableViewCell.identifier,
            for: indexPath
        ) as? CommentTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: comment)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
