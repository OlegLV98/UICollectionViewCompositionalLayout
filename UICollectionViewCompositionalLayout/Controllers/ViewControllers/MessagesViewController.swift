//
//  MessagesViewController.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import UIKit

final class MessagesViewController: UIViewController {
    private lazy var tableData = MsgTableItem.mockData()
    
    private lazy var viewBehindTable: UIView = {
        .config(view: $0) { view in
            view.backgroundColor = .white
            view.layer.cornerRadius = 30
            view.clipsToBounds = true
        }
    }(UIView())
    private lazy var tableView: UITableView = {
        .config(view: $0) { view in
            view.contentInset = .init(top: 15, left: 0, bottom: 21, right: 0)
            view.register(MsgTableCell.self, forCellReuseIdentifier: "cell")
            view.showsVerticalScrollIndicator = false
            view.dataSource = self
            view.separatorStyle = .none
        }
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewBehindTable)
        viewBehindTable.addSubview(tableView)
        
        setConstraints()
    }
}

extension MessagesViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            viewBehindTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            viewBehindTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            viewBehindTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 189),
            viewBehindTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -227),
            
            tableView.leadingAnchor.constraint(equalTo: viewBehindTable.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: viewBehindTable.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: viewBehindTable.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: viewBehindTable.bottomAnchor)
        ])
    }
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MsgTableCell else {
            return UITableViewCell()
        }
        cell.setupCell(item: tableData[indexPath.row])
        return cell
    }
}
