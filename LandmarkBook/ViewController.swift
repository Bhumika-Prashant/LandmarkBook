//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Bhumika Hirapara on 2/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        Landmark Book Data
        
         landMarkNames = ["Colosseum", "Great-Wall-of-China", "Kremlin", "Stonehenge", "TajMahal"]
         landMarkImages = [#imageLiteral(resourceName: "Colosseum"), #imageLiteral(resourceName: "Great-Wall-of-China"), #imageLiteral(resourceName: "Kremlin"), #imageLiteral(resourceName: "Stonehenge"), #imageLiteral(resourceName: "TajMahal")]
        
        
//        landMarkNames.append("Colosseum")
//        landMarkNames.append("Great-Wall-of-China")
//        landMarkNames.append("Kremlin")
//        landMarkNames.append("Stonehenge")
//        landMarkNames.append("TajMahal")
//
//        landMarkImages.append(UIImage(named: "Colosseum")!)
//        landMarkImages.append(UIImage(named: "Great-Wall-of-China")!)
//        landMarkImages.append(UIImage(named: "Kremlin")!)
//        landMarkImages.append(UIImage(named: "Stonehenge")!)
//        landMarkImages.append(UIImage(named: "TajMahal")!)
        
    }

}
    
//  MARK: - TableView Delegate and Datasource Methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = landMarkNames[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            landMarkNames.remove(at: indexPath.row)     // delete data from Arrays
//            landMarkImages.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
//       UIContextualAction -> an action to display when the user swipes table row
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
            self.landMarkNames.remove(at: indexPath.row)     // delete data from Arrays
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)  // delete tableview row
        }
        
        let swipeActionsConfigurations = UISwipeActionsConfiguration(actions: [delete])
        return swipeActionsConfigurations
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            
            let destinationVC = segue.destination as! ImageViewController
            
            destinationVC.selectedLandMarkName = chosenLandMarkName
            destinationVC.selectedLandMarkImage = chosenLandMarkImage
        }
    }
}
