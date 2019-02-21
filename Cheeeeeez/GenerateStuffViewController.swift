import UIKit
import RealmSwift


class GenerateStuffViewController: UIViewController {
   

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    @IBAction func generateImage(_ sender: Any) {
        
        LorempixelManager.generateRandomImage { image in
            
            self.photoView.image = image
            
        }
        
    }
    
    @IBAction func generateQuote(_ sender: Any) {
        
        ForasmaticManager.generateCheesyQuote(completion: {
            
            (quoteText, quoteAuthor) in
            
            self.quoteLabel.text = quoteText
            self.authorLabel.text = quoteAuthor
            
            
        })
        
    }
    
    @IBAction func saveAll(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myQuote = QuoteManager()
        myQuote.quoteName = "hello be fabulous"
        myQuote.authorName = "JC"
        myQuote.photo = nil
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(myQuote)
        }
        
    }
    
}

