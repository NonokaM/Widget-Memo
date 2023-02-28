//
//  ContentView.swift
//  SimpleMemo
//
//  Created by MOMII Nonoka on 2023/02/24.
//

import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var text: String
}

struct ContentView: View {
    @State private var memoText = ""
    @State private var memos: [Memo] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(memos) { memo in
                    Text(memo.text)
                }
                .navigationBarTitle("memo")
                
                HStack {
                    TextField("Enter memo", text: $memoText)
                        .padding(.horizontal)
                    
                    Button(action: addMemo) {
                        Image(systemName: "plus")
                    }
                    .padding(.trailing)
                }
            }
        }
    }
    
    func addMemo() {
        memos.append(Memo(text: memoText))
        memoText = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
