//
//  PaymentProofListViewControllerTests.swift
//  DesafioItauTests
//
//  Created by Vitor Campos on 28/02/25.
//

import XCTest

@testable import DesafioItau

final class PaymentProofListViewControllerTests: XCTestCase {
    let spy = PaymentProofListViewModelSpy()
    lazy var sut = PaymentProofListViewController(viewModel: spy)

    
    func test_controller_shouldDisplay_rightNUmberOfCells() {
        sut.loadViewIfNeeded()
        let tableView = sut.tableView
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 2)
    }
    
    func test_controller_shouldDisplay_rightData() {
        let tableView = sut.tableView
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? PaymentProofListUITableViewCell
        XCTAssertEqual(cell?.payeeName.text, spy.mockDataTest?[0].name)
    }
    
    func test_didSelectRow_ShouldNavigateToDetailScreen() {
        sut.loadViewIfNeeded()
        let navigation = UINavigationController(rootViewController: sut)
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)
        XCTAssertTrue(navigation.topViewController is PaymentProofDetailsViewController)
    }
}

//MARK: SPY

final class PaymentProofListViewModelSpy: PaymentProofListViewModelProtocol {
    var mockDataTest: [PaymentProof]?
    
    func updateProofList(completion: @escaping (Result<[PaymentProof], Error>) -> Void) {
        let mockData = MockData.getPaymentProofTestsData()
        mockDataTest = mockData
        completion(.success(mockData))
    }
}
