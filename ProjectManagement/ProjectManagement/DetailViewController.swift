//
//  DetailViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-07.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var toDoView: UIView!
    @IBOutlet weak var doneView: UIView!
    @IBOutlet weak var inProgressView: UIView!
    
    //MARK: - Properties
    var projectFromDashboard : Project? = nil
    
    // Action : segmented control to go between container view controllers
    @IBAction func changeContainerViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // show the toDo view controller
            UIView.animate(withDuration: 0.5, animations: {
                self.showViewContainer(withName: self.toDoView)
            })
            // chow inprogressViewController
        } else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.showViewContainer(withName: self.inProgressView)
            })
            // show doneViewController
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.showViewContainer(withName: self.doneView)
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.projectName.text = self.projectFromDashboard?.name
        // instantiate each view controller
        inistantiateContainerView(withNumberInArray: 0)
        UIView.animate(withDuration: 0.5, animations: {
            self.showViewContainer(withName: self.toDoView)
        })
        inistantiateContainerView(withNumberInArray: 1)
        inistantiateContainerView(withNumberInArray: 2)
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
//            viewControllerChild.updateTable()
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
    

 

}
