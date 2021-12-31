//
//  ContentView.swift
//  Map
//
//  Created by Kyohei Morinaka on 2021/12/31.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var onSearchKey: String = ""
    var body: some View {
        VStack {
            TextField("Key Word", text: $inputText, prompt: Text ("入力してください"))
                .onSubmit {
                    onSearchKey = inputText
                }
                .padding()
            LocationView(searchKey: onSearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
