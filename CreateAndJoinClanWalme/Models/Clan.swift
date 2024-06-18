//
//  Clan.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

struct Clan: Codable {
    let id: String
    let owner: String
    var clan_name: String?
    var clan_description: String?
    let invite_code: String
    let trees: Int?
}
