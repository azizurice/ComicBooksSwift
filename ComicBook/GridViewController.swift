//
//  SecondViewController.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    var apps = TIBApps.getAllApps()
    let detailSegueIdentifier="ShowDetailSegue"
    var passCharacter = ComicCharacter(title: "Headsup ", detail: "Beginner Detail", imageName: "1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
       // collectionView.estimatedRowHeight = 165
        ///collectionView.rowHeight = UITableViewAutomaticDimension
        
    }
}
extension GridViewController : UICollectionViewDataSource,UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! AppCollectionViewCell
       
       // cell.backgroundColor = UIColor.red
        
        let app = apps[indexPath.row]
        
        
        cell.appImageView.image = UIImage(named: app.imageName)
        cell.appLabelView.text = app.title
        
        
        return cell
    }
    

    
    // MARK:- Selected Cell IndexPath
    
    func getIndexPathForSelectedCell() -> IndexPath? {
        
        var indexPath:IndexPath?
        
        if collectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = collectionView.indexPathsForSelectedItems![0]
        }
        return indexPath
    }
    
    // MARK:- prepareForSegue
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        // retrieve selected cell & fruit
//        
//        if let indexPath = getIndexPathForSelectedCell() {
//            let app = apps[indexPath.row]
//            if (segue.identifier == detailSegueIdentifier) {
//                print("The width of someResolution is \(app.detail)")
//                //    let nav=segue.destination as! UINavigationController
//             
//                let detailViewController = segue.destination as! DetailViewController
//                // Pass on the data to the Detail ViewController by setting it's indexPathRow value
//                
//                detailViewController.app = app
//            }
//      }
//    }
}
