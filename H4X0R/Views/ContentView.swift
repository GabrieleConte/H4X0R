//
//  ContentView.swift
//  H4X0R
//
//  Created by Gabriele Conte on 03/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetManager()
    var body: some View {
        
        NavigationStack{
            Spacer()
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("H4X0R")
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
