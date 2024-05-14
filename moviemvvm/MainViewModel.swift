//
//  MainViewModel.swift
//  moviemvvm
//
//  Created by BJIT-SAKIB on 9/5/24.
//

import Foundation

class MainViewModel {
    var isLoading: Observable<Bool> = Observable(false)
    var userList: Observable<[Users]> = Observable(nil)

    var dataSource:[Users] = []
    func numberOfSections() -> Int{
        1
    }
    
    
    func numberOfRows(in section: Int) -> Int{
        dataSource.count
    }
    
    func getData(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        //call api
        APICaller.getUserData {[weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                self?.dataSource = data
                self?.mapCellData()
            case .failure(_):
                print("--------")
            }
        }
    }
    
    
    func mapCellData(){
        self.userList.value = self.dataSource 
    }
}
