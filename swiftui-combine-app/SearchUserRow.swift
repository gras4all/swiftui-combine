//
//  SearchUserRow.swift
//  swiftui-combine-app
//
//  Created by Андрей Груненков on 08.10.2022.
//

import SwiftUI

struct SearchUserRow: View {
    @ObservedObject var viewModel: SearchUserViewModel
    @State var user: User

    var body: some View {
        HStack {
            Text(user.login)
                .font(Font.system(size: 18).bold())

            Spacer()
            }
            .frame(height: 60)
    }
    
}

