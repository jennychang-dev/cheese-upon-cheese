import UIKit
import CoreData

class GenerateStuffViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext? = nil
    var isCompleted: Bool = false
    
    private var appDelegate: AppDelegate? = nil

    @IBOutlet weak var photoView: UIImageView!
   
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    @IBAction func generateImage(_ sender: Any) {

        LorempixelManager.generateRandomImage()
        let imageData = LorempixelManager.imageData
        self.photoView.image = UIImage(data: imageData)
        
    }
    
    @IBAction func generateQuote(_ sender: Any) {
        
        ForasmaticManager.generateCheesyQuote()
        quoteLabel.text = ForasmaticManager.quoteText
        authorLabel.text = ForasmaticManager.quoteAuthor
    }
   
    @IBAction func saveAll(_ sender: Any) {
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

