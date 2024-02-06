//
//  AddWishCell.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 05.02.2024.
//

import UIKit

class AddWishCell: UITableViewCell {
    
    private var addWish: ((String) -> ())?
    static let reuseId: String = Constants.reuseId
    
    private enum Constants {
        static let wrapColor: UIColor = .red
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
        
        static let reuseId = "AddWishCell"
        static let wrapCornerRadius: CGFloat = 20
        static let wrapHeightConstraint: Double = 70
        
        static let wishTextViewHorizontalConstraint: Double = 20
        static let wishTextViewTopConstraint: Double = 10
        static let wishTextViewHeightConstraint: Double = 30
        static let wishTextViewCornerRadius: CGFloat = 10
        
        static let wishButtonTitle = "Add!"
        static let wishButtonHeightConstraint: Double = 20
        static let wishButtonTopConstraint: Double = 5
        static let wishButtonLeftConstraint: Double = 20
        static let wishButtonWidthConstraint: Double = 100
        static let wishButtonCornerRadius: Double = 10
        
        
        
    }
    private let wishTextView: UITextView = UITextView()
    private let wishButton: UIButton = UIButton()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(action: @escaping (String) -> ()) {
        addWish = action
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        let wrap: UIView = UIView()
        
        contentView.addSubview(wrap)
        wrap.isUserInteractionEnabled = true
        wrap.backgroundColor = .lightGray
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.pin(to: contentView)
        wrap.addSubview(wishTextView)
        wrap.addSubview(wishButton)
        
        wishTextView.translatesAutoresizingMaskIntoConstraints = false
        wishButton.translatesAutoresizingMaskIntoConstraints = false
        wrap.setHeight(Constants.wrapHeightConstraint)
        
        wishTextView.backgroundColor = .white
        wishTextView.pinHorizontal(to: wrap, Constants.wishTextViewHorizontalConstraint)
        wishTextView.pinTop(to: wrap, Constants.wishTextViewTopConstraint)
        wishTextView.setHeight(Constants.wishTextViewHeightConstraint)
        
        wishButton.backgroundColor = .systemGray
        wishButton.setTitle(Constants.wishButtonTitle, for: .normal)
    
        wishButton.setHeight(Constants.wishButtonHeightConstraint)
        wishButton.pinTop(to: wishTextView.bottomAnchor, Constants.wishButtonTopConstraint)
        wishButton.pinLeft(to: wrap, Constants.wishButtonLeftConstraint)
        wishButton.setWidth(Constants.wishButtonWidthConstraint)
        wishButton.layer.cornerRadius = Constants.wishButtonCornerRadius
        wishButton.addTarget(self, action: #selector(addWishButtonTapped), for: .touchUpInside)
        
        wishTextView.layer.cornerRadius = Constants.wishTextViewCornerRadius
        
    }
    
    @objc func addWishButtonTapped() {
        addWish?(wishTextView.text!)
        wishTextView.text = String()
    }
}

