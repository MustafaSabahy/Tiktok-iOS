


import Foundation
import UIKit


/// Delegate interface to notify manager events
protocol ExploreManagerDelegate: AnyObject {
    /// Notify a view controller should be pushed
    /// - Parameter vc: The view controller to present
    func pushViewController(_ vc: UIViewController)
    /// Notify a hashtag element was tapped
    /// - Parameter hashtag: The hashtag taht was tapped
    func didTapHashtag(_ hashtag: String)
}



final class ExploreManager{
    
    /// Shared singleton instance
    static let shared = ExploreManager()

    /// Delegate to notify of events
    weak var delegate: ExploreManagerDelegate?

    /// Represents banner action type
    enum BannerAction: String {
        /// Post type
        case post
        /// Hashtag search type
        case hashtag
        /// Creator type
        case user
    }

    // MARK: - Publiuc
    
    public func getExploreBanners () -> [ExploreBannerViewModel]{
        
        guard let exploreData = parseExploreData() else {
            return []

        }
        return exploreData.banners.compactMap({
            ExploreBannerViewModel(image: UIImage(named: $0.image),
                                   title: $0.title){
                //empty
            }
        })
    }
    
    
    
    public func getExploreCreators () -> [ExploreUserViewModel]{
        
        guard let exploreData = parseExploreData() else {
            return []

        }
        return exploreData.creators.compactMap({
            ExploreUserViewModel(
                profilePicture: UIImage(named: $0.image),
                username: $0.username,
                followerCuunt: $0.followers_count
            ){
                //empty
            }
        })
    }

    
    
    public func getExploreHashtags () -> [ExploreHashtagViewModel]{
        
        guard let exploreData = parseExploreData() else {
            return []

        }
        return exploreData.hashtags.compactMap({
            ExploreHashtagViewModel(text: $0.tag, icon: UIImage(systemName: $0.image), count: $0.count){
                //empty
            }
        })
    }
    
    
    public func getExploreTrendingPosts () -> [ExplorePostViewModel]{
        
        guard let exploreData = parseExploreData() else {
            return []

        }
        return exploreData.trendingPosts.compactMap({
            ExplorePostViewModel(thumbnailImage: UIImage(named: $0.image), caption: $0.caption){
                //empty
            }
        })
    }

    
    
    
    public func getExploreRecent () -> [ExplorePostViewModel]{
        
        guard let exploreData = parseExploreData() else {
            return []

        }
        return exploreData.recentPosts.compactMap({
            ExplorePostViewModel(thumbnailImage: UIImage(named: $0.image), caption: $0.caption){
                //empty
            }
        })
    }
    
    
    
    
    public func getExplorePopularPosts () -> [ExplorePostViewModel]{
        
        guard let exploreData = parseExploreData() else {
            return []

        }
        return exploreData.popular.compactMap({
            ExplorePostViewModel(thumbnailImage: UIImage(named: $0.image), caption: $0.caption){
                //empty
            }
        })
    }
    
    
    
    // MARK: - private
    
    private func parseExploreData() -> ExploreResponse? {
        guard let path = Bundle.main.path(forResource: "explore", ofType: "json") else {
            return nil
        }

        do {
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(
                ExploreResponse.self,
                from: data
            )
        } catch {
            print(error)
            return nil
        }
    }
}


struct ExploreResopnse : Codable{
    
    let banners : [Banner]
    let trendingPosts : [Post]
    let creators : [Creator]
    let recentPosts : [Post]
    let hashtags : [Hashtag]
    let popular : [Post]
    let recommended : [Post]


}

