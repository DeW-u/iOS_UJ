//
//  PaymentView.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 23/01/2024.
//

import SwiftUI

struct PaymentView: View {
    @Binding var showPaymentSheet: Bool
    
    @State private var isLoading: Bool = false
    @State private var paymentError: Bool = false
    @State private var paymentErrorText: String = ""
    
    @State private var creditCardNumber: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var creditCardExpirationDate: String = ""
    @State private var creditCardCVV: String = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    
                    Text("Credit card details")
                        .bold()
                    
                    TextField(
                        "Credit card number",
                        text: $creditCardNumber
                    )
                    .textFieldStyle(
                        .roundedBorder
                    )
                    .padding()
                    
                    HStack {
                        TextField(
                            "First name",
                            text: $firstName
                        )
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .padding()
                        
                        TextField(
                            "Last name",
                            text: $lastName
                        )
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .padding()
                    }
                    
                    HStack {
                        TextField(
                            "Expiration date",
                            text: $creditCardExpirationDate
                        )
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .padding()
                        
                        TextField(
                            "CVV",
                            text: $creditCardCVV
                        )
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .padding()
                    }
                    
                    Button {
                        Task {
                            do {
                                let url = URL(string: "http://0.0.0.0:8010/api/cardPayment")
                                var request = URLRequest(url: url!)
                                request.httpMethod = "POST"
                                let data = try! JSONEncoder().encode(
                                    CreditCardDomain(
                                        cardNumber: creditCardNumber,
                                        expirationDate: creditCardExpirationDate,
                                        cvvCode: creditCardCVV,
                                        ownerFirstName: firstName,
                                        ownerLastName: lastName
                                    )
                                )
                                
                                request.httpBody = data
                                request.setValue(
                                    "application/json",
                                    forHTTPHeaderField: "Content-Type"
                                )
                                
                                paymentError = false
                                isLoading = true
                                
                                let (responseData, response) = try await URLSession.shared.data(for: request)
                                
                                let statusCode = (response as! HTTPURLResponse).statusCode
                                
                                if statusCode == 200 {
                                    isLoading = false
                                    PersistenceController.shared.clearCart()
                                    showPaymentSheet = false
                                } else {
                                    isLoading = false
                                    paymentError = true
                                    
                                    let decodedText = try JSONDecoder().decode(ApiErrorMessageDomain.self, from: responseData)
                                    
                                    paymentErrorText = decodedText.error
                                }
                            } catch {
                                print("Download error")
                            }
                        }
                    } label: {
                        Text("Confirm & Pay")
                            .foregroundStyle(.green)
                    }.padding()
                    
                    if paymentError {
                        Text(paymentErrorText)
                            .foregroundStyle(.red)
                    }
                    
                    Spacer()
                }
                .navigationBarItems(leading: Button(action: {
                    showPaymentSheet.toggle()
                }, label: {
                    Text("Back")
                }))
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(2.0, anchor: .center)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            }
                        }
                }
            }
            
        }
    }
}

#Preview {
    PaymentView(showPaymentSheet: .constant(false))
}
