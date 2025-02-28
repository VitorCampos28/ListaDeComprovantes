//
//  PaymentProofListViewControllerTests.swift
//  DesafioItauTests
//
//  Created by Vitor Campos on 28/02/25.
//

import XCTest

@testable import DesafioItau

final class PaymentProofListViewControllerTests: XCTestCase {
    private var spy = PaymentProofListViewModelSpy()
    private lazy var sut = PaymentProofListViewController(viewModel: spy)
    private lazy var navigation = UINavigationController(rootViewController: sut)
    
    
    func test_controller_shouldDisplay_rightNUmberOfCells() {
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_controller_shouldDisplay_rightData() {
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? PaymentProofListUITableViewCell

        XCTAssertEqual(cell?.payeeName.text, spy.mockDataTest?[0].name)
    }
    
    func test_didSelectRow_ShouldNavigateToDetailScreen() {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)
        XCTAssertTrue(navigation.topViewController is PaymentProofDetailsUIViewController, "Deveria navegar para a tela de detalhes")
    }
}

//MARK: SPY

final class PaymentProofListViewModelSpy: PaymentProofListViewModelProtocol {
    var mockDataTest: [PaymentProof]?
    
    func updateProofList(completion: @escaping (Result<[DesafioItau.PaymentProof], any Error>) -> Void) {
        let mockData = [PaymentProof(title: "Pagamento", receiptId: "123452456456", name: "Peçanha da Silva", receiverName: "Diogo Silva", amount: "R$ 200,00", control: "ITOEWRNCV321424", date: "qua, 28 de abril de 2022"), PaymentProof(title: "Pagamento", receiptId: "123452456456", name: "Peçanha da Silva", receiverName: "Diogo Silva", amount: "R$ 200,00", control: "ITOEWRNCV321424", date: "qua, 1 de maio de 2022")]
        mockDataTest = mockData
        completion(.success(mockData))
    }
}
