//
//  CustomTableViewCell.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    static let reuseID = "Cell"
    
    private var service: Service?{
        didSet {
            if let service = service {
                serviceNameLbl.text = service.name
                serviceDescriptionLbl.text = service.serviceDescription
            }
        }
    }
    
    //MARK: - Create UI elements
    
    // Добавим View, для кастомного расположения элементов на ячейке
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // ImageView для картинки сервиса
    private let imageOfService: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.contentMode = .scaleAspectFit
//        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // ImageView для системной стрелки (шеврона)
    private let imageOfSelectCell: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.compact.right"))
        image.tintColor = .gray
 //       image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Label для названия сервиса
    private  let serviceNameLbl: UILabel = {
        let label = UILabel()
        label.text = "Сервис"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Label для описания сервиса
    private  let serviceDescriptionLbl: UILabel = {
        let label = UILabel()
        label.text = "Описание сервиса"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life cicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Self.reuseID)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Methods
    
    func config(with service: Service){
        self.service = service
    }
    
    
    // MARK: - Constraints
    
    func setupConstraints() {
        addSubview(cellView)
 //       self.selectionStyle = .none
        
        let textStack = UIStackView(arrangedSubviews: [serviceNameLbl, serviceDescriptionLbl])
        textStack.axis = .vertical
        textStack.spacing = 4
        
        let contentStack = UIStackView(arrangedSubviews: [imageOfService, textStack, imageOfSelectCell])
        cellView.addSubview(contentStack)
        contentStack.axis = .horizontal
        contentStack.spacing = 10
        contentStack.alignment = .center
        contentStack.distribution = .fillProportionally
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            contentStack.topAnchor.constraint(equalTo: cellView.topAnchor),
            contentStack.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            
            imageOfService.heightAnchor.constraint(equalToConstant: 80),
            imageOfService.widthAnchor.constraint(equalToConstant: 80),
            
            imageOfSelectCell.heightAnchor.constraint(equalToConstant: 20),
            imageOfSelectCell.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}
