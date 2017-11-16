//
//  SongsViewController.swift
//  CodableExercises
//
//  Created by Luis Calle on 11/16/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDelegate {

    var allSongs = [Song]()
    @IBOutlet weak var songsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.songsTableView.delegate = self
        self.songsTableView.dataSource = self
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "songsdata", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let songs = try myDecoder.decode([Song].self, from: data)
                    self.allSongs = songs
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

extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songCell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        let selectedSong = allSongs[indexPath.row]
        songCell.textLabel?.text = selectedSong.song_name
        songCell.detailTextLabel?.text = selectedSong.display_artist
        return songCell
    }
}
