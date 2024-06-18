//
//  CreateOrJoinView.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct CreateOrJoinView: View {
    @State var appClan: Clan?

    var body: some View {
        NavigationView {
            VStack {
                if appClan == nil {
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
                } else {
                    NavigationLink(destination: MyClanView(appClan: $appClan)) {
                        Text("My Clan")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Clan Options")
        }
        .onAppear {
            if let savedClanData = UserDefaults.standard.data(forKey: "savedClan"),
               let savedClan = try? JSONDecoder().decode(Clan.self, from: savedClanData) {
                appClan = savedClan
            }
        }
    }
}

#Preview {
    CreateOrJoinView()
}
