//
//  WrappedOpenspaceViewController.swift
//  ProjectS
//
//  Created by Jeytery on 16.12.2022.
//

import Foundation
import UIKit

class WrappedOpenspaceViewController: UIViewController {
    
    var delegate: OpenspaceViewControllerDelegate? {
        get {
            return openspaceViewController.delegate
        }
        set(newValue) {
            openspaceViewController.delegate = newValue
        }
    }
    
    init(wrappedOpenspace: WrappedOpenspace) {
        self.openspaceRepository = OpenscapeRepository(wrappedOpenspace: wrappedOpenspace)
        super.init(nibName: nil, bundle: nil)
        
        addLoader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isAppeared { return }
        isAppeared = true
        
        openspaceRepository.openspace {
            [self] openspace in
            
            fullscreenLoaderViewController.hide {
                fullscreenLoaderViewController.removeFromParent()
                fullscreenLoaderViewController.view.removeFromSuperview()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let fullscreenLoaderViewController = FullscreenLoadingViewController()
    private let openspaceRepository: OpenscapeRepository
    
    private var openspaceViewController: OpenspaceViewController!
    private var isAppeared = false
}

private extension WrappedOpenspaceViewController {
    func addLoader() {
        self.view.addSubview(fullscreenLoaderViewController.view)
        self.addChild(fullscreenLoaderViewController)
        fullscreenLoaderViewController.didMove(toParent: self)
        fullscreenLoaderViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
