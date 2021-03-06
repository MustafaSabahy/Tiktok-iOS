////
////  ExploreViewController.swift
////  Tiktok
////
////  Created by mustafa sabahy on 02/07/2022.
//
//import UIKit
//
//class ExploreViewController: UIViewController {
//
//    private let searchBar: UISearchBar = {
//        let bar = UISearchBar()
//        bar.placeholder = "Search..."
//        bar.layer.cornerRadius = 8
//        bar.layer.masksToBounds = true
//        return bar
//    }()
//
//    private var sections = [ExploreSection]()
//
//    private var collectionView: UICollectionView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        ExploreManager.shared.delegate = self
//        view.backgroundColor = .systemBackground
//        configureModels()
//        setUpSearchBar()
//        setUpCollectionView()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView?.frame = view.bounds
//    }
//
//    func setUpSearchBar() {
//        navigationItem.titleView = searchBar
//        searchBar.delegate = self
//    }
//
//    private func configureModels() {
//        // Banner
//        sections.append(
//            ExploreSection(
//                type: .banners,
//                cells: []
////                    ExploreManager.shared.getExploreBanners().compactMap({
////                    return ExploreCell.banner(viewModel: $0)
////                })
//            )
//        )
//
//        // Trending posts
//        sections.append(
//            ExploreSection(
//                type: .trendingPosts,
//                cells:[
//                    .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//                    })),
//                    .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//                    })),
//                    .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//                    })),
//                    .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//                    })),
//                    .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//                    }))
//                ]
////                    ExploreManager.shared.getExploreTrendingPosts().compactMap({
////                    return ExploreCell.post(viewModel: $0)
////                })
//            )
//        )
//
//        // users
//        sections.append(
//            ExploreSection(
//                type: .users,
//                cells:[
//
//                    .user(viewModel: ExploreUserViewModel(profilePicture: nil, username: "", followerCuunt: 0, handler: {
//
//                    })),
//                    .user(viewModel: ExploreUserViewModel(profilePicture: nil, username: "", followerCuunt: 0, handler: {
//
//                    })),  .user(viewModel: ExploreUserViewModel(profilePicture: nil, username: "", followerCuunt: 0, handler: {
//
//                    })),  .user(viewModel: ExploreUserViewModel(profilePicture: nil, username: "", followerCuunt: 0, handler: {
//
//                    }))
//
//                ]
////                    ExploreManager.shared.getExploreCreators().compactMap({
////                    return ExploreCell.user(viewModel: $0)
////                })
//            )
//        )
//
//        // trending hashtags
//        sections.append(
//            ExploreSection(
//                type: .trendingHashtags,
//                cells: [
//                    .hashtag(viewModel: ExploreHashtagViewModel(text: "hhh", icon: nil, count: 1, handler: {
//
//                    })),
//                    .hashtag(viewModel: ExploreHashtagViewModel(text: "hhh", icon: nil, count: 1, handler: {
//
//                    })),
//                        .hashtag(viewModel: ExploreHashtagViewModel(text: "hhh", icon: nil, count: 1, handler: {
//
//                    }))
//                ]
////                    ExploreManager.shared.getExploreHashtags().compactMap({
////                    ExploreCell.hashtag(viewModel: $0)
////                })
//            )
//        )
//
//        // Popular
//        sections.append(
//            ExploreSection(
//                type: .popular,
//                cells: []
////                    ExploreManager.shared.getExplorePopularPosts().compactMap({
////                    return ExploreCell.post(viewModel: $0)
////                })
//            )
//        )
//
//        // new/recent
//        sections.append(
//            ExploreSection(
//                type: .new,
//                cells: []
////                    ExploreManager.shared.getExploreRecentPosts().compactMap({
////                    return ExploreCell.post(viewModel: $0)
////                })
//            )
//        )
//    }
//
//    func setUpCollectionView() {
//        let layout = UICollectionViewCompositionalLayout { section, _ -> NSCollectionLayoutSection? in
//            return self.layout(for: section)
//        }
//
//        let collectionView = UICollectionView(
//            frame: .zero,
//            collectionViewLayout: layout
//        )
//
//        collectionView.register(
//            UICollectionViewCell.self,
//            forCellWithReuseIdentifier: "cell"
//        )
//        collectionView.register(
//            ExploreBannerCollectionViewCell.self,
//            forCellWithReuseIdentifier: ExploreBannerCollectionViewCell.identifier
//        )
//        collectionView.register(
//            ExplorePostCollectionViewCell.self,
//            forCellWithReuseIdentifier: ExplorePostCollectionViewCell.identifier
//        )
//        collectionView.register(
//            ExploreUserCollectionViewCell.self,
//            forCellWithReuseIdentifier: ExploreUserCollectionViewCell.identifier
//        )
//        collectionView.register(
//            ExploreHashtagCollectionViewCell.self,
//            forCellWithReuseIdentifier: ExploreHashtagCollectionViewCell.identifier
//        )
//
//        collectionView.backgroundColor = .systemBackground
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
//
//        self.collectionView = collectionView
//    }
//}
//
//
//// MARK: - ExploreCollectionView
//extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return sections[section].cells.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let model = sections[indexPath.section].cells[indexPath.row]
//
//        switch model {
//        case .banner(let viewModel):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: ExploreBannerCollectionViewCell.identifier,
//                for: indexPath
//            ) as? ExploreBannerCollectionViewCell else {
//                return collectionView.dequeueReusableCell(
//                    withReuseIdentifier: "cell",
//                    for: indexPath
//                )
//            }
//            cell.configure(with: viewModel)
//            return cell
//        case .post(let viewModel):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: ExplorePostCollectionViewCell.identifier,
//                for: indexPath
//            ) as? ExplorePostCollectionViewCell else {
//                return collectionView.dequeueReusableCell(
//                    withReuseIdentifier: "cell",
//                    for: indexPath
//                )
//            }
//            cell.configure(with: viewModel)
//            return cell
//        case .hashtag(let viewModel):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: ExploreHashtagCollectionViewCell.identifier,
//                for: indexPath
//            ) as? ExploreHashtagCollectionViewCell else {
//                return collectionView.dequeueReusableCell(
//                    withReuseIdentifier: "cell",
//                    for: indexPath
//                )
//            }
//            cell.configure(with: viewModel)
//            return cell
//        case .user(let viewModel):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: ExploreUserCollectionViewCell.identifier,
//                for: indexPath
//            ) as? ExploreUserCollectionViewCell else {
//                return collectionView.dequeueReusableCell(
//                    withReuseIdentifier: "cell",
//                    for: indexPath
//                )
//            }
//            cell.configure(with: viewModel)
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        HapticsManager.shared.vibrateForSelection()
//        let model = sections[indexPath.section].cells[indexPath.row]
//
//        switch model {
//        case .banner(let viewModel):
//            viewModel.handler()
//        case .post(let viewModel):
//            viewModel.handler()
//        case .hashtag(let viewModel):
//            viewModel.handler()
//        case .user(let viewModel):
//            viewModel.handler()
//        }
//    }
//}
//
//extension ExploreViewController: UISearchBarDelegate {
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))
//    }
//
//    @objc func didTapCancel() {
//        navigationItem.rightBarButtonItem = nil
//        searchBar.text = nil
//        searchBar.resignFirstResponder()
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        navigationItem.rightBarButtonItem = nil
//        searchBar.resignFirstResponder()
//    }
//}
//
//// MARK: - Section Layouts
//
//extension ExploreViewController {
//    func layout(for section: Int) -> NSCollectionLayoutSection {
//        let sectionType = sections[section].type
//
//        switch sectionType {
//        case .banners:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .fractionalHeight(1)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//
//            // Group
//            let group = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(0.9),
//                    heightDimension: .absolute(200)
//                ),
//                subitems: [item]
//            )
//
//            // Section layout
//            let sectionLayout = NSCollectionLayoutSection(group: group)
//            sectionLayout.orthogonalScrollingBehavior = .groupPaging
//            // Return
//            return sectionLayout
//        case .users:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .fractionalHeight(1)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//
//            // Group
//            let group = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(150),
//                    heightDimension: .absolute(200)
//                ),
//                subitems: [item]
//            )
//
//            // Section layout
//            let sectionLayout = NSCollectionLayoutSection(group: group)
//            sectionLayout.orthogonalScrollingBehavior = .continuous
//            // Return
//            return sectionLayout
//
//        case .trendingHashtags:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .fractionalHeight(1)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//
//            // Group
//            let verticalGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .absolute(60)
//                ),
//                subitems: [item]
//            )
//
//            // Section layout
//            let sectionLayout = NSCollectionLayoutSection(group: verticalGroup)
//
//            // Return
//            return sectionLayout
//
//        case .trendingPosts, .new, .recommended:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .fractionalHeight(1)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//
//            // Group
//            let verticalGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(100),
//                    heightDimension: .absolute(300)
//                ),
//                subitem: item,
//                count: 2
//            )
//
//            let group = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(110),
//                    heightDimension: .absolute(300)
//                ),
//                subitems: [verticalGroup]
//            )
//
//            // Section layout
//            let sectionLayout = NSCollectionLayoutSection(group: group)
//            sectionLayout.orthogonalScrollingBehavior = .continuous
//            // Return
//            return sectionLayout
//
//        case .popular:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .fractionalHeight(1)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//
//            let group = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(110),
//                    heightDimension: .absolute(200)
//                ),
//                subitems: [item]
//            )
//
//            // Section layout
//            let sectionLayout = NSCollectionLayoutSection(group: group)
//            sectionLayout.orthogonalScrollingBehavior = .continuous
//            // Return
//            return sectionLayout
//        }
//    }
//}
//
//extension ExploreViewController: ExploreManagerDelegate {
//    func pushViewController(_ vc: UIViewController) {
//        HapticsManager.shared.vibrateForSelection()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    func didTapHashtag(_ hashtag: String) {
//        HapticsManager.shared.vibrateForSelection()
//        searchBar.text = hashtag
//        searchBar.becomeFirstResponder()
//    }
//}







 //MARK: - Update



