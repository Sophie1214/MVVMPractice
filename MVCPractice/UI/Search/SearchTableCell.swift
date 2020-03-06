//
//  SearchTableCell.swift
//  MVCPractice
//
//  Created by Sophie Su on 2020-03-06.
//  Copyright © 2020 Trak iT. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class SearchTableCell: UITableViewCell {
    
    let leftImage = UIImageView().then { (view) in
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "avatar")
    }
    
    let nameLabel = UILabel().then { (label) in
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Developer Name"
    }
    
    let descriptionLabel = UILabel().then { (label) in
        label.font = UIFont.systemFont(ofSize: 16)
    }
    
    let locationLabel = UILabel().then { (label) in
        label.font = UIFont.systemFont(ofSize: 16)
    }
    
    let bookmarkLabel = UILabel().then { (label) in
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.text = "📓 0"
    }
    
    let eyeLabel = UILabel().then { (label) in
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.text = "👁 0"
    }
    
    let peopleLabel = UILabel().then { (label) in
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.text = "ᢜ 0"
    }

 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(leftImage)
        leftImage.easy.layout(Left(10), Top(10), Bottom(>=10))
        
        contentView.addSubview(nameLabel)
        nameLabel.easy.layout(Left(10).to(leftImage, .right), Top().to(leftImage, .top))
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.easy.layout(Left().to(nameLabel, .left), Top(8).to(nameLabel, .bottom))
        
        contentView.addSubview(locationLabel)
        locationLabel.easy.layout(Left().to(descriptionLabel, .left), Top(8).to(descriptionLabel, .bottom))
        
        contentView.addSubview(bookmarkLabel)
        bookmarkLabel.easy.layout(Left().to(locationLabel, .left), Top(3).to(locationLabel, .bottom))
        
        contentView.addSubview(eyeLabel)
        eyeLabel.easy.layout(CenterY().to(bookmarkLabel, .centerY), Left(35).to(bookmarkLabel, .right))
        
        contentView.addSubview(peopleLabel)
        peopleLabel.easy.layout(CenterY().to(bookmarkLabel, .centerY), Left(35).to(eyeLabel, .right))
    }
    
    func populateContent(developer: Developer){
        nameLabel.text = developer.name
        descriptionLabel.text = developer.description
        locationLabel.text = "⚑ \(developer.location)"
        bookmarkLabel.text = "📓 \(developer.bookmark)"
        eyeLabel.text = "👁 \(developer.eye)"
        peopleLabel.text = "ᢜ \(developer.people)"
    }
}
