import PlaygroundSupport
import View

let car1 = CarList(brand: "Porsche", model: "911")
let car2 = CarList(brand: "Audi", model: "RS3")
let car3 = CarList(brand: "Mercedes", model: "C63S AMG")

let cars = [car1, car2, car3]

let carsListViewController = CarsListViewController()

//carsListViewController.setCars(cars)
//carsListViewController.setError("Request failed!")
//carsListViewController.setEmpty("No cars")

PlaygroundPage.current.liveView = carsListViewController

