//
//  PaymentProofListViewModel.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

protocol PaymentProofListViewModelProtocol {
    
    func updateProofList(completion: @escaping (Result<[PaymentProof], Error>) -> Void)
}

class PaymentProofListViewModel: PaymentProofListViewModelProtocol {
    var showPopupError: ((String) -> Void)?
    var paymentProofList: [PaymentProof]?
    let service: PaymentProofServiceProtocol
    
    init (service: PaymentProofServiceProtocol = PaymentProofService(mock: true)) {
        self.service = service
    }
    
    func updateProofList(completion: @escaping (Result<[PaymentProof], Error>) -> Void) {
        Task {
            do {
                let data = try await self.service.updatePaymentProof()
                guard let paymentProofList = data else {
                    throw AplicationErrors.unableToRetrieveTheData
                }
                completion(.success(paymentProofList))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
