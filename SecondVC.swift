import SwiftUI


struct ContentView3: View {
    var body: some View {
    gameBeginView()
    }
}
struct gameBeginView : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
    let navController = UINavigationController (rootViewController: SecondVC())
return navController
        
    }
        
    }

class SecondVC : UIViewController {
    
        var imageGirl = UIImage(named: "girl")
        var imageGirlView : UIImageView!
        var imageBoy = UIImage (named: "boy")
        var imageBoyView = UIImageView ()
        var textIntroDialogue = UILabel ()
        var startGameButton = UIButton ()
        var bubleIMage = UIImage (named: "buble")
        var bubleImageView : UIImageView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        assignbackground()
                    // Do any additional setup after loading the view.
                }

          func assignbackground(){
                let background = UIImage(named: "background")

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
        
        
        
        
        
        textIntroDialogue = UILabel ()
        textIntroDialogue.numberOfLines = 0
        textIntroDialogue.textAlignment = .center
        textIntroDialogue.translatesAutoresizingMaskIntoConstraints = false
        textIntroDialogue.setTyping2(text: """
        Hi! it’s almost the end of Ramadhan.
        This means Eid al Fitri day is coming soon.
        We should go MUDIK
        """)
        
        bubleImageView.addSubview(textIntroDialogue)
        NSLayoutConstraint.activate([
            textIntroDialogue.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 30),
            textIntroDialogue.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor),
        
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


        startGameButton.addTarget(self, action: #selector(actionClickMe), for: .touchUpInside)
    }
    
    @objc func actionClickMe(sender: UIButton) {
        navigationController?.pushViewController(bubleVC(), animated: true)
    }
        
    }

extension UILabel {
    func setTyping2(text: String, characterDelay: TimeInterval = 5.0) {
      self.text = ""
        
      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }
        
      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
        
        
    }
        
    }


