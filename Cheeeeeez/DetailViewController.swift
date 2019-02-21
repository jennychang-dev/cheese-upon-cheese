import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailQuoteLabel: UILabel!
    @IBOutlet weak var detailAuthorLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    var detailItem: QuoteManager? {
        didSet {
            
        }
    }

    func configureView() {
        if let detail = detailItem {
            
            guard let author = detailAuthorLabel else {
                fatalError("can't create author label!!")
            }
            
            guard let quote = detailQuoteLabel else {
                fatalError("can't create quote label!!")
            }
            
            guard let photoView = detailImage else {
                fatalError("can't generate image!!")
            }
            
            author.text = detail.authorName
            quote.text = detail.quoteName
            
            guard let photo = detail.photo else {
                fatalError("data is probs nil")
            }
            photoView.image = UIImage(data: photo)
            
        }
    }
    
}
