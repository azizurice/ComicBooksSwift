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

    
    let detailSegueIdentifier="ShowDetailSegue"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comic Book"
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
        return DataSource.characters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! AppCollectionViewCell
        
        let comicDetails = DataSource.characters[indexPath.row]
        
        cell.app = comicDetails
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // retrieve selected cell & fruit
        
        if let indexPath = getIndexPathForSelectedCell() {
           
            let app = DataSource.characters[(indexPath.row)]
            let detailViewController = segue.destination as! DetailViewController
                // Pass on the data to the Detail ViewController by setting it's indexPathRow value
                
                detailViewController.app = app
            }
      }
    
}
