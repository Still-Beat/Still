//
//  NextViewController.swift
//  myFirstApp
//
//  Created by Sind Bad on 13.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//


import UIKit

class NextViewController:
UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...1000 {
            data.append("\(i)")
        }
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse")!
        let text = data [indexPath.row]
        cell.textLabel?.text = text 
        return cell
    }
}

