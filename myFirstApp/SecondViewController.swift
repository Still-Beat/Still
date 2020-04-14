//
//  SecondViewController.swift
//  myFirstApp
//
//  Created by Sind Bad on 09.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var ButtonNextPage: UIButton!
    
    var сount = 0

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        Label2.text = String(сount)
        Label2.font = .systemFont(ofSize: 40)
        Label2.textColor = .black
        
        ButtonNextPage.setTitle("Next", for: .normal)
        ButtonNextPage.setTitleColor(.black, for: .normal)
        ButtonNextPage.titleLabel?.font = .systemFont(ofSize: 30)
        ButtonNextPage.layer.cornerRadius = 20
        ButtonNextPage.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
 
    }
        
        
        // Do any additional setup after loading the view.


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
