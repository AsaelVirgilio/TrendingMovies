//
//  TrendingViewController+HeaderBarViewControllerDelegate.swift
//  BAZProject
//
//

import UIKit

class TrendingViewController: UIViewController, TrendingProtocol {
    
    var movies: [MovieResult] = []
    let mediaType: MediaType = .movie
    
    var presenter: TrendingPresenterProtocol?
    static let nibName = "TrendingView"

    @IBOutlet weak var errorUIView: ErrorPageViewController!
    @IBOutlet weak var moviesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        errorUIView.delegate = self
        moviesTableView.register(CellMovie.nib(), forCellReuseIdentifier: CellMovie.identifier)
        getData()
    }

    func getData() {
        view.showLoader()
        presenter?.getTrendingMedia(mediaType: mediaType, timeWindow: .day)
    }
    
    func updateView(data: [MovieResult]) {
        movies = data
        moviesTableView.reloadData()
    }
    
    func stopLoading() {
        view.removeLoader()
    }
    
    func showErrorView() {
        moviesTableView.isHidden = true
        errorUIView.isHidden = false
    }
    
}


