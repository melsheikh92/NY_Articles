//
//  AppDelegate.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit
import moa
import SwinjectStoryboard
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        //init error img for all img loading
        Moa.errorImage = R.image.calendar()
        let container: Container = {
            let container = Container()
            container.register(ArticlesViewModel.self) { _ in ArticlesViewModel(manger: ApiManager<ArticlesResponse>())}
            container.storyboardInitCompleted(MainViewController.self) { r, c in
                c.viewModel = r.resolve(ArticlesViewModel.self)
            }
            return container
        }()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
        window.rootViewController = storyboard.instantiateInitialViewController()

        return true
    }
}
