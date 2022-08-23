//
//  ContentView.swift
//  StackOverflowApp
//
//  Created by Rattana Noeun on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.posts) {post in
                NavigationLink(destination: DetailView(url: post.link)) {
                  
                    VStack {
                        Text(post.title)
                        
                        HStack {
                            Text("Votes:")
                            Text(String(post.score))
                            Text("Answers:")
                            Text(String(post.answer_count))
                        }
                    }
                }
            }
            .navigationTitle("Stack Overflow App")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
