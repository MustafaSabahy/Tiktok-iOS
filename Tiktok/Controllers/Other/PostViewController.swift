//
//  PostViewController.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import UIKit
import AVFoundation


protocol postViewControllerDelegate: AnyObject {
    
    func postViewController (_ vc: PostViewController, didTapCommentButoonFor post : PostModel)
    func postViewController (_ vc: PostViewController, didTapProfileButtoon post : PostModel)


}

class PostViewController: UIViewController {

    weak var delegate : postViewControllerDelegate?
    var model: PostModel

    
    private let likeButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.imageView?.contentMode = .scaleToFill

        button.tintColor = .white
        return button
    }()
    
    private let commentButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "text.bubble.fill"), for: .normal)
        button.imageView?.contentMode = .scaleToFill

        button.tintColor = .white
        return button
    }()
    
    
    private let shareButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.imageView?.contentMode = .scaleToFill

        button.tintColor = .white
        return button
    }()
    
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "test"), for: .normal)
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Check out this video! #fyp #foryou #foryoupage  Check out this video! #fyp #foryou #foryoupage  Check out this video! #fyp #foryou #foryoupage"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    
    var player: AVPlayer?
    private var playerDidFinishObserver: NSObjectProtocol?

    init(model: PostModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder : NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVideo()
        let colors : [UIColor] = [
            .red , .green , .blue , .orange , .black , .white ]
        view.backgroundColor = colors.randomElement()

//        view.addSubview(likeButton)
//        view.addSubview(commentButton)
//        view.addSubview(shareButton)

        setUpButtons()
        setUpDoubleTapToLike()
        view.addSubview(captionLabel)
        view.addSubview(profileButton)
        profileButton.addTarget(self, action: #selector(didTapProfileButtoon), for: .touchUpInside)
    
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size: CGFloat = 40
//        let tabBarHeight: CGFloat = (tabBarController?.tabBar.height ?? 0)
        let yStart: CGFloat = view.height - (size * 4.0) - 30 - view.safeAreaInsets.bottom
        for (index, button ) in [likeButton, commentButton, shareButton].enumerated() {
            button.frame = CGRect(x: view.width-size-10, y: yStart + (CGFloat(index) * 10) + (CGFloat(index) * size), width: size, height: size)
        }
        
        
        captionLabel.sizeToFit()
        let labelSize = captionLabel.sizeThatFits(CGSize(width: view.width - size - 12, height: view.height))
        captionLabel.frame = CGRect(
            x: 5,
            y: view.height - 10 - view.safeAreaInsets.bottom - labelSize.height,
            width: view.width - size - 12,
            height: labelSize.height
        )

        profileButton.frame = CGRect(
            x: likeButton.left,
            y: likeButton.top - 10 - size,
            width: size,
            height: size
        )
        profileButton.layer.cornerRadius = size / 2
        
        
        
    }
    
    
    private func configureVideo (){
        
        guard let path = Bundle.main.path(forResource: "m", ofType: "mp4") else{
            return
        }
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        player?.volume = 0
        player?.play()
        
        
        
        
        
        guard let player = player else {
            return
        }

        playerDidFinishObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        
        
        
        
    }
    
    @objc func didTapProfileButtoon (){
        delegate?.postViewController(self, didTapProfileButtoon: model)
        
    }
    
    func setUpButtons(){
        
        
        view.addSubview(likeButton)
        view.addSubview(commentButton)
        view.addSubview(shareButton)
        
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)


    }
    
    @objc private func didTapLike() {
        model.isLikedByCurrentUser = !model.isLikedByCurrentUser

        likeButton.tintColor = model.isLikedByCurrentUser ? .systemRed : .white
    }

    @objc private func didTapComment() {
       // (parent as? UIPageViewController)?.view?.isUserInteractionEnabled = false
//        let vc = CommentViewController(post: model)
//        addChild(vc)
//        vc.didMove(toParent: self)
//        view.addSubview(vc.view)
//        let frame : CGRect = CGRect(x: 0, y: view.height, width: view.width, height: view.height * 0.76)
//
//        vc.view.frame = frame
//        UIView.animate(withDuration: 0.2){
//            vc.view.frame = CGRect(x: 0, y: self.view.height - frame.height, width: frame.width, height: frame.height)
//        }
        
        
        delegate?.postViewController(self, didTapCommentButoonFor: model)
        
        
        
        
    }

    @objc private func didTapShare() {
        guard let url = URL(string: "https://www.tiktok.com") else {
            return
        }

        let vc = UIActivityViewController(
            activityItems: [url],
            applicationActivities: []
        )
        present(vc, animated: true)
    }
    
    
    func setUpDoubleTapToLike() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    
    @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
        if !model.isLikedByCurrentUser {
            model.isLikedByCurrentUser = true
        }
        HapticsManager.shared.vibrateForSelection()
        let touchPoint = gesture.location(in: view)

        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.tintColor = .systemRed
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.center = touchPoint
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        view.addSubview(imageView)

        UIView.animate(withDuration: 0.2) {
            imageView.alpha = 1
        } completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                    UIView.animate(withDuration: 0.3) {
                        imageView.alpha = 0
                    } completion: { done in
                        if done {
                            imageView.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
    
    
}
