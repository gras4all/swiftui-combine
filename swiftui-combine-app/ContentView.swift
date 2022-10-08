//
//  ContentView.swift
//  swiftui-combine-app
//
//  Created by Андрей Груненков on 08.10.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SearchUserViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchUserBar(text: $viewModel.name) {
                    self.viewModel.search()
                }

                List(viewModel.users) { user in
                    SearchUserRow(viewModel: self.viewModel, user: user)
                }
                }
                .navigationBarTitle(Text("Github users"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
