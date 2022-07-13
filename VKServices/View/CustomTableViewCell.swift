//
//  CustomTableViewCell.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import SwiftUI


struct SwiftUIController: UIViewControllerRepresentable {
    typealias UIViewControllerType = MainTableViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = UIViewControllerType()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct SwiftUIController_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIController().edgesIgnoringSafeArea(.all)
    }
}

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    static let reuseID = "Cell"
    
    private var cellImage: UIImage? {
        get {
            return imageOfService.image
        } set {
                    //    self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = false
            imageOfService.image = newValue
        }
    }
    
    //MARK: - Create UI elements
    
    private let activityIndicator: UIActivityIndicatorView = {
       let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()
    
    // Добавим View, для кастомного расположения элементов на ячейке
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // ImageView для картинки сервиса
    private let imageOfService: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // ImageView для системной стрелки (шеврона)
    private let imageOfSelectCell: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.compact.right"))
        image.tintColor = .gray
        return image
    }()
    
    // Label для названия сервиса
    private  let serviceNameLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Label для описания сервиса
    private  let serviceDescriptionLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //       label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        //      label.minimumScaleFactor = 5
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
    
    
    
    // MARK: - Constraints
    
    func setupConstraints() {
        addSubview(cellView)
        self.selectionStyle = .none
        
        let textStack = UIStackView(arrangedSubviews: [serviceNameLbl, serviceDescriptionLbl])
        textStack.axis = .vertical
        textStack.spacing = 0
        textStack.alignment = .leading
        textStack.distribution = .equalCentering
        
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
            
            imageOfService.heightAnchor.constraint(equalToConstant:80),
            imageOfService.widthAnchor.constraint(equalToConstant: 80),
            
            imageOfSelectCell.heightAnchor.constraint(equalToConstant: 17),
            imageOfSelectCell.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}

extension CustomTableViewCell {
    
    func setupCell(model: Service) {
        serviceNameLbl.text = model.name
        serviceDescriptionLbl.text = model.serviceDescription
        cellImage = UIImage()
               self.activityIndicator.startAnimating()
               self.activityIndicator.isHidden = false
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: model.iconURL) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.cellImage = UIImage(data: imageData)
            }
        }
    }
}
