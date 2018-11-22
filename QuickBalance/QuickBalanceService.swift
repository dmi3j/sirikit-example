//  Copyright © 2018 Dmitrijs Beloborodovs. All rights reserved.

import Foundation

open class QuickBalanceService {
    public init() {}
    
    public func quickBalanceAccounts(_ completion: @escaping ((_ accounts: [Account]) -> Void)) {
        var accounts = [Account]()

        let account1 = Account(name: "Main Account", balance: 150.0)
        let account2 = Account(name: "Saving Account", balance: 300.0)
        let account3 = Account(name: "Credit Card Account", balance: -100)

        accounts.append(account1)
        accounts.append(account2)
        accounts.append(account3)

        sleep(3)
        completion(accounts)
    }
}
