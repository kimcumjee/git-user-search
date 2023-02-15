//
//  ViewController.swift
//  git-user-search
//
//  Created by 한승재 on 2023/02/13.
//

import UIKit
import RxSwift
import Then
import SnapKit

final class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    private lazy var searchTableView = UITableView().then { view in
        
    }
    
    private lazy var searchTextField = UITextField().then { view in
        view.attributedPlaceholder? = NSAttributedString(string: "유저 네임을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViews()
        viewModel.searchUser(name: "vex")
        viewModel.observableResult.subscribe(onNext: { data in
            print("\(data)")
        }).disposed(by: viewModel.disposeBag)
    }
    
    private func setViews() {
        self.view.addSubview(searchTableView)
        self.view.addSubview(searchTextField)
        self.searchTextField.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(12)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
            $0.width.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.greaterThanOrEqualTo(64)
        }
        self.searchTableView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.top.equalTo(self.searchTextField.snp.bottom).offset(12)
        }
    }
    
    deinit {
        viewModel.disposeBag = DisposeBag()
    }
}
