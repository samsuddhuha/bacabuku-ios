//
//  Service.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import Moya
import SwiftyJSON

enum Common: Equatable {
    case getListBook(limit: Int, offset: Int)
    case getDetailBook(id: Int)
}

let commonClosure = { (target: Common) -> Endpoint in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    
    switch target {
    case .getListBook, .getDetailBook:
        return defaultEndpoint.adding(newHTTPHeaderFields: ["X-Dreamfactory-API-Key": "25e0bf00ab2fa7f03a9fa57035139e47ccb28c20658f6de907b8011347e369fb"])
    }
}

let CommonService = MoyaProvider<Common>(endpointClosure: commonClosure)

extension Common: TargetType {
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .getListBook:
            return "book/uptodate"
        case .getDetailBook(let id):
            return "book/detail/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getListBook, .getDetailBook:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        var data = [String:Any]()
        
        switch self {
        case .getListBook(let limit, let offset):
            data["limit"] = limit
            data["offset"] = offset
            return .requestParameters(parameters: data, encoding: URLEncoding.queryString)
            
        case .getDetailBook:
            return .requestParameters(parameters: data, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
