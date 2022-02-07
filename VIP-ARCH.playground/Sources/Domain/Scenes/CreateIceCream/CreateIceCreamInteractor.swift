import Foundation

public class CreateIceCreamInteractor {
    public var presenter: CreateIceCreamPresentationLogic?
}

extension CreateIceCreamInteractor: CreateIceCreamBusinessLogic {
    
    public func loadIceCream(request: CreateIceCream.LoadIceCream.Request) {
        print("loadIceCream called...")
        let iceCream = IceCream.vanilla
        let response = CreateIceCream.LoadIceCream.Response(iceCream: iceCream)
        presenter?.presentIceCream(response: response)
    }
} 
