import UIKit
import RealmSwift

class QuoteManager: Object {
    
    @objc dynamic var quoteName: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var photo: Data? = nil

}
