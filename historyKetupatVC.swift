import SwiftUI

struct history1View: View {
    var body: some View {
        GameView()
    }
}
struct history1Struct: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navController = UINavigationController (rootViewController: historyKetupatVC())
        return navController
        
    }
    
}
class historyKetupatVC : UIViewController {
    var manuscriptView : UIImageView!
    var manuscriptImage = UIImage(named: "manuscript")
    var historyLabel = UILabel()
    var nextImage = UIImage(named: "1next")
    var nextView : UIImageView!
    var backImage = UIImage(named: "1back")
    var backView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        setupViewHistory()
        
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
    }
    
    func setupViewHistory() {
        
        manuscriptView = UIImageView()
        manuscriptView.translatesAutoresizingMaskIntoConstraints = false
        manuscriptView.image = manuscriptImage
        
        view.addSubview(manuscriptView)
        
        NSLayoutConstraint.activate([
            manuscriptView.topAnchor.constraint(equalTo: view.topAnchor, constant: 156),
            manuscriptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            manuscriptView.widthAnchor.constraint(equalToConstant: 810),
            manuscriptView.heightAnchor.constraint(equalToConstant: 834)
        ])
        
        
        historyLabel = UILabel ()
        historyLabel.numberOfLines = 0
        historyLabel.textAlignment = .center
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.font = UIFont.systemFont(ofSize: 24)
        historyLabel.setTyping(text: """
        Ketupat is basically rice wrapped
        in young coconut leaves.
        Ketupat is one of typical food for Eid al Fitri,
        or Muslim feast day in Indonesia.
        There are some phylosophy of ketupat itself,
        Its complicated webbing
        simbolize human mistakes in life,
        Meanwhile, the white rice inside Ketupat
        represents clean and pure heart,
        after doing fasting for a month in Ramadhan
        and asking and giving forgiveness
        between Muslim in Eid al Fitri day
        """)
        
        manuscriptView.addSubview(historyLabel)
        NSLayoutConstraint.activate([
            
            historyLabel.topAnchor.constraint(equalTo: manuscriptView.topAnchor, constant: 170),
            historyLabel.centerXAnchor.constraint(equalTo: manuscriptView.centerXAnchor),
        ])
        
        
        nextView = UIImageView()
        nextView.translatesAutoresizingMaskIntoConstraints = false
        nextView.image = nextImage
        view.addSubview(nextView)
        setUpTapRecognizer()
        
        NSLayoutConstraint.activate([
            nextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1007),
            nextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 702),
            nextView.widthAnchor.constraint(equalToConstant: 114),
            nextView.heightAnchor.constraint(equalToConstant: 53)
        ])
        
        backView = UIImageView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.image = backImage
        view.addSubview(backView)
        setUpTapRecognizer2()
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1063),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 702),
            backView.widthAnchor.constraint(equalToConstant: 114),
            backView.heightAnchor.constraint(equalToConstant: 53)
        ])
    }
    
    private func setUpTapRecognizer () {
        let tapRecognizer = UITapGestureRecognizer (target: self, action: #selector (tapView))
        nextView.isUserInteractionEnabled = true
        nextView.addGestureRecognizer(tapRecognizer)}
    
    @objc func tapView(sender: UIImageView) {
        navigationController?.pushViewController(quizVC(), animated: true)
    }
    
    private func setUpTapRecognizer2 () {
        let tapRecognizer2 = UITapGestureRecognizer (target: self, action: #selector (tapView2))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(tapRecognizer2)}
    
    @objc func tapView2(sender: UIImageView) {
        navigationController?.pushViewController(helpMomVC(), animated: true)
        
    }
    
    
    
    
}
