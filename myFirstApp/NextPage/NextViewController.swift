//
//  NextViewController.swift
//  myFirstApp
//
//  Created by Sind Bad on 13.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//


import UIKit
import Alamofire

class NextViewController:
UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var data: [String] = []
    
    var covids: [Covid] = []
    
    let endpointUrl = "https://covid-193.p.rapidapi.com/statistics"
    
    let headers = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "965c8acedfmsh584d18dcd8c1004p121fd9jsnd4188fc670fb"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibFirst = UINib (nibName: "CovidCell", bundle: nil)
        tableView.register(nibFirst, forCellReuseIdentifier: "covid")
        let nibSecond = UINib (nibName: "CovidCellTotal", bundle: nil)
        tableView.register(nibSecond, forCellReuseIdentifier: "covidTotal")
        
    }
    
    // получение данных
    func getData() {
        
        let headers = HTTPHeaders(self.headers)
        
        // предыдущий способ принимал в себя JSON, а этот кушает сырую Data, поэтому меняем на responseData
        
        AF.request(endpointUrl, method: .get, headers: headers).responseData { responseData in
            
            switch responseData.result {
                
                
                
            case .success(let value):
                
                // парсинг  всего объекта response
                
                let response: Response = try! JSONDecoder().decode(Response.self, from: value)
                
                // достаем из ответа массив коронавирусных стран и приравниваем к нашему пустому
                
                self.covids = response.covids
                
                // сортируем страны по убыванию смертей
                
                self.covids.sort { (one, two) -> Bool in
                    one.deaths.total > two.deaths.total
                }
                
                // перезагружаем таблицу
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // сеттим количество секций
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // сеттим количество ячеек
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covids.count
    }
    
    // наполнение ячейки данными
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "covid")! as! CovidCell
            
            cell.labelOne.text = covids[indexPath.row].country
            cell.imageTwo.text = String(covids[indexPath.row].deaths.total)
            cell.myImageView.image = UIImage(ciImage: .blue)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "covidTotal")! as! CovidCellTotal
            
            cell.labelOne.text = String(covids[indexPath.row].cases.recovered)
            return cell
        }
        
    }
    
}





