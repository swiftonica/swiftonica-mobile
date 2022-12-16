//
//  FullscreenLoadingViewController.swift
//  ProjectS
//
//  Created by Jeytery on 16.12.2022.
//

import Foundation
import UIKit

class FullscreenLoadingViewController: UIViewController {
    private let spinner = UIActivityIndicatorView(style: .large)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FullscreenLoadingViewController {
    func hide(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3) {
            [weak view] in
            view?.alpha = 0
        } completion: {
            _ in
            completion()
        }
    }
}
