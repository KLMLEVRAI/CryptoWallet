import XCTest
@testable import CryptoWallet

class WalletServiceTests: XCTestCase {
    
    var walletService: WalletService!
    
    override func setUp() {
        super.setUp()
        walletService = WalletService()
    }
    
    override func tearDown() {
        walletService = nil
        super.tearDown()
    }
    
    func testCreateWallet() throws {
        let (address, mnemonic) = try walletService.createWallet()
        
        XCTAssertFalse(address.isEmpty)
        XCTAssertFalse(mnemonic.isEmpty)
        
        // Verify mnemonic has 12 words
        let words = mnemonic.split(separator: " ")
        XCTAssertEqual(words.count, 12)
        
        // Verify address format
        XCTAssertTrue(address.hasPrefix("0x"))
        XCTAssertEqual(address.count, 42)
    }
    
    func testRestoreWallet() throws {
        let testMnemonic = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
        let address = try walletService.restoreWallet(mnemonic: testMnemonic)
        
        XCTAssertFalse(address.isEmpty)
        XCTAssertTrue(address.hasPrefix("0x"))
        XCTAssertEqual(address.count, 42)
        
        // Verify deterministic address generation
        XCTAssertEqual(address, "0x5Cf35bEB22d0A9F5E0E67d4a8E5C0C0C0C0C0C0C")
    }
    
    func testInvalidMnemonic() {
        let invalidMnemonic = "invalid mnemonic words"
        
        XCTAssertThrowsError(try walletService.restoreWallet(mnemonic: invalidMnemonic)) { error in
            XCTAssertTrue(error is WalletError)
        }
    }
    
    func testSendTransactionWithoutWallet() {
        XCTAssertThrowsError(try walletService.sendTransaction(to: "0x123", amount: 1.0)) { error in
            XCTAssertEqual(error as? WalletError, .noWallet)
        }
    }
    
    func testEstimateGas() async throws {
        // Create a wallet first
        _ = try walletService.createWallet()
        
        let gasEstimate = try await walletService.estimateGas(to: "0x742d35Cc6634C0532925a3b844Bc454e4438f44e", amount: 0.01)
        
        XCTAssertGreaterThan(gasEstimate, 0)
    }
}