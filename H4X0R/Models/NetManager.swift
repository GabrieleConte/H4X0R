//
//  NetManager.swift
//  H4X0R
//
//  Created by Gabriele Conte on 03/11/22.
//

import Foundation
class NetManager: ObservableObject {
    @Published var posts=[Post]()
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session=URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, err in
                if(err==nil){
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch{
                            print(err as Any)
                            }
                        }
                    }
                }
            task.resume()
            }
        }
    }
