import SwiftUI

struct CartItemRow: View {
    let item: CartItem
    let onUpdateQuantity: (UUID, Int) async -> Void
    let onRemove: (UUID) async -> Void

    var body: some View {
        HStack {
            Image(systemName: item.product.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(item.product.name)
                    .font(.headline)
                Text("$\(item.product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            HStack {
                Button(action: {
                    Task {
                        if item.quantity > 1 {
                            await onUpdateQuantity(item.id, item.quantity - 1)
                        } else {
                            await onRemove(item.id)
                        }
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }

                Text("\(item.quantity)")
                    .frame(minWidth: 30)

                Button(action: {
                    Task {
                        await onUpdateQuantity(item.id, item.quantity + 1)
                    }
                }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.green)
                }
            }

            Text("$\(item.totalPrice, specifier: "%.2f")")
                .font(.headline)
                .frame(width: 80, alignment: .trailing)

            Button(action: {
                Task {
                    await onRemove(item.id)
                }
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 5)
    }
}