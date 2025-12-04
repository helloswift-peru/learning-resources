import Foundation

struct AppContainer {
    let cartRepository: CartRepository
    let getCartItemsUseCase: GetCartItemsUseCase
    let addItemToCartUseCase: AddItemToCartUseCase
    let removeItemFromCartUseCase: RemoveItemFromCartUseCase
    let updateCartItemQuantityUseCase: UpdateCartItemQuantityUseCase
    let calculateTotalUseCase: CalculateTotalUseCase

    init() {
        cartRepository = CartRepositoryImpl()
        getCartItemsUseCase = GetCartItemsUseCase(cartRepository: cartRepository)
        addItemToCartUseCase = AddItemToCartUseCase(cartRepository: cartRepository)
        removeItemFromCartUseCase = RemoveItemFromCartUseCase(cartRepository: cartRepository)
        updateCartItemQuantityUseCase = UpdateCartItemQuantityUseCase(cartRepository: cartRepository)
        calculateTotalUseCase = CalculateTotalUseCase()
    }
}