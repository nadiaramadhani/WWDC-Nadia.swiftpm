//BELUM DIPAKE
import SwiftUI

struct ContentView2 : View {
    var body: some View {
        gameStartView ()
        
    }
}


struct gameStartView : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        return gameStartVC()
}
}

class gameStartVC : UIViewController {
    
        var imageContent = UIImage (named: "tempe")
        var imageContentView : UIImageView!
        var questLabel = UILabel ()
        var buttonCorrectAnswer = UIButton()
        var buttonWrongAnswer = UIButton()
        var bubleLable = UILabel()
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
//            view.backgroundColor = UIColor(red: 0.67, green: 0.92, blue: 0.71, alpha: 1.00)
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
                  
                  setUpViews()
                  
                  
              }
            
    
    func setUpViews(){
        imageContentView = UIImageView()
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        imageContentView.image = imageContent
        view.addSubview(imageContentView)
        
        NSLayoutConstraint.activate([
            //imageContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageContentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            //imageContentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        questLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        questLabel.center = CGPoint(x: 400, y: 600)
        questLabel.textAlignment = .center
        questLabel.layer.cornerRadius = 5
        questLabel.font = UIFont.systemFont(ofSize: 30)
        questLabel.text = """
 What is this food made of?
"""
        questLabel.backgroundColor = UIColor.gray
        questLabel.layer.cornerRadius = 10
        view.addSubview(questLabel)
//        NSLayoutConstraint.activate([
//            questLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            questLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
        
        
        buttonCorrectAnswer = UIButton()
        buttonCorrectAnswer.backgroundColor = .systemGray
        buttonCorrectAnswer.setTitle("Soy bean", for: .normal)
        buttonCorrectAnswer.layer.cornerRadius = 5
        view.addSubview(buttonCorrectAnswer)
        buttonCorrectAnswer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            buttonCorrectAnswer.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
            buttonCorrectAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            buttonCorrectAnswer.widthAnchor.constraint(equalToConstant:  200),
            buttonCorrectAnswer.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
        
        buttonWrongAnswer = UIButton()
        buttonWrongAnswer.backgroundColor = .systemGray
        buttonWrongAnswer.setTitle("Red bean", for: .normal)
        buttonWrongAnswer.layer.cornerRadius = 5
        view.addSubview(buttonWrongAnswer)
        buttonWrongAnswer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            buttonWrongAnswer.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
            buttonWrongAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 500),
            buttonWrongAnswer.widthAnchor.constraint(equalToConstant:  200),
            buttonWrongAnswer.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
