import SwiftUI


struct ContentView: View {
    var body: some View {
    GameLaunchView()
    }
}
struct GameLaunchView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
    let navController = UINavigationController (rootViewController: GameViewController())
return navController
        
    }
        
    }
class GameViewController : UIViewController {
    var logoGame = UIImage(named: "logoApp")
    var logoImageView : UIImageView!
    var buttonStart = UIButton()
    var labelApp = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.55, green: 0.79, blue: 0.80, alpha: 1.00)
        
        setupViews()
    }
    
    func setupViews (){
       logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = logoGame
               view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            //logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            logoImageView.widthAnchor.constraint(equalToConstant: 775),
            logoImageView.heightAnchor.constraint(equalToConstant: 550)
            
        ])
        
        
        labelApp = UILabel ()
        labelApp.translatesAutoresizingMaskIntoConstraints = false
        labelApp.text = "WELCOME TO INDONESIA"
        labelApp.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(labelApp)
        NSLayoutConstraint.activate([
            labelApp.topAnchor.constraint(equalTo: view.topAnchor, constant: 465),
            labelApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        buttonStart = UIButton()
            buttonStart.backgroundColor = .systemBlue
            buttonStart.setTitle("START", for: .normal)
            buttonStart.layer.cornerRadius = 5
            view.addSubview(buttonStart)
            buttonStart.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                buttonStart.topAnchor.constraint(equalTo: view.topAnchor, constant: 560),
                buttonStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonStart.widthAnchor.constraint(equalToConstant:  200),
                buttonStart.heightAnchor.constraint(equalToConstant: 50)
                
            ])

       

        buttonStart.addTarget(self, action: #selector(actionClickMe), for: .touchUpInside)
    }
    
    @objc func actionClickMe(sender: UIButton) {
        navigationController?.pushViewController(SecondVC(), animated: true)
    }
}

