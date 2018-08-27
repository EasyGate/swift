//
//  FromePopUpViewController.swift
//  Easy Gate
//
//  Created by ameer on 8/1/18.
//  Copyright © 2018 JpJets. All rights reserved.
//

import UIKit

class FromePopUpViewController: UIViewController {

    // MARK: - Properites
    var AllAirport = ["Amman" , "Aqaba" , "London" , "Spain" , "Italy" , "Paris" ,"Amman" , "Aqaba" , "London" , "Spain" , "Italy" , "Paris" ,"Amman" , "Aqaba" , "London" , "Spain" , "Italy" , "Paris"]
    
    // MARK: - IBOutlet
    @IBOutlet weak var FromePopUpTableView: UITableView!
    
     // MARK: - IBAction
    @IBAction func Back(_ sender: UIButton) {
      self.navigationController?.popViewController(animated: false)}
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        FromePopUpTableView.dataSource = self
        FromePopUpTableView.delegate = self
    }
}

// MARK: - extensions
extension FromePopUpViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllAirport.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  FromePopUpTableView.frame.size.height / 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FromTableViewCell
        cell.FromCurrencyType.text = AllAirport[indexPath.row]
        return cell
    }
}
