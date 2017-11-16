//
//  CitiesWeatherViewController.swift
//  CodableExercises
//
//  Created by Luis Calle on 11/16/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class CitiesWeatherViewController: UIViewController, UITableViewDelegate {

    var allCities = [City]()
    @IBOutlet weak var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.citiesTableView.delegate = self
        self.citiesTableView.dataSource = self
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "citiesweatherinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let cities = try myDecoder.decode([City].self, from: data)
                    self.allCities = cities
                }
                catch let error {
                    print(error)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CitiesWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: "City Cell", for: indexPath)
        let selectedCity = allCities[indexPath.row]
        cityCell.textLabel?.text = selectedCity.name
        cityCell.detailTextLabel?.text = selectedCity.main.temp.description
        return cityCell
    }
}
