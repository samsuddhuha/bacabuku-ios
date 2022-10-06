//
//  DetailBookViewModel.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import SwiftyJSON

class DetailBookViewModel: BaseViewModel {
    
    var successGetBook: ((DetailBookModel) -> Void)?
    
    func getDetailBook(id: Int) {
        self.showLoading?(true)
        CommonService.request(Common.getDetailBook(id: id), completion: {result in switch result {
    
        case .success(let response):
            let data = JSON.init(response.data)
            print(data)
            do {
                _ = try response.filterSuccessfulStatusCodes()
                
                let dataMap = try JSONDecoder().decode(DetailBookModel.self, from: data[KEY_RESULT].rawData())
                self.successGetBook?(dataMap)
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
