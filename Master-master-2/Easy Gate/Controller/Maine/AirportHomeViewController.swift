//
//  AirportHomeViewController.swift
//  Easy Gate
//
//  Created by ameer on 7/15/18.
//  Copyright © 2018 JpJets. All rights reserved.
//

import UIKit

class AirportHomeViewController: UIViewController {
   
   // MARK: - Properites
     var CollectionViewNamesArray = ["Passenger Terminal" , "Cargo Terminal" , "General Aviation" , "General Info" , "Currency Conversion" , "Where To Go"]
    
    // MARK: - IBOutlet
    @IBOutlet weak var AirportHomeColliction: UICollectionView!
   
    // MARK: - IBAction
    @IBAction func Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)}
    
    @IBAction func Home(_ sender: UIButton) {
     let sb = UIStoryboard(name: "Maine", bundle: nil)
     let controller = sb.instantiateViewController(withIdentifier: "Home")
     self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func SkySskyscannercanner(_ sender: AnyObject) {
        if let url = URL(string: "https://www.skyscanner.net") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func FlightRadar(_ sender: UIButton) {
        if let url = URL(string: "https://www.flightradar24.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func Uber(_ sender: UIButton) {
        if let url = URL(string: "https://www.uber.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func News(_ sender: UIButton) {
        if let url = URL(string: "https://www.forbes.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
   // MARK: - ViewLifeCycle
     override func viewDidLoad() {
        super.viewDidLoad()
       AirportHomeColliction.delegate = self
       AirportHomeColliction.dataSource = self
        AirportHomeColliction.isScrollEnabled = false
     }
}

// MARK: - extensions
extension AirportHomeViewController : UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionViewNamesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AirportHomeColliction.dequeueReusableCell(withReuseIdentifier: "AirportHomeCollectionViewCell", for: indexPath) as! AirportHomeCollectionViewCell
       cell.Imge.image = UIImage(named: "Car")
       cell.AirportHomeLabel.text = CollectionViewNamesArray[indexPath.row]
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/3.25 , height: collectionView.frame.size.height / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsetsMake(collectionView.frame.size.height * 0.05,
                                        collectionView.frame.size.width * 0.005,
                                        collectionView.frame.size.height * 0.3,
                                        collectionView.frame.size.width * 0.005) }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.size.height * 0.15 }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let sb = UIStoryboard(name: "Maine", bundle: nil)
        var controller = sb.instantiateViewController(withIdentifier: "PassengerTerminal")
        if indexPath.row == 0 {
            controller = sb.instantiateViewController(withIdentifier: "PassengerTerminal")
        }
        else if indexPath.row == 1 {
            controller = sb.instantiateViewController(withIdentifier: "GeneralAviation")
        }
        else if indexPath.row == 2 {
            controller = sb.instantiateViewController(withIdentifier: "GeneralAviation")
        }
        else if indexPath.row == 3 {
            controller = sb.instantiateViewController(withIdentifier: "GeneralInfo")
        }
        else if indexPath.row == 4 {
            controller = sb.instantiateViewController(withIdentifier: "CurrencyConversion")
        }
        else{
            controller = sb.instantiateViewController(withIdentifier: "TerminalServicesD")
            GlobalManager.sharedInstance.CollictionSelected = "Attraction"
         }//WhereToGo
           self.navigationController?.pushViewController(controller, animated: true)
           GlobalManager.sharedInstance.AirportNameColliction = CollectionViewNamesArray [indexPath.row]
        
         }
}
