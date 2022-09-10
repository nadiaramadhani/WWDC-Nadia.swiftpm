import SwiftUI


struct GameView: View {
    var body: some View {
    GameStartView()
    }
}
struct GameStartView : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
    let navController = UINavigationController (rootViewController: nastarVC())
return navController
        
    }
        
    }
class nastarVC : UIViewController {
    var nastarView : UIImageView!
    var doughView : UIImageView!
    var jamView : UIImageView!
    var nastarImage = UIImage(named:"nastarraw")
    var doughImage = UIImage(named:"dough")
    var jamImage = UIImage(named:"jam")
    var momImage = UIImage (named: "mom")
    var momView : UIImageView!
    var doughLabel = UILabel()
    var jamLabel = UILabel()
    var stoveImage = UIImage (named: "stove")
    var stoveView : UIImageView!
    var textMom2 = UILabel()
    var bubleImage = UIImage(named: "buble")
    var bubleImageView : UIImageView!
    var nextButton = UIButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        assignbackground()
                }

          func assignbackground(){
                let background = UIImage(named: "dapur")

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
        
        
        momView = UIImageView()
        momView.translatesAutoresizingMaskIntoConstraints = false
        momView.image = momImage
       
               view.addSubview(momView)
        
        NSLayoutConstraint.activate([
           momView.topAnchor.constraint(equalTo: view.topAnchor, constant: 455),
           momView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 157),
           momView.widthAnchor.constraint(equalToConstant: 114),
           momView.heightAnchor.constraint(equalToConstant: 317)
        ])
        
        
        bubleImageView = UIImageView ()
        bubleImageView.translatesAutoresizingMaskIntoConstraints = false
        bubleImageView.image = bubleImage
        view.addSubview(bubleImageView)
        
        NSLayoutConstraint.activate([
            bubleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 227),
            bubleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 245),
            bubleImageView.widthAnchor.constraint(equalToConstant: 307),
            bubleImageView.heightAnchor.constraint(equalToConstant: 157)
        ])
        
        
        textMom2 = UILabel ()
        textMom2.numberOfLines = 0
        textMom2.textAlignment = .center
        textMom2.translatesAutoresizingMaskIntoConstraints = false
        textMom2.setTyping(text: """
        You can put the jam to
        the nastar dough
        The dough consists of flour,
        egg, and butter.
        After that, tap next to cook Nastar
        """)
        
        bubleImageView.addSubview(textMom2)
        NSLayoutConstraint.activate([
            textMom2.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 20),
            textMom2.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor)
        ])
        
        doughView = UIImageView()
        doughView.translatesAutoresizingMaskIntoConstraints = false
        doughView.image = doughImage
        
        view.addSubview(doughView)
        NSLayoutConstraint.activate([
            doughView.topAnchor.constraint(equalTo: view.topAnchor, constant: 840),
            doughView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            doughView.widthAnchor.constraint(equalToConstant: 221),
            doughView.heightAnchor.constraint(equalToConstant: 132)
        ])
        
        stoveView = UIImageView()
        stoveView.translatesAutoresizingMaskIntoConstraints = false
        stoveView.image = stoveImage
        
        view.addSubview(stoveView)
        
        NSLayoutConstraint.activate([
            stoveView.topAnchor.constraint(equalTo: view.topAnchor, constant: 580),
            stoveView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 346),
            stoveView.widthAnchor.constraint(equalToConstant: 114),
            stoveView.heightAnchor.constraint(equalToConstant: 53)
        ])
        
        
        doughLabel = UILabel()
        doughLabel.text = "Nastar Dough"
        doughLabel.font = UIFont.systemFont(ofSize: 30)
        doughLabel.translatesAutoresizingMaskIntoConstraints = false
        doughLabel.backgroundColor = .gray
        view.addSubview(doughLabel)
        NSLayoutConstraint.activate ([
            doughLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 774),
            doughLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55)
        ])
    
        
        jamView = UIImageView()
        jamView.translatesAutoresizingMaskIntoConstraints = false
        jamView.image = jamImage
        
        view.addSubview(jamView)
        setupPanRecognizer()

        NSLayoutConstraint.activate([
            jamView.topAnchor.constraint(equalTo: view.topAnchor, constant: 839),
            jamView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 575),
            jamView.widthAnchor.constraint(equalToConstant: 90),
            jamView.heightAnchor.constraint(equalToConstant: 156)
        ])
        
        
        jamLabel = UILabel()
        jamLabel.text = "Pineapple Jam"
        jamLabel.font = UIFont.systemFont(ofSize: 30)
        jamLabel.translatesAutoresizingMaskIntoConstraints = false
        jamLabel.backgroundColor = .gray
        view.addSubview(jamLabel)
        NSLayoutConstraint.activate ([
            jamLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 774),
            jamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600)
        ])
        
        
        nextButton = UIButton ()
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 5
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 1080),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 700),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        nextButton.addTarget(self, action: #selector(tapView), for: .touchUpInside)
    }
    var jamTemporary : UIImageView!
    private func setupPanRecognizer () {
        let panRecognizer = UIPanGestureRecognizer (target: self,
                                                    action: #selector(handlePan))
        
        jamView.isUserInteractionEnabled = true
        jamView.addGestureRecognizer(panRecognizer)
    }

    @objc func tapView(sender: UIButton) {
        navigationController?.pushViewController(cookNastarVC(), animated: true)
    }
    var riceTemporary : UIImageView!
    @objc private func handlePan (panGesture: UIPanGestureRecognizer){
        let translation = panGesture.translation(in: view)
        panGesture.setTranslation(.zero, in: view)
        jamView.center = .init(x: jamView.center.x + translation.x,
                                  y: jamView.center.y + translation.y)
        
        print("tapped!")
        let draggedView = panGesture.view
        if draggedView!.frame.intersects(doughView.frame)
        {
            doughView.image = UIImage(named: "nastarraw")
            jamView.removeFromSuperview()
        }

    }
    private func onePanRecognizer () {
        let onePanRecognizer = UIPanGestureRecognizer (target: self,
                                                    action: #selector(handlePan))
        jamView.isUserInteractionEnabled = true
        jamView.addGestureRecognizer(onePanRecognizer)
    }
    }
