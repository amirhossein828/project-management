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
    var selectedProject : Project? = nil

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
        let numberOfToDo = self.projectArray?[indexPath.row].calculateNumberOfToDoInProgressDoneTasks()[0]
        cell.toDoLabel.text = String(numberOfToDo!)
        let numberOfInProgress = self.projectArray?[indexPath.row].calculateNumberOfToDoInProgressDoneTasks()[1]
        cell.inProgressLabel.text = String(numberOfInProgress!)
        let numberOfDone = self.projectArray?[indexPath.row].calculateNumberOfToDoInProgressDoneTasks()[2]
        cell.doneLabel.text = String(numberOfDone!)
        cell.timeLeftToDueDate.text = String((self.projectArray?[indexPath.row].timeToFinish()[0])!)
        cell.dayLeft.text = String((self.projectArray?[indexPath.row].timeToFinish()[1])!)
        cell.progressBar.progress = Double((self.projectArray?[indexPath.row].projectProgress())!)
        cell.delegate = self
        cell.setIndexPath(withIndex: indexPath)
        return cell
    }
    
    // selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedProject = self.projectArray?[indexPath.row]
        performSegue(withIdentifier: "godetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "godetail" {
            let vc = segue.destination as! DetailViewController
            vc.projectFromDashboard = self.selectedProject
        }
    }
 
}

// extension for conforming to DashboardCellDelegate protocol
extension DashboardViewController : DashboardCellDelegate {
    // method for deleting cell from collection view
    func deleteCell(withIndexPath index : IndexPath){
        print(index.row)
        // delete form database
        deleteFromDatadase((self.projectArray?[index.row])!)
        // delete from collection view
        collectionView.deleteItems(at: [index])
    }
}

