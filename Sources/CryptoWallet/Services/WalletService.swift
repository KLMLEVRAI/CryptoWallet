import Foundation
import web3swift
import CryptoSwift

class WalletService {
    private var keystore: BIP32Keystore?
    private let web3 = Web3.InfuraMainnetWeb3()
    
    func createWallet() throws -> (address: String, mnemonic: String) {
        let mnemonic = try BIP39.generateMnemonics(bitsOfEntropy: 128)!
        let keystore = try BIP32Keystore(mnemonics: mnemonic, password: "", mnemonicsPassword: "")
        self.keystore = keystore
        let address = keystore.addresses!.first!.address
        return (address, mnemonic)
    }
    
    func restoreWallet(mnemonic: String) throws -> String {
        let keystore = try BIP32Keystore(mnemonics: mnemonic, password: "", mnemonicsPassword: "")
        self.keystore = keystore
        return keystore.addresses!.first!.address
    }
    
    func getBalance(address: String) async throws -> Double {
        let ethAddress = EthereumAddress(address)!
        let balance = try await web3.eth.getBalance(for: ethAddress)
        return Double(balance) / pow(10, 18) // Convert wei to ETH
    }
    
    func getTokens(address: String) async throws -> [Token] {
        // Implement ERC-20 token fetching
        // This would typically involve calling token contracts or using an API
        return []
    }
    
    func getNFTs(address: String) async throws -> [NFT] {
        // Implement ERC-721 NFT fetching
        // This would involve calling NFT contracts or using an API
        return []
    }
    
    func sendTransaction(to: String, amount: Double, gasPrice: Double? = nil) async throws -> String {
        guard let keystore = keystore else { throw WalletError.noWallet }
        
        let ethAmount = Web3.Utils.parseToBigUInt(String(amount), units: .eth)!
        let toAddress = EthereumAddress(to)!
        
        let contract = web3.contract(Web3.Utils.coldWalletABI, at: toAddress, abiVersion: 2)!
        var options = TransactionOptions.defaultOptions
        options.value = ethAmount
        options.from = keystore.addresses!.first!
        options.gasLimit = .automatic
        options.gasPrice = gasPrice != nil ? .manual(BigUInt(gasPrice! * pow(10, 9))) : .automatic
        
        let tx = contract.write("fallback", parameters: [] as [AnyObject], extraData: Data(), transactionOptions: options)!
        let signedTx = try tx.sign(keystore: keystore)
        let result = try await web3.eth.sendRawTransaction(signedTx)
        
        return result.hash
    }
    
    func getTransactions(address: String) async throws -> [Transaction] {
        // Implement transaction history fetching
        // This would typically use an API like Etherscan
        return []
    }
    
    func estimateGas(to: String, amount: Double) async throws -> Double {
        let ethAmount = Web3.Utils.parseToBigUInt(String(amount), units: .eth)!
        let toAddress = EthereumAddress(to)!
        
        let contract = web3.contract(Web3.Utils.coldWalletABI, at: toAddress, abiVersion: 2)!
        var options = TransactionOptions.defaultOptions
        options.value = ethAmount
        options.from = keystore?.addresses?.first
        
        let gasEstimate = try await web3.eth.estimateGas(for: contract.write("fallback", parameters: [] as [AnyObject], extraData: Data(), transactionOptions: options)!)
        
        return Double(gasEstimate) / pow(10, 9) // Convert wei to gwei
    }
}

enum WalletError: Error {
    case noWallet
    case invalidAddress
    case insufficientFunds
    case networkError
}