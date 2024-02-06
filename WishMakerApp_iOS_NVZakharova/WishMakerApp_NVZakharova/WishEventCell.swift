//
//  WishEventCell.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 06.02.2024.
//

import UIKit

final class WishEventCell: UICollectionViewCell {

    static let reuseId: String = "WishEventCell"
    
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let endDateLabel: UILabel = UILabel()
    private let image: UIImageView = UIImageView()
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateFormatter.dateStyle = DateFormatter.Style.medium
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        startDateLabel.text = "Start Date: \(dateFormatter.string(from: event.startDate))"
        endDateLabel.text = "End Date: \(dateFormatter.string(from: event.endDate))"
    }
    
    private func configureWrap() {
        addSubview(wrapView)
        wrapView.backgroundColor = .white
        wrapView.layer.cornerRadius = 12
        wrapView.layer.borderWidth = 1
        wrapView.layer.borderColor = .none
        
        
        wrapView.translatesAutoresizingMaskIntoConstraints = false
        wrapView.pinHorizontal(to: self, 5)
        wrapView.pinVertical(to: self, 5)
    }
    
    private func configureTitleLabel() {
        wrapView.addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
     
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.pinTop(to: wrapView, 10)
        titleLabel.pinHorizontal(to: wrapView, 10)
    }
    
    private func configureDescriptionLabel() {
        wrapView.addSubview(descriptionLabel)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, 5)
        descriptionLabel.pinHorizontal(to: wrapView, 10)
    }
    
    private func configureStartDateLabel() {
        wrapView.addSubview(startDateLabel)
        startDateLabel.font = UIFont.systemFont(ofSize: 12)
        
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.pinHorizontal(to: wrapView, 10)
        startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, 5)
    }
    
    private func configureEndDateLabel() {
        wrapView.addSubview(endDateLabel)
        endDateLabel.font = UIFont.systemFont(ofSize: 12)
        
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateLabel.pinHorizontal(to: wrapView, 10)
        endDateLabel.pinTop(to: startDateLabel.bottomAnchor, 5)
        endDateLabel.pinBottom(to: wrapView, 0)
    }
    
  
}
