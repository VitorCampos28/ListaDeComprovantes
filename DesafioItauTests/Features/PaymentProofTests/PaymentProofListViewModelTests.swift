//
//  PaymentProofListViewModelTests.swift
//  DesafioItauTests
//
//  Created by Vitor Campos on 28/02/25.
//

import XCTest

@testable import DesafioItau

class PaymentProofListViewModelTests: XCTestCase {
    private let spy = PaymentProofServiceSpy()
    private lazy var sut = PaymentProofListViewModel(service: spy)
    
    func test_fetchData_shouldCallService() {
        let expectation = expectation(description: "Deve chamar o serviço")
        
        sut.updateProofList { _ in
            XCTAssertTrue(self.spy.paymentProofDataCalled)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }

    func test_fetchData_shouldBeCalledJustOnce() {
        let expectation = expectation(description: "Deve ser chamado apenas uma vez")
        
        sut.updateProofList { _ in
            XCTAssertEqual(self.spy.numberOfCalls, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
}


//MARK: SPY

final class PaymentProofServiceSpy: PaymentProofServiceProtocol {
    private(set) var paymentProofDataCalled = false
    private(set) var numberOfCalls: Int = 0
    
    func updatePaymentProof() async throws -> Data {
        paymentProofDataCalled = true
        
        numberOfCalls += 1

        return Data()
    }
}
