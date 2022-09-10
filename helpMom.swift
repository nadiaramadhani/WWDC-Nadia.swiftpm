import SwiftUI

struct KitchenView: View {
    var body: some View {
        helpMom()
    }
}
struct helpMom: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: helpMomVC())
        return navController
        
    }
    
}
class helpMomVC : UIViewController {
    var ketupatView : UIImageView!
    var ketupatImage = UIImage (named: "ketupats")
    var nastarView : UIImageView!
    var nastarImage = UIImage (named: "nastar")
    var oporImage = UIImage (named: "opor")
    var oporView : UIImageView!
    var momImage = UIImage(named: "mom")
    var momView :UIImageView!
    var bubleImage = UIImage (named: "buble")
    var bubleImageView : UIImageView!
    var txtMom1 = UILabel()
    var ketupatLabel = UILabel()
    var oporLabel = UILabel()
    var nastarLabel = UILabel()
    var backView : UIImageView!
    var backImage = UIImage(named: "backbutton")
    var historyImg = UIImage (named: "history")
    var historyView : UIImageView!
    var nextImg = UIImage(named: "next")
    var nextView : UIImageView!
    
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
        
        txtMom1 = UILabel ()
        txtMom1.numberOfLines = 0
        txtMom1.textAlignment = .center
        txtMom1.translatesAutoresizingMaskIntoConstraints = false
        txtMom1.setTyping(text: """
        Hi dear! Welcome home
        I am preparing some foods
        If you're not tired please help me
        Choose which one you want to help
        """)
        
        bubleImageView.addSubview(txtMom1)
        NSLayoutConstraint.activate([
            
            txtMom1.topAnchor.constraint(equalTo: bubleImageView.topAnchor, constant: 30),
            txtMom1.centerXAnchor.constraint(equalTo: bubleImageView.centerXAnchor),
        ])
        
        ketupatView = UIImageView ()
        ketupatView.translatesAutoresizingMaskIntoConstraints = false
        ketupatView.image = ketupatImage
        view.addSubview(ketupatView)
        setUpTapRecognizer()
        
        NSLayoutConstraint.activate([
           ketupatView.topAnchor.constraint(equalTo: view.topAnchor, constant: 780),
           ketupatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
           ketupatView.widthAnchor.constraint(equalToConstant: 240 ),
           ketupatView.heightAnchor.constraint(equalToConstant: 243)
        ])
        ketupatLabel.text = "Ketupat"
        ketupatLabel.translatesAutoresizingMaskIntoConstraints = false
        ketupatLabel.textAlignment = .center
        ketupatLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(ketupatLabel)
        NSLayoutConstraint.activate([
            ketupatLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 1025),
            ketupatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80)
            
        ])
        
        oporView = UIImageView ()
        oporView.translatesAutoresizingMaskIntoConstraints = false
        oporView.image = oporImage
       
        view.addSubview(oporView)
        setUpTapRecognizer3()
        
        NSLayoutConstraint.activate([
           oporView.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
           oporView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 305),
           oporView.widthAnchor.constraint(equalToConstant: 221),
           oporView.heightAnchor.constraint(equalToConstant: 182)
        ])
        oporLabel.text = "Chicken Opor"
        oporLabel.translatesAutoresizingMaskIntoConstraints = false
        oporLabel.textAlignment = .center
        oporLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(oporLabel)
        NSLayoutConstraint.activate([
            oporLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 1025),
            oporLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 335)
            
        ])
        
        nastarView = UIImageView ()
        nastarView.translatesAutoresizingMaskIntoConstraints = false
        nastarView.image = nastarImage
       
               view.addSubview(nastarView)
        setUpTapRecognizer2()
        
        NSLayoutConstraint.activate([
           nastarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 830),
           nastarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 590),
           nastarView.widthAnchor.constraint(equalToConstant: 225),
           nastarView.heightAnchor.constraint(equalToConstant: 118)
        ])
        nastarLabel.text = "Nastar"
        nastarLabel.translatesAutoresizingMaskIntoConstraints = false
        nastarLabel.textAlignment = .center
        nastarLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(nastarLabel)
        NSLayoutConstraint.activate([
            nastarLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 1025),
            nastarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 660)
            
        ])
}

    private func setUpTapRecognizer () {
            let tapRecognizer = UITapGestureRecognizer (target: self, action: #selector (tapView))
            ketupatView.isUserInteractionEnabled = true
            ketupatView.addGestureRecognizer(tapRecognizer)}
    
    @objc func tapView(sender: UIImageView) {
        navigationController?.pushViewController(ketupatVC(), animated: true)
        
        
    }
    private func setUpTapRecognizer2 () {
            let tapRecognizer2 = UITapGestureRecognizer (target: self, action: #selector (tapView2))
            nastarView.isUserInteractionEnabled = true
            nastarView.addGestureRecognizer(tapRecognizer2)}
    
    @objc func tapView2(sender: UIImageView) {
        navigationController?.pushViewController(nastarVC(), animated: true)
    }
    
    
    private func setUpTapRecognizer3 () {
            let tapRecognizer3 = UITapGestureRecognizer (target: self, action: #selector (tapView3))
            oporView.isUserInteractionEnabled = true
            oporView.addGestureRecognizer(tapRecognizer3)}
    
    @objc func tapView3(sender: UIImageView) {
        navigationController?.pushViewController(oporVC(), animated: true)
    
    }
}
