import UIKit
import CoreGraphics

public class CreateIceCreamView: UIView {
    public var interactor: CreateIceCreamBusinessLogic?
    
    public func fetchIceCream() {
        print("fetchIceCream called...")
        let request = CreateIceCream.LoadIceCream.Request()
        interactor?.loadIceCream(request: request)
    }
    
    public init() {
        super.init(frame: .init(origin: .init(x: 0, y: 0), size: .init(width: 200, height: 200)))
        configureSubViews()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func configureSubViews() {
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func update(icecreamInfo: String) {
        label.text = icecreamInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreateIceCreamView: CreateIceCreamDisplayLogic {
    
    public func displayIceCream(viewModel: CreateIceCream.LoadIceCream.ViewModel) {
        //Update UI
        print("displayIceCream called...")
        update(icecreamInfo: viewModel.iceCreamInfo)
    }
}

public extension CreateIceCreamView {
    
    func configure() -> Self {
        print("configure called...")
        let view = self
        let interactor = CreateIceCreamInteractor()
        let presenter = CreateIceCreamPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
