import ComposableArchitecture

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    walletReducer.pullback(
        state: \.walletState,
        action: /AppAction.wallet,
        environment: { $0.wallet }
    ),
    settingsReducer.pullback(
        state: \.settingsState,
        action: /AppAction.settings,
        environment: { $0.settings }
    ),
    Reducer { state, action, environment in
        switch action {
        case .onboardingCompleted:
            state.isOnboardingCompleted = true
            return .none
        case .wallet, .settings:
            return .none
        }
    }
)

enum AppAction: Equatable {
    case onboardingCompleted
    case wallet(WalletAction)
    case settings(SettingsAction)
}

struct AppEnvironment {
    var wallet: WalletEnvironment
    var settings: SettingsEnvironment
}