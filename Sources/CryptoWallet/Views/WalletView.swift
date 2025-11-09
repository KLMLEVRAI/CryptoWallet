import SwiftUI
import ComposableArchitecture

struct WalletView: View {
    let store: Store<WalletState, WalletAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    VStack(spacing: 20) {
                        BalanceCard(balance: viewStore.balance)
                        TokenList(tokens: viewStore.tokens)
                        TransactionHistory(transactions: viewStore.transactions)
                    }
                    .padding()
                }
                .navigationTitle("Wallet")
                .navigationBarItems(trailing: Button(action: {
                    // Send action
                }) {
                    Image(systemName: "arrow.up.circle")
                })
                .onAppear {
                    viewStore.send(.loadBalance)
                    viewStore.send(.loadTokens)
                    viewStore.send(.loadTransactions)
                }
            }
        }
    }
}

struct BalanceCard: View {
    let balance: Double

    var body: some View {
        VStack {
            Text("Balance")
                .font(.headline)
            Text("\(balance, specifier: "%.4f") ETH")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

struct TokenList: View {
    let tokens: [Token]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Tokens")
                .font(.headline)
            ForEach(tokens) { token in
                HStack {
                    Text(token.symbol)
                    Spacer()
                    Text("\(token.balance, specifier: "%.4f")")
                }
                .padding(.vertical, 5)
            }
        }
    }
}

struct TransactionHistory: View {
    let transactions: [Transaction]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Recent Transactions")
                .font(.headline)
            ForEach(transactions) { transaction in
                HStack {
                    Text(transaction.type.rawValue.capitalized)
                    Spacer()
                    Text("\(transaction.value, specifier: "%.4f") ETH")
                    Text(transaction.timestamp, style: .date)
                }
                .padding(.vertical, 5)
            }
        }
    }
}