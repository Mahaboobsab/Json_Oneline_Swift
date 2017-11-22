//
//  ViewController.swift
//  JsonOneLine
//
//  Created by Mahaboobsab Nadaf on 22/11/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

import UIKit



struct Country : Decodable {
    let name : String
    let capital : String
    let region :  String
    let population : Int
    let borders: [String]
    
}


class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var myTableView: UITableView!
    
    var countries = [Country]()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonURL = "https://restcountries.eu/rest/v2/all"
        
        let url = URL(string : jsonURL)
        
        URLSession.shared.dataTask(with: url!){(data, response, error)in
            
           
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for eachCountry in self.countries{
                    
                    print(eachCountry.name + " : " + eachCountry.capital + " : " + eachCountry.region)
                    
                    
                    
                }
                
                
                print(self.countries[0].borders[1])
                
              DispatchQueue.main.async {
                    
                     self.myTableView.reloadData()
                    
                }
                
               
            }
            catch{
                

                
                
                print("Error : \(error.localizedDescription)")
            }
            
        }.resume()
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.countries.count
        
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        
       
        
        cell.textLabel?.text = self.countries[indexPath.row].name
        cell.detailTextLabel?.text = self.countries[indexPath.row].capital
        
        
        
        return cell
        
    }
}

