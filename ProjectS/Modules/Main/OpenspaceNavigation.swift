//
//  OpenspaceNavigation.swift
//  ProjectS
//
//  Created by Jeytery on 11.12.2022.
//

import Foundation
import UIKit

class OpenspaceNavigation: UINavigationController {
    init(openspace: Openspace) {
        super.init(nibName: nil, bundle: nil)
        let vc = OpenspaceViewController(openspace: openspace)
        vc.delegate = self
        setViewControllers([vc], animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OpenspaceNavigation: OpenspaceViewControllerDelegate {
    func openspaceViewController(
        _ viewController: OpenspaceViewController,
        didOpen openspace: Openspace
    ) {
        let viewController = OpenspaceViewController(openspace: openspace)
        pushViewController(viewController, animated: true)
    }
}
