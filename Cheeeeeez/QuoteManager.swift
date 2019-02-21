import UIKit
import RealmSwift

class QuoteManager: Object {
    
    static var quotes = [QuoteManager]()
    
    @objc dynamic var quoteName: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var photo: Data? = nil

    static func fetchFromRealm() -> [QuoteManager] {
        
        let realm = try! Realm()
        let results = realm.objects(QuoteManager.self)
        
        if results.count != quotes.count {
            quotes.removeAll()
            
            for result in results {
                
                if !quotes.contains(result) {
                    quotes.append(result)
                }
                
            }
            
        }
        
        return quotes
        
    }
    
}
