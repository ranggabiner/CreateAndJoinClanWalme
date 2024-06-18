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
        Group {
            if let appClan = appClan {
                MyClanView(appClan: $appClan)
            } else {
                CreateOrJoinView()
            }
        }
    }
}

#Preview {
    ContentView()
}
