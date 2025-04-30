//
//  ViewController.swift
//  Bikki_Exam03
//
//  Created by sai vinay kumar bikki on 4/22/25.
//

import UIKit

class BikkiHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var BikkiTVOL: UITableView!
    var sortedGames: [Game] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Games"
        BikkiTVOL.delegate = self
        BikkiTVOL.dataSource = self
        // Sort games alphabetically by name (handling nil values)
                sortedGames = games.sorted { ($0.name ?? "") < ($1.name ?? "") }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return sortedGames.count
       }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return games.count
//        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BikkiCell", for: indexPath)
                    cell.textLabel?.text = sortedGames[indexPath.row].name
                    return cell
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
               if transition == "BikkiDescriptionSegue" {
                   let destination = segue.destination as! BikkiGameController
                   if let index = BikkiTVOL.indexPathForSelectedRow?.row {
                       destination.game = sortedGames[index]
                   }
               }
        
       // if segue.identifier == "BikkiDescriptionSegue",
         //  let destinationVC = segue.destination as? BikkiGameController,
           //let index = sender as? Int {
            //destinationVC.game = games[index]
        //}
    }
}

