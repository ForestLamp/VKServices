//
//  CustomTableViewCell.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageOfService: UIImage = {
        let image = UIImage()
        
        return image
    }()
    
    private  let serviceName: UILabel = {
        let label = UILabel()
        label.text = "Сервис"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private  let serviceDescription: UILabel = {
        let label = UILabel()
        label.text = "Описание сервиса"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life cicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Constraints
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(serviceName)
 //       self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            serviceName.heightAnchor.constraint(equalToConstant: 200),
            serviceName.widthAnchor.constraint(equalToConstant: 200),
            serviceName.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            serviceName.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20)
        ])
        

        
    }
    
    /*  Clean!
     override func awakeFromNib() {
     super.awakeFromNib()
     // Initialization code
     }
     
     override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)
     
     // Configure the view for the selected state
     }
     */
    
}
