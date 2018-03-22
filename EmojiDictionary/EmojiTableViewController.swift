//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by martynov on 2018-01-22.
//  Copyright © 2018 oobii. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    var emojis: [Emoji] = [] {
        willSet(updatedEmojiList) {
            Emoji.saveToFile(emojis: updatedEmojiList)
        }
    }
    
    
    @IBAction func refreshControlActivated(_ sender: UIRefreshControl) {
        // Network fetch or other operation that updates the array of data displayed in the table view
        
        tableView.reloadData()
        sender.endRefreshing()  //this line ends the animation

    }
    
    
    // We get here when we press "Cancel" or "Save" in the AddEditEmojiTableViewController
    @IBAction func unwindToEmojiTabkeViewController(unwindSegue: UIStoryboardSegue) {
        
        guard unwindSegue.identifier == "saveUnwind" else { return }
        
        if let sourceViewController = unwindSegue.source as? AddEditEmojiTableViewController {
            
            if let emoji = sourceViewController.emoji {
                
                // if the table view still has a selected row
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    
                    emojis[selectedIndexPath.row] = emoji
                    
                    
                    
                     // Model changed we need to tell the tableView right away
                    // the array of rows to reload contains only one row/cell in our case
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                    
                } else {
                    
                    // getting IndexPath just after our last row
                    
                    // IndexPath is an array
                    let newIndexPath = IndexPath(row: emojis.count, section: 0)
                    
                    // adding new emoji to the array
                    emojis.append(emoji)
                    
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                    
                    
                }
                
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // To deal with multiline descriptions
        // also need to set compression resistance
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        
         
        if let loadedFromFileEmojis = Emoji.loadFromFile() {
            emojis = loadedFromFileEmojis
        } else {
            emojis = Emoji.loadSampleEmojis()
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return emojis.count
        }
        else {
            return 0
        }
    }
    
    // return cell for displaying based on Emoji.swift Model
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        let emoji = emojis[indexPath.row]
        // Configure the cell...
        //        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        //        cell.detailTextLabel?.text = "\(emoji.description) - \(emoji.usage)"
        
        cell.update(with: emoji)
        cell.showsReorderControl = true
        return cell
    }
    
    //    // Commented out because we created a segue from Cell to static ViewController
    //    // so pressing on cell would segue to it, and we dont want that
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let emoji = emojis[indexPath.row]
    //        print("\(emoji.symbol) indexPath = \(indexPath)")
    //        performSegue(withIdentifier: "Edit", sender: nil)
    //    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let emojiToMove = emojis.remove(at: fromIndexPath.row)
        emojis.insert(emojiToMove, at: to.row)
        
        tableView.reloadData()
        
    }
    
    // To remove Delete indicator
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            let emojiToDelete = emojis.remove(at: indexPath.row)
            print("Deleting \(emojiToDelete.symbol)")
            tableView.reloadData()
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "EditEmoji" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let addEditEmojiTableViewController = segue.destination as! AddEditEmojiTableViewController
            
            addEditEmojiTableViewController.emoji = emoji
            
        }
        
    }
    
    
}
