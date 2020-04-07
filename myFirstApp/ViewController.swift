//
//  ViewController.swift
//  myFirstApp
//
//  Created by Sind Bad on 02.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var MyButton: UIButton!
    @IBOutlet weak var ButtonReset: UIButton!
    @IBOutlet weak var ButtonAddition: UIButton!
    var Count = 0
    var Plus = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        MyLabel.text = String(Count)
        MyButton.setTitle("+", for: .normal)
        MyButton.setTitleColor(.black, for: .normal)
        MyButton.layer.cornerRadius = 20
        MyButton.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 37/255, alpha: 1)
        ButtonReset.setTitle("Reset", for: .normal)
        ButtonReset.setTitleColor(.black, for: .normal)
        ButtonReset.layer.cornerRadius = 20
        ButtonReset.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 37/255, alpha: 1)
        ButtonAddition.setTitle("-", for: .normal)
        ButtonAddition.setTitleColor(.black, for: .normal)
        ButtonAddition.layer.cornerRadius = 20
        ButtonAddition.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 37/255, alpha: 1)
        if Count > 0 { Count = Count - 1}
        
        // Do any additional setup after loading the view.
    }

    @IBAction func MyButtonAction(_ sender: Any) {
       Count += 1
       MyLabel.text = String(Count)
       MyButton.backgroundColor = (UIColor .red)
    }
    @IBAction func ButtonResetAction(_ sender: Any) {
        Count = 0
        MyLabel.text = String(Count)
    }
    
    @IBAction func ButtonAdditionAction(_ sender: Any) {
        if Count > 0 {
        Count = Count - 1
            MyLabel.text = String(Count) }
        
    }
}
