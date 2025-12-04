import Foundation

struct RemoveItemFromCartUseCase {
    private let cartRepository: CartRepository

    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }

    func execute(id: UUID) async {
        await cartRepository.removeItem(with: id)
    }
}