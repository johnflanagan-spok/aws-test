import UIKit
import AWSCognitoAuth

class ViewController: UIViewController {

    var cognitoAuth: AWSCognitoAuth?

    override func viewDidLoad() {
        super.viewDidLoad()

        let authConfiguration = AWSCognitoAuthConfiguration(
            appClientId: "2ablg1v9eu8fbe50d20j8flr25",
            appClientSecret: nil,
            scopes: Set(["openid"]),
            signInRedirectUri: "spokgo://signin",
            signOutRedirectUri: "spokgo://signout",
            webDomain: "https://spoktest-a4bd55d0-f9a2-11e8-9f0c-503aca261699.auth.us-east-1.amazoncognito.com",
            identityProvider: "spokvdev",
            idpIdentifier: nil,
            userPoolIdForEnablingASF: "us-east-1_Mpb1vY4Q4"
        )

        let cognitoAuthKey = "cognitoAuthKey"
        AWSCognitoAuth.registerCognitoAuth(with: authConfiguration, forKey: cognitoAuthKey)
        cognitoAuth = AWSCognitoAuth(forKey: cognitoAuthKey)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        cognitoAuth?.getSession(self) { (session, error) in
            // This is not called if the user presses the "Done" button on the SFSafariViewController
            print("Sign in completion handler called")
        }
    }

    @IBAction func signOutPressed(_ sender: Any) {
        cognitoAuth?.signOut(self) { error in
            print("Sign out completion handler called")
        }
    }
}

