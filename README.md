# EmojiDictionary
UITableViewController

We created a project. Dleted the default View Controller from the Main.storyboard. Drag Navigation controller on to the Storyboard scene, it takes with it a Table View Controller. Set the navigation controller to be the initial view controlle
Then add a new Cocoa Touch Class called "EmojiTableViewController" as a subclass of UITableViewController. Back in your storyboard, select the table view controller and assign EmojiTableViewController as its custom class.

A dynamic table view object must have a data source object—and may or may not have a delegate object.
The data source, which adopts the UITableViewDataSource protocol, is responsible for providing the necessary data to the table view object.

The data source methods: number of sections, number of rows in each section, and a method called cell for row at index path.

When the table view loads or reloads its data, it queries the data source by calling each of these methods (sometimes multiple times) to request information for the visible rows. Based on the parameters of these calls, it's the data source's job to return the requested info. As the user scrolls through the table view and different rows become visible, the table view also queries the data source for information to fill the rows about to be displayed.

<h4>Implementing UITableViewDataSource protocol</h4>

```swift
optional func numberOfSections(in tableView: UITableView) -> Int
func tableView(_ tableView: UITableView, numberOfRowsInSectionsection: Int) -> Int
func tableView(_ tableView: UITableView, cellForRowAtindexPath: IndexPath) -> UITableViewCell
```

The second protocol in the table view API is the delegate. The delegate object, which conforms to the <b>UITableViewDelegate</b> protocol, implements methods to modify visible aspects of the table view, manage selections, support an accessory view, and support editing of individual rows in a table behavior. Unlike the data source protocol, the delegate protocol has no required methods.

Responding to Accessory View Interaction
```swift
tableView(_:accessoryButtonTappedForRowWith:)
```
Responding to User Interaction
```swift
tableView(_:didSelectRowAt:)
```
In EmojiDictionary app, you're using a table view controller to manage the table view. That means the table view delegate is already assigned as the table view controller itself, just like the data source. Add the didSelectRow method. 




