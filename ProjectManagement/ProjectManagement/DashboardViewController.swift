//
//  ViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-04.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit
import RealmSwift


private let reuseIdentifier = "Cell"

class DashboardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var projectArray : Results<Project>? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // read the data from database when come back from add project and after viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        readData(Project.self, predicate: nil) { (response : Results<Project>) in
            print(response)
            self.projectArray = response
            self.collectionView.reloadData()
            
        }
    }
    
  


}

// configure collection view
extension DashboardViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.projectArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DashboardCollectionViewCell
        cell.nameOfProjectLabel.text = self.projectArray?[indexPath.row].name ?? ""
        
        
        return cell
    }
    
}

