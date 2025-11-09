import XCTest
@testable import CryptoWallet

class AppStateTests: XCTestCase {
    
    func testAppStateInitialization() {
        let appState = AppState()
        
        XCTAssertFalse(appState.isOnboardingCompleted)
        XCTAssertEqual(appState.walletState.balance, 0.0)
        XCTAssertTrue(appState.walletState.tokens.isEmpty)
        XCTAssertTrue(appState.walletState.nfts.isEmpty)
        XCTAssertTrue(appState.walletState.transactions.isEmpty)
        XCTAssertFalse(appState.settingsState.isDarkMode)
        XCTAssertEqual(appState.settingsState.language, "en")
        XCTAssertTrue(appState.settingsState.notificationsEnabled)
    }
    
    func testWalletStateEquatable() {
        let state1 = WalletState()
        let state2 = WalletState()
        
        XCTAssertEqual(state1, state2)
        
        var state3 = WalletState()
        state3.balance = 1.0
        XCTAssertNotEqual(state1, state3)
    }
    
    func testSettingsStateEquatable() {
        let state1 = SettingsState()
        let state2 = SettingsState()
        
        XCTAssertEqual(state1, state2)
        
        var state3 = SettingsState()
        state3.isDarkMode = true
        XCTAssertNotEqual(state1, state3)
    }
    
    func testTokenModel() {
        let token = Token(contractAddress: "0x123", symbol: "ETH", name: "Ethereum", balance: 1.5, decimals: 18)
        
        XCTAssertEqual(token.contractAddress, "0x123")
        XCTAssertEqual(token.symbol, "ETH")
        XCTAssertEqual(token.name, "Ethereum")
        XCTAssertEqual(token.balance, 1.5)
        XCTAssertEqual(token.decimals, 18)
        XCTAssertNotNil(token.id)
    }
    
    func testNFTModel() {
        let nft = NFT(contractAddress: "0x456", tokenId: "1", name: "Test NFT", imageUrl: "https://example.com/image.png", metadata: ["description": "A test NFT"])
        
        XCTAssertEqual(nft.contractAddress, "0x456")
        XCTAssertEqual(nft.tokenId, "1")
        XCTAssertEqual(nft.name, "Test NFT")
        XCTAssertEqual(nft.imageUrl, "https://example.com/image.png")
        XCTAssertEqual(nft.metadata?["description"] as? String, "A test NFT")
        XCTAssertNotNil(nft.id)
    }
    
    func testTransactionModel() {
        let date = Date()
        let transaction = Transaction(hash: "0x789", from: "0xabc", to: "0xdef", value: 0.5, timestamp: date, type: .send)
        
        XCTAssertEqual(transaction.hash, "0x789")
        XCTAssertEqual(transaction.from, "0xabc")
        XCTAssertEqual(transaction.to, "0xdef")
        XCTAssertEqual(transaction.value, 0.5)
        XCTAssertEqual(transaction.timestamp, date)
        XCTAssertEqual(transaction.type, .send)
        XCTAssertNotNil(transaction.id)
    }
}