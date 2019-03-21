//
//  ArticlesViewModel.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import RxCocoa
import PromiseKit
class ArticlesViewModel{
    
    let articlesSubj = BehaviorRelay<[Article]>(value: [Article]())
    let isLoading = BehaviorRelay<Bool>(value: false)
    let msgSubj = BehaviorRelay<String>(value: "")
    
    
    func loadArticles(completion:(()->Void)? = nil) {
        isLoading.accept(true)
        let manger:ApiManager<ArticlesResponse> = ApiManager()
        manger.getRequest(action: .articles).done { (response) in
            self.isLoading.accept(false)
            self.msgSubj.accept("data loaded successfully")

            guard let articles = response.results else {
                return
            }
            self.articlesSubj.accept(articles)
            completion?()
            }.catch { (e) in
                print(e)
                self.msgSubj.accept("fail loading data")
        }
    }
}


