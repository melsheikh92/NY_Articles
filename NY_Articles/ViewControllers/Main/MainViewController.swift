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
    
    let refreshControl:UIRefreshControl = UIRefreshControl()
    
    var viewModel: ArticlesViewModel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCells()
        initResfreshControl()
        bindArticlesTableview()
        bindLoading()
        bindSneakBar()
        viewModel.loadArticles()
        
    }
    
    func registerTableCells(){
        articlesTableview.register(R.nib.articleCell)
    }
    
    func initResfreshControl(){
        
        refreshControl.addTarget(self, action: #selector(refreshViewController), for: .valueChanged)
        self.articlesTableview.refreshControl = self.refreshControl
        
    }
    
    @objc func refreshViewController(){
        self.viewModel.loadArticles()
    }
    
    //handle loading
    func bindLoading(){
        viewModel.isLoading.asObservable().subscribe { (event) in
            guard let isLoad = event.element else {
                return
            }
            if(isLoad){
                self.showLoading()
            }else {
                self.hideLoading()
                if(self.refreshControl.isRefreshing){
                    self.refreshControl.endRefreshing()
                }
            }
            }.disposed(by: disposeBag)
    }
    //inistalize subscription to show msgs to users
    func bindSneakBar(){
        viewModel.msgSubj.asObservable().filter({ (msg) -> Bool in
            return !msg.isEmpty
        }).subscribe { (event) in
            guard let msg = event.element else {
                return
            }
            self.showSneakBar(msg)
            }.disposed(by: disposeBag)
    }
    
    func bindArticlesTableview(){
        let obseravableListOfArticles = viewModel.articlesSubj.asObservable()
        //handling data source
        obseravableListOfArticles.bind(to: self.articlesTableview.rx.items(cellIdentifier: R.nib.articleCell.identifier, cellType: ArticleCell.self)){index, model , cell in
            
            cell.img.moa.url    = model.media?[0].media_metadata?[0].url
            cell.tiitle.text    = model.title
            cell.section.text   = model.section
            cell.datelbl.text   = model.published_date
            cell.subTitle.text  = model.keywords
            
            }.disposed(by: disposeBag)
        
        //handling cell click action
        articlesTableview.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            
            guard let  selectedCellModel =  self?.viewModel.articlesSubj.value[indexPath.row] else{
                return
            }
            self?.viewModel.msgSubj.accept("selected cell has title : " + selectedCellModel.title!)
            
            if let detailsVC = R.storyboard.main.detailsVC(){
                detailsVC.article = self?.viewModel.articlesSubj.value[indexPath.row]
                self?.startController(vc:detailsVC,prsentation: .push)
            }
            
        }).disposed(by: disposeBag)
        
    }
    
}

