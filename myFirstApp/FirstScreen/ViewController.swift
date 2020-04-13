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
        myLabel.text = String(model.count)
    }
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonAddition: UIButton!
    @IBOutlet weak var buttonNextPage: UIButton!
    
    let model = FirstViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        model.delegate = self
        myLabel.text = String(model.count)
        configureUI()
    }
    
    func configureUI(){
        
        myLabel.textColor = .black
        myLabel.font = .systemFont(ofSize: 30)
        
        myButton.setTitle("+", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        myButton.titleLabel?.font = .systemFont(ofSize: 30)
        myButton.layer.cornerRadius = 20
        myButton.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        
        buttonReset.setTitle("Reset", for: .normal)
        buttonReset.setTitleColor(.black, for: .normal)
        buttonReset.layer.cornerRadius = 20
        buttonReset.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        buttonReset.titleLabel?.font = .systemFont(ofSize: 30)
        
        buttonAddition.setTitle("-", for: .normal)
        buttonAddition.setTitleColor(.black, for: .normal)
        buttonAddition.layer.cornerRadius = 20
        buttonAddition.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        buttonAddition.titleLabel?.font = .systemFont(ofSize: 30)
        
        buttonNextPage.setTitle("Go to next VC", for: .normal)
        buttonNextPage.setTitleColor(.black, for: .normal)
        buttonNextPage.backgroundColor = UIColor(red: 88/255, green: 195/255, blue: 237/255, alpha: 1)
        buttonNextPage.layer.cornerRadius = 20
        buttonNextPage.titleLabel?.font = .systemFont(ofSize: 30)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToNextVc" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.сount = model.count
            }
        }
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
