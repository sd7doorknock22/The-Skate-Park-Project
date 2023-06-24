//TheSkateParkProject.swift

import UIKit

class SkatePark {
    
    //MARK: Properties
    
    var name: String
    var location: String
    var size: Int
    var equipment: [String]
    
    //MARK: Initialization
    
    init?(name: String, location: String, size: Int, equipment: [String]) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The location must not be empty
        guard !location.isEmpty else {
            return nil
        }
        
        // The size must be a valid size
        guard size >= 0 else {
            return nil
        }
        
        self.name = name
        self.location = location
        self.size = size
        self.equipment = equipment
    }
}

//MARK: SkatePark Management

extension SkatePark {
    
    //MARK: Add Equipment
    
    func addEquipment(equipment: String) {
        self.equipment.append(equipment)
    }
    
    //MARK: Remove Equipment
    
    func removeEquipment(equipment: String) {
        guard let index = self.equipment.index(of: equipment) else {
            return
        }
        
        self.equipment.remove(at: index)
    }
    
    //MARK: Resize Park
    
    func resizePark(size: Int) {
        self.size = size
    }
    
    //MARK: Change Park Location
    
    func changeLocation(location: String) {
        self.location = location
    }
    
    //MARK: Change Park Name
    
    func changeName(name: String) {
        self.name = name
    }
    
}

//MARK: SkatePark Data Persistence

extension SkatePark {
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("skateparks")
    
    //MARK: Encoding
    
    func encode() -> [String:Any] {
        return ["name": name, "location": location, "size": size, "equipment": equipment]
    }
    
    //MARK: Saving data
    
    func saveSkatePark() {
        NSKeyedArchiver.archiveRootObject(self.encode(), toFile: SkatePark.ArchiveURL.path)
    }
    
    //MARK: Loading data
    
    static func loadSkatePark() -> SkatePark? {
        guard let encodedSkatePark = NSKeyedUnarchiver.unarchiveObject(withFile: SkatePark.ArchiveURL.path) as? [String:Any] else {
            return nil
        }
        
        guard let name = encodedSkatePark["name"] as? String,
            let location = encodedSkatePark["location"] as? String,
            let size = encodedSkatePark["size"] as? Int,
            let equipment = encodedSkatePark["equipment"] as? [String] else {
            return nil
        }
        
        return SkatePark(name: name, location: location, size: size, equipment: equipment)
    }
}