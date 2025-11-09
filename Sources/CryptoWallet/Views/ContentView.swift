import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            if viewStore.isOnboardingCompleted {
                MainTabView(store: store)
            } else {
                OnboardingView(store: store)
            }
        }
    }
}

struct MainTabView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        TabView {
            WalletView(store: store.scope(state: \.walletState, action: AppAction.wallet))
                .tabItem {
                    Label("Wallet", systemImage: "wallet.pass")
                }
            NFTsView(store: store.scope(state: \.walletState, action: AppAction.wallet))
                .tabItem {
                    Label("NFTs", systemImage: "photo.on.rectangle.angled")
                }
            SettingsView(store: store.scope(state: \.settingsState, action: AppAction.settings))
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct OnboardingView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        VStack {
            Text("Welcome to CryptoWallet")
                .font(.largeTitle)
                .padding()
            Text("Your ethical, non-custodial crypto wallet")
                .font(.headline)
                .padding()
            Button("Get Started") {
                ViewStore(store).send(.onboardingCompleted)
            }
            .padding()
        }
    }
}