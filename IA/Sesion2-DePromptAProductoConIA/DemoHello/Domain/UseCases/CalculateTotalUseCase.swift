import Foundation

struct CalculateTotalUseCase {
    func execute(items: [CartItem]) -> Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
}