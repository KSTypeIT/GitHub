
import Foundation

protocol RepositoryDetailsViewModelProtocol {
    var name: String { get }
    var id: String { get }
    var url: String { get }
    var size: String { get }
    var description: String? { get }
    var language: String? { get }
}

struct RepositoryDetailsViewModel: RepositoryDetailsViewModelProtocol {

    private let repository: Repository

    init(repository: Repository){
        self.repository = repository
    }

    internal var name: String {
        "Name: \(repository.name)"
    }
    internal var id: String {
        "Repository id: \(repository.id.description)"
    }
    internal var url: String {
        "ULR: \(repository.url)"
    }
    internal var size: String {
        "Size: \(repository.size)"
    }
    internal var description: String? {
        "Description: \(repository.description ?? "")"
    }
    internal var language: String? {
        "Language: \(repository.language ?? "")"
    }
}
