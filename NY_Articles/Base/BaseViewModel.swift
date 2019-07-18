//
//  BaseViewModel.swift
//  NY_Articles
//
//  Created by Mahmoud on 7/18/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    let isLoading = BehaviorRelay<Bool>(value: false)
    let msgSubj = BehaviorRelay<String>(value: "")
}
