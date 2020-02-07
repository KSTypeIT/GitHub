
import Foundation

protocol RepositoryCollectionViewModelDelegate: AnyObject {
    func repositoriesReload()
    func reqestFailed()
}

protocol RepositoryCollectionViewModelProtocol {
    func viewDidLoad()
    func getRepositories(filtered: Bool) -> [Repository]
    func getRepositoryAtIndex(indexPath: IndexPath, filtered: Bool) -> Repository
    func findRepository(_ searchString: String)
}

final class RepositoryCollectionViewModel: RepositoryCollectionViewModelProtocol {

    public weak var delegate: RepositoryCollectionViewModelDelegate?

    private let dataProvider: DataProviding
    private var repositories: [Repository] = []
    private var filteredRepositories: [Repository] = []

    init (dataProvider: DataProviding = DataProvider()) {
        self.dataProvider = dataProvider
    }

    internal func viewDidLoad() {
        //this is called here since we need data to work with. Could happen in some Loading Controller before we load the RepositoyColectionVC.

        dataProvider.requestAllRepositories(completionHandler: { [weak self] repositories in
            self?.repositories = repositories
            self?.delegate?.repositoriesReload()

        }, errorHandler: { [weak self] _ in
            self?.delegate?.reqestFailed()
        })
    }

    internal func getRepositories(filtered: Bool) -> [Repository] {
        return filtered ? self.filteredRepositories : self.repositories
    }

    internal func getRepositoryAtIndex(indexPath: IndexPath, filtered: Bool) -> Repository {
        return filtered ? self.filteredRepositories[indexPath.row] : self.repositories[indexPath.row]
    }

    internal func findRepository(_ searchString: String) {
        self.filteredRepositories = self.repositories.filter {
            $0.name.range(of: searchString, options: .caseInsensitive) != nil
        }
        self.delegate?.repositoriesReload()
    }
}
