//
//  NDBItem.swift
//  Nutrition Cal
//
//  Created by Galina Petrova on 03/25/16.
//  Copyright © 2015 Galina Petrova. All rights reserved.
//

import UIKit
import CoreData


class NDBItem: NSManagedObject {
	
	@NSManaged var group: String?
	@NSManaged var name: String
	@NSManaged var ndbNo: String
	@NSManaged var saved: NSNumber
	@NSManaged var dateAdded: NSDate
	@NSManaged var imagePath: String?
	
	@NSManaged var nutrients: [NDBNutrient]?
	
	override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
		super.init(entity: entity, insertIntoManagedObjectContext: context)
	}
	
	init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
		let entity = NSEntityDescription.entityForName("NDBItem", inManagedObjectContext: context)!
		super.init(entity: entity, insertIntoManagedObjectContext: context)
		
		self.group = (dictionary["group"] as! String)
		self.name = (dictionary["name"] as! String)
		self.ndbNo = (dictionary["ndbno"] as! String)
		self.saved = false
		self.dateAdded = NSDate()
		
		self.imagePath = ImageCache.Caches.imageCache.pathForIdentifier(ndbNo)
	}
	
	var image: UIImage? {
		get { return ImageCache.Caches.imageCache.imageWithIdentifier(ndbNo) }
		set { ImageCache.Caches.imageCache.storeImage(newValue, withIdentifier: ndbNo) }
	}
	
}
