import SwiftUI


struct ContentWrong: View {
    var body: some View {
    WrongStruct()
    }
}
struct WrongStruct : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
    let navController = UINavigationController (rootViewController: wrongVC())
return navController
        
    }
        
    }

class wrongVC : UIViewController {
    
        var imageGirl = UIImage(named: "girl")
        var imageGirlView : UIImageView!
        var imageBoy = UIImage (named: "boy")
        var imageBoyView = UIImageView ()
        var wrongText = UILabel ()
        var startGameButton = UIButton ()
        var bubleIMage = UIImage (named: "buble")
        var bubleGirl = UIImage (named: "bubleGirl")
        var bubleImageView : UIImageView!
        var backBar = UIImage(named: "1back")
        var backView : UIImageView!
    
    var bubleGirlView : UIImageView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        assignbackground()
                }

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
        
        imageGirlView = UIImageView()
        imageGirlView.translatesAutoresizingMaskIntoConstraints = false
        imageGirlView.image = imageGirl
       
               view.addSubview(imageGirlView)
        
        NSLayoutConstraint.activate([
           imageGirlView.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
           imageGirlView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 550),
           imageGirlView.widthAnchor.constraint(equalToConstant: 300),
           imageGirlView.heightAnchor.constraint(equalToConstant: 450)
        ])
       
           imageBoyView = UIImageView ()
           imageBoyView.translatesAutoresizingMaskIntoConstraints = false
           imageBoyView.image = imageBoy
          
                  view.addSubview(imageBoyView)
           
           NSLayoutConstraint.activate([
              imageBoyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 750),
              imageBoyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
              imageBoyView.widthAnchor.constraint(equalToConstant: 300),
              imageBoyView.heightAnchor.constraint(equalToConstant: 450)
           ])
           
           bubleImageView = UIImageView ()
           bubleImageView.translatesAutoresizingMaskIntoConstraints = false
           bubleImageView.image = bubleIMage
           view.addSubview(bubleImageView)
           
           NSLayoutConstraint.activate([
               bubleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 533),
               bubleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180),
               bubleImageView.widthAnchor.constraint(equalToConstant: 411),
               bubleImageView.heightAnchor.constraint(equalToConstant: 167)
    
           ])
        wrongText = UILabel ()
        wrongText.numberOfLines = 0
        wrongText.textAlignment = .center
        wrongText.translatesAutoresizingMaskIntoConstraints = false
        wrongText.setTyping(text: """
        
        OOPS!
        It's a wrong answer
        Tap back to restart the game
        """)
        
        bubleImageView.addSubview(wrongText)
        NSLayoutConstraint.activate([
            wrongText.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 30),
            wrongText.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor)
            
        ])
        
        backView = UIImageView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.image = backBar
        view.addSubview(backView)
        setUpTapRecognizer2()
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1007),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 702),
            backView.widthAnchor.constraint(equalToConstant: 114),
            backView.heightAnchor.constraint(equalToConstant: 53)
        ])
        
        
        
    }
    
    private func setUpTapRecognizer2 () {
        let tapRecognizer2 = UITapGestureRecognizer (target: self, action: #selector (tapView2))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(tapRecognizer2)}
    
    @objc func tapView2(sender: UIImageView) {
        navigationController?.pushViewController(GameViewController(), animated: true)
        
    }
}
