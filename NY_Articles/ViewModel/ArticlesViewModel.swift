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
class ArticlesViewModel: BaseViewModel {
    
    let articlesSubj = BehaviorRelay<[Article]>(value: [Article]())
    let manger: ApiManager<ArticlesResponse>
    
    init(manger: ApiManager<ArticlesResponse>) {
        self.manger = manger
    }
   
    func loadArticles(completion:(()->Void)? = nil) {
        isLoading.accept(true)
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
                self.isLoading.accept(false)
        }
    }
}


