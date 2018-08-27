//
//  AttractionItemsItemsViewController.swift
//  Easy Gate
//
//  Created by ameer on 8/5/18.
//  Copyright © 2018 JpJets. All rights reserved.
//

import UIKit

class AttractionItemsItemsViewController: UIViewController  {
    
    // MARK: - Properites
     var   saliderImagesObj = ["q" , "Car" , "5918348-image"  , "q" , "Car" , "5918348-image" , "q" , "Car" , "5918348-image"  , "q" , "Car" , "5918348-image" , "Car" , "5918348-image"  , "q" , "Car" , "5918348-image" , "q" , "Car" , "5918348-image"  , "q" , "Car" , "5918348-image" ]
    var a: MainDealsViewPager!
    var ratingValue = 1.5
    
     // MARK: - IBOutlet
     @IBOutlet weak var ImagesCollectionView: UICollectionView!
     @IBOutlet weak var rating: UIView!
     @IBOutlet weak var ratingHight: NSLayoutConstraint!
     @IBOutlet weak var ratingImgOme: UIImageView!
     @IBOutlet weak var ratingImgTwo: UIImageView!
     @IBOutlet weak var ratingImgthree: UIImageView!
     @IBOutlet weak var ratingImgFour: UIImageView!
     @IBOutlet weak var ratingImgFive: UIImageView!
    
     // MARK: - IBAction
    @IBAction func Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)}
    
    @IBAction func Home(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Maine", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "Home")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
  // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ImagesCollectionView.delegate = self
        ImagesCollectionView.dataSource = self
       // ratingHight.constant = 1
        rating.frame.size.height  =  rating.frame.size.height * 0.0001
        setRating()
    }
    
    // MARK: - function
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        a = segue.destination as! MainDealsViewPager
    }
    //Star-Full , star_empty  , star-half-full
    
}

// MARK: - extensions
extension AttractionItemsItemsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UIGestureRecognizerDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saliderImagesObj.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "ImagsCollectionViewCell", for: indexPath) as! ImagsCollectionViewCell
        cell.CollectionImage.image = UIImage(named: saliderImagesObj[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/5, height: collectionView.frame.size.height / 1.3 ) }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        (a as MainDealsViewPager).viewPager?.scrollToPage(index: indexPath.row + 1)
     
        
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0,
                                10,
                                0,
                                0) }}

extension AttractionItemsItemsViewController {
    func setRating(){
        if ratingValue == 1 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image = #imageLiteral(resourceName: "star_empty")
            ratingImgthree.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFour.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 2 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFour.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 3 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFour.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 4 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFour.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 5 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFour.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFive.image = #imageLiteral(resourceName: "Star-Full")
        }
        else if ratingValue == 0.5 {
            ratingImgOme.image = #imageLiteral(resourceName: "star-half-full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "star_empty")
            ratingImgthree.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFour.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 1.5 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "star-half-full")
            ratingImgthree.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFour.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 2.5 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "star-half-full")
            ratingImgFour.image = #imageLiteral(resourceName: "star_empty")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 3.5 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFour.image = #imageLiteral(resourceName: "star-half-full")
            ratingImgFive.image = #imageLiteral(resourceName: "star_empty")
        }
        else if ratingValue == 4.5 {
            ratingImgOme.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgTwo.image =  #imageLiteral(resourceName: "Star-Full")
            ratingImgthree.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFour.image = #imageLiteral(resourceName: "Star-Full")
            ratingImgFive.image = #imageLiteral(resourceName: "star-half-full")
        }
    }
}
