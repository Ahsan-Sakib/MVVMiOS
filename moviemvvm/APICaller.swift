//
//  APICaller.swift
//  moviemvvm
//
//  Created by BJIT-SAKIB on 9/5/24.
//

import Foundation
enum NetworkError:Error{
    case invalidUrl
    case typeCasting
}


public class APICaller{
    static func getUserData(completionHandler: @escaping (_ result: Result< [Users],NetworkError>)->Void){
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidUrl))
            return }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode([Users].self, from: data){
                completionHandler(.success(resultData))
            }else{
                completionHandler(.failure(.typeCasting))
            }
        }.resume()
    }
}
