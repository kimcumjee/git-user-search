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
import RxCocoa

final class ViewModel {
    var disposeBag = DisposeBag()
        
    private let isLoading = BehaviorRelay<Bool>(value: true)
    private let provider = MoyaProvider<GitAPI>()
    var observableResult = PublishSubject<UserList>()
    
    func searchUser(name: String){
        provider.rx.request(.getUserList(name: name)).subscribe { response in
            switch response {
                    case .success(let result) :
                guard let data = try? result.map(UserList.self) else { return }
                self.observableResult.onNext(data)
                    case .failure(let err):
                        print(err.localizedDescription)
                }
        }.disposed(by: self.disposeBag)
    }
}
