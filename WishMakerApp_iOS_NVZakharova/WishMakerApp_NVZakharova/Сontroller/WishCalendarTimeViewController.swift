//
//  WishCalendarTimeViewController.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 06.02.2024.
//


import UIKit

class WishCalendarTimeViewController: UIViewController {
    
    enum Constants {
        
        static let eventKey = "event"
        static let contentInsetTop: CGFloat = 0
        static let contentInsetBottom: CGFloat = 0
        static let contentInsetLeft: CGFloat = 0
        static let contentInsetRight: CGFloat = 0
        
        static let layoutMinimumInteritemSpacing: CGFloat = 0
        static let layoutMinimumLineSpacing: CGFloat = 0
        
        static let reuseId = "cell"
        
        static let collectionViewTopConstraint: Double = 50
        static let addButtonColor: UIColor = .white
        static let addButtonTitle = "Add"
        static let addButtonCornerRadius: CGFloat = 15
        
        static let addEventButtonBottomConstraint: Double = -10
        static let addEventButtonWidthConstraint: Double = 200
        static let addEventButtonHeightConstraint: Double = 30
        static let cellHeight: CGFloat = 120
        
    }
    
    private let calendarManager: CalendarManager = CalendarManager()
    private var eventArray: [WishEventModel] = []
    private let defaults = UserDefaults.standard
    
    private let collectionView: UICollectionView = UICollectionView (
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let addEventButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = WishMakerViewController.accentColor
        configureCollection()
        configureAddEventButton()
        loadEvents()
    }
    
    private func loadEvents() {
        let decoder = JSONDecoder()
        if let savedEvents = UserDefaults.standard.object(forKey: Constants.eventKey) as? Data,
           let loadedEvents = try? decoder.decode([WishEventModel].self, from: savedEvents) {
            eventArray = loadedEvents
            return
        }
        eventArray = []
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false

        collectionView.contentInset = UIEdgeInsets(top: Constants.contentInsetTop, left: Constants.contentInsetLeft, bottom: Constants.contentInsetBottom, right: Constants.contentInsetRight)
        collectionView.register(
            WishEventCell.self,
            forCellWithReuseIdentifier: WishEventCell.reuseId
        )
        
        defaults.array(forKey: Constants.eventKey)
        if let layout = collectionView.collectionViewLayout as?
            UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = Constants.layoutMinimumInteritemSpacing
            layout.minimumLineSpacing = Constants.layoutMinimumLineSpacing
            
            layout.invalidateLayout()
        }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseId)
        view.addSubview(collectionView)
        
        collectionView.pinHorizontal(to: view)
        collectionView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collectionView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.collectionViewTopConstraint)
    }
    
    
    private func configureAddEventButton() {
        addEventButton.backgroundColor = .white
        addEventButton.setTitle(Constants.addButtonTitle, for: .normal)
        addEventButton.setTitleColor(view.backgroundColor, for: .normal)
        addEventButton.layer.cornerRadius = Constants.addButtonCornerRadius
        addEventButton.layer.shadowColor = UIColor.black.cgColor
        
        view.addSubview(addEventButton)
        
        addEventButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addEventButton.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: Constants.addEventButtonBottomConstraint),
            addEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addEventButton.widthAnchor.constraint(equalToConstant: Constants.addEventButtonWidthConstraint),
            addEventButton.heightAnchor.constraint(equalToConstant: Constants.addEventButtonHeightConstraint)
        ])
        
        addEventButton.addTarget(self, action: #selector(addEventButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func addEventButtonPressed() {
        let destinationVC = EventViewController()
        destinationVC.view.backgroundColor = view.backgroundColor
        destinationVC.configureAction { wishEvent in
            self.eventArray.append(wishEvent)
            self.collectionView.reloadData()
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.eventArray) {
             UserDefaults.standard.set(encoded, forKey: Constants.eventKey)
             }
            self.calendarManager.create(eventModel: wishEvent)
        }
        present(destinationVC, animated: true)
    }
    
    
    
}

extension WishCalendarTimeViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return eventArray.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                        WishEventCell.reuseId, for: indexPath)
        guard let wishEventCell = cell as? WishEventCell else {
            return cell
        }
        wishEventCell.configure(
            with: eventArray[indexPath.row]
            )
        return cell
    }
}

extension WishCalendarTimeViewController:  UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // Adjust cell size as needed
        return CGSize(width: collectionView.bounds.width, height: Constants.cellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell tapped at index \(indexPath.item)")
    }
}

