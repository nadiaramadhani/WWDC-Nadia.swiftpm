import SwiftUI

struct cookStruct: View {
    var body: some View {
        GameView()
    }
}
struct cookViewUI: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: cookVC())
        return navController
        
    }
    
}
class cookVC : UIViewController {
    var stoveImage = UIImage (named: "stove")
    var stoveView : UIImageView!
    var ketupatImage = UIImage (named: "ketupats")
    var ketupatView : UIImageView!
    var labelDone = UILabel()
    var momView : UIImageView!
    var momImage = UIImage (named: "mom")
    var bubleImage = UIImage(named: "buble")
    var bubleImageView : UIImageView!
    var historyBar = UIImage(named: "1history")
    var historyView : UIImageView!
    var backBar = UIImage(named: "1back")
    var backView : UIImageView!
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
        
        setupView2()
        
        
    }
    func setupView2() {
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
            bubleImageView.widthAnchor.constraint(equalToConstant: 350),
            bubleImageView.heightAnchor.constraint(equalToConstant: 157)
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
        
        ketupatView = UIImageView()
        ketupatView.image = ketupatImage
        ketupatView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ketupatView)
        panRecognizer2()
        NSLayoutConstraint.activate([
            ketupatView.topAnchor.constraint(equalTo: view.topAnchor, constant: 763),
            ketupatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            ketupatView.widthAnchor.constraint(equalToConstant: 359),
            ketupatView.heightAnchor.constraint(equalToConstant: 311)
            
        ])

        
        labelDone = UILabel()
        labelDone.numberOfLines = 0
        labelDone.textAlignment = .center
        labelDone.translatesAutoresizingMaskIntoConstraints = false
        labelDone.setTyping(text: """
        Put ketupat into the boiling water
        And your ketupat is done
        Tap history to know the story of ketupat
        Or tap back to cook other foods
        """)
        
        bubleImageView.addSubview(labelDone)
        NSLayoutConstraint.activate([
            labelDone.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 20),
            labelDone.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor)
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
        
        historyView = UIImageView()
        historyView.translatesAutoresizingMaskIntoConstraints = false
        historyView.image = historyBar
        view.addSubview(historyView)
        setUpTapRecognizer3()
        
        NSLayoutConstraint.activate([
            historyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 938),
            historyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 702),
            historyView.widthAnchor.constraint(equalToConstant: 114),
            historyView.heightAnchor.constraint(equalToConstant: 53)
            
        ])
        
        
    }
    var ketupatTemporary : UIImageView!
    @objc private func handlePan (panGesture: UIPanGestureRecognizer){
        let translation = panGesture.translation(in: view)
        panGesture.setTranslation(.zero, in: view)
        ketupatView.center = .init(x: ketupatView.center.x + translation.x,
                                   y: ketupatView.center.y + translation.y)
        
        let draggedView = panGesture.view
        if draggedView!.frame.intersects(stoveView.frame)
        {
            ketupatView.image = UIImage(named: "ketupatCooked")
        }
    }
    
    private func panRecognizer2 () {
        let onePanRecognizer = UIPanGestureRecognizer (target: self,
                                                       action: #selector(handlePan))
        ketupatView.isUserInteractionEnabled = true
        ketupatView.addGestureRecognizer(onePanRecognizer)
    }

    private func setUpTapRecognizer2 () {
        let tapRecognizer2 = UITapGestureRecognizer (target: self, action: #selector (tapView2))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(tapRecognizer2)}
    
    @objc func tapView2(sender: UIImageView) {
        navigationController?.pushViewController(helpMomVC(), animated: true)
        
    }
    private func setUpTapRecognizer3 () {
        let tapRecognizer3 = UITapGestureRecognizer (target: self, action: #selector (tapView3))
        historyView.isUserInteractionEnabled = true
        historyView.addGestureRecognizer(tapRecognizer3)}
    
    @objc func tapView3(sender: UIImageView) {
        navigationController?.pushViewController(historyKetupatVC(), animated: true)
        
    }
    
    
}
