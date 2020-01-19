//  Copyright © 2020 Dmitrijs Beloborodovs. All rights reserved.

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var accountTitleLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {

        /// 01
        guard let _ = interaction.intentResponse as? INSearchForAccountsIntentResponse else {
            completion(false, parameters, CGSize.zero)
            return
        }

        /// 02
        guard parameters.count > 0 else {
            completion(true, parameters, CGSize.zero)
            return
        }

        /// 03
        parameters.forEach { (parameter) in
            if let account = interaction.parameterValue(for: parameter) as? INPaymentAccount {
                accountTitleLabel.text = account.nickname?.spokenPhrase
                accountBalanceLabel.text = account.balance?.amount!.floatValue.description
            }
        }

        let viewSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        completion(true, parameters, viewSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
