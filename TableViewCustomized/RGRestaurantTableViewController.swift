//
//  RGRestaurantTableViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/13.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit
import CoreData

class RGRestaurantTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {
    var fetchResultController:NSFetchedResultsController<NSFetchRequestResult>!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Navagation back button configuration
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // Enable self sizing cells
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Load data from CoreData
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RgRestaurant")
        let sortDescription = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescription]
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            fetchResultController = NSFetchedResultsController(fetchRequest:fetchRequest,managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            do {
                try fetchResultController.performFetch()
                restaurants = fetchResultController.fetchedObjects as! [rgRestaurant]
            } catch {
                print(error)
            }
        }
        
    }
    
    //When CoreData changes
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRows(at: [_newIndexPath], with: .fade)
            }
        case .delete:
            if let _indexPath = indexPath {
                tableView.deleteRows(at: [_indexPath], with: .fade)
            }
        case .update:
            if let _indexPath = indexPath {
                tableView.reloadRows(at: [_indexPath], with: .fade)
            }
            
        default:
            tableView.reloadData()
        }
        
        restaurants = controller.fetchedObjects as! [rgRestaurant]
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
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
        return restaurants.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

   
    
    //Written by Roger!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let RGCellIdentifier = "RGCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: RGCellIdentifier, for: indexPath) as! RGRestaurantTableViewCell
        
        cell.RGCellImage?.image = UIImage(data: restaurants[indexPath.row].image as! Data)
        cell.RGCellName?.text = restaurants[indexPath.row].name
        cell.RGCellLocation?.text = restaurants[indexPath.row].location
        cell.RGCellType?.text = restaurants[indexPath.row].type
        
        if restaurants[indexPath.row].isVisited {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        //Above lines equal to these:
        //cell.accessoryType = RGrestaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
 
    
    var restaurants:[rgRestaurant] = []
        
    
    /*
    //When select a row of the table
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let RGAlert = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.actionSheet)
        // Add Cancel action
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        RGAlert.addAction(CancelAction)
        // Add Calling action
        let CallActionHander = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Wrong", message: "Sorry, service is unvaluable now!", preferredStyle: UIAlertControllerStyle.alert)
            let CallCancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alertMessage.addAction(CallCancelAction)
            self.present(alertMessage, animated: true, completion: nil)
        }
        let CallAction = UIAlertAction(title: "Call", style: UIAlertActionStyle.default, handler: CallActionHander)
        RGAlert.addAction(CallAction)
        
        //Add Check or Uncheck action
        if !RGrestaurantIsVisited[indexPath.row]  {
            //Add Check action
            let CheckAction = UIAlertAction(title: "I have been here.", style: UIAlertActionStyle.default, handler: ({ (action: UIAlertAction)-> Void in
                self.RGrestaurantIsVisited[indexPath.row] = true
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = UITableViewCellAccessoryType.checkmark

            }))
            RGAlert.addAction(CheckAction)
        }
        else {
            //Add Uncheck action
            let UncheckAction = UIAlertAction(title: "I haven't been here.", style: UIAlertActionStyle.default, handler: ({ (action: UIAlertAction)-> Void in
                self.RGrestaurantIsVisited[indexPath.row] = false
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = UITableViewCellAccessoryType.none
            }))
            RGAlert.addAction(UncheckAction)
        }
        
        //Show Alert
        self.present(RGAlert, animated: true, completion: nil)

        //Cancel the seletion of the row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    */
    
    /*
    //Enable the swipe to delete function
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            RGRestaurantNames.remove(at: indexPath.row)
            RGrestaurantTypes.remove(at: indexPath.row)
            RGRestaurantLocations.remove(at: indexPath.row)
            RGrestaurantImages.remove(at: indexPath.row)
            RGrestaurantIsVisited.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        
    }
    */
    //Enable customized actions in row
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Share action
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(action, indexPath)-> Void in
            let defaultText = "Checking in at" + self.restaurants[indexPath.row].name!
            let sharedImage = UIImage(data: self.restaurants[indexPath.row].image! as Data)
            let activityController = UIActivityViewController(activityItems: [sharedImage as Any,defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        )
        shareAction.backgroundColor = UIColor.init(red: 28/255, green: 165/255, blue: 253/255, alpha: 1)
        //Delete action
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: {(action,indexPath)-> Void in
            if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
                let restaurantDelete = self.fetchResultController.object(at: indexPath) as! rgRestaurant
                managedObjectContext.delete(restaurantDelete)
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
            }
        }
        )
        deleteAction.backgroundColor = UIColor.gray
        //Add actions to row
        return [deleteAction,shareAction]
    }
    
    //Segue to next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let indexPath = tableView.indexPathForSelectedRow
            let destinationView = segue.destination as! DetailViewController
            destinationView.detailRestaurant = restaurants[(indexPath?.row)!]
        }
    }
    
    //Hide the navigation bar on swipe
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    //Segue back from New restaurant view
    @IBAction func cancel(segue:UIStoryboardSegue){
        
    }
    
    

}
