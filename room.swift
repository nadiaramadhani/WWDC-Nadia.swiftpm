import SwiftUI


struct roomBeginView: View {
    var body: some View {
        roomViewStart()
    }
}
struct roomViewStart : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: roomVC())
        return navController
        
    }
    
}

class roomVC : UIViewController {
    
    var momImage = UIImage(named: "mom")
    var momView :UIImageView!
    var dadImage = UIImage(named: "dad")
    var dadView :UIImageView!
    var bubleImage = UIImage (named: "buble")
    var bubleImageView : UIImageView!
    var txtDad1 = UILabel()
    var startGameButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        assignbackground()
        
        func assignbackground(){
            let background = UIImage(named: "room")
            
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
            
            setupView()
            
        }
        func setupView () {
            
            dadView = UIImageView()
            dadView.translatesAutoresizingMaskIntoConstraints = false
            dadView.image = dadImage
            
            view.addSubview(dadView)
            
            NSLayoutConstraint.activate([
                dadView.topAnchor.constraint(equalTo: view.topAnchor, constant: 630),
                dadView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                dadView.widthAnchor.constraint(equalToConstant: 168),
                dadView.heightAnchor.constraint(equalToConstant: 425)
                
            ])
            
            bubleImageView = UIImageView ()
            bubleImageView.translatesAutoresizingMaskIntoConstraints = false
            bubleImageView.image = bubleImage
            view.addSubview(bubleImageView)
            
            NSLayoutConstraint.activate([
                bubleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 496),
                bubleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 235),
                bubleImageView.widthAnchor.constraint(equalToConstant: 307),
                bubleImageView.heightAnchor.constraint(equalToConstant: 157)
            ])
            
            txtDad1 = UILabel ()
            txtDad1.numberOfLines = 0
            txtDad1.textAlignment = .center
            txtDad1.translatesAutoresizingMaskIntoConstraints = false
            txtDad1.setTyping(text: """
            Hi dear! Welcome home
            How are you both?
            Your mom is cooking in the kitchen now
            She is preparing for our Eid al Fitri foods
            """)
            
            bubleImageView.addSubview(txtDad1)
            NSLayoutConstraint.activate([
                
                txtDad1.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 10),
                txtDad1.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor),
                
            ])
            
            startGameButton = UIButton ()
            startGameButton.setTitle("Next", for: .normal)
            startGameButton.translatesAutoresizingMaskIntoConstraints = false
            startGameButton.backgroundColor = .systemBlue
            startGameButton.layer.cornerRadius = 5
            view.addSubview(startGameButton)
            
            NSLayoutConstraint.activate([
                startGameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 1080),
                startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 700),           startGameButton.widthAnchor.constraint(equalToConstant: 100),
                startGameButton.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        }
            startGameButton.addTarget(self, action: #selector(actionClickMe), for: .touchUpInside)
    }
        @objc func actionClickMe(sender: UIButton) {
            navigationController?.pushViewController(helpMomVC(), animated: true)
        }
        
    }
    
