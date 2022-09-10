import SwiftUI


struct arrive: View {
    var body: some View {
        arriveView()
    }
}
struct arriveView : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: arriveVC())
        return navController
        
    }
    
}
class arriveVC : UIViewController {
    var buttonStart = UIButton()
    var labelApp = UILabel()
    var carImage = UIImage (named: "mobil")
    var carImageView : UIImageView!
    var enterButton = UIButton ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        assignbackground()
    }
    
    func assignbackground(){
        let background = UIImage(named: "arrived")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        setupViews()
    }
    
    func setupViews (){
        
        carImageView = UIImageView ()
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.image = carImage
        view.addSubview(carImageView)
        
        NSLayoutConstraint.activate([
            carImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11),
            carImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 900),
            carImageView.widthAnchor.constraint(equalToConstant: 136),
            carImageView.heightAnchor.constraint(equalToConstant: 80)
            
        ])
        
        enterButton = UIButton ()
        enterButton.setTitle("Enter", for: .normal)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.backgroundColor = .systemBlue
        enterButton.layer.cornerRadius = 5
        view.addSubview(enterButton)
        
        NSLayoutConstraint.activate([
            enterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 1080),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 700),
            enterButton.widthAnchor.constraint(equalToConstant: 100),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        enterButton.addTarget(self, action: #selector(actionClickMe), for: .touchUpInside)
    }
    
    @objc func actionClickMe(sender: UIButton) {
        navigationController?.pushViewController(roomVC(), animated: true)
    }
    
    
    
    
}


