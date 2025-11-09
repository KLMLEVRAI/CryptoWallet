import SwiftUI
import ComposableArchitecture

struct SettingsView: View {
    let store: Store<SettingsState, SettingsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                Form {
                    Section(header: Text("Appearance")) {
                        Toggle("Dark Mode", isOn: viewStore.binding(
                            get: \.isDarkMode,
                            send: SettingsAction.toggleDarkMode
                        ))
                    }
                    
                    Section(header: Text("Language")) {
                        Picker("Language", selection: viewStore.binding(
                            get: \.language,
                            send: SettingsAction.setLanguage
                        )) {
                            Text("English").tag("en")
                            Text("Français").tag("fr")
                        }
                    }
                    
                    Section(header: Text("Notifications")) {
                        Toggle("Enable Notifications", isOn: viewStore.binding(
                            get: \.notificationsEnabled,
                            send: SettingsAction.toggleNotifications
                        ))
                    }
                    
                    Section(header: Text("Security")) {
                        Button("Enable Biometric Authentication") {
                            // Implement biometric setup
                        }
                    }
                    
                    Section(header: Text("About")) {
                        NavigationLink("Ethical Commitments", destination: EthicalView())
                        NavigationLink("Privacy Policy", destination: PrivacyPolicyView())
                    }
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct EthicalView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Our Ethical Commitments")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Non-Custodial by Principle")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We believe in true financial sovereignty. Your private keys never leave your device, ensuring you maintain full control over your assets at all times.")
                
                Text("Transparency and Openness")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Our code is open-source, allowing the community to audit and verify our security practices. We maintain a public changelog and commit to responsible disclosure of any vulnerabilities.")
                
                Text("Privacy First")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We collect no personal data, implement no tracking, and require explicit opt-in for any data sharing. Your financial privacy is paramount.")
                
                Text("Responsible Security")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We encourage security research and maintain a bug bounty program. We prioritize user safety over convenience and implement industry-standard security practices.")
                
                Text("Accessibility and Inclusion")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We design with accessibility in mind, supporting VoiceOver, high contrast modes, and adaptive sizing to ensure our app is usable by everyone.")
                
                Text("Environmental Consciousness")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We display estimated energy costs for transactions and encourage the use of Layer 2 solutions to minimize environmental impact.")
            }
            .padding()
        }
        .navigationTitle("Ethics")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Privacy Policy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Data Collection")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("CryptoWallet does not collect, store, or transmit any personal information. All wallet data remains locally on your device.")
                
                Text("Third-Party Services")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We integrate with blockchain networks and decentralized exchanges. Your interactions with these services are direct and not mediated by us.")
                
                Text("Security Measures")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("We implement industry-standard encryption and security practices. Your private keys are encrypted and stored securely on your device.")
                
                Text("Contact")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("For privacy concerns, please review our open-source code or contact us through our public repository.")
            }
            .padding()
        }
        .navigationTitle("Privacy")
    }
}