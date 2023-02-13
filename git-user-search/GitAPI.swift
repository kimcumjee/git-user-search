//
//  GitAPI.swift
//  git-user-search
//
//  Created by 한승재 on 2023/02/13.
//

import Foundation
import Moya

enum GitAPI {
    case getUserList(name: String)
}

extension GitAPI : TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .getUserList:
            return "/search/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserList(name: let name):
            let params : [String: String] = [ "q" : name ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUserList(name: let name):
            return nil
        }
    }
    
    
}
