import UIKit

protocol UserDataCollectionViewProtocol: AnyObject {
    var presenter: UserDataCollectionViewPresenterProtocol? { get set }
    func updateCells(with data: [CellLabels])
    func reloadDataCollectionView()
}

class UserDataCollectionView: UIView, UserDataCollectionViewProtocol {
    let dataCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UserDataCVCell.self, forCellWithReuseIdentifier: UserDataCVCell.reuseIdentifier)
        collectionView.register(DividerCell.self, forCellWithReuseIdentifier: DividerCell.reuseIdentifier)
        return collectionView
    }()
    
    private var dataCells: [CellLabels] = []
    
    var presenter: UserDataCollectionViewPresenterProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupDataCollectionView()
    }
    
    private func setupDataCollectionView() {
        dataCollectionView.translatesAutoresizingMaskIntoConstraints = false
        dataCollectionView.backgroundColor = .clear
        dataCollectionView.dataSource = self
        dataCollectionView.delegate = self
        self.addSubview(dataCollectionView)
        
        NSLayoutConstraint.activate([
            dataCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dataCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            dataCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dataCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func updateCells(with data: [CellLabels]) {
        self.dataCells = data
    }
    
    func reloadDataCollectionView() {
        DispatchQueue.main.async {
            self.dataCollectionView.reloadData()
        }
    }
}

extension UserDataCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCells.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DividerCell.reuseIdentifier, for: indexPath) as! DividerCell
            cell.configure(with: "Nation,%:")
            return cell
        } else {
            let adjustedIndex = indexPath.row > 2 ? indexPath.row - 1 : indexPath.row
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserDataCVCell.reuseIdentifier, for: indexPath) as! UserDataCVCell
            let userData = dataCells[adjustedIndex]
            cell.configure(with: userData)
            return cell
        }
    }
}

extension UserDataCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        
        if indexPath.row == 2 {
            return CGSize(width: width, height: 50)
        } else {
            let adjustedIndex = indexPath.row > 2 ? indexPath.row - 1 : indexPath.row
            let height = calculateHeightForWidth(width, at: adjustedIndex)
            return CGSize(width: width, height: height)
        }
    }
    
    private func calculateHeightForWidth(_ width: CGFloat, at indexPath: Int) -> CGFloat {
        let dummyCell = UserDataCVCell(frame: CGRect(x: 0, y: 0, width: width, height:                          UIView.layoutFittingCompressedSize.height))
        dummyCell.configure(with: dataCells[indexPath])
        return dummyCell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
}
