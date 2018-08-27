//
//  PopUpViewController.swift
//  Easy Gate
//
//  Created by ameer on 7/24/18.
//  Copyright © 2018 JpJets. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    // MARK: - Properites
    var filterdArray = [String]()
 var AllAirport = ["Amman" , "Aqaba" , "London" , "Spain" , "Italy" , "Paris" ,"Amman" , "Aqaba" , "London" , "Spain" , "Italy" , "Paris" ,"Amman" , "Aqaba" , "London" , "Spain" , "Italy" , "Paris"]
    
    // MARK: - IBOutlet
     @IBOutlet weak var AllCountrysTableView: UITableView!
     @IBOutlet weak var CountriesSearsh: UISearchBar!
    
    // MARK: - IBOutlet
    @IBAction func Close(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Maine", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "Home")
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    // MARK: - ViewLifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AllCountrysTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllCountrysTableView.dataSource = self
        AllCountrysTableView.delegate = self
        CountriesSearsh.delegate = self
        if filterdArray.count < 0 {
            filterdArray = AllAirport
        }
    }
}

// MARK: - extensions
extension PopUpViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllAirport.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  AllCountrysTableView.frame.size.height / 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AllCountrysPopUpTableViewCell
       cell.CountryName.text = AllAirport[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Maine", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        let unique = Array(Set(AllAirport.filter({$0 == AllAirport[indexPath.row]})))

        controller.filterdArray = unique
        self.navigationController?.pushViewController(controller, animated: false)
//        GlobalManager.sharedInstance.selectedContry = AllAirport[indexPath.row]
        print(select)
    }
}
extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

extension PopUpViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterdArray = AllAirport
        filterdArray = filterdArray.filter({$0.lowercased().contains(searchText.lowercased())})
        
        if searchText.count == 0 {
            filterdArray = AllAirport
            self.AllCountrysTableView.isHidden = true
        } else {
            self.AllCountrysTableView.isHidden = false

        }
        
        filterdArray = filterdArray.sorted(by: {$0 < $1})
        AllCountrysTableView.reloadData()
    }
}
