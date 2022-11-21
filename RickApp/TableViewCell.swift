//
//  TableViewCell.swift
//  RickApp
//
//  Created by Вадим on 15.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    var a: CGFloat = 25
    var b: CGFloat = 0
    
    let imagesView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 32
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"SF UI Text", size: 21)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"SF UI Text", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let videoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        button.setTitle("Watch Episodes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let locationNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"SF UI Text", size: 14)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont(name:"SF UI Text", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setSubviews() {
        self.addSubview(imagesView)
        self.addSubview(statusLabel)
        
    }
    
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [nameLabel, speciesLabel, videoButton, locationNameLabel])
        stack.alignment = .leading
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stack)
        
        /*
        if statusLabel.backgroundColor == .systemGreen {
            b = 56
        } else if statusLabel.backgroundColor == .systemRed {
            b = 55
        } else {
            b = 92
        }
        */
        
        NSLayoutConstraint.activate([
            imagesView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            imagesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imagesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imagesView.widthAnchor.constraint(equalToConstant: 120),
            imagesView.heightAnchor.constraint(equalToConstant: 120),
            
            stack.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            stack.leadingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: 18),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: stack.topAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            statusLabel.widthAnchor.constraint(equalToConstant: b),
            statusLabel.heightAnchor.constraint(equalToConstant: a)
        ])
    }
    
    func setImage(result : String) {
        guard let receivedImage = try? Data(contentsOf: URL(string: result)!) else {return}
        imagesView.image = UIImage(data: receivedImage)
    }
    
    func setName(result: String) {
        nameLabel.text = result
    }
    
    func setSpecies(result: String) {
        speciesLabel.text = result
    }
    
    func setOrigin(result: String) {
        locationNameLabel.text = result
    }
    
    func setStatus(result: String) {
        statusLabel.text = result.uppercased()
        switch result {
        case "Alive": statusLabel.backgroundColor = .systemGreen
        case "Dead": statusLabel.backgroundColor = .systemRed
        default: statusLabel.backgroundColor = .systemGray
        }
        
        switch result {
        case "Alive": b = 56
        case "Dead": b = 55
        default: b = 92
        }
    }
    
    func aliveStatus() {
        statusLabel.backgroundColor = .systemGreen
        
    }
}
