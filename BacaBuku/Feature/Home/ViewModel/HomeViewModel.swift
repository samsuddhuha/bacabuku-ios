//
//  HomeViewModel.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import SwiftyJSON

class HomeViewModel: BaseViewModel {
    
    var successGetListBook: (([BookModel]) -> Void)?
    
    func getListBuku(offset: Int) {
        self.showLoading?(true)
        CommonService.request(Common.getListBook(limit: 10, offset: offset), completion: {result in switch result {
    
        case .success(let response):
            let data = JSON.init(response.data)
            print(data)
            do {
                _ = try response.filterSuccessfulStatusCodes()
                
                let dataMap = try JSONDecoder().decode([BookModel].self, from: data[KEY_RESULT].rawData())
                self.successGetListBook?(dataMap)
            } catch {
                self.showErrorAlert?(error.localizedDescription)
            }
            self.showLoading?(false)
        case .failure(let error):
            self.showErrorAlert?(error.localizedDescription)
            print(error)
            self.showLoading?(false)
        }})
    }

}
