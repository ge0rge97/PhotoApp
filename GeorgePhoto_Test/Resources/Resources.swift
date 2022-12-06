//
//  Resources.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

typealias R = Resources

enum Resources {
    //MARK: - TabBar
    enum TabBar {
        
        enum Titles {
            static func setTitle(withTab tab: Tabs) -> String? {
                switch tab {
                case .search:
                    return "Search"
                case .saved:
                    return "Saved"
                }
            }
        }
        
        enum Images {
            static func setIcon(withTab tab: Tabs) -> UIImage? {
                switch tab {
                case .search:
                    return UIImage(systemName: "magnifyingglass")
                case .saved:
                    return UIImage(systemName: "heart")
                }
            }
        }
    }
}
//MARK: - Font
extension Resources {
    //MARK: - Fonts
    enum Fonts {
        
        static func regularFont(withSize size: CGFloat) -> UIFont? {
            return .systemFont(ofSize: size)
        }
        static func boldFont(withSize size: CGFloat) -> UIFont? {
            return .boldSystemFont(ofSize: size)
        }
    }
}
//MARK: - Strings
extension Resources {
    enum Strings {
        
        enum SearchPhotoVC {
            
            static var navigationTitle: String {
                return "Search your photo"
            }
        }
        
        enum SavedPhotoVC {
            
            static var navigationTitle: String {
                return "Saved Photo"
            }
        }
    }
}
//MARK: - Images
extension Resources {
    
    enum Images {
        
        static var savedButtonImage: UIImage? {
            return UIImage(systemName: "heart")
        }
        
        static var removeButtonImage: UIImage? {
            return UIImage(systemName: "trash")
        }
    }
}
//MARK: - Cell Id
extension Resources {
    
    enum CellIds {
        
        static var searchPhotoCollectionViewCell: String {
            return "searchPhotoCollectionViewCell"
        }
        static var savedPhotoCollectionViewCell: String {
            return "savedPhotoCollectionViewCell"
        }
    }
}
//MARK: - API Keys
extension Resources {
    
    enum ApiKeys {
        
        static var unsplashAPIKey: String {
            return "xOSIS57Lxva7bcgZiBLkCj_xVAwqlgaYa0Jpi5MnlaM"
        }
    }
}
