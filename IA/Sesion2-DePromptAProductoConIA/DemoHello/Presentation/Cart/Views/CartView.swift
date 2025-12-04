import SwiftUI

struct CartView: View {
    @StateObject private var viewModel: CartViewModel

    init(appContainer: AppContainer) {
        _viewModel = StateObject(wrappedValue: CartViewModel(
            getCartItemsUseCase: appContainer.getCartItemsUseCase,
            addItemToCartUseCase: appContainer.addItemToCartUseCase,
            removeItemFromCartUseCase: appContainer.removeItemFromCartUseCase,
            updateCartItemQuantityUseCase: appContainer.updateCartItemQuantityUseCase,
            calculateTotalUseCase: appContainer.calculateTotalUseCase
        ))
    }

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.items.isEmpty {
                    Text("Your cart is empty")
                        .font(.title)
                        .foregroundColor(.secondary)
                        .padding()
                    Button("Add Sample Item") {
                        Task {
                            let sampleProduct = Product(name: "Sample Product", price: 10.0, imageName: "photo")
                            await viewModel.addItem(product: sampleProduct)
                        }
                    }
                    .padding()
                } else {
                    List {
                        ForEach(viewModel.items) { item in
                            CartItemRow(
                                item: item,
                                onUpdateQuantity: viewModel.updateQuantity,
                                onRemove: viewModel.removeItem
                            )
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                Task {
                                    await viewModel.removeItem(id: viewModel.items[index].id)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())

                    VStack {
                        HStack {
                            Text("Total:")
                                .font(.title)
                            Spacer()
                            Text("$\(viewModel.total, specifier: "%.2f")")
                                .font(.title)
                                .bold()
                        }
                        .padding()

                        Button(action: {
                            // Checkout logic
                            print("Checkout")
                        }) {
                            Text("Checkout")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Shopping Cart")
        }
    }
}