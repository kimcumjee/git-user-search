//
//  ViewController.swift
//  git-user-search
//
//  Created by 한승재 on 2023/02/13.
//

import UIKit
import RxSwift

final class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.searchUser(name: "vex")
        viewModel.observableResult.subscribe(onNext: { data in
            print("\(data)")
        }).disposed(by: viewModel.disposeBag)
    }
    deinit {
        viewModel.disposeBag = DisposeBag()
    }
}

