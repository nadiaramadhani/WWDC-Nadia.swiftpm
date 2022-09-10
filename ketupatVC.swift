import SwiftUI

struct GameHelp: View {
    var body: some View {
        GameView()
    }
}
struct GameHelpUI: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: ketupatVC())
        return navController
        
    }
    
}
class ketupatVC : UIViewController {
    var janurView : UIImageView!
    var berasView : UIImageView!
    var janurImage = UIImage(named:"janur")
    var berasImage = UIImage(named:"beras")
    var sendokImage = UIImage (named: "spoon")
    var sendokView : UIImageView!
    var nextButton = UIButton()
    var janurView2 : UIImageView!
    var janurView3 : UIImageView!
    var janurView4 : UIImageView!
    var momImage = UIImage (named: "mom")
    var momView : UIImageView!
    var janurLabel = UILabel()
    var riceLabel = UILabel()
    var stoveImage = UIImage (named: "stove")
    var stoveView : UIImageView!
    var textMom2 = UILabel()
    var bubleImage = UIImage(named: "buble")
    var bubleImageView : UIImageView!
    
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
        
        setupView()
        
        
    }
    
    func setupView (){
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
        
        You can put the rice to
        the coconut leaves
        Tap next to cook Ketupat
        """)
        
        bubleImageView.addSubview(textMom2)
        NSLayoutConstraint.activate([
            textMom2.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 30),
            textMom2.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor)
        ])
        
        sendokView = UIImageView()
        sendokView.translatesAutoresizingMaskIntoConstraints = false
        sendokView.image = sendokImage
        
        view.addSubview(sendokView)
        setupPanRecognizer()
        
        NSLayoutConstraint.activate([
            sendokView.topAnchor.constraint(equalTo: view.topAnchor, constant: 870),
            sendokView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 668),
            sendokView.widthAnchor.constraint(equalToConstant: 165),
            sendokView.heightAnchor.constraint(equalToConstant: 90)
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
        
        
        janurLabel = UILabel()
        janurLabel.text = "Coconut leaves"
        janurLabel.font = UIFont.systemFont(ofSize: 30)
        janurLabel.translatesAutoresizingMaskIntoConstraints = false
        janurLabel.backgroundColor = .gray
        view.addSubview(janurLabel)
        NSLayoutConstraint.activate ([
            janurLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 774),
            janurLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55)
        ])
        
        janurView = UIImageView()
        janurView.translatesAutoresizingMaskIntoConstraints = false
        janurView.image = janurImage
        
        view.addSubview(janurView)
        
        NSLayoutConstraint.activate([
            janurView.topAnchor.constraint(equalTo: view.topAnchor, constant: 760),
            janurView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            janurView.widthAnchor.constraint(equalToConstant: 270),
            janurView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        
        janurView2 = UIImageView()
        janurView2.translatesAutoresizingMaskIntoConstraints = false
        janurView2.image = janurImage
        
        view.addSubview(janurView2)
        
        NSLayoutConstraint.activate([
            janurView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 790),
            janurView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            janurView2.widthAnchor.constraint(equalToConstant: 270),
            janurView2.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        
        janurView3 = UIImageView()
        janurView3.translatesAutoresizingMaskIntoConstraints = false
        janurView3.image = janurImage
        
        view.addSubview(janurView3)
        
        NSLayoutConstraint.activate([
            janurView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 830),
            janurView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            janurView3.widthAnchor.constraint(equalToConstant: 270),
            janurView3.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        
        janurView4 = UIImageView()
        janurView4.translatesAutoresizingMaskIntoConstraints = false
        janurView4.image = janurImage
        
        view.addSubview(janurView4)
        
        NSLayoutConstraint.activate([
            janurView4.topAnchor.constraint(equalTo: view.topAnchor, constant: 860),
            janurView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            janurView4.widthAnchor.constraint(equalToConstant: 270),
            janurView4.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        berasView = UIImageView()
        berasView.translatesAutoresizingMaskIntoConstraints = false
        berasView.image = berasImage
        
        view.addSubview(berasView)
        
        NSLayoutConstraint.activate([
            berasView.topAnchor.constraint(equalTo: view.topAnchor, constant: 909),
            berasView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 590),
            berasView.widthAnchor.constraint(equalToConstant: 175),
            berasView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        
        riceLabel = UILabel()
        riceLabel.text = "Rice"
        riceLabel.font = UIFont.systemFont(ofSize: 30)
        riceLabel.translatesAutoresizingMaskIntoConstraints = false
        riceLabel.backgroundColor = .gray
        view.addSubview(riceLabel)
        NSLayoutConstraint.activate ([
            riceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 774),
            riceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600)
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
                                                    action: #selector(handlePan))
        sendokView.isUserInteractionEnabled = true
        sendokView.addGestureRecognizer(panRecognizer)
    }

    @objc func tapView(sender: UIButton) {
        navigationController?.pushViewController(cookVC(), animated: true)
    }
    var riceTemporary : UIImageView!
    @objc private func handlePan (panGesture: UIPanGestureRecognizer){
        let translation = panGesture.translation(in: view)
        panGesture.setTranslation(.zero, in: view)
        sendokView.center = .init(x: sendokView.center.x + translation.x,
                                  y: sendokView.center.y + translation.y)
        
        print("tapped!")
        let draggedView = panGesture.view
        if draggedView!.frame.intersects(janurView.frame)
        {
            janurView.image = UIImage(named: "ketupat")
            sendokView.removeFromSuperview()
            
            
        }
        if draggedView!.frame.intersects(janurView2.frame)
        {
            janurView2.image = UIImage(named: "ketupat")
            sendokView.removeFromSuperview()
        }
        
        if draggedView!.frame.intersects(janurView3.frame)
        {
            janurView3.image = UIImage(named: "ketupat")
            sendokView.removeFromSuperview()
        }
        if draggedView!.frame.intersects(janurView4.frame)
        {
            janurView4.image = UIImage(named: "ketupat")
            sendokView.removeFromSuperview()
        }
        

    }
    private func onePanRecognizer () {
        let onePanRecognizer = UIPanGestureRecognizer (target: self,
                                                    action: #selector(handlePan))
        janurView.isUserInteractionEnabled = true
        janurView.addGestureRecognizer(onePanRecognizer)
    }
//    var stoveTemporary : UIImageView!
//    @objc private func handlePanStove (panGesture: UIPanGestureRecognizer){
//        let translation = panGesture.translation(in: view)
//        panGesture.setTranslation(.zero, in: view)
//        janurView.center = .init(x: janurView.center.x + translation.x,
//                                  y: janurView.center.y + translation.y)
//
//        let draggedView = panGesture.view
//        if draggedView!.frame.intersects(stoveView.frame)
//        {
//            janurView.image = UIImage(named: "ketupatCooked")
//            janurView.removeFromSuperview()
//
//
//        }
    
}
