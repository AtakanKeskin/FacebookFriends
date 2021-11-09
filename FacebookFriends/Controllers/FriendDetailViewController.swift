//
//  FriendDetailViewController.swift
//  FacebookFriends
//
//  Created by macbook on 3.11.2021.
//

import UIKit
import Kingfisher
import MapKit

class FriendDetailViewController : UIViewController
{

    var friendDetailIndex : Int = 0
    
    private var friendImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private var friendNameTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mr. Atakan Keskin"
        label.font = UIFont.systemFont(ofSize: 21.0)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
        label.backgroundColor = .clear
        label.textAlignment = .left
        return label
    }()
    
    private var nationalityTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Turkish"
        label.font = UIFont.systemFont(ofSize: 21.0)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
        label.backgroundColor = .clear
        label.textAlignment = .right
        return label
    }()
    
    private var locationIconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private var cellIconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private var phoneLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12312312312123"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    private var locationLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12312312312123"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    fileprivate let stackView_0 : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.spacing = 30
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
       return stackView
    }()
    
    fileprivate let stackView_1 : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .clear
       return stackView
    }()
    
    fileprivate let stackView_2 : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .clear
       return stackView
    }()
    
    private let mapView : MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        stackView_1.addArrangedSubview(cellIconImageView)
        stackView_1.addArrangedSubview(phoneLabel)
        stackView_2.addArrangedSubview(locationIconImageView)
        stackView_2.addArrangedSubview(locationLabel)
        stackView_0.addArrangedSubview(stackView_1)
        stackView_0.addArrangedSubview(stackView_2)
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        mapRender(lat: NetworkManager.shared.friends.results[friendDetailIndex].location.coordinates.latitude, long: NetworkManager.shared.friends.results[friendDetailIndex].location.coordinates.longitude)
    }
    
    private func setupUI(){
        view.addSubview(friendImageView)
        view.addSubview(friendNameTextLabel)
        view.addSubview(nationalityTextLabel)
        view.addSubview(stackView_0)
        view.addSubview(mapView)
        let imageUrl = ImageResource(downloadURL: URL(string: NetworkManager.shared.friends.results[friendDetailIndex
        ].picture.large)!)
        friendImageView.kf.setImage(with: imageUrl)
        friendNameTextLabel.text = "\(NetworkManager.shared.friends.results[friendDetailIndex].name.title) \(NetworkManager.shared.friends.results[friendDetailIndex].name.first) \(NetworkManager.shared.friends.results[friendDetailIndex].name.last)"
        nationalityTextLabel.text = NetworkManager.shared.friends.results[friendDetailIndex].nat
        phoneLabel.text = NetworkManager.shared.friends.results[friendDetailIndex].phone
        locationLabel.text = NetworkManager.shared.friends.results[friendDetailIndex].location.city
    }
    
    private func setLayout(){
        friendImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        friendImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        friendImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        friendImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
        friendNameTextLabel.leadingAnchor.constraint(equalTo: friendImageView.leadingAnchor, constant: 8).isActive = true
        friendNameTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.74).isActive = true
        friendNameTextLabel.bottomAnchor.constraint(equalTo: friendImageView.bottomAnchor, constant: -6).isActive = true
        
        nationalityTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        nationalityTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        nationalityTextLabel.bottomAnchor.constraint(equalTo: friendNameTextLabel.bottomAnchor).isActive = true
        
        stackView_0.topAnchor.constraint(equalTo: friendImageView.bottomAnchor, constant: 2).isActive = true
        stackView_0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView_0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView_0.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        cellIconImageView.heightAnchor.constraint(equalTo: stackView_1.heightAnchor, multiplier: 0.45).isActive = true
        cellIconImageView.widthAnchor.constraint(equalTo: stackView_1.widthAnchor, multiplier: 1).isActive = true
        phoneLabel.widthAnchor.constraint(equalTo: stackView_1.widthAnchor).isActive = true
        phoneLabel.heightAnchor.constraint(equalTo: stackView_1.heightAnchor, multiplier: 0.54).isActive = true
        locationIconImageView.heightAnchor.constraint(equalTo: stackView_2.heightAnchor, multiplier: 0.45).isActive = true
        locationIconImageView.widthAnchor.constraint(equalTo: stackView_1.widthAnchor).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: stackView_2.widthAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalTo: stackView_1.heightAnchor, multiplier: 0.54).isActive = true
        
        stackView_1.heightAnchor.constraint(equalTo: stackView_0.heightAnchor, multiplier: 0.8).isActive = true
        stackView_2.heightAnchor.constraint(equalTo: stackView_0.heightAnchor, multiplier: 0.8).isActive = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: stackView_0.bottomAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    func mapRender(lat : String, long: String){
        let latitude = Double(lat)!
        let longitude = Double(long)!
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    
}



