
import XCTest
@testable import Applause

class RepositoryCollectionViewModelTests: XCTestCase, RepositoryCollectionViewModelDelegate {

    let viewModel = RepositoryCollectionViewModel(dataProvider: DataProviderMock())
    var reloadCount: Int = 0

    override func setUp() {
        reloadCount = 0
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryCollectionViewModel() {
        viewModel.viewDidLoad()
        viewModel.delegate = self
        viewModel.findRepository("xxx")

        XCTAssertEqual(viewModel.getRepositories(filtered: true).count, 0) // There is no Repositories Containing XXX in their name
        XCTAssertEqual(viewModel.getRepositories(filtered: false).count, 5) // Full Repository list is 5
        XCTAssertEqual(reloadCount, 1) // The delegate Method 'repositoriesReload' should be called once after 'findRepository'
        XCTAssertEqual(viewModel.getRepositoryAtIndex(indexPath: IndexPath(row: 1, section: 1), filtered: false).name, "TestRepo")

        viewModel.findRepository("")
        XCTAssertEqual(reloadCount, 2)
        XCTAssertEqual(viewModel.getRepositories(filtered: true).count, 0)


        viewModel.findRepository("Tes")
        XCTAssertEqual(reloadCount, 3)
        XCTAssertEqual(viewModel.getRepositories(filtered: true).count, 5)

    }

    func repositoriesReload() {
        //If delegate works
        reloadCount+=1
    }

    func reqestFailed() {
        // Could be used for failed action
    }
}

class DataProviderMock: DataProviding {
    private let repositories: [Repository]
    private let testRepo: Repository

    init() {
        testRepo = Repository(id: 123, name: "TestRepo", url: "TestURL", size: 123, description: "Test Description", language: "Swift 5")
        repositories = Array(repeating: testRepo, count: 5)
    }

    func requestAllRepositories(completionHandler: @escaping ([Repository]) -> Void, errorHandler: @escaping (RequestError) -> Void) {
        completionHandler(repositories)
    }
}
