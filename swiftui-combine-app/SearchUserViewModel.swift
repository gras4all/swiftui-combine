//
//  SearchUserViewModel.swift
//  swiftui-combine-app
//
//  Created by Андрей Груненков on 08.10.2022.
//

import SwiftUI
import Combine

final class SearchUserViewModel: ObservableObject {

    @Published var name = "gras4all"

    @Published private(set) var users = [User]()

    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        searchCancellable?.cancel()
    }

    func search() {
        guard !name.isEmpty else {
            return users = []
        }

        var urlComponents = URLComponents(string: "https://api.github.com/search/users")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.users, on: self)
    }
    
}

