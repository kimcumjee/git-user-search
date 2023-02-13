//
//  ViewController.swift
//  git-user-search
//
//  Created by 한승재 on 2023/02/13.
//

import UIKit

final class ViewController: UIViewController {
    private let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.searchUser(name: "vex") 
    }

}

