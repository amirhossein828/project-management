//
//  InProgressTableViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-08.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class InProgressTableViewController: UITableViewController {
    
    var projectFromDashboardDetail : Project? = nil
    var taskToDo = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.taskToDo.count
    }
    
    // update table view when this view controller get chosen
    func updateTable(){
        self.taskToDo.removeAll()
        let tasks = self.projectFromDashboardDetail?.tasks
        for task in tasks! {
            if task.status == TaskStatus.INPROGRESS.rawValue {
                taskToDo.append(task)
            }
        }
        tableView.reloadData()
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! InProgressTableViewCell
        let task = self.taskToDo[indexPath.row]
        let project = self.projectFromDashboardDetail
        //        cell.textLabel?.text = self.taskToDo[indexPath.row].nameOfTask
        cell.setLabelAndCell(withTask: task, withProject: project!, index: indexPath)
        cell.delegate = self

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InProgressTableViewController : ToDoCellDelegate {
    // method to change the stutus of task form toDo to inProgress
    func changeStutusOfTask(forProject : Project, forTask : Task) {
        updateTaskStatus(forTask, forTaskId: forTask.taskId, taskStatus: TaskStatus.DONE.rawValue, startDate: nil, finishDate: Date())
    }
    // method to delete toDoTask from taskArray when the changeStutusToInProgress tapped
    func deleteFromArray(withIndex : IndexPath){
        self.taskToDo.remove(at: withIndex.row)
        tableView.reloadData()
    }
}
