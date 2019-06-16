import Foundation
import RealmSwift

final class DataManager {
    
    static let shared = DataManager()
    
    // MARK: field names (use for predicates) and results sorting
    static let chatIdFieldName = "chatId"
    
    static let questionIdFieldName = "questionId"
    
    var realm : Realm {
        return try! Realm()
    }
    
    func write<T: Object>(value: [T]) {
        do {
            try realm.write { realm.add(value) }
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func readAll<T: Object>(object: T.Type) -> [T] {
        let result = realm.objects(T.self)
        return Array(result)
    }
    
    func readAllResult<T: Object>(object: T.Type) -> Results<T> {
        return realm.objects(T.self)
    }
    
    func deleteAll<T: Object>(_ class: T.Type) {
        let allObjects = realm.objects(T.self)
        do {
            try realm.write { realm.delete(allObjects) }
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func delete<T: Object>(value: [T]) {
        do {
            try realm.write { realm.delete(value) }
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func update<T: Object>(value: [T]) {
        do {
            try realm.write { realm.add(value, update: true) }
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func equalityPredicate(_ fieldName: String, _ value: Any) -> NSPredicate {
        return NSPredicate(format: "\(fieldName) == %@", argumentArray: [value])
    }
    
}
