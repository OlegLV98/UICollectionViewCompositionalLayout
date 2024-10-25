//
//  ProfileViewController.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController {

    private lazy var profileData = ProfileItem.mockData()
    
    private lazy var editButton: UIButton = {
        .config(view: $0) { view in
            view.setTitle("Edit", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
            view.setTitleColor(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1), for: .normal)
            view.widthAnchor.constraint(equalToConstant: 50).isActive = true
            view.heightAnchor.constraint(equalToConstant: 17).isActive = true
        }
    }(UIButton())
    
    private lazy var avaImageView: UIImageView = {
        .config(view: $0) { [weak self] view in
            view.backgroundColor = .white
            view.image = UIImage(named: self?.profileData.ava ?? "") ?? UIImage(systemName: "person.crop.circle.fill")
            view.contentMode = .scaleAspectFill
            view.layer.cornerRadius = 80
            view.widthAnchor.constraint(equalToConstant: 160).isActive = true
            view.heightAnchor.constraint(equalToConstant: 160).isActive = true
            view.clipsToBounds = true
        }
    }(UIImageView())
    
    private lazy var nameLabel = AppUI.createLabel(text: profileData.name,
                                                   font: .systemFont(ofSize: 30, weight: .heavy), textAlignment: .center)

    private lazy var nickLabel = AppUI.createLabel(text: "@" + profileData.nickName,
                                                   font: .systemFont(ofSize: 16, weight: .light),
                                                   textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), textAlignment: .center)
    
    private func buttonConfig() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "camera.fill")
        config.baseForegroundColor = .white
        config.contentInsets = .init(top: 7, leading: 7, bottom: 7, trailing: 7)
        return config
    }
    
    private lazy var cameraButton: UIButton = {
        .config(view: $0) { view in
            view.clipsToBounds = true
            view.backgroundColor = #colorLiteral(red: 0.2470729053, green: 0.9990244508, blue: 0.6703470945, alpha: 1)
            view.widthAnchor.constraint(equalToConstant: 40).isActive = true
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
            view.layer.cornerRadius = 20
        }
    }(UIButton(configuration: buttonConfig()))
    
    private lazy var tableView: UITableView = {
        .config(view: $0) { view in
            view.showsVerticalScrollIndicator = false
            view.register(ProfileTableCell.self, forCellReuseIdentifier: "cell")
            view.bouncesVertically = false
            view.separatorStyle = .none
            view.dataSource = self
        }
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [editButton, avaImageView, cameraButton, nameLabel, nickLabel, tableView].forEach {
            view.addSubview($0)
        }
        setConstraints()
    }
}


extension ProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            avaImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            avaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraButton.trailingAnchor.constraint(equalTo: avaImageView.trailingAnchor),
            cameraButton.bottomAnchor.constraint(equalTo: avaImageView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avaImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            nickLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileData.profileData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(info: profileData.profileData[indexPath.row].info, data: profileData.profileData[indexPath.row].data)
        return cell
    }
}
