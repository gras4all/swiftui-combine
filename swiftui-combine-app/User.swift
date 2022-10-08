//
//  User.swift
//  swiftui-combine-app
//
//  Created by Андрей Груненков on 08.10.2022.
//

import Foundation
import SwiftUI

struct User: Hashable, Identifiable, Decodable {
    var id: Int64
    var login: String
    var avatar_url: URL
}
