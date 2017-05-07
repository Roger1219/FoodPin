//
//  RGRestaurantTableViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/13.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class RGRestaurantTableViewController: UITableViewController {

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
    
    //Written by Roger!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    /*
    var RGRestaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh'sChocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats","Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina","Donostia", "Royal Oak", "Thai Cafe"]
    var RGRestaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong","Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York","New York", "New York", "New York", "New York", "New York", "New York","London", "London", "London", "London"]
    var RGrestaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/Causual Drink", "French", "Bakery", "Bakery", "Chocolate","Cafe", "American /Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee& Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var RGrestaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg","cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg","bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg","upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg","fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    var RGrestaurantIsVisited = [Bool](repeating: false, count: 21)
    
    */
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
        rgRestaurant(name: "Cafe Deadend", location: "G/F,72 Po Hing Fong, Sheung Wan, Hong Kong", type: "Coffee & Tea Shop", image: "cafedeadend.jpg", isVisited: false),
        rgRestaurant(name: "Homei", location: "Hong Kong", type: "Cafe", image:"homei.jpg", isVisited: false),
        rgRestaurant(name: "Teakha", location: "Hong Kong", type: "Tea House", image:"teakha.jpg", isVisited: false),
        rgRestaurant(name: "Cafe loisl", location:"Hong Kong", type: "Austrian / Causual Drink", image: "cafeloisl.jpg", isVisited: false),
        rgRestaurant(name: "Petite Oyster", location: "Hong Kong", type: "French",image: "petiteoyster.jpg", isVisited: false),
        rgRestaurant(name: "For Kee Restaurant", location: "HongKong", type: "Bakery", image: "forkeerestaurant.jpg", isVisited: false),
        rgRestaurant(name: "Po's Atelier", location: "Hong Kong", type: "Bakery",image: "posatelier.jpg", isVisited: false),
        rgRestaurant(name: "Bourke Street Backery", location:"Sydney", type: "Chocolate", image: "bourkestreetbakery.jpg", isVisited: false),
        rgRestaurant(name: "Haigh's Chocolate", location: "Sydney", type: "Cafe",image: "haighschocolate.jpg", isVisited: false),
        rgRestaurant(name: "Palomino Espresso", location:"Sydney", type: "American / Seafood", image: "palominoespresso.jpg", isVisited: false),
        rgRestaurant(name: "Upstate", location: "New York", type: "American", image:"upstate.jpg", isVisited: false),
        rgRestaurant(name: "Traif", location: "New York", type: "American", image:"traif.jpg", isVisited: false),
        rgRestaurant(name: "Graham Avenue Meats", location: "New York",type: "Breakfast & Brunch", image: "grahamavenuemeats.jpg", isVisited: false),
        rgRestaurant(name: "Waffle & Wolf", location: "NewYork", type: "Coffee & Tea", image: "wafflewolf.jpg", isVisited: false),
        rgRestaurant(name: "Five Leaves", location: "New York", type: "Coffee & Tea",image: "fiveleaves.jpg", isVisited: false),
        rgRestaurant(name: "Cafe Lore", location: "New York", type: "Latin American",image: "cafelore.jpg", isVisited: false),
        rgRestaurant(name: "Confessional", location: "New York", type: "Spanish",image: "confessional.jpg", isVisited: false),
        rgRestaurant(name: "Barrafina", location: "London", type: "Spanish", image:"barrafina.jpg", isVisited: false),
        rgRestaurant(name: "Donostia", location: "London", type: "Spanish", image:"donostia.jpg", isVisited: false),
        rgRestaurant(name: "Royal Oak", location: "London", type: "British", image: "royaloak.jpg", isVisited: false),
        rgRestaurant(name: "Thai Cafe", location: "London", type: "Thai", image:"thaicafe.jpg", isVisited: false)]
*/
    
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
