//
//  ViewController.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

     let horizantalScrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.bounces = false
//        scrollView.backgroundColor = .red
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    
    }()
    
    let forYouPageViewController  = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: [:])
    
    
    let followingPageViewController  = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: [:])
    
    private var forYouPosts = PostModel.mockModels()
    private var followingPosts = PostModel.mockModels()
    
    
    let control : UISegmentedControl = {
        
        let titles = ["Following", "For You"]
        let control = UISegmentedControl(items: titles)
        control.selectedSegmentIndex = 1
        control.backgroundColor = nil
        control.selectedSegmentTintColor = .white
        return control
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(horizantalScrollView)
        setUpFeed()
        horizantalScrollView.delegate = self
        horizantalScrollView.contentOffset = CGPoint(x: view.width, y: 0)
        setUpHeaderButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        horizantalScrollView.frame = view.bounds
    }

    
    
    func setUpHeaderButton (){
        control.addTarget(self, action: #selector(didchangeSegmentControl(_:)), for: .valueChanged)
        navigationItem.titleView = control
    }
    
    @objc private func didchangeSegmentControl(_ sender: UISegmentedControl){
        horizantalScrollView.setContentOffset((CGPoint(x: view.width * CGFloat(sender.selectedSegmentIndex), y: 0)), animated: true)
    }
    
    
    private func setUpFeed (){
        
        horizantalScrollView.contentSize = CGSize(width: view.width * 2, height: view.height)
    
 setUpFollowingFeed()
        setUpForYouFeed()
    }
    
    
    func setUpFollowingFeed(){
     
        
//        let vc = UIViewController ()
//        vc.view.backgroundColor = .blue
        
        
        guard let model = followingPosts.first else
        {
            return
        }
        
        let vc = PostViewController(model: model)
        vc.delegate = self
        followingPageViewController.setViewControllers([vc],
                                                       direction: .forward,
                                                       animated: false,
                                                       completion: nil)

        followingPageViewController.dataSource = self
        
        
        horizantalScrollView.addSubview((followingPageViewController.view))
        followingPageViewController.view.frame = CGRect(x: 0,
                                             y: 0
                                             , width: horizantalScrollView.width
                                             , height: horizantalScrollView.height)
        addChild(followingPageViewController)
        followingPageViewController.didMove(toParent: self)
    }
    
    
    func setUpForYouFeed(){
     
        
//        let vc = UIViewController ()
//        vc.view.backgroundColor = .blue
//
        
        guard let model = forYouPosts.first else
        {
            return
        }
        let vc = PostViewController(model: model)
        vc.delegate = self
        
        forYouPageViewController.setViewControllers([vc],
                                                    direction: .forward,
                                                    animated: false,
                                                    completion: nil)

        forYouPageViewController.dataSource = self
        
        
        horizantalScrollView.addSubview((forYouPageViewController.view))
        forYouPageViewController.view.frame = CGRect(x: view.width,
                                             y: 0
                                             , width: horizantalScrollView.width
                                             , height: horizantalScrollView.height)

        addChild(forYouPageViewController)
        forYouPageViewController.didMove(toParent: self)
    }
    
}

extension HomeViewController : UIPageViewControllerDataSource {
     
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let fromPost = (viewController as?  PostViewController)?.model else {
            return nil
        }
        
        guard let index = currentPosts.firstIndex(where: {
            $0.identifier == fromPost.identifier
        }) else {return nil }
        
        
        if index == 0 {
            return nil
        }
        let priorIndex = index - 1
        let model = currentPosts[priorIndex]
        let vc = PostViewController(model: model)
        vc.delegate = self
        return vc
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        let vc = UIViewController()
//        vc.view?.backgroundColor = [UIColor.red,UIColor.gray,UIColor.green].randomElement()
//        return vc
        
        guard let fromPost = (viewController as?  PostViewController)?.model else {
            return nil
        }
        
        guard let index = currentPosts.firstIndex(where: {
            $0.identifier == fromPost.identifier
        }) else {return nil }
        
        
//        if index == 0 {
//            return nil
//        }
         
        guard index < (currentPosts.count - 1) else {
            return nil
        }
//        let priorIndex = index - 1
//        let model = currentPosts[priorIndex]
          let nextIndex = index + 1
        let model = currentPosts[nextIndex]
        let vc = PostViewController(model: model)
//          gate = self
        vc.delegate = self
        return vc
        
        
    }
    
    
    
    var currentPosts : [PostModel]{
        if horizantalScrollView.contentOffset.x == 0 {
        //following
            return followingPosts
        }
        //foryou
        return forYouPosts
    }
    
}

extension HomeViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 || scrollView.contentOffset.x <= (view.width/2){
            control.selectedSegmentIndex = 0
        } else if scrollView.contentOffset.x > (view.width/2){
            control.selectedSegmentIndex = 1
        }
    }
    
}

extension HomeViewController : postViewControllerDelegate{
    func postViewController(_ vc: PostViewController, didTapCommentButoonFor post: PostModel) {
        
     
             horizantalScrollView.isScrollEnabled = false
            if horizantalScrollView.contentOffset.x == 0 {
                followingPageViewController.dataSource = nil
            } else {
                forYouPageViewController.dataSource = nil
            }
            let vc = CommentsViewController(post: post)
        vc.delegate = self
        addChild(vc)
            vc.didMove(toParent: self)
            view.addSubview(vc.view)
            let frame : CGRect = CGRect(x: 0, y: view.height, width: view.width, height: view.height * 0.76)
            
            vc.view.frame = frame
            UIView.animate(withDuration: 0.2){
                vc.view.frame = CGRect(x: 0, y: self.view.height - frame.height, width: frame.width, height: frame.height)
            }
        
    }
    
    
    func postViewController(_ vc: PostViewController, didTapProfileButtoon post: PostModel) {
           
        let user = post.user
        let vc = ProfileViewController(user: user)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: CommentsViewControllerDelegate {
    func didTapCloseForComments(with viewController: CommentsViewController) {
        // close comments with animation
        let frame = viewController.view.frame
        UIView.animate(withDuration: 0.2) {
            viewController.view.frame = CGRect(x: 0, y: self.view.height, width: frame.width, height: frame.height)
        } completion: { [weak self] done in
            if done {
                DispatchQueue.main.async {
                    // remove comment vc as child
                    viewController.view.removeFromSuperview()
                    viewController.removeFromParent()
                    // allow horizontal and vertical scroll
                    self?.horizantalScrollView.isScrollEnabled = true
                    self?.forYouPageViewController.dataSource = self
                    self?.followingPageViewController.dataSource = self
                }
            }
        }
    }
}

