import Foundation

public struct IceCream {
    public let flavour: String
    public let price: Double
    
    public init(flavour: String, price: Double) {
        self.flavour = flavour
        self.price = price
    }
    
    public static let vanilla: IceCream = .init(flavour: "vanilla", price: 10.0)
}
