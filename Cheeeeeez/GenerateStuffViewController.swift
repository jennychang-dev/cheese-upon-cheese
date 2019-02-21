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
        
        let myQuote = QuoteManager()
        myQuote.quoteName = quoteLabel.text ?? ""
        myQuote.authorName = authorLabel.text ?? ""
        myQuote.photo = photoView.image?.pngData()
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(myQuote)
        }
        
        let quotes = realm.objects(QuoteManager.self)
        print(quotes)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LorempixelManager.generateRandomImage { image in
            
            self.photoView.image = image
            
        }
        
        ForasmaticManager.generateCheesyQuote(completion: {
            
            (quoteText, quoteAuthor) in
            
            self.quoteLabel.text = quoteText
            self.authorLabel.text = quoteAuthor
            
            
        })
        
    }
    
}

