//
//  TableViewCell.swift
//  RickApp
//
//  Created by Вадим on 15.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    let imagesView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 32
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.text = ""
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var speciesGenderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let images = UIImageView()
        images.image = UIImage(systemName: "arrowtriangle.right.fill")
        images.tintColor = UIColor.textOrange
        return images
    }()
    
    let videoButton: UIButton = {
        let button = UIButton()
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
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25/2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let videoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17/2
        view.clipsToBounds = true
        view.backgroundColor = UIColor.mainOrange
        view.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubview(statusView)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(speciesGenderLabel)
        self.addSubview(videoView)
        videoView.addSubview(image)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imagesView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imagesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imagesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imagesView.widthAnchor.constraint(equalToConstant: 120),
            imagesView.heightAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            nameLabel.leadingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: 18),
            nameLabel.widthAnchor.constraint(equalToConstant: 137),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            speciesGenderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            speciesGenderLabel.leadingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: 18),
            
            videoView.topAnchor.constraint(equalTo: speciesGenderLabel.bottomAnchor, constant: 12),
            videoView.leadingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: 18),
            videoView.widthAnchor.constraint(equalToConstant: 148),
            videoView.heightAnchor.constraint(equalToConstant: 35),
            
            
            image.widthAnchor.constraint(equalToConstant: 10),
            image.heightAnchor.constraint(equalToConstant: 12),
            image.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 13),
            image.leadingAnchor.constraint(equalTo: videoView.trailingAnchor, constant: 12),
            
            
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            
        ])
    }
    
    func setImage(result : String) {
        guard let receivedImage = try? Data(contentsOf: URL(string: result)!) else {return}
        imagesView.image = UIImage(data: receivedImage)
    }
    
    func setName(result: String) {
        nameLabel.text = result
    }
    
    func setSpecies(speciesResult: String, genderResult: String) {
        speciesGenderLabel.text = "\(speciesResult), \(genderResult)"
       
    }
    
    func setOrigin(result: String) {
        locationNameLabel.text = result
    }
    
    func setStatus(result: String) {
        statusLabel.text = result.uppercased()
        switch result {
        case "Alive": statusView.backgroundColor = UIColor.mainGreen
        case "Dead": statusView.backgroundColor = UIColor.mainRed
        default: statusView.backgroundColor = UIColor.mainGray
        }
        
        switch result {
        case "Alive":
            NSLayoutConstraint.activate([
                statusView.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor),
                statusView.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
                statusView.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -8),
                statusView.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 8),
                statusView.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -4),
                statusView.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            ])
        case "Dead":
            NSLayoutConstraint.activate([
                statusView.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor),
                statusView.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
                statusView.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -8),
                statusView.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 8),
                statusView.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -4),
                statusView.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            ])
        default:
            NSLayoutConstraint.activate([
                statusView.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor),
                statusView.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
                statusView.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -8),
                statusView.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 8),
                statusView.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -4),
                statusView.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            ])
        }
    }
}

extension UIColor {
    static var mainGreen = UIColor(red: 199/255, green: 255/255, blue: 185/255, alpha: 1)
    static var mainRed = UIColor(red: 255/255, green: 232/255, blue: 224/255, alpha: 1)
    static var mainGray = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    static var mainOrange = UIColor(red: 255/255, green: 107/255, blue: 0/255, alpha: 0.1)
    static var textOrange = UIColor(red: 255/255, green: 107/255, blue: 0/255, alpha: 1)
}
