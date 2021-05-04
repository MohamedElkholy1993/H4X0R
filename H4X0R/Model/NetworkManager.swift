//
//  NetworkManager.swift
//  H4X0R
//
//  Created by moutaz hegazy on 4/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject{
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, respose, error) in
                if error != nil{
                    return
                }
                let decoder = JSONDecoder()
                if let safeData = data{
                    do{
                        let decodedData = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = decodedData.hits
                        }
                        
                    }catch{
                        print(error)
                    }
                }
                
                
            }
            task.resume()
        }
    }
}
