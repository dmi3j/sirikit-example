//  Copyright © 2018 Dmitrijs Beloborodovs. All rights reserved.

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any? {
        if intent is INSearchForAccountsIntent {
            return QuickBalanceRequestHandler()
        }
        return .none
    }
}
