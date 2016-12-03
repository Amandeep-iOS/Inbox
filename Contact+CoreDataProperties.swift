//
//  Contact+CoreDataProperties.swift
//  Inbox
//
//  Created by Mikael Teklehaimanot on 12/2/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact");
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var contactID: String?
    @NSManaged public var conversations: NSSet?
    @NSManaged public var messages: NSSet?

}

// MARK: Generated accessors for conversations
extension Contact {

    @objc(addConversationsObject:)
    @NSManaged public func addToConversations(_ value: Conversation)

    @objc(removeConversationsObject:)
    @NSManaged public func removeFromConversations(_ value: Conversation)

    @objc(addConversations:)
    @NSManaged public func addToConversations(_ values: NSSet)

    @objc(removeConversations:)
    @NSManaged public func removeFromConversations(_ values: NSSet)

}

// MARK: Generated accessors for messages
extension Contact {

    @objc(addMessagesObject:)
    @NSManaged public func addToMessages(_ value: Message)

    @objc(removeMessagesObject:)
    @NSManaged public func removeFromMessages(_ value: Message)

    @objc(addMessages:)
    @NSManaged public func addToMessages(_ values: NSSet)

    @objc(removeMessages:)
    @NSManaged public func removeFromMessages(_ values: NSSet)

}