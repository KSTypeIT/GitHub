
import Foundation
import UIKit

fileprivate enum Static: String {
    case xibName = "RepositoryDetailsViewController"
}

final class RepositoryDetailsViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var lanugaeLabel: UILabel!
    @IBOutlet private weak var sizeLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!

    private let viewModel: RepositoryDetailsViewModelProtocol

    init(repositoryDetailsViewModel: RepositoryDetailsViewModelProtocol) {
        self.viewModel = repositoryDetailsViewModel
        super.init(nibName: Static.xibName.rawValue, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }

    private func bindViewModel() {
        nameLabel.text = viewModel.name
        idLabel.text = viewModel.id
        lanugaeLabel.text = viewModel.language
        sizeLabel.text = viewModel.size
        descriptionLabel.text = viewModel.description
        urlLabel.text = viewModel.url
    }
}