import Foundation
import UIKit



//
//enum ExploreSectionType {
//
//    case banners
//    case trendingPosts
//    case users
//    case trendingHashtags
//    case recommended
//    case popular
//    case new
//
//    var title : String{
//        switch self {
//        case .banners:
//            return "Featured"
//        case .trendingPosts:
//            return "Trending Videos"
//        case .trendingHashtags:
//           return "Hashtags"
//        case .recommended:
//            return "Recommended"
//        case .popular:
//            return "Popular"
//        case .new:
//            return "Recently Posted"
//
//        case .users:
//            return "Popular Creators"
//        }
//    }
//
//}

//enum ExploreCell {
//
//
//    case banner(viewModel: String)
//    case post(viewModel: String)
//    case hashtag(viewModel: String)
//    case user(viewModel: String)
//}


//struct ExploreSection {
//    let typ: ExploreSectionType
//    let cells: [ExploreCell]
//}
class ExploreViewController: UIViewController {

    
    
    private let searchBar :UISearchBar = {
       let bar = UISearchBar()
     bar.placeholder = "Search..."
     bar.layer.cornerRadius = 8
     bar.layer.masksToBounds = true
        return bar
    }()
    
  private var sections = [ExploreSection]()
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      ExploreManager.shared.delegate = self
        view.backgroundColor = .systemBackground
        configureModels()
        setUpSearchBar()
        setUpCollectionView()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    func setUpSearchBar(){
        
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
    }
    
