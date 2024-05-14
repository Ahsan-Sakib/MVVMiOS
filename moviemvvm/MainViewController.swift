//
//  MainViewController.swift
//  moviemvvm
//
//  Created by BJIT-SAKIB on 9/5/24.
//

import UIKit

class MainViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    let viewModel = MainViewModel()
    var userList:[Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func setupView(){
        self.title = "Main View"
        self.view.backgroundColor = .white
        setupTableView()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self ,let isLoading = isLoading else{
                return
            }

            DispatchQueue.main.async {
                if isLoading{
                    self.loadingIndicator.startAnimating()
                }else{
                    self.loadingIndicator.stopAnimating()
                    self.loadingIndicator.isHidden = true
                }
            }
        }
        
        viewModel.userList.bind {[weak self] userList in
            guard let self = self,let userList = userList else{
                return
            }
            
            self.userList = userList
            self.tableView.reloadData()
        }
    }
}
