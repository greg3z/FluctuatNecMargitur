import PlaygroundSupport
import View

let carDetails = CarDetails(brand: "Ferrari", model: "F40", power: "600ch")

let carDetailsViewController = CarDetailsViewController()

//carDetailsViewController.setCar(carDetails)
//carDetailsViewController.setError("Car not found")

PlaygroundPage.current.liveView = carDetailsViewController