    func configureModels(){
//        var cells = [ExploreCell]()
//        for _ in 0...1000{
//            let cell = ExploreCell.banner(viewModel: ExploreBannerViewModel(image: nil, title: "Foo", handler: {
//
//            }))
//            cells.append(cell)
//        }



        // banner
        sections.append(ExploreSection(type: .banners, cells: ExploreManager.shared.getExploreBanners().compactMap({
            return ExploreCell.banner(viewModel: $0)
        })
                                      )
          )
        
        
        
        
//        var posts = [ExploreCell]()
//        for _ in 0...6 {
//            posts.append(ExploreCell.post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//            })))
//        }
        // Trending posts
        sections.append(ExploreSection(type: .trendingPosts, cells: ExploreManager.shared.getExploreTrendingPosts().compactMap({
            return ExploreCell.post(viewModel: $0)
        })))
        
        
        
        // user
        sections.append(ExploreSection(type: .users, cells: ExploreManager.shared.getExploreCreators().compactMap({
            return ExploreCell.user(viewModel: $0)
        })))
        
        
        
        // trending hashtag
        sections.append(ExploreSection(type: .trendingHashtags, cells:
                                        
                                        ExploreManager.shared.getExploreHashtags().compactMap({
            ExploreCell.hashtag(viewModel: $0)
        })
          
                                      ))
        
        
        
        // recommended
//        sections.append(ExploreSection(type: .recommended, cells:
//                                        ExploreManager.shared.getExplorePopularPosts().compactMap({
//                                            return ExploreCell.post(viewModel: $0)
//                                        })
//  ))
        
        
        
        // popular
        sections.append(ExploreSection(type: .popular, cells:
                                        ExploreManager.shared.getExplorePopularPosts().compactMap({
                                            return ExploreCell.post(viewModel: $0)
                                        })                           ))
        
        
        // new
        sections.append(ExploreSection(type: .new, cells:  ExploreManager.shared.getExploreRecent().compactMap({
            return ExploreCell.post(viewModel: $0)
        })

                                        
//                                        [
//
//            .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//            })),
//            .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//            })),
//            .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//            })),
//            .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//            })),
//            .post(viewModel: ExplorePostViewModel(thumbnailImage: nil, caption: "", handler: {
//
//            }))
//
//        ]
                                      
                                      
                                      ))
    }

    
    func setUpCollectionView(){
        
        let layout = UICollectionViewCompositionalLayout {section, _ -> NSCollectionLayoutSection? in
            return self.layout(for: section)
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.register(
            ExploreBannerCollectionViewCell.self,
            forCellWithReuseIdentifier: ExploreBannerCollectionViewCell.identifier
        )
        collectionView.register(
            ExplorePostCollectionViewCell.self,
            forCellWithReuseIdentifier: ExplorePostCollectionViewCell.identifier
        )
        collectionView.register(
            ExploreUserCollectionViewCell.self,
            forCellWithReuseIdentifier: ExploreUserCollectionViewCell.identifier
        )
        collectionView.register(
            ExploreHashtagCollectionViewCell.self,
            forCellWithReuseIdentifier: ExploreHashtagCollectionViewCell.identifier
        )
        
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
   //     collectionView.backgroundColor = .red
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }

}




extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = sections[indexPath.section].cells[indexPath.row]

