import Foundation

struct AddItemToCartUseCase {
    private let cartRepository: CartRepository

    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }

    func execute(item: CartItem) async {
        await cartRepository.addItem(item)
    }
}