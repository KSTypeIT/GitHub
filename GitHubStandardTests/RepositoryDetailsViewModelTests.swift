
import XCTest
@testable import Applause

class RepositoryDetailsViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryDetailsViewModel() {
        let repository: Repository = Repository(id: 111,
                                                name: "testRepo",
                                                url: "www.testULR.com",
                                                size: 123,
                                                description: "Test Description",
                                                language: "Swift 5")
        let viewModel: RepositoryDetailsViewModelProtocol = RepositoryDetailsViewModel(repository: repository)

        XCTAssertEqual(viewModel.name, "Name: testRepo")
        XCTAssertEqual(viewModel.url, "ULR: www.testULR.com")
        XCTAssertEqual(viewModel.size, "Size: 123")
        XCTAssertEqual(viewModel.description, "Description: Test Description")
        XCTAssertEqual(viewModel.language, "Language: Swift 5")
    }
}

