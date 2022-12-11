//
//  RootViewController.swift
//  ProjectS
//
//  Created by Jeytery on 28.11.2022.
//

import Foundation
import UIKit
import Eureka
import SnapKit
import Lister

class RootViewController: UIViewController {
    private let lister = Lister(frame: .zero, style: .plain)
    private let postsVC = PostsViewController()
        
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemBackground
        title = "Swiftonica"
        
        view.addSubview(lister)
        lister.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        postsVC.view.backgroundColor = .red
        
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .medium
        button.setTitle("iOS Internet Map", for: .normal)
        
        lister.set([
            .init(rows: [
                .init(
                    view: postsVC.view,
                    height: 300,
                    edges: nil,
                    action: nil),
                .init(
                    view: button,
                    height: 80,
                    edges: .init(top: 20, left: 20, bottom: 0, right: 20)
                )
            ],
            header: "На повестке",
            footer: nil),
            .init(
                rows: [
                ],
                header: "Темы",
                footer: nil)
        ])
        
        lister.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
