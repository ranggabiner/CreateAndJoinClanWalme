//
//  CreateClanViewModel.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import Foundation

class CreateClanViewModel: ObservableObject {
    @Published var appClan: Clan?
    @Published var clanName: String = ""
    @Published var clanDescription: String = ""
    @Published var inviteCode: String = ""

    private let userManager = ClanManager.shared

    init(appClan: Clan?) {
        self.appClan = appClan
    }

    func createClan() async {
        let idClan = UUID().uuidString
        let ownerId = UUID().uuidString
        let code = UUID().uuidString.prefix(8).uppercased()

        let newClan = Clan(id: idClan, owner: ownerId, clan_name: clanName, clan_description: clanDescription, invite_code: String(code), trees: 0)

        do {
            let isSuccess = try await userManager.insertClan(newClan)

            if isSuccess {
                appClan = newClan
            } else {
                print("Failed to create clan")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
