//
//  BaseViewModel.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation

class BaseViewModel: NSObject {
    var showLoading: ((Bool) -> Void)?
    var showErrorAlert: ((String) -> Void)?
}
