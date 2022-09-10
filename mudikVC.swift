import SwiftUI


struct ContentView5: View {
    var body: some View {
    gameBeginView()
    }
}
struct gameBeginView3 : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
    let navController = UINavigationController (rootViewController: SecondVC())
return navController
        
    }
    }

class mudikVC : UIViewController {
    
        var imageGirl = UIImage(named: "girl")
        var imageGirlView : UIImageView!
        var imageBoy = UIImage (named: "boy")
        var imageBoyView = UIImageView ()
        var textIntroDialogue = UILabel ()
        var startGameButton = UIButton ()
        var bubleIMage = UIImage (named: "bubleGirl")
        var bubleImageView : UIImageView!
        var mudikImage = UIImage (named: "car2")
        var mudikView : UIImageView!
        var nextButton = UIButton ()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        assignbackground()
                    // Do any additional setup after loading the view.
                }

          func assignbackground(){
                let background = UIImage(named: "peta")

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
        mudikView = UIImageView ()
        mudikView.translatesAutoresizingMaskIntoConstraints = false
        mudikView.image = mudikImage
       
               view.addSubview(mudikView)
        
        NSLayoutConstraint.activate([
           mudikView.topAnchor.constraint(equalTo: view.topAnchor, constant: 674),
           mudikView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 346),
           mudikView.widthAnchor.constraint(equalToConstant: 142),
           mudikView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        startGameButton = UIButton ()
        startGameButton.setTitle("Drive", for: .normal)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.backgroundColor = .systemBlue
        startGameButton.layer.cornerRadius = 5
        view.addSubview(startGameButton)
        
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 1080),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600),
            startGameButton.widthAnchor.constraint(equalToConstant: 100),
            startGameButton.heightAnchor.constraint(equalToConstant: 50)
        ])


        startGameButton.addTarget(self, action: #selector(actionTerbanginRocket), for: .touchUpInside)
        
        
        nextButton = UIButton ()
               nextButton.setTitle("Next", for: .normal)
               nextButton.translatesAutoresizingMaskIntoConstraints = false
               nextButton.backgroundColor = .systemBlue
               nextButton.layer.cornerRadius = 5
               view.addSubview(nextButton)

               NSLayoutConstraint.activate([
                   nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 1080),
                   nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 720),
                   nextButton.widthAnchor.constraint(equalToConstant: 100),
                   nextButton.heightAnchor.constraint(equalToConstant: 50)
               ])


               nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }

    @objc func actionTerbanginRocket() {
        
        UIView.animate(withDuration: 5.0, delay: 0) {
            self.mudikView.frame.origin.x = 36
            self.mudikView.frame.origin.y = 447
        }
        
       
    }

    @objc func nextVC() {

        navigationController?.pushViewController(arriveVC(), animated: true)
        }
        
    }

