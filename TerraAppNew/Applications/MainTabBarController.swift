//
//  MainTabBarController.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 28.07.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupViews()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .specialBlue
        tabBar.unselectedItemTintColor = .specialDarkGray
        
        tabBar.layer.borderColor = UIColor.specialGray.cgColor
        tabBar.layer.borderWidth = 1
    }
    
    private func setupViews() {
        
//        let newsVC = UINavigationController(rootViewController:NewsViewController())
//        let serviceVC = UINavigationController(rootViewController: CoursesViewController())
//        let calendarVC = UINavigationController(rootViewController: CalendarViewController())
//        let profileVC = UINavigationController(rootViewController: ProfileViewController())
//        let aboutVC = UINavigationController(rootViewController:AboutTerraViewController())
        let newsVC = NewsViewController()
        let serviceVC = CoursesViewController()
        let calendarVC = CalendarViewController()
        let profileVC = ProfileViewController()
        let aboutVC = AboutTerraViewController()
        
        setViewControllers( [newsVC,
                            serviceVC,
                            calendarVC,
                            profileVC,
                            aboutVC],
                            animated: true)
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(named: "NewsTB")
        items[1].image = UIImage(named: "ServiceTB")
        items[2].image = UIImage(named: "CalendarTB")
        items[3].image = UIImage(named: "ProfileTB")
        items[4].image = UIImage(named: "AboutTB")
        
        items[0].title = "Новости"
        items[1].title = "Сервисы"
        items[2].title = "Календарь"
        items[3].title = "Профиль"
        items[4].title = "Terra"
    }
}
