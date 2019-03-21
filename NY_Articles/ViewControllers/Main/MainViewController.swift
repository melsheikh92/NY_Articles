//
//  ViewController.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import moa
class MainViewController: BaseViewController {
    
    @IBOutlet weak var articlesTableview: UITableView!
    
    let viewModel :ArticlesViewModel = ArticlesViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        bindLoading()
        bindSneakBar()
        viewModel.loadArticles()
    }
    
    func bindLoading(){
        viewModel.isLoading.asObservable().subscribe { (event) in
            guard let isLoad = event.element else {
                return
            }
            if(isLoad){
                self.showLoading()
            }else {
                self.hideLoading()
            }
        }
    }
    
    func bindSneakBar(){
        viewModel.msgSubj.asObservable().subscribe { (event) in
            guard let msg = event.element else {
                return
            }
           self.showSneakBar(msg)
        }
    }
    
    func initTableView(){
        articlesTableview.register(R.nib.articleCell)
        
        let obseravableListOfArticles = viewModel.articlesSubj.asObservable()
        
        obseravableListOfArticles.bind(to: self.articlesTableview.rx.items(cellIdentifier:  R.nib.articleCell.identifier, cellType: ArticleCell.self)){index, model , cell in
            
            cell.img.moa.url = model.url
            cell.tiitle.text = model.title
            cell.section.text = model.section
            cell.datelbl.text = model.published_date
            cell.subTitle.text = model.keywords
            
        }.disposed(by: disposeBag)
    }
    
}

