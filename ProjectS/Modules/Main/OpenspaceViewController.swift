//
//  OpenspaceViewController.swift
//  ProjectS
//
//  Created by Jeytery on 10.12.2022.
//

import Foundation
import UIKit

protocol OpenspaceViewControllerDelegate: AnyObject {
    func openspaceViewController(
        _ viewController: OpenspaceViewController,
        didOpen openspace: Openspace
    )
}

class OpenspaceViewController: UIViewController {
    
    weak var delegate: OpenspaceViewControllerDelegate?
    
    init(openspace: Openspace) {
        self.openspace = openspace
        super.init(nibName: nil, bundle: nil)
        orderedThemes = OrderedThemes(themes: openspace.themes ?? [])
        configureTableView()
        configureViewController(title: openspace.name)
        
        API().getSwitonica() { value in }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let openspace: Openspace
    private var orderedThemes: OrderedThemes!
}

private extension OpenspaceViewController {
    func configureViewController(title: String) {
        self.title = title
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell")
    }
}

extension OpenspaceViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return orderedThemes.arrays.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return orderedThemes.arrays[section].count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        cell.textLabel?.text = orderedThemes.arrays[indexPath.section][indexPath.row].title
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print(orderedThemes.arrays[indexPath.section][indexPath.row].title)
        let theme = orderedThemes.arrays[indexPath.section][indexPath.row]
        let content = theme.content
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return orderedThemes.kindName(by: section)
    }
}
