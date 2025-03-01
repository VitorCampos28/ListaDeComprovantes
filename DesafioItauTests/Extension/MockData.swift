//
//  MockData.swift
//  DesafioItau
//
//  Created by Vitor Campos on 28/02/25.
//


final class MockData {
    static func getPaymentProofTestsData() -> [PaymentProof] {
        return [PaymentProof(title: "Pagamento", receiptId: "123452456456", name: "Peçanha da Silva", receiverName: "Diogo Silva", amount: "R$ 200,00", control: "ITOEWRNCV321424", date: "qua, 28 de abril de 2022"), PaymentProof(title: "Pagamento", receiptId: "123452456456", name: "Peçanha da Silva", receiverName: "Diogo Silva", amount: "R$ 200,00", control: "ITOEWRNCV321424", date: "qua, 1 de maio de 2022")]
    }
}