        switch model {
        case .banner(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExploreBannerCollectionViewCell.identifier,
                for: indexPath
            ) as? ExploreBannerCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        case .post(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExplorePostCollectionViewCell.identifier,
                for: indexPath
            ) as? ExplorePostCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        case .hashtag(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExploreHashtagCollectionViewCell.identifier,
                for: indexPath
            ) as? ExploreHashtagCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        case .user(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExploreUserCollectionViewCell.identifier,
                for: indexPath
            ) as? ExploreUserCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        HapticsManager.shared.vibrateForSelection()
        let model = sections[indexPath.section].cells[indexPath.row]

        switch model {
        case .banner(let viewModel):
            viewModel.handler()
        case .post(let viewModel):
            viewModel.handler()
        case .hashtag(let viewModel):
            viewModel.handler()
        case .user(let viewModel):
            viewModel.handler()
        }
    }
}





extension ExploreViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))
    }

    @objc func didTapCancel() {
        navigationItem.rightBarButtonItem = nil
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem = nil
        searchBar.resignFirstResponder()
    }
}






// MARk: - layout func


extension ExploreViewController {
    
    func layout(for section : Int) -> NSCollectionLayoutSection{
     //   let sectionType = sections[section].type
        let sectionType = sections[section].type
        switch sectionType {
            
        case .banners:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )

            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            // Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.9),
                    heightDimension: .absolute(200)
                ),
                subitems: [item]
            )

            // Section layout
            let sectionLayout = NSCollectionLayoutSection(group: group)
            sectionLayout.orthogonalScrollingBehavior = .groupPaging
            // Return
            return sectionLayout
        case .users:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )

            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            // Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(150),
                    heightDimension: .absolute(200)
                ),
                subitems: [item]
            )

            // Section layout
            let sectionLayout = NSCollectionLayoutSection(group: group)
            sectionLayout.orthogonalScrollingBehavior = .continuous
            // Return
            return sectionLayout

        case .trendingHashtags:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )

            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            // Group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(60)
                ),
                subitems: [item]
            )

            // Section layout
            let sectionLayout = NSCollectionLayoutSection(group: verticalGroup)

            // Return
            return sectionLayout

        case .trendingPosts, .new, .recommended:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )

            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            // Group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(100),
                    heightDimension: .absolute(300)
                ),
                subitem: item,
                count: 2
            )

            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(110),
                    heightDimension: .absolute(300)
                ),
                subitems: [verticalGroup]
            )

            // Section layout
            let sectionLayout = NSCollectionLayoutSection(group: group)
            sectionLayout.orthogonalScrollingBehavior = .continuous
            // Return
            return sectionLayout

        case .popular:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )

            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(110),
                    heightDimension: .absolute(200)
                ),
                subitems: [item]
            )

            // Section layout
            let sectionLayout = NSCollectionLayoutSection(group: group)
            sectionLayout.orthogonalScrollingBehavior = .continuous
            // Return
            return sectionLayout
            
            
            
            
        }

    }
    
}


extension ExploreViewController: ExploreManagerDelegate {
    func pushViewController(_ vc: UIViewController) {
        HapticsManager.shared.vibrateForSelection()
        navigationController?.pushViewController(vc, animated: true)
    }

    func didTapHashtag(_ hashtag: String) {
        HapticsManager.shared.vibrateForSelection()
        searchBar.text = hashtag
        searchBar.becomeFirstResponder()
    }
}
