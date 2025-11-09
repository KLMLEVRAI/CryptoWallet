import ComposableArchitecture

struct AppState: Equatable {
    var walletState: WalletState = .init()
    var settingsState: SettingsState = .init()
    var isOnboardingCompleted: Bool = false
}

struct WalletState: Equatable {
    var address: String?
    var balance: Double = 0.0
    var tokens: [Token] = []
    var nfts: [NFT] = []
    var transactions: [Transaction] = []
}

struct SettingsState: Equatable {
    var isDarkMode: Bool = false
    var language: String = "en"
    var notificationsEnabled: Bool = true
}

struct Token: Equatable, Identifiable {
    let id = UUID()
    let contractAddress: String
    let symbol: String
    let name: String
    let balance: Double
    let decimals: Int
}

struct NFT: Equatable, Identifiable {
    let id = UUID()
    let contractAddress: String
    let tokenId: String
    let name: String?
    let imageUrl: String?
    let metadata: [String: Any]?
}

struct Transaction: Equatable, Identifiable {
    let id = UUID()
    let hash: String
    let from: String
    let to: String
    let value: Double
    let timestamp: Date
    let type: TransactionType
}

enum TransactionType: String, Equatable {
    case send, receive, swap
}