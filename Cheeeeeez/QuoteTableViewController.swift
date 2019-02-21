import UIKit
import RealmSwift

class QuoteTableViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var quotes = [QuoteManager]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.reloadData()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
       quotes = QuoteManager.fetchFromRealm()
        
    
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = quotes[indexPath.row]
                
                if let controller = (segue.destination as? DetailViewController) {
                controller.detailItem = object
                }

            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return quotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? QuoteTableViewCell else {
            fatalError("couldn't identify cell to use")
        }
        
        cell.authorLabel.text = quotes[indexPath.row].authorName
        cell.inspirationalQuoteLabel.text = quotes[indexPath.row].quoteName
        
        if let imageData = quotes[indexPath.row].photo {
        cell.inspirationalImage.image = UIImage(data: imageData)
        }
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delete(index: indexPath.row)
        
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func delete(index: Int) {
        let myQuote = quotes[index]
        let realm = try! Realm()
        quotes.remove(at: index)
        try! realm.write {
            realm.delete(myQuote)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
