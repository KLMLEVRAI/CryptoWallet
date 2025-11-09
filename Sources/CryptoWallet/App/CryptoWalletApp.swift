import SwiftUI
import ComposableArchitecture

@main
struct CryptoWalletApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(
                initialState: AppState(),
                reducer: appReducer,
                environment: AppEnvironment()
            ))
        }
    }
}