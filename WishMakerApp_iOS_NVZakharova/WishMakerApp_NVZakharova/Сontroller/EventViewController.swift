//
//  EventViewController.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 06.02.2024.
//

import UIKit

class EventViewController: UIViewController {
    
    
    enum Constants {
        
        static let headerLabelFontSize: CGFloat  = 40
        static let headerLabelText = "Add new Event! "
        static let headerLabelNumberOfLines = 1
        static let headerLabelTopConstraint: Double = 20
        static let headerLabelLeadingConstraint: Double = 20
        
        static let titleLabelFontSize: CGFloat = 25
        static let titleLabelText = "Title"
        static let titleLabelNumberOfLines = 1
        static let titleLabelTopConstraint: Double = 30
        static let titleLabelLeadingConstraint: Double = 20
        
        static let titleTextFontSize: CGFloat = 14
        static let titleTextText = ""
        static let titleTextCornerRadius: CGFloat = 10
        static let titleTextTopConstraint: Double = 5
        static let titleTextLeadingConstraint: Double = 20
        static let titleTextWidthConstraint: Double = 300
        static let titleTextHeightConstraint: Double = 32
        
        static let descriptionLabelFontSize: CGFloat = 25
        static let descriptionLabelText = "Description"
        static let descriptionLabelNumberOfLines = 1
        static let descriptionLabelTopConstraint: Double = 30
        static let descriptionLabelLeadingConstraint: Double = 20
        
        static let descriptionTextFontSize: CGFloat = 14
        static let descriptionTextText = ""
        static let descriptionTextCornerRadius: CGFloat = 10
        static let descriptionTextTopConstraint: Double = 5
        static let descriptionTextLeadingConstraint: Double = 20
        static let descriptionTextWidthConstraint: Double = 300
        static let descriptionTextHeightConstraint: Double = 32
        
        static let startDateLabelFontSize: CGFloat = 25
        static let startDateLabelText = "Start"
        static let startDateLabelNumberOfLines = 1
        static let startDateLabelTopConstraint: Double = 30
        static let startDateLabelLeadingConstraint: Double = 20
        
        static let startDatePickerTrainlingConstraint: Double = -30
        
        static let finishLabelFontSize: CGFloat = 25
        static let finishLabelText = "Finish"
        static let finishLabelNumberOfLines = 1
        static let finishLabelTopConstraint: Double = 30
        static let finishLabelLeadingConstraint: Double = 20
        
        static let finishDatePickerTrainlingConstraint: Double = -30
        
        static let addButtonTitle = "Add"
        static let addButtonCornerRadius: CGFloat = 15
        static let addButtonButtomConstraint: Double = -20
        static let addButtonWidthConstraint: Double = 300
        static let addButtonHeightConstraint: Double = 50
        
    }
    
    
    private var addEvent: ((WishEventModel) -> ())?
    
    private let headerLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let finishDateLabel: UILabel = UILabel()
    
    private let startDatePicker = UIDatePicker()
    private let finishDatePicker = UIDatePicker()
    
    
    private let titleText: UITextView = UITextView()
    private let descriptionText: UITextView = UITextView()
    
    private let addButton: UIButton = UIButton()
    private let table: UITableView = UITableView()
    private let pickFromWishesButton: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
    }
    
    public func getAddButton() -> UIButton {
        return addButton
    }
    
    func configureAction(action: ((WishEventModel) -> ())?) {
        addEvent = action
    }
    
    
    private func configureUI() {
        //view.backgroundColor = WishMakerViewController.currentColor
        configureHeaderLabel()
        configureTitleLabel()
        configureTitleText()
        configureDescriptionLabel()
        configureDescriptionText()
        configureStartDateLabel()
        configureStartDatePicker()
        configureFinishDateLabel()
        configureFinishDatePicker()
        configureAddButton()
        configureTable()
        configurePickFromWishesButton()
    }
    
    private func configureHeaderLabel() {
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: Constants.headerLabelFontSize, weight: .bold)
        
        headerLabel.text = Constants.headerLabelText
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = Constants.headerLabelNumberOfLines
        
        view.addSubview(headerLabel)
        
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.headerLabelTopConstraint),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.headerLabelLeadingConstraint)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: Constants.titleLabelFontSize, weight: .medium)
        
        titleLabel.text = Constants.titleLabelText
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = Constants.titleLabelNumberOfLines
        
        view.addSubview(titleLabel)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Constants.titleLabelTopConstraint),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.titleLabelLeadingConstraint)
        ])
    }
    
    
    private func configureTitleText() {
        titleText.textColor = .black
        titleText.font = UIFont.systemFont(ofSize: Constants.titleTextFontSize, weight: .medium)
        
        titleText.text = Constants.titleTextText
        titleText.textAlignment = .center
        titleText.isEditable = true
        titleText.backgroundColor = .white
        titleText.layer.cornerRadius = Constants.titleTextCornerRadius
        
        view.addSubview(titleText)
        
        titleText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.titleTextTopConstraint),
            titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.titleTextLeadingConstraint),
            titleText.widthAnchor.constraint(equalToConstant: Constants.titleTextWidthConstraint),
            titleText.heightAnchor.constraint(equalToConstant: Constants.titleTextHeightConstraint)
        ])
        
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: Constants.descriptionLabelFontSize, weight: .medium)
        
        descriptionLabel.text = Constants.descriptionLabelText
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = Constants.descriptionLabelNumberOfLines
        
        view.addSubview(descriptionLabel)
        
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: Constants.descriptionLabelTopConstraint),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.descriptionLabelLeadingConstraint)
        ])
    }
    
    private func configureDescriptionText() {
        descriptionText.textColor = .black
        descriptionText.font = UIFont.systemFont(ofSize: Constants.descriptionTextFontSize, weight: .medium)
        
        descriptionText.text = Constants.descriptionTextText
        descriptionText.textAlignment = .center
        descriptionText.isEditable = true
        descriptionText.backgroundColor = .white
        descriptionText.layer.cornerRadius = Constants.descriptionTextCornerRadius
        
        view.addSubview(descriptionText)
        
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.descriptionTextTopConstraint),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.descriptionTextLeadingConstraint),
            descriptionText.widthAnchor.constraint(equalToConstant: Constants.descriptionTextWidthConstraint),
            descriptionText.heightAnchor.constraint(equalToConstant: Constants.descriptionTextHeightConstraint)
        ])
    }
    
    private func configureStartDateLabel() {
        startDateLabel.textColor = .white
        startDateLabel.font = UIFont.systemFont(ofSize: Constants.startDateLabelFontSize, weight: .medium)
        
        startDateLabel.text = Constants.startDateLabelText
        startDateLabel.textAlignment = .left
        startDateLabel.numberOfLines = Constants.startDateLabelNumberOfLines
        
        view.addSubview(startDateLabel)
        
        
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDateLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: Constants.startDateLabelTopConstraint),
            startDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.startDateLabelLeadingConstraint)
        ])
    }
    
    private func configureStartDatePicker() {
        startDatePicker.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            startDatePicker.preferredDatePickerStyle = .automatic
        }
        
        view.addSubview(startDatePicker)
        
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            startDatePicker.centerYAnchor.constraint(equalTo: startDateLabel.centerYAnchor),
            startDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.startDatePickerTrainlingConstraint)
        ])
    }
    
    private func configureFinishDateLabel() {
        finishDateLabel.textColor = .white
        finishDateLabel.font = UIFont.systemFont(ofSize: Constants.finishLabelFontSize, weight: .medium)
        
        finishDateLabel.text = Constants.finishLabelText
        finishDateLabel.textAlignment = .left
        finishDateLabel.numberOfLines = Constants.finishLabelNumberOfLines
        
        view.addSubview(finishDateLabel)
        
        
        finishDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            finishDateLabel.topAnchor.constraint(equalTo: startDatePicker.bottomAnchor, constant: Constants.finishLabelTopConstraint),
            finishDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.finishLabelLeadingConstraint)
        ])
    }
    
    private func configureFinishDatePicker() {
        finishDatePicker.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            finishDatePicker.preferredDatePickerStyle = .automatic
        }
        
        view.addSubview(finishDatePicker)
        
        finishDatePicker.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            finishDatePicker.centerYAnchor.constraint(equalTo: finishDateLabel.centerYAnchor),
            finishDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    
    private func configureAddButton() {
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .white
        addButton.layer.cornerRadius = 15
        
        view.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 300),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func addButtonPressed() {
        addEvent?(WishEventModel(title: titleText.text, description: descriptionText.text, startDate: startDatePicker.date, endDate: finishDatePicker.date))
        print ("hello")
        dismiss(animated: true)
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: finishDatePicker.bottomAnchor, constant: 30).isActive = true
        table.widthAnchor.constraint(equalToConstant: 300).isActive = true
        table.heightAnchor.constraint(equalToConstant: 150).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        table.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.layer.cornerRadius = 15
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
    }
    
    
    private func configurePickFromWishesButton() {
        pickFromWishesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickFromWishesButton)
        pickFromWishesButton.backgroundColor = WishMakerViewController.accentColor
        pickFromWishesButton.setTitle("Pick", for: .normal)
        pickFromWishesButton.setTitleColor(WishMakerViewController.accentColor, for: .normal)
        pickFromWishesButton.leadingAnchor.constraint(equalTo: titleText.trailingAnchor, constant: 20).isActive = true
        pickFromWishesButton.layer.cornerRadius = 10
        pickFromWishesButton.pinCenterY(to: titleText.centerYAnchor)
        pickFromWishesButton.setWidth(50)
        pickFromWishesButton.setHeight(50)
        pickFromWishesButton.setImage(UIImage(systemName: "arrow.turn.left.down"), for: .normal)
        pickFromWishesButton.addTarget(self, action: #selector(pickFromWishes), for: .touchUpInside)
    }
    
    @objc
    private func pickFromWishes() {
        if (table.isHidden) {
            table.isHidden = false
        } else {
            table.isHidden = true
        }
    }
    
}

extension EventViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WishStoringViewController.wishArray.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: WrittenWishCell.reuseId,
            for: indexPath
        )
        guard let wishCell = cell as? WrittenWishCell else { return cell }
        wishCell.configure(with: WishStoringViewController.wishArray[indexPath.row])
        return wishCell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        titleText.text = WishStoringViewController.wishArray[indexPath.row]
    }
}


