# EmojiDictionary
UITableViewController

A dynamic table view object must have a data source object—and may or may not have a delegate object.
The data source, which adopts the UITableViewDataSource protocol, is responsible for providing the necessary data to the table view object.

The data source methods: number of sections, number of rows in each section, and a method called cell for row at index path.

When the table view loads or reloads its data, it queries the data source by calling each of these methods (sometimes multiple times) to request information for the visible rows. Based on the parameters of these calls, it's the data source's job to return the requested info. As the user scrolls through the table view and different rows become visible, the table view also queries the data source for information to fill the rows about to be displayed.

<h4>Protocol UITableViewDataSource</h4>


 
```swift
optional func numberOfSections(in tableView: UITableView) -> Int
func tableView(_ tableView: UITableView, numberOfRowsInSectionsection: Int) -> Int
func tableView(_ tableView: UITableView, cellForRowAtindexPath: IndexPath) -> UITableViewCell
```
