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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertController = UIAlertController (title: "Alert ", message: "You choose row \(indexPath.row)", preferredStyle: .alert)
        let alertAction =  UIAlertAction (title: "Ok", style:  .cancel, handler: nil)
        alertController.addAction(alertAction)
         present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    func getData() {
        
        let headers = HTTPHeaders(self.headers)
        
        AF.request(endpointUrl, method: .get, headers: headers).responseJSON { responseJSON in
            
            switch responseJSON.result {
                
            case .success(let value):
                
                print(value)
            
                let response = value as! NSDictionary
                
                
                let country = response.object(forKey: "response")
                
                
                guard let jsonArray = country as? [[String: Any]] else { return }
                
                for jsonObject in jsonArray {
                    let covid = Covid(json: jsonObject)
                    self.covids.append(covid!)
                }
                self.covids.sort { (one, two) -> Bool in
                    one.deaths > two.deaths
                }
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "covid")! as! CovidCell
            
            cell.labelOne.text = covids[indexPath.row].country
            cell.imageTwo.text = String(covids[indexPath.row].deaths)
            cell.myImageView.image = #imageLiteral(resourceName: "41766-kosmos-lyuk_skajuoker-robot-shturmovik-star_wars_battlefront_ii-360x780")
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "covidTotal")! as! CovidCellTotal
            
            cell.labelOne.text = String(covids[indexPath.row].recovered)
            return cell
        }
        

    
}

struct Covid {

    var country: String
    var day: String
    var deaths : Int
    var recovered : Int
    

    init?(json: [String: Any]) {
        guard
            let country = json["country"] as? String,
            let day = json["day"] as? String,
            let recovered = json["recovered"] as? Int,
            let deaths = json["deaths"] as? [String: Any],
            let total = deaths["total"] as? Int
            
        else {
            return nil
        }
        self.country = country
        self.day = day
        self.deaths = total
        self.recovered = recovered
    }

    static func getArray(from jsonArray: Any) -> [Covid]? {

        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        var covids: [Covid] = []

        for jsonObject in jsonArray {
            if let covid = Covid(json: jsonObject) {
                covids.append(covid)
            }
        }
        return covids
    }
 
}

}
