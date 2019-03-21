//
//  DetailVC.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit
import moa
class DetailVC : BaseViewController {
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    var article:Article?
    
    override func viewDidLoad() {
        showLoading()
    }
    override func viewDidAppear(_ animated: Bool) {
        loadDataFromModel()
    }
    
    func  loadDataFromModel(){
        guard let article = self.article else{
            return
        }
        self.img.moa.url = article.media?[0].media_metadata?[0].url
        self.lbl.text = article.title
        loadfromURL(article.url)
        
    }
    
    func loadfromURL(_ mUrl :String?){
        guard let stringUrl = mUrl ,let  url = URL(string: stringUrl) else{
            return
        }
        
        if let htmlTxt = try? String(contentsOf: url, encoding: .utf8){
            self.detailTxt.attributedText = htmlTxt.html2AttributedString
            hideLoading()
        }
    }
}
