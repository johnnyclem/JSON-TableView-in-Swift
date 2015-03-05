// Playground - noun: a place where people can play

import UIKit

let screen = UIView(frame: CGRect(x: 0, y: 0, width: 480, height: 320))
screen.backgroundColor = UIColor.lightGrayColor()
let tableView = UITableView(frame: screen.frame, style: .Grouped)

class Repository {
    var name : String
    var description : String
    
    init(json: NSDictionary) {
        self.name = json["name"] as! String
        self.description = json["description"] as! String
    }
}

class TableViewDataSource : NSObject, UITableViewDataSource {
    
    var repositories = [Repository]()
    
    init(repositories: [Repository]) {
        self.repositories = repositories
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = repositories[indexPath.row].name
        cell.detailTextLabel?.text = repositories[indexPath.row].description
        return cell
    }
}

let sampleRepoOne = ["name": "learn-swift", "html_url": "https://github.com/nettlep/learn-swift", "description": "Learn Apple's Swift programming language interactively through these playgrounds."]
let sampleRepoTwo = ["name": "swift-reference-pg", "html_url": "https://github.com/hackswift", "description": "Swift Reference is a handy playground file that can be used when you are starting to learn swift"]

let dataSource = TableViewDataSource(repositories: [Repository(json: sampleRepoOne), Repository(json: sampleRepoTwo)])

tableView.dataSource = dataSource
screen.addSubview(tableView)
tableView.reloadData()

screen

