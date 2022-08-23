//
//  NetworkManager.swift
//  StackOverflowApp
//
//  Created by Rattana Noeun on 4/17/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://api.stackexchange.com/2.3/questions?page=5&pagesize=20&fromdate=1648771200&todate=1650153600&order=desc&sort=votes&site=stackoverflow") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.items
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
