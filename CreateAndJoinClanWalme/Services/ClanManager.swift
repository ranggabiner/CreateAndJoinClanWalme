//
//  ClanManager.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import Supabase
import Foundation

class ClanManager {
    var dummyId = "1234ABC"
    
    static let shared = ClanManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://oaezghaybcxjptqbtdzn.supabase.co")!,
                                supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hZXpnaGF5YmN4anB0cWJ0ZHpuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg2MjY3OTQsImV4cCI6MjAzNDIwMjc5NH0.hfDso0hEbe7mVDfYo7OUjlpSeiuwvcqqb_HmncXTEpo")
        
    func insertClan(_ createClan: Clan) async throws -> Bool {
        let insertResponse = try await client.database.from("clans").insert(createClan).execute()
        return insertResponse.status == 201
    }

}
