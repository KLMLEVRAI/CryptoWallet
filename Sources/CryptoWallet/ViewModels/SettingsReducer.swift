import ComposableArchitecture

let settingsReducer = Reducer<SettingsState, SettingsAction, SettingsEnvironment> { state, action, environment in
    switch action {
    case .toggleDarkMode:
        state.isDarkMode.toggle()
        return .none
    case .setLanguage(let language):
        state.language = language
        return .none
    case .toggleNotifications:
        state.notificationsEnabled.toggle()
        return .none
    }
}

enum SettingsAction: Equatable {
    case toggleDarkMode
    case setLanguage(String)
    case toggleNotifications
}

struct SettingsEnvironment {
    // Add any necessary dependencies
}