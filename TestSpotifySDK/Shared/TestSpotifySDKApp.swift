//
//  TestSpotifySDKApp.swift
//  Shared
//
//  Created by Luis Gómez Alonso on 13/11/21.
//

import SwiftUI

@main
struct TestSpotifySDKApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var spotifyController = SpotifyController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    spotifyController.setAccessToken(from: url)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
                    spotifyController.connect()
                })
        }
        
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("scene is now active!")
            case .inactive:
                print("scene is now inactive!")
            case .background:
                print("scene is now in the background!")
            @unknown default:
                print("Apple must have added something new!")
            }
        }
    }
}
