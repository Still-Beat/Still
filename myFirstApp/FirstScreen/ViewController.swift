//
//  ViewController.swift
//  myFirstApp
//
//  Created by Sind Bad on 02.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FirstViewModelDelegate {
    func CountBechanges() {
        MyLabel.text = String(model.count)
    }
    
    
    
    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var MyButton: UIButton!
    @IBOutlet weak var ButtonReset: UIButton!
    @IBOutlet weak var ButtonAddition: UIButton!
    @IBOutlet weak var ButtonNextPage: UIButton!

    let model = FirstViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToNextVc" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.сount = model.count
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        model.delegate = self
        MyLabel.text = String(model.count)
        configureUI()
    }
    func configureUI(){
        
        MyLabel.textColor = .black
        MyLabel.font = .systemFont(ofSize: 30)
        MyButton.setTitle("+", for: .normal)
        MyButton.setTitleColor(.black, for: .normal)
        MyButton.titleLabel?.font = .systemFont(ofSize: 30)
        MyButton.layer.cornerRadius = 20
        MyButton.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        ButtonReset.setTitle("Reset", for: .normal)
        ButtonReset.setTitleColor(.black, for: .normal)
        ButtonReset.layer.cornerRadius = 20
        ButtonReset.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        ButtonReset.titleLabel?.font = .systemFont(ofSize: 30)
        ButtonAddition.setTitle("-", for: .normal)
        ButtonAddition.setTitleColor(.black, for: .normal)
        ButtonAddition.layer.cornerRadius = 20
        ButtonAddition.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        ButtonAddition.titleLabel?.font = .systemFont(ofSize: 30)
        ButtonNextPage.setTitle("Go to next VC", for: .normal)
    ButtonNextPage.setTitleColor(.black, for: .normal)
        ButtonNextPage.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        ButtonNextPage.layer.cornerRadius = 20
        ButtonNextPage.titleLabel?.font = .systemFont(ofSize: 30)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func MyButtonAction(_ sender: Any) {
        model.plusOne()
    }
    @IBAction func ButtonResetAction(_ sender: Any) {
        model.reset()
    }
    
    @IBAction func ButtonAdditionAction(_ sender: Any) {
        model.minusOne()
        
    }
}
