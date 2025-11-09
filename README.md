# CryptoWallet

An ethical, non-custodial iOS crypto wallet inspired by Phantom Wallet and Ledger Live. Built with SwiftUI and Composable Architecture.

## Features

- **Non-Custodial**: Your keys, your crypto. Full control over your assets.
- **BIP39 Wallet Creation/Restoration**: Secure wallet generation and recovery.
- **Multi-Asset Support**: ETH, ERC-20 tokens, and ERC-721 NFTs.
- **Transaction Management**: Send/receive with gas estimation.
- **Portfolio Tracking**: Balance history and charts.
- **NFT Gallery**: Visual NFT display with metadata.
- **DEX Integration**: Built-in swap functionality.
- **Security Features**: Biometric authentication, hardware wallet support.
- **Privacy-Focused**: No tracking, no personal data collection.
- **Open-Source**: Transparent and auditable code.
- **Accessibility**: VoiceOver support, high contrast, adaptive sizing.

## Ethical Commitments

### Non-Custodial by Principle
We believe in true financial sovereignty. Your private keys never leave your device.

### Transparency and Openness
Our code is open-source, allowing the community to audit our security practices.

### Privacy First
We collect no personal data, implement no tracking, and require explicit opt-in for any data sharing.

### Responsible Security
We encourage security research and maintain a bug bounty program.

### Accessibility and Inclusion
We design with accessibility in mind, supporting VoiceOver and adaptive interfaces.

### Environmental Consciousness
We display estimated energy costs for transactions and encourage Layer 2 solutions.

## Architecture

- **Language**: Swift 5+ with SwiftUI
- **Architecture**: MVVM with Composable Architecture (TCA)
- **Minimum iOS Version**: iOS 16
- **Web3 Integration**: web3swift, WalletConnect
- **CI/CD**: Codemagic

## Project Structure

```
CryptoWallet/
├── Package.swift
├── Sources/CryptoWallet/
│   ├── App/
│   │   └── CryptoWalletApp.swift
│   ├── Models/
│   │   └── AppState.swift
│   ├── ViewModels/
│   │   ├── AppReducer.swift
│   │   ├── WalletReducer.swift
│   │   └── SettingsReducer.swift
│   ├── Views/
│   │   ├── ContentView.swift
│   │   ├── WalletView.swift
│   │   ├── NFTsView.swift
│   │   └── SettingsView.swift
│   ├── Services/
│   │   └── WalletService.swift
│   └── Resources/
│       └── Localizable.strings
├── Tests/
│   └── CryptoWalletTests/
└── codemagic.yaml
```

## Setup

### Prerequisites
- Xcode 14+
- iOS 16+ device/simulator
- CocoaPods (for dependencies)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/CryptoWallet.git
   cd CryptoWallet
   ```

2. Install dependencies:
   ```bash
   pod install
   ```

3. Open the workspace:
   ```bash
   open CryptoWallet.xcworkspace
   ```

4. Build and run the app in Xcode.

## CI/CD Setup (Codemagic)

### Prerequisites
- Codemagic account
- Apple Developer Program membership
- App Store Connect API key

### Configuration

1. **Environment Variables**:
   Set the following in Codemagic:
   - `APP_STORE_CONNECT_PRIVATE_KEY`: Your App Store Connect API key
   - `APP_STORE_CONNECT_KEY_IDENTIFIER`: Key ID
   - `APP_STORE_CONNECT_ISSUER_ID`: Issuer ID

2. **Code Signing**:
   - Upload your provisioning profiles and certificates to Codemagic
   - Or use automatic code signing with App Store Connect

3. **Workflows**:
   - `ios-debug`: Builds debug IPA and uploads to TestFlight
   - `ios-release`: Builds release IPA, increments build number, uploads to TestFlight

### Building from Windows

Since you're on Windows, use Codemagic for cloud builds:

1. Push your code to a Git repository (GitHub, GitLab, etc.)
2. Connect your repository to Codemagic
3. Configure the workflows as described above
4. Trigger builds manually or on push/tag

The `codemagic.yaml` file is pre-configured for:
- Automatic dependency installation
- Code signing setup
- Build number incrementation
- TestFlight deployment

## Security

### Key Management
- Private keys are encrypted and stored securely on-device
- Biometric authentication for transaction approval
- Hardware wallet support via WalletConnect

### Best Practices
- No logging of sensitive data
- Secure random number generation for key creation
- Regular security audits and updates

## Testing

Run the test suite:
```bash
swift test
```

### Test Coverage
- Unit tests for wallet operations
- UI tests for critical user flows
- Integration tests for Web3 interactions

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Bug Reports and Security Issues
- Report bugs via GitHub Issues
- For security vulnerabilities, please email security@cryptowallet.com
- We follow responsible disclosure practices

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This software is for educational and research purposes. Always verify transactions and keep your seed phrase secure. The developers are not responsible for any financial losses.

## Support

- Documentation: [docs.cryptowallet.com](https://docs.cryptowallet.com)
- Community: [Discord](https://discord.gg/cryptowallet)
- Email: support@cryptowallet.com