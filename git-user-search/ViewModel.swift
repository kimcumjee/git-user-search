//
//  ViewModel.swift
//  git-user-search
//
//  Created by 한승재 on 2023/02/13.
//

import Foundation
import Moya
import RxSwift
import RxMoya

final class ViewModel {
    private let provider = MoyaProvider<GitAPI>()
    func searchUser(name: String) {
        provider.rx.request(.getUserList(name: name)).subscribe { response in
            switch response {
                    case .success(let result) :
                guard let data = try? result.map(UserList.self) else { return }
                        print(data)
                    case .failure(let err):
                        print(err.localizedDescription)
                }
        }
    }
}
