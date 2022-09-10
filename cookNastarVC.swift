import SwiftUI

struct cookNastarStruct: View {
    var body: some View {
        GameView()
    }
}
struct cookNastarUI: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: cookNastarVC())
        return navController
        
    }
    
}
class cookNastarVC : UIViewController {
    var nastarView : UIImageView!
    var nastarImage = UIImage(named:"nastarraw")
    var nastarCookedView : UIImageView!
    var nastarCookedImage = UIImage(named:"nastar")
    var momImage = UIImage (named: "mom")
    var momView : UIImageView!
    var doughLabel = UILabel()
    var jamLabel = UILabel()
    var ovenView : UIImageView!
    var ovenImage = UIImage(named: "oven")
    var textMom2 = UILabel()
    var bubleImage = UIImage(named: "buble")
    var bubleImageView : UIImageView!
    var historyBar = UIImage(named: "1history")
    var historyView : UIImageView!
    var backBar = UIImage(named: "1back")
    var backView : UIImageView!
    var labelDone = UILabel()
    
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
            bubleImageView.heightAnchor.constraint(equalToConstant: 165)
        ])
        
        
        ovenView = UIImageView()
        ovenView.translatesAutoresizingMaskIntoConstraints = false
        ovenView.image = ovenImage
        
        view.addSubview(ovenView)
        
        NSLayoutConstraint.activate([
            ovenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 675),
            ovenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 498),
            ovenView.widthAnchor.constraint(equalToConstant: 95),
            ovenView.heightAnchor.constraint(equalToConstant: 69)
        ])
        
        nastarView = UIImageView()
        nastarView.image = nastarImage
        nastarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nastarView)
        panRecognizer2()
        NSLayoutConstraint.activate([
            nastarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 867),
            nastarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            nastarView.widthAnchor.constraint(equalToConstant: 225),
            nastarView.heightAnchor.constraint(equalToConstant: 118)
            
        ])

        
        labelDone = UILabel()
        labelDone.numberOfLines = 0
        labelDone.textAlignment = .center
        labelDone.translatesAutoresizingMaskIntoConstraints = false
        labelDone.setTyping(text: """
        Put Nastar into the boiling water
        And your Nastar is done
        Thanks for helping me
        Tap history to know the story of Nastar
        Or tap other to cook other foods
        """)
        
        bubleImageView.addSubview(labelDone)
        NSLayoutConstraint.activate([
            labelDone.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 10),
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
        nastarView.center = .init(x: nastarView.center.x + translation.x,
                                   y: nastarView.center.y + translation.y)
        
        let draggedView = panGesture.view
        if draggedView!.frame.intersects(ovenView.frame)
        {
            nastarView.image = UIImage(named: "nastar")
        }
    }
    
    private func panRecognizer2 () {
        let onePanRecognizer = UIPanGestureRecognizer (target: self,
                                                       action: #selector(handlePan))
        nastarView.isUserInteractionEnabled = true
        nastarView.addGestureRecognizer(onePanRecognizer)
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
        navigationController?.pushViewController(historyNastarVC(), animated: true)
        
    }
    
    
}
