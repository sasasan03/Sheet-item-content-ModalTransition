//
//  ContentView.swift
//  Sheet(item,content)ModalTransition
//
//  Created by sako0602 on 2023/02/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user2: UserInfo?
    
    var body: some View {
        VStack {
            Button("押してみ？"){
                user2 = UserInfo(name: "さこ")
            }
            Button("もっかい押してみ？"){
                user2 = UserInfo(name: "まこ")
            }
        }
        .sheet(item: $user2) { item in
            NextView(user: item)
        }
    }
}

struct NextView: View {
    let user: UserInfo
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("あなた誰？\(user.name)")
            Button("画面を閉じる"){ dismiss() }
        }
    }
}

struct UserInfo: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

