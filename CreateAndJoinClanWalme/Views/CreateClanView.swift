//
//  CreateClanView.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct CreateClanView: View {
    @ObservedObject var viewModel: CreateClanViewModel
    @Binding var appClan: Clan?

    var body: some View {
        VStack {
            TextField("Enter Name of the Clan", text: $viewModel.clanName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Clan Description (optional)", text: $viewModel.clanDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                Task {
                    await viewModel.createClan()
                    if let updatedClan = viewModel.appClan {
                        appClan = updatedClan
                        if let encoded = try? JSONEncoder().encode(updatedClan) {
                            UserDefaults.standard.set(encoded, forKey: "savedClan")
                        }
                    }
                }
            }) {
                Text("Create Clan")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}


#Preview {
    CreateClanView(viewModel: CreateClanViewModel(appClan: .init(id: "1234-adsffa", owner: "1231-gadfs", invite_code: "GSRI123H", trees: 0)), appClan: .constant(.init(id: "1234-adsffa", owner: "1231-gadfs", invite_code: "GSRI123H", trees: 0)))
}
