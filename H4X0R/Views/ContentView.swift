//
//  ContentView.swift
//  H4X0R
//
//  Created by moutaz hegazy on 4/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailsView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle(Text("H4X0R News"))
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


