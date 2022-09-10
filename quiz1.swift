import SwiftUI

struct ContentViewquiz: View {
    var body: some View {
        quiz1View ()
        
    }
}


struct quiz1View : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        return quiz1VC()
}
}

class quiz1VC : UIViewController {
    
        var imageContent = UIImage (named: "ketupats")
        var imageContentView : UIImageView!
        var questLabel = UILabel ()
        var buttonCorrectAnswer = UIButton()
        var buttonWrongAnswer = UIButton()
        var bubleLable = UILabel()
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            assignbackground()
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
        imageContentView.backgroundColor = .gray
    view.addSubview(imageContentView)
    
    NSLayoutConstraint.activate([
        imageContentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageContentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
    ])
    questLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 100))
    imageContentView.translatesAutoresizingMaskIntoConstraints = false
    questLabel.center = CGPoint(x: 400, y: 600)
    questLabel.textAlignment = .center
    questLabel.layer.cornerRadius = 5
    questLabel.font = UIFont.systemFont(ofSize: 30)
    questLabel.text = """
What is the wrapping of the Ketupat?
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
    buttonCorrectAnswer.setTitle("Coconut leaves", for: .normal)
    buttonCorrectAnswer.layer.cornerRadius = 5
    view.addSubview(buttonCorrectAnswer)
    buttonCorrectAnswer.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        
        buttonCorrectAnswer.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
        buttonCorrectAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
        buttonCorrectAnswer.widthAnchor.constraint(equalToConstant:  200),
        buttonCorrectAnswer.heightAnchor.constraint(equalToConstant: 50)
        
    ])
        buttonCorrectAnswer.addTarget(self, action: #selector(actionCorrect), for: .touchUpInside)
    
    buttonWrongAnswer = UIButton()
    buttonWrongAnswer.backgroundColor = .systemGray
    buttonWrongAnswer.setTitle("Banana leaves", for: .normal)
    buttonWrongAnswer.layer.cornerRadius = 5
    view.addSubview(buttonWrongAnswer)
    buttonWrongAnswer.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        
        buttonWrongAnswer.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
        buttonWrongAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 500),
        buttonWrongAnswer.widthAnchor.constraint(equalToConstant:  200),
        buttonWrongAnswer.heightAnchor.constraint(equalToConstant: 50)
    ])
        buttonWrongAnswer.addTarget(self, action: #selector(actionWrong), for: .touchUpInside)
        
        
    }
    @objc func actionCorrect(sender: UIButton) {
        navigationController?.pushViewController(correctVC(), animated: true)
    }
    @objc func actionWrong(sender: UIButton) {
        navigationController?.pushViewController(wrongVC(), animated: true)
    }
}
