//
//  FriendRealm.swift
//  FacebookFriends
//
//  Created by macbook on 9.11.2021.
//

import Foundation
import RealmSwift

class FriendRealm : Object{
    @objc dynamic var title = ""
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var picutureUrl = ""
    @objc dynamic var latitude = ""
    @objc dynamic var longitude = ""
    @objc dynamic var phone = ""
    @objc dynamic var nat = ""
    @objc dynamic var city = ""
    @objc dynamic var imagedata : NSData?
}
