//
//  ImageSelectionController.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

protocol ImageSelectionControllerDelegate: Coordinator {
    func didSelectImage(with image: Image?)
}

final class ImageSelectionController: BaseViewController, UISearchBarDelegate, PullableTableViewDelegate {
    
    // MARK: - Navigation Delegate
    
    public var delegate: ImageSelectionControllerDelegate?
    
    // MARK: - Properties
        
    lazy var searchBar:UISearchBar = UISearchBar()
    
    private lazy var container: ImageTableViewContainer = ImageTableViewContainer()
    private var imgViewModels: [CellImageViewModel] = []
    private var images: [Image] = []

    private var imagesDataSource: ImagesDataSource? {
        didSet {
            self.container.tableView.dataSource = imagesDataSource
        }
    }
   
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Loading..."
        self.setupTableView()
        self.setupSearchBar()
        
        self.loadData(for: self.searchBar.text) {
            self.container.tableView.reloadData()
        }
    }
    
    private func loadData(for tags: String?, completion: @escaping () -> Swift.Void = {}) {
        
        let fetchData: FetchData = FetchData.shared
        var handler: NetworkHandler?
        handler = NetworkHandler()
        
        var loader: ImageLoader?
        loader = ImageLoader()
        
        fetchData.fetchImageData(for: tags, handler: handler) { [weak self] response in
            
            if case .success(let responseImages) = response {
                self?.images.append(contentsOf: responseImages)
                
                let viewModels: [CellImageViewModel] = responseImages.map { CellImageViewModel(image: $0, loader: loader) }
                self?.imgViewModels.append(contentsOf: viewModels)
                
                self?.imagesDataSource = ImagesDataSource(imageViewModels: self?.imgViewModels ?? [])
                self?.navigationItem.title = "Choose an image"
                completion()
            }
            
            if case .failure(let err) = response {
                if err.localizedDescription == APIError.noConnection.localizedDescription {
                    let message: MessageController = MessageController()
                    self?.present(message.connectionFailController, animated: true)
                }
      
                return
            }
        }
    }
    
    private func resetData() {
        self.imgViewModels.removeAll()
        self.images.removeAll()
        self.imagesDataSource = ImagesDataSource(imageViewModels: self.imgViewModels)
        self.container.tableView.reloadData()
    }
    
    
     // MARK: - SearchBar Methods
    
    private func setupSearchBar() {
        
        self.searchBar.searchBarStyle = UISearchBar.Style.prominent
        self.searchBar.searchTextField.textColor = .lightGray
        self.searchBar.searchTextField.autocapitalizationType = .none
        self.searchBar.placeholder = " Search..."
        self.searchBar.sizeToFit()
        self.searchBar.isTranslucent = false
        
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.delegate = self
        navigationItem.titleView = self.searchBar
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.resetData()
        self.loadData(for: self.searchBar.text) {
            self.container.tableView.reloadData()
        }
        
        self.searchBar.resignFirstResponder()
    }

    // MARK: - TableView Methods

    func pullToRefreshDataSource() {
        
        self.resetData()
        self.loadData(for: self.searchBar.text) {
            self.container.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image: Image = self.images[indexPath.row]
        self.delegate?.didSelectImage(with: image)
    }
    
    private func setupTableView() {
        self.view.addSubview(self.container)
        self.container.tableView.delegate = self

        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.container.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.container.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
