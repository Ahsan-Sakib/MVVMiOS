//
//  MainViewController+TableView.swift
//  moviemvvm
//
//  Created by BJIT-SAKIB on 9/5/24.
//

import UIKit

extension MainViewController : UITableViewDelegate,UITableViewDataSource{
    func setupTableView(){
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = "\(userList[indexPath.row].name)"
        return cell
    }
    
}
