//
//  ContentView.swift
//  CreateAndJoinClanWalme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("savedClan") var savedClanData: Data?
    @State var appClan: Clan? = nil

    var body: some View {
        if let appClan = appClan {
            MyClanView(appClan: appClan)
        } else {
            CreateClanView(viewModel: CreateClanViewModel(appClan: appClan), appClan: $appClan)
                .onAppear {
                    if let savedClanData = savedClanData,
                       let savedClan = try? JSONDecoder().decode(Clan.self, from: savedClanData) {
                        appClan = savedClan
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
