//
//  String+html.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation

extension String {
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = data(using: .utf8)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [ .documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
