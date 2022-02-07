import UIKit
import PlaygroundSupport

let view = CreateIceCreamView().configure()
view.fetchIceCream()

PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true
