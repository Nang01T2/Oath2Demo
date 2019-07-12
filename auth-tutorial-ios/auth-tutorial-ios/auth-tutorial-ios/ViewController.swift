import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var successLabel: UILabel!
    let authService = AuthService()
    
    @IBAction func authorize(_ sender: Any) {
        authService.authorize(from: self, onSuccess: { [weak self] authState in
            self?.loginButton.isHidden = true
            self?.successLabel.isHidden = false
            print("RefreshToken: \(authState.refreshToken)")
            print("AccessToken: \(authState.lastTokenResponse?.accessToken)")
        }, onError: { error in
            print(error)
        })
    }
}
