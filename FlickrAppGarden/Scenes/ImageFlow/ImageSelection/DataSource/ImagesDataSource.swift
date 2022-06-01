//
//  ImagesDataSource.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

final class ImagesDataSource: NSObject, UITableViewDataSource {
    
    let imageViewModels: [CellImageViewModel]
    
    init(imageViewModels: [CellImageViewModel]) {
        self.imageViewModels = imageViewModels
    }
    
    func imageViewModel(at indexPath: IndexPath) -> CellImageViewModel {
        return self.imageViewModels[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageViewModels.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.reuseIdentifier) as? ImageTableCell else {
            fatalError("Could not cast cell: ImageTableCell!")
        }
        cell.imageViewModel = self.imageViewModel(at: indexPath)
        
        return cell
    }
}
