//
//  ViewController.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var articlesTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    
    func initTableView(){
        articlesTableview.register(R.nib.articleCell)
        articlesTableview.delegate = self
        articlesTableview.dataSource = self
    }

}

