//
//  DetailsView.swift
//  H4X0R
//
//  Created by moutaz hegazy on 4/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    var url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable{
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString{
            if let url = URL(string: safeURL){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
