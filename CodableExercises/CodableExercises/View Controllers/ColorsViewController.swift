//
//  ColorsViewController.swift
//  CodableExercises
//
//  Created by Luis Calle on 11/16/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate {

    var schemeColors = [Color]()
    @IBOutlet weak var colorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorTableView.delegate = self
        self.colorTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "colorsinfo", ofType: "json") else { return }
        let myURL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: myURL) else { return }
        let myDecoder = JSONDecoder()
        guard let myScheme = try? myDecoder.decode(ColorScheme.self, from: data) else { return }
        self.schemeColors = myScheme.colors
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

extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schemeColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorCell = tableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        let selectedColor = schemeColors[indexPath.row]
        colorCell.textLabel?.text = selectedColor.name.value
        colorCell.detailTextLabel?.text = selectedColor.rgb.fraction.r.description + " " + selectedColor.rgb.fraction.g.description + " " + selectedColor.rgb.fraction.b.description
        return colorCell
    }
}
