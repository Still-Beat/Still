//
//  NextViewController.swift
//  myFirstApp
//
//  Created by Sind Bad on 13.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//


import UIKit

class NextViewController:
UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var data: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...1000 {
            data.append("\(i)")
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertController = UIAlertController (title: "Alert ", message: "You choose row \(indexPath.row)", preferredStyle: .alert)
        let alertAction =  UIAlertAction (title: "Ok", style:  .cancel, handler: nil)
        alertController.addAction(alertAction)
         present(alertController, animated: true, completion: nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse")! as! CustomTableViewCell
        
        let text = data[indexPath.row]
        if indexPath.row % 2 == 0 {
        cell.contentView.backgroundColor = .blue
        }
        else {
            cell.contentView.backgroundColor = .lightGray
        }
        
        cell.label.text = text
         return cell
}
}
