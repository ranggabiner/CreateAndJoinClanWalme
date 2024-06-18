//
//  MyClanView.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct MyClanView: View {
    @Binding var appClan: Clan?

    var body: some View {
        VStack {
            Text("Welcome to \(appClan?.clan_name ?? "") Clan")  // harus fetch
                .font(.largeTitle)
                .padding()
            
            Text("Amount of Tree: \(appClan?.trees ?? 10) Clan") // harus fetch
                .font(.largeTitle)
                .padding()

            Text("Description: \(appClan?.clan_description ?? "")")  // harus fetch
                .padding()

            Text("Invite Code: \(appClan?.invite_code ?? "")")
                .padding()

            Button(action: {
                Task {
                    await deleteClan()
                    appClan = nil
                }
            }) {
                Text("Delete Clan")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }

    func deleteClan() async {
        guard let clan = appClan else { return }

        do {
            let isSuccess = try await ClanManager.shared.deleteClan(clan.id)
            if isSuccess {
                DispatchQueue.main.async {
                    appClan = nil
                    UserDefaults.standard.removeObject(forKey: "savedClan")
                }
            } else {
                print("Failed to delete clan")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    MyClanView(appClan: .constant(.init(id: "217893-hasdfi", owner: "saidf1289", invite_code: "1723HDJKA", trees: 0)))
}
