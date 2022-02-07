
class CreateIceCreamPresenter {
    var view: CreateIceCreamDisplayLogic?
}

extension CreateIceCreamPresenter: CreateIceCreamPresentationLogic {
    
    func presentIceCream(response: CreateIceCream.LoadIceCream.Response) {
        print("presentIceCream called...")
        let iceCreamInfo = "\(response.iceCream.flavour) flavoured icecream will cost Rs \(String(response.iceCream.price))"
        let viewModel = CreateIceCream.LoadIceCream.ViewModel(iceCreamInfo: iceCreamInfo)
        view?.displayIceCream(viewModel: viewModel)
    }
}

