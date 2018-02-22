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
In the new table view controller scene, select the table view and open the Attributes inspector. Change the Content to Static Cells.

You can now start to build your static table view. In the Attributes inspector, adjust the number of sections to four, with one row each. Next, adjust the Style of the table view to Grouped, then add the following section headers: "Symbol", "Name", "Description", and "Usage". To update section information, such as headers and footers, select the section in the Document Outline, then use the Attributes inspector. Add a text field in each cell, and don't forget to add constraints to cover the entire cell.

![storyboard](https://github.com/oobii/EmojiDictStaticTableView/blob/StaticTableView/StaticTableViewStoryboard.png)

