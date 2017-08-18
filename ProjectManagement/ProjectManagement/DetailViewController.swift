//
//  DetailViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-07.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var toDoView: UIView!
    @IBOutlet weak var doneView: UIView!
    @IBOutlet weak var inProgressView: UIView!
    
    //MARK: - Properties
    var projectFromDashboard : Project? = nil
    var segmentedNumber : Int? = nil

    // Action : segmented control to go between container view controllers
    @IBAction func changeContainerViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // show the toDo view controller
            UIView.animate(withDuration: 0.5, animations: {
                self.showViewContainer(withName: self.toDoView)
            })
            self.segmentedNumber = 0
            // show inprogressViewController
        } else if sender.selectedSegmentIndex == 1 {
            inistantiateContainerView(withNumberInArray: 1)
            UIView.animate(withDuration: 0.5, animations: {
                self.showViewContainer(withName: self.inProgressView)
            })
            self.segmentedNumber = 1
            // show doneViewController
        }else {
            inistantiateContainerView(withNumberInArray: 2)
            UIView.animate(withDuration: 0.5, animations: {
                self.showViewContainer(withName: self.doneView)
            })
            self.segmentedNumber = 2
        }
    }

    @IBAction func updateButton(_ sender: UIBarButtonItem) {
        let updateViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddProject") as! AddProjectViewController
        updateViewController.projectFromUpdate = projectFromDashboard
        let objNav = UINavigationController(rootViewController: updateViewController)
        self.present(objNav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewFields()
    }
    
    // set the fields in the page 
    func setViewFields() {
        self.projectName.text = self.projectFromDashboard?.name
        // instantiate each view controller
        inistantiateContainerView(withNumberInArray: 0)
        inistantiateContainerView(withNumberInArray: 1)
        inistantiateContainerView(withNumberInArray: 2)
        if let segmentedNo = self.segmentedNumber {
            if segmentedNo == 0 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.showViewContainer(withName: self.toDoView)
                })
                
            }else if segmentedNo == 1 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.showViewContainer(withName: self.inProgressView)
                })
            }else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.showViewContainer(withName: self.doneView)
                })
            }
        } else {
        UIView.animate(withDuration: 0.5, animations: {
            self.showViewContainer(withName: self.toDoView)
        })
        }
    }
    
    // method to instantiate viewControllers and set their tableview content
    func inistantiateContainerView(withNumberInArray : Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if withNumberInArray == 0 {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "ToDoViewController")
            self.addChildViewController(viewController)
            let viewControllerChild = self.childViewControllers[0] as! ToDoTableViewController
            viewControllerChild.projectFromDashboardDetail = self.projectFromDashboard
            viewControllerChild.updateTable()
        }else if withNumberInArray == 1 {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "InProgressViewController")
            self.addChildViewController(viewController)
            let viewControllerChild = self.childViewControllers[1] as! InProgressTableViewController
            viewControllerChild.projectFromDashboardDetail = self.projectFromDashboard
            viewControllerChild.updateTable()
        }else {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "DoneViewController")
            self.addChildViewController(viewController)
            let viewControllerChild = self.childViewControllers[2] as! DoneTableViewController
            viewControllerChild.projectFromDashboardDetail = self.projectFromDashboard
            viewControllerChild.updateTable()
        }
        
    }
    
   
    // method for make other view controller hidden when one of them get chosen
    func showViewContainer(withName : UIView){
        if withName == self.toDoView {
            self.toDoView.alpha = 1
            self.inProgressView.alpha = 0
            self.doneView.alpha = 0
        } else if withName == self.inProgressView {
            self.toDoView.alpha = 0
            self.inProgressView.alpha = 1
            self.doneView.alpha = 0
        } else {
            self.toDoView.alpha = 0
            self.inProgressView.alpha = 0
            self.doneView.alpha = 1
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let string = projectFromDashboard?.projectId
        readData(Project.self, predicate: nil) { (result) in
            for projectInResult in result {
                if projectInResult.projectId == self.projectFromDashboard?.projectId {
                   self.projectFromDashboard = projectInResult
                    setViewFields()
                }
            }
            
        }
    }
    

 

}
