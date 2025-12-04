import SwiftUI
import Combine

@MainActor
class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var total: Double = 0.0
    @Published var isLoading = false

    private let getCartItemsUseCase: GetCartItemsUseCase
    private let addItemToCartUseCase: AddItemToCartUseCase
    private let removeItemFromCartUseCase: RemoveItemFromCartUseCase
    private let updateCartItemQuantityUseCase: UpdateCartItemQuantityUseCase
    private let calculateTotalUseCase: CalculateTotalUseCase

    init(
        getCartItemsUseCase: GetCartItemsUseCase,
        addItemToCartUseCase: AddItemToCartUseCase,
        removeItemFromCartUseCase: RemoveItemFromCartUseCase,
        updateCartItemQuantityUseCase: UpdateCartItemQuantityUseCase,
        calculateTotalUseCase: CalculateTotalUseCase
    ) {
        self.getCartItemsUseCase = getCartItemsUseCase
        self.addItemToCartUseCase = addItemToCartUseCase
        self.removeItemFromCartUseCase = removeItemFromCartUseCase
        self.updateCartItemQuantityUseCase = updateCartItemQuantityUseCase
        self.calculateTotalUseCase = calculateTotalUseCase
        Task {
            await loadItems()
        }
    }

    func loadItems() async {
        isLoading = true
        items = await getCartItemsUseCase.execute()
        total = calculateTotalUseCase.execute(items: items)
        isLoading = false
    }

    func addItem(product: Product) async {
        let item = CartItem(product: product)
        await addItemToCartUseCase.execute(item: item)
        await loadItems()
    }

    func removeItem(id: UUID) async {
        await removeItemFromCartUseCase.execute(id: id)
        await loadItems()
    }

    func updateQuantity(id: UUID, quantity: Int) async {
        do {
            try await updateCartItemQuantityUseCase.execute(id: id, quantity: quantity)
            await loadItems()
        } catch {
            // Handle error, perhaps show alert
            print("Error updating quantity: \(error)")
        }
    }
}