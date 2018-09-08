import PlaygroundSupport
import View

let loginViewController = LoginViewController()

loginViewController.buttonTappedCallback = { print($0) }

PlaygroundPage.current.liveView = loginViewController

