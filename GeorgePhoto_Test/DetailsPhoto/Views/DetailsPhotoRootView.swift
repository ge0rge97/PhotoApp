//
//  DetailsPhotoRootView.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

final class DetailsPhotoRootView: BaseView {
    
    let detailsImage = UIImageView()
    
    let authorNameLabel = DetailsPhotoRootView.createDetailsLabel()
    let photoCreateDateLabel = DetailsPhotoRootView.createDetailsLabel()
    let photoNumberOfLikesLabel = DetailsPhotoRootView.createDetailsLabel()
    
    private let stackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            detailsImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.detailsImageSidesSpacing),
            detailsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.detailsImageSidesSpacing),
            detailsImage.heightAnchor.constraint(equalTo: detailsImage.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: detailsImage.bottomAnchor, constant: Constants.labelSpacing),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.labelSpacing),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.labelSpacing),
            stackView.heightAnchor.constraint(equalToConstant: self.bounds.height / 5)
        ])
    }
}
//MARK: - Required Methods
extension DetailsPhotoRootView {
    
    override func setupViews() {
        
        [authorNameLabel, photoCreateDateLabel, photoNumberOfLikesLabel].forEach{ stackView.addArrangedSubview($0) }
        
        [detailsImage, stackView].forEach{ addSubview($0) }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        [detailsImage, authorNameLabel, photoCreateDateLabel, photoNumberOfLikesLabel, stackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        detailsImage.backgroundColor = .lightGray
        detailsImage.layer.cornerRadius = 10
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
}
//MARK: - Private Methods
private extension DetailsPhotoRootView {
    static func createDetailsLabel() -> UILabel {
        
        let label = UILabel()
        
        label.textColor = .gray
        label.font = R.Fonts.regularFont(withSize: 18)
        label.textAlignment = .center
        
        return label
    }
}
//MARK: - Constants
private extension DetailsPhotoRootView {
    
    enum Constants {
        
        static let detailsImageSidesSpacing: CGFloat = 10
        
        static let labelSpacing: CGFloat = 10
    }
}
