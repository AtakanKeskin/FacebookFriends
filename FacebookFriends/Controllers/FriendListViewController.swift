//
//  FriendListViewController.swift
//  FacebookFriends
//
//  Created by macbook on 3.11.2021.
//

import UIKit
import Kingfisher
import RealmSwift

class FriendListViewController : UIViewController
{

    private let friendsCollectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
    private let friendsList = NetworkManager.shared.friends
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(friendsCollectionView)
        friendsCollectionView.register(FriendCollectionViewCell.self, forCellWithReuseIdentifier: FriendCollectionViewCell.identifier)
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
        friendsCollectionView.backgroundColor = .white
        setUpLayouts()
        
        if(!NetworkManager.shared.isFriendsEmpty){
            try! realm.write({
                realm.deleteAll()
            })

            try! realm.write({
                for fr in friendsList.results{
                    let friend_object = FriendRealm()
                    friend_object.name = fr.name.first
                    friend_object.title = fr.name.title
                    friend_object.surname = fr.name.last
                    friend_object.nat = fr.nat
                    friend_object.city = fr.location.city
                    friend_object.phone = fr.phone
                    friend_object.longitude = fr.location.coordinates.longitude
                    friend_object.latitude = fr.location.coordinates.latitude
                    let url = NSURL(string: fr.picture.large)
                    let imgData = NSData(contentsOf: url! as URL)
                    friend_object.imagedata = imgData
                    realm.add(friend_object)
                }
            })
        }
      
        
    }

    private func setUpLayouts(){
        friendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        friendsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        friendsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        friendsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        friendsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
    }
    
}


extension FriendListViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCollectionViewCell.identifier, for: indexPath) as! FriendCollectionViewCell
        cell.backgroundColor = .white
        if(NetworkManager.shared.isFriendsEmpty){
            let people = realm.objects(FriendRealm.self)
            cell.nameLabel.text = people[indexPath.item].name
            cell.lastNameLabel.text = people[indexPath.item].surname
            cell.friendImageView.image = UIImage(data: people[indexPath.item].imagedata! as Data)
            cell.friendImageView.backgroundColor = .yellow
        }else{
            let imageUrl = ImageResource(downloadURL: URL(string: friendsList.results[indexPath.item
            ].picture.large)!)
            cell.nameLabel.text = friendsList.results[indexPath.item].name.first
            cell.lastNameLabel.text = friendsList.results[indexPath.item].name.last
            cell.friendImageView.kf.setImage(with: imageUrl)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(NetworkManager.shared.isFriendsEmpty){
            let people = realm.objects(FriendRealm.self)
            return people.count
        }else{
            return friendsList.results.count

        }
    }
}


extension FriendListViewController : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let targetView = FriendDetailViewController()
        targetView.friendDetailIndex = indexPath.item
        targetView.navigationItem.title = "Friend Details"
        navigationController?.pushViewController(targetView, animated: true)
        
    }
}


extension FriendListViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.07, height: collectionView.frame.width / 2.07)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
