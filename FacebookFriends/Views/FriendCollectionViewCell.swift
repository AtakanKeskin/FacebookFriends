//
//  FriendCollectionViewCell.swift
//  FacebookFriends
//
//  Created by macbook on 5.11.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FriendCollectionViewCell"
    
    public let friendImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBackground
        imageView.layer.cornerRadius = 16.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let nameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test Name"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        return label
    }()
    
    public let lastNameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test Last Nameasdasdasd"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        return label
    }()
    
    private let stackView : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
       return stackView
    }()
    
    private let lineView : UIView = {
        let view_0 = UIView()
        view_0.translatesAutoresizingMaskIntoConstraints = false
        view_0.backgroundColor = .systemBlue
        return view_0
    }()
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        contentView.addSubview(friendImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(lineView)
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(lastNameLabel)
        contentView.backgroundColor = .systemBackground
        stackView.backgroundColor = .systemBackground
        
        
        friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        friendImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
        friendImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        
        stackView.topAnchor.constraint(equalTo: friendImageView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(lastNameLabel)
        
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
