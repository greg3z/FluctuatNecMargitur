//
//  CarsTableViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 02/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class CarsTableViewController: UITableViewController {

    public enum Callback {
        case carSelected(CarList)
    }
    public var callback: ((Callback) -> Void)?

    private let cars: [CarList]

    public init(cars: [CarList]) {
        self.cars = cars
        super.init(style: .plain)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

}

extension CarsTableViewController {

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = cars[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = car.brand
        cell.detailTextLabel?.text = car.model
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        callback?(.carSelected(car))
    }

}
