//
//  BaseTabBarController.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

//MARK: - TabBar Tabs
enum Tabs: Int, CaseIterable {
    case search
    case saved
}

final class BaseTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureAppearance()
        selectTab(withTab: .search)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Methods
extension BaseTabBarController {
    private func configureAppearance() {
        tabBar.backgroundColor          = .white
        tabBar.unselectedItemTintColor  = .black
        tabBar.tintColor                = .blue
        
        let controllers: [UINavigationController] = Tabs.allCases.map { tab in
            let controller          = UINavigationController(rootViewController: getControllers(forTab: tab))
            controller.tabBarItem   = UITabBarItem(title: R.TabBar.Titles.setTitle(withTab: tab),
                                                   image: R.TabBar.Images.setIcon(withTab: tab),
                                                   tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    
    private func getControllers(forTab tab: Tabs) -> UIViewController {
        switch tab {
        case .search:
            return SearchPhotoViewController()
        case .saved:
            return SavedPhotoViewController()
        }
    }
    
    private func selectTab(withTab tab: Tabs) {
        selectedIndex = tab.rawValue
    }
}
