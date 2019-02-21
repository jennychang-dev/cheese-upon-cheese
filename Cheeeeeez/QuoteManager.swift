import UIKit
import RealmSwift

class QuoteManager: Object {
    
    @objc dynamic var quoteName: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var photo: Data? = nil
    
//    init(quoteName: String, authorName: String, photo: Data?) {
//        self.quoteName = quoteName
//        self.authorName = authorName
//        self.photo = photo
//    }
    
//    static func writeToRealm() {
//
//        let newQuote = QuoteManager(quoteName: "Something fun for now", authorName: "JC", photo: nil)
//
//        let realm = try! Realm()
//
//        try! realm.write {
//            realm.add(newQuote)
//        }

    
}
