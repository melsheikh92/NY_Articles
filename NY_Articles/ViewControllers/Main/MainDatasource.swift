//
//  MainDatasource.swift
//  NY_Articles
//
//  Created by msheikh on 3/20/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: CGRect())
    }
    
    
}
