//
//  CreateOrJoinView.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct CreateOrJoinView: View {
    var body: some View {
        @State var appClan: Clan?

        NavigationView {
            VStack {
                NavigationLink(destination: JoinClanView()) {
                    Text("Join Clan")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: CreateClanView(viewModel: CreateClanViewModel(appClan: appClan), appClan: $appClan)) {
                    Text("Create Clan")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Clan Options")
        }
    }
}

#Preview {
    CreateOrJoinView()
}
