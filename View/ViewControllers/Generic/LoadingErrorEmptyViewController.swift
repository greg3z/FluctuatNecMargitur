//
//  LoadingErrorEmptyViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 08/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public class LoadingErrorEmptyViewController: LoadingErrorViewController {

    public func setEmpty(_ emptyMessage: String) {
        let emptyViewController = EmptyViewController(emptyMessage: emptyMessage)
        containerViewController.setViewController(emptyViewController)
    }

}
