import SwiftUI
import ComposableArchitecture
import Kingfisher

struct NFTsView: View {
    let store: Store<WalletState, WalletAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(viewStore.nfts) { nft in
                            NFTCard(nft: nft)
                        }
                    }
                    .padding()
                }
                .navigationTitle("NFTs")
                .onAppear {
                    viewStore.send(.loadNFTs)
                }
            }
        }
    }
}

struct NFTCard: View {
    let nft: NFT

    var body: some View {
        VStack {
            if let imageUrl = nft.imageUrl, let url = URL(string: imageUrl) {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(10)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 150)
                    .cornerRadius(10)
                    .overlay(Text("No Image").foregroundColor(.gray))
            }
            Text(nft.name ?? "Unnamed NFT")
                .font(.headline)
                .lineLimit(1)
            Text("#\(nft.tokenId)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}