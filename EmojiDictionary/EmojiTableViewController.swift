//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by martynov on 2018-01-22.
//  Copyright © 2018 oobii. All rights reserved.
//

//TODO:
//Using an array of arrays, separate your emoji into sections using the same
//grouping as Apple's emoji keyboard: Smileys & People, Animals & Nature,
//Food & Drink, Activity, Travel & Places, Obects, Symbols, Flags. Update your table view data source to display the sectioned data.






import UIKit

class EmojiTableViewController: UITableViewController {
    
    // Going into editing mode by tapping this left button
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEdditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEdditingMode, animated: true)
        
    }
    
    var emojiSections: [[Emoji]] = [
        [Emoji(symbol: "😀", name: "Grinning face", description: "A typical smiley face", usage: "happiness")],
        [Emoji(symbol: "🐘", name: "Elephant", description: "A grey elephant", usage: "Good memory"), Emoji(symbol: "🐸", name: "Frog" , description: "Green frog" , usage: "Pond" ),Emoji(symbol: "🐢", name: "Turtle" , description: "Wise turtle", usage: "slow")],
        [Emoji(symbol: "🍕", name:"Pizza" , description: "Slice of pizza", usage:"Food"),
         Emoji(symbol:"🎂" , name:"Birthday cake" , description:"Desert" , usage:"Yummy" )]]
    
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning face", description: "A typical smiley face", usage: "happiness"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A grey elephant", usage: "Good memory"),
        Emoji(symbol: "🐸", name: "Frog" , description: "Green frog" , usage: "Pond" ),
        Emoji(symbol: "🐢", name: "Turtle" , description: "Wise turtle", usage: "slow"),
        Emoji(symbol: "🍕", name:"Pizza" , description: "Slice of pizza", usage:"Food"),
        Emoji(symbol:"🏐" , name: "Volleyball", description:"White volleyball", usage:"Sports" ),
        Emoji(symbol:"⏰", name:"Alarm clock" , description:"Red clock" , usage:"Waking up"),
        Emoji(symbol:"🇨🇦" , name:"Canada flag", description:"Red and white flag", usage:"Country" ),
        Emoji(symbol:"👀", name:"Eyes" , description:"Two eyes" , usage:"To see" ),
        Emoji(symbol:"🚲" , name:"Bycicle" , description:"Blue bike", usage:"Getting around"),
        Emoji(symbol:"🌈" , name:"Rainbow", description:"seven coulors" , usage:"Rain and sun" ),
        Emoji(symbol:"🎹" , name:"Musical keyboard" , description:"Piano" , usage:"Playing music" ),
        Emoji(symbol:"📎" , name:"Paperclip" , description:"Grey clip" , usage:"Attachment"),
        Emoji(symbol:"💚" , name:"Green heart" , description:"Shape" , usage:"Love" ),
        Emoji(symbol:"🎂" , name:"Birthday cake" , description:"Desert" , usage:"Yummy" ),
        Emoji(symbol:"☃️" , name:"Snowman" , description:"Winter" , usage:"Build" ),
        Emoji(symbol:"🌹" , name:"Rose" , description:"Flower" , usage:"Smells good"),
        Emoji(symbol:"🍍" , name:"Pineapple" , description:"Large fruit" , usage:"Wear a crown" ),
        ]
    
    
    // If you want to refresh the table view with new data when a user returns to the view
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        // Simple way of getting into Editting Mode for rows
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.rightBarButtonItem = editButtonItem
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
    
    // returm cell based on Emoji.swift Model
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        
        let emoji = emojis[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = "\(emoji.description) - \(emoji.usage)"
        
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol) indexPath = \(indexPath)")
    }
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
