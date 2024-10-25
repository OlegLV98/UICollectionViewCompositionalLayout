//
//  MainViewController.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import UIKit

enum Layout: Int {
    case news
    case events
    case users
}

final class MainViewController: UIViewController {
    
    private lazy var collectionData = CollectionSection.mockData()
    
    private lazy var collectionView: UICollectionView = {
        $0.register(CollectionNewsCell.self, forCellWithReuseIdentifier: CollectionNewsCell.reuseId)
        $0.register(CollectionEventsCell.self, forCellWithReuseIdentifier: CollectionEventsCell.reuseId)
        $0.register(CollectionUsersCell.self, forCellWithReuseIdentifier: CollectionUsersCell.reuseId)
        
        $0.register(NewsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsHeaderCell.reuseId)
        $0.register(NewsFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NewsFooterCell.reuseId)
        $0.register(EventsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventsHeaderCell.reuseId)
        $0.register(UsersHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UsersHeaderCell.reuseId)
        
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = #colorLiteral(red: 0.9215685725, green: 0.9215685725, blue: 0.9215685725, alpha: 1)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: CGRect(x: 0, y: 59, width: view.frame.width, height: view.frame.height - 59), collectionViewLayout: createLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionNumber, _ in
            let section = Layout(rawValue: sectionNumber)!
            switch section {
            case .news: return self?.createNewsLayoutSection()
            case .events: return self?.createEventsLayoutSection()
            case .users: return self?.createUsersLayoutSection()
            }
        }
    }
    
    private func createNewsLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(321), heightDimension: .estimated(161))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       repeatingSubitem: item,
                                                       count: 1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 25)
        let section = NSCollectionLayoutSection(group: group)
    
        section.contentInsets = .init(top: 16, leading: 30, bottom: 0, trailing: 5)
        section.orthogonalScrollingBehavior = .paging
    
        section.boundarySupplementaryItems = [createHeaderSize(), createFooterSize()]
        return section
    }
    
    private func createEventsLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(51))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 7, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(317), heightDimension: .estimated(161))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                       repeatingSubitem: item,
                                                       count: 3)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 15, leading: 30, bottom: 60, trailing: 15)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [createHeaderSize()]
        return section
    }
    
    private func createUsersLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(213), heightDimension: .absolute(173))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       repeatingSubitem: item,
                                                       count: 1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)
      
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 14, leading: 30, bottom: 24, trailing: 10)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.boundarySupplementaryItems = [createHeaderSize()]
        return section
    }
    
    private func createHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(24)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
        
        headerSize.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        return headerSize
    }
    
    private func createFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerSize = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(28)),
              elementKind: UICollectionView.elementKindSectionFooter,
              alignment: .bottom)
        footerSize.contentInsets = .init(top: 11, leading: 0, bottom: -72, trailing: 0)
        return footerSize
    }
    
    private func createCell<T: SelfConfiguringCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Error Cell")
        }
        let item = collectionData[indexPath.section].items[indexPath.item]
        cell.setupCell(item: item)
        return cell
    }
    
    private func createSupplementaryView<T: SelfConfiguringSupplementaryView>(supplementaryElement: T.Type, elementKind: String, indexPath: IndexPath) -> T {
        guard let supplementaryElementView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind , withReuseIdentifier: supplementaryElement.reuseId, for: indexPath) as? T else {
            fatalError("Error Cell")
        }
        let header = collectionData[indexPath.section].header
        let footer = collectionData[indexPath.section].footer
        let viewButton = collectionData[indexPath.section].viewButton
        supplementaryElementView.setupView(header: header, footer: footer, viewButton: viewButton)
        return supplementaryElementView
    }
}


extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = Layout(rawValue: indexPath.section)!
        switch section {
        case .news: return createCell(cellType: CollectionNewsCell.self, indexPath: indexPath)
        case .events: return createCell(cellType: CollectionEventsCell.self, indexPath: indexPath)
        case .users: return createCell(cellType: CollectionUsersCell.self, indexPath: indexPath)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = Layout(rawValue: indexPath.section)!
        switch (section, kind) {
        case (.news, UICollectionView.elementKindSectionHeader):
            return createSupplementaryView(supplementaryElement: NewsHeaderCell.self, elementKind: kind, indexPath: indexPath)
        case (.news, UICollectionView.elementKindSectionFooter):
            return createSupplementaryView(supplementaryElement: NewsFooterCell.self, elementKind: kind, indexPath: indexPath)
        case (.events, UICollectionView.elementKindSectionHeader):
            return createSupplementaryView(supplementaryElement: EventsHeaderCell.self, elementKind: kind, indexPath: indexPath)
        case (.users, UICollectionView.elementKindSectionHeader):
            return createSupplementaryView(supplementaryElement: UsersHeaderCell.self, elementKind: kind, indexPath: indexPath)
        default: return UICollectionReusableView()
        }
    }
}
