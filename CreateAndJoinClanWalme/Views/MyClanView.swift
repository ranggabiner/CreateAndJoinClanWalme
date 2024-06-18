//
//  MyClanView.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct MyClanView: View {
    var appClan: Clan

    var body: some View {
        VStack {
            Text("Welcome to \(appClan.clan_name) Clan")
                .font(.largeTitle)
                .padding()

            Text("Description: \(appClan.clan_description)")
                .padding()

            Text("Invite Code: \(appClan.invite_code)")
                .padding()

            Button(action: {
                // Handle exit clan logic
            }) {
                Text("Exit Clan")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
#Preview {
    MyClanView(appClan: .init(id: "1234-adsffa", owner: "1231-gadfs", invite_code: "GSRI123H", trees: 0))
}
