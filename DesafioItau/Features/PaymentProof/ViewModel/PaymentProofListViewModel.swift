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
                
                if let paymentProofModel = try? JSONDecoder().decode(PaymentProofModel.self, from: data) {
                    completion(.success(paymentProofModel.updateData.paymentProofList))
                } else {
                    throw AplicationErrors.decodeError
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
}
