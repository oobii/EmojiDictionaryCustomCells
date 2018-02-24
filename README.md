# EmojiDictionaryStaticTableView

Example of building static TableView(ADwS p:545):<br>

* Take a stock EmojiDictionary code (Navigation Controller + TableView Controller)
* Put new NavController with TableView Controller
* Create a swift file/class and assing it to TableView Controller
* Remove ```numberOfSections(..)``` and ```tableView(...,numberOfRowsInSection)``` from that file
  This is important, otherwise we cannot 
* Create a "Show" segue from EmojiCell (Ctl-Drag) directly to the new TableView Controller
* From "Add" Bar Button Item on Emoji TableView Controller create a "Modal" segue to the new NavController 
* Make  the new TableView Controller a static one with fixed number of rows 

#### Static Table View
In the new table view controller scene, select the table view and open the Attributes inspector. Change the Content to **Static** Cells.

You can now start to build your static table view. In the Attributes inspector
1. adjust the number of sections to four, with one row each
Table View>Content>Static Cells
In Document Outline under Section-1 delete 2 out of 3 Cells
2. adjust the Style of the table view to Grouped
3. then add the following section headers: "Symbol", "Name", "Description", and "Usage".
4. To update section information, such as headers and footers, select the section in the Document Outline, then use the Attributes inspector.
5. Add a text field in each cell, and don't forget to add constraints to cover the entire cell.

![storyboard](https://github.com/oobii/EmojiDictStaticTableView/blob/StaticTableView/StaticTableViewStoryboard.png)

### Implementation of Automatic row height
To avod truncation of a long text lines add this to ```viewDidLoad(...)```
```swift
“tableView.rowHeight = UITableViewAutomaticDimension
tableView.estimatedRowHeight = 44.0
```
Set the bottom label's number of lines to 0 in the Attributes inspector.<br>

#### Set Compression Resistance
Every view has a default compression resistance value of 750 - that is, how resistant the view is to shrinking. In the Attributes inspector, set the top label's compression resistance to 751, telling the Auto Layout engine that it has a higher priority than everything else to not shrink, including the cell, itself. Set the bottom label's compression resistance to 752 so that it is resistant to shrinking as well (a value of 751 would still contain ambiguity between the two labels). Since the vertical stack view continues to have a compression resistance value of 750, the Auto Layout engine understands that the stack view will grow to accommodate the larger amount of text. The stack view height increase will be taken into account when the table view calculated the cell height via UITableViewAutomaticDimension.<br>

#### Refresh Control
To refresh the TableView and display the spinner:<br>
Add this code and set Refreshing to "Enabled" in storyboard for TableView Controller.<br>
```swift
@IBAction func refreshControlActivated(_ sender: UIRefreshControl) {
// Network fetch or other operation that updates the array of data displayed in the table view
   tableView.reloadData()
   sender.endRefreshing()  //this line ends the animation
   }
   
   
   ```
