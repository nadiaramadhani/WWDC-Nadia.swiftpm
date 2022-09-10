import SwiftUI


struct oporStruct: View {
    var body: some View {
    oporGameView()
    }
}
struct oporGameView : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
    let navController = UINavigationController (rootViewController: oporVC())
return navController
        
    }
        
    }
class oporVC : UIViewController {
    var oporRawView : UIImageView!
    var seasonView : UIImageView!
    var chickenView : UIImageView!
    var cocoMilkView : UIImageView!
    var oporImage = UIImage(named:"oporraw")
    var chickenIMage = UIImage(named:"chicken")
    var seasonImage = UIImage(named:"seasoning")
    var momImage = UIImage (named: "mom")
    var cocoMilkImage = UIImage(named: "coconutMilk")
    var momView : UIImageView!
    var chickenLabel = UILabel()
    var seasonLabel = UILabel()
    var cocoMilkLabel = UILabel()
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
            bubleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
            bubleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 227),
            bubleImageView.widthAnchor.constraint(equalToConstant: 307),
            bubleImageView.heightAnchor.constraint(equalToConstant: 157)
        ])
        
        
        textMom2 = UILabel ()
        textMom2.numberOfLines = 0
        textMom2.textAlignment = .center
        textMom2.translatesAutoresizingMaskIntoConstraints = false
        textMom2.setTyping(text: """
        First put the seasoning into chicken
        then add coconut milk
        If your raw Opor is done
        tap next to cook Opor
        """)
        
        bubleImageView.addSubview(textMom2)
        NSLayoutConstraint.activate([
            textMom2.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 20),
            textMom2.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor)
        ])
        
        chickenView = UIImageView()
        chickenView.translatesAutoresizingMaskIntoConstraints = false
        chickenView.image = chickenIMage
        
        view.addSubview(chickenView)
        NSLayoutConstraint.activate([
            chickenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 836),
            chickenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            chickenView.widthAnchor.constraint(equalToConstant: 239),
            chickenView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        cocoMilkView = UIImageView()
        cocoMilkView.translatesAutoresizingMaskIntoConstraints = false
        cocoMilkView.image = cocoMilkImage
        
        view.addSubview(cocoMilkView)
        NSLayoutConstraint.activate([
            cocoMilkView.topAnchor.constraint(equalTo: view.topAnchor, constant: 870),
            cocoMilkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 657),
            cocoMilkView.widthAnchor.constraint(equalToConstant: 89),
            cocoMilkView.heightAnchor.constraint(equalToConstant: 132)
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
        
        
        chickenLabel = UILabel()
        chickenLabel.text = "Chicken meat"
        chickenLabel.font = UIFont.systemFont(ofSize: 30)
        chickenLabel.translatesAutoresizingMaskIntoConstraints = false
        chickenLabel.backgroundColor = .gray
        view.addSubview(chickenLabel)
        NSLayoutConstraint.activate ([
            chickenLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 774),
            chickenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
        ])
    
        
        seasonView = UIImageView()
        seasonView.translatesAutoresizingMaskIntoConstraints = false
        seasonView.image = seasonImage
        
        view.addSubview(seasonView)
        setupPanRecognizer()

        NSLayoutConstraint.activate([
            seasonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 897),
            seasonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 355),
            seasonView.widthAnchor.constraint(equalToConstant: 211),
            seasonView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        seasonLabel = UILabel()
        seasonLabel.text = "Seasoning"
        seasonLabel.font = UIFont.systemFont(ofSize: 30)
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.backgroundColor = .gray
        view.addSubview(seasonLabel)
        setupPanRecognizer2()
        NSLayoutConstraint.activate ([
            seasonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 780),
            seasonLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 345)
        ])
        
        cocoMilkLabel = UILabel()
        cocoMilkLabel.text = "Cococnut Milk"
        cocoMilkLabel.font = UIFont.systemFont(ofSize: 30)
        cocoMilkLabel.translatesAutoresizingMaskIntoConstraints = false
        cocoMilkLabel.backgroundColor = .gray
        view.addSubview(cocoMilkLabel)
        NSLayoutConstraint.activate ([
            cocoMilkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 780),
            cocoMilkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 611)
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

    private func setupPanRecognizer () {
        let panRecognizer = UIPanGestureRecognizer (target: self,
                                                    action: #selector(handlePanSeason))
        
        seasonView.isUserInteractionEnabled = true
        seasonView.addGestureRecognizer(panRecognizer)
    }

    @objc func tapView(sender: UIButton) {
        navigationController?.pushViewController(cookOporVC(), animated: true)
    }
    
    var seasonTemporary : UIImageView!
    @objc private func handlePanSeason (panGesture: UIPanGestureRecognizer){
        let translation = panGesture.translation(in: view)
        panGesture.setTranslation(.zero, in: view)
        seasonView.center = .init(x: seasonView.center.x + translation.x,
                                  y: seasonView.center.y + translation.y)
        
        print("tapped!")}
    
    private func setupPanRecognizer2 (){
        let panRecognizer2 = UIPanGestureRecognizer (target: self, action: #selector(handlePanCoco))
        cocoMilkView.isUserInteractionEnabled = true
        cocoMilkView.addGestureRecognizer(panRecognizer2)
    }
    var cocoTemporary : UIImageView!
    @objc private func handlePanCoco (panGesture: UIPanGestureRecognizer){
        let translation = panGesture.translation(in: view)
        panGesture.setTranslation(.zero, in: view)
        cocoMilkView.center = .init(x: cocoMilkView.center.x + translation.x,
                                  y: cocoMilkView.center.y + translation.y)
        
        print("tapped!")
        let draggedView = panGesture.view
        if draggedView!.frame.intersects(chickenView.frame)
        {
            chickenView.image = UIImage(named: "oporraw")
            seasonView.removeFromSuperview()
            cocoMilkView.removeFromSuperview()
        }
    }
}

