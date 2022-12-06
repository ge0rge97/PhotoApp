//
//  BaseCollectionViewCell.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

class PhotoBaseCollectionViewCell: UICollectionViewCell {
    
    var photoImageView = UIImageView()
    
    private var actionButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
        setupConstraints()
        configureAppearance()
    }
    
    func setButtonImage(withImage image: UIImage?) {
        self.actionButton.setBackgroundImage(image, for: .normal)
    }
    
    func setActionButtonAction(forTarget target: Any, action: Selector) {
        self.actionButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Required Methods
extension PhotoBaseCollectionViewCell {
    private func setupViews() {
        [photoImageView, actionButton].forEach{ addSubview($0) }
    }
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            actionButton.widthAnchor.constraint(equalToConstant: 30),
            actionButton.heightAnchor.constraint(equalToConstant: 30),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    private func configureAppearance() {
        [photoImageView, actionButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        actionButton.tintColor = .red
    }
}
