//
//  WishStoringViewController.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 06.02.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    public static var wishArray: [String] = UserDefaults.standard.array(forKey: "key") as? [String] ?? []
    private let table: UITableView = UITableView()
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        view.backgroundColor = WishMakerViewController.accentColor
        WishStoringViewController.wishArray = defaults.array(forKey: "key") as? [String] ?? []
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .white
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = 25
        table.rowHeight = 70
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
        
        table.pin(to: view, 25)
    }
}

extension WishStoringViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return WishStoringViewController.wishArray.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: AddWishCell.reuseId,
                for: indexPath
            )
            
            guard let wishCell = cell as? AddWishCell else { return cell }
            wishCell.configure { wish in
                if wish.isEmpty {
                    return
                }
                else {
                    WishStoringViewController.wishArray.append(wish)
                    self.table.reloadData()
                    self.defaults.set(WishStoringViewController.wishArray, forKey: "key")
                }
            }
            return wishCell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: WishStoringViewController.wishArray[indexPath.row])
            return wishCell
        }
       
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.section != 0 {
            WishStoringViewController.wishArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            table.reloadData()
            defaults.set(WishStoringViewController.wishArray, forKey: "key")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
}
