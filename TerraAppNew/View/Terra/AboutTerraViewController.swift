import UIKit

class AboutTerraViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let terraLabel = UILabel(text: "Terra. Информация",
                                         font: .proDisplayBold18(),
                                         color: .specialBlack,
                                         line: 1)
    
    private let terraLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let terraName: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logotext")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "about")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "terraalgos")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "terraprojects")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var terraInformationButton: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -3)
        config.baseBackgroundColor = .white
        config.baseForegroundColor = UIColor.specialBlack
        config.title = "Общая информация"
        config.subtitle = " "
        config.attributedTitle?.font = .systemFont(ofSize: 17, weight: .bold)
        config.titleAlignment = .leading
        config.image = UIImage(named: "about")
        config.imagePlacement = .trailing
        switch view.frame.size.width {
        case 0..<380: config.imagePadding = view.frame.size.width / 4 - 10
        case 380...400: config.imagePadding = view.frame.size.width / 4
        default: config.imagePadding = view.frame.size.width / 4 + 20
        }
        button.configuration = config
        
        button.applyShadow(cornerRadius: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(aboutButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var terraAlgorithmsButton: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -3)
        config.baseBackgroundColor = .white
        config.baseForegroundColor = UIColor.specialBlack
        config.title = "Алгоритмы Terra"
        config.subtitle = " "
        config.attributedTitle?.font = .systemFont(ofSize: 17, weight: .bold)
        config.titleAlignment = .leading
        config.image = UIImage(named: "terraalgos")
        config.imagePlacement = .trailing
        switch view.frame.size.width {
        case 0..<380: config.imagePadding = view.frame.size.width / 4
        case 380...400: config.imagePadding = view.frame.size.width / 4 + 10
        default: config.imagePadding = view.frame.size.width / 4 + 30
        }
        button.configuration = config
        
        button.applyShadow(cornerRadius: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(algoButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var terraProjectsButton: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -3)
        config.baseBackgroundColor = .white
        config.baseForegroundColor = UIColor.specialBlack
        config.title = "Проекты Terra"
        config.subtitle = " "
        config.attributedTitle?.font = .systemFont(ofSize: 17, weight: .bold)
        config.titleAlignment = .leading
        config.image = UIImage(named: "terraprojects")
        config.imagePlacement = .trailing
        switch view.frame.size.width {
        case 0..<380: config.imagePadding = view.frame.size.width / 4 - 20
        case 380...400: config.imagePadding = view.frame.size.width / 4 - 15
        default: config.imagePadding = view.frame.size.width / 4+10
        }
        button.configuration = config
        
        button.applyShadow(cornerRadius: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(projectsButton), for: .touchUpInside)
        return button
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.applyShadow(cornerRadius: 5)
        return view
    }()
    
    private let strokeLabel: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backButtonLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc func aboutButton(){
        let nextVC = InformationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("Button information pressed")
    }
    
    @objc func algoButton(){
        let nextVC = AlgoritmsTerraViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("Button algo pressed")
    }
    
    @objc func projectsButton(){
        let nextVC = ProjectsTerraViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("Button projects pressed")
    }
    
    private func backButtonLabel(){
        let backButton = UIBarButtonItem()
        backButton.title = "Информация"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(terraLabel)
        view.addSubview(strokeLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(terraLogo)
        scrollView.addSubview(terraName)
        scrollView.addSubview(terraInformationButton)
        scrollView.addSubview(terraAlgorithmsButton)
        scrollView.addSubview(terraProjectsButton)
    }
}

extension AboutTerraViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            terraLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            terraLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            strokeLabel.topAnchor.constraint(equalTo: terraLabel.bottomAnchor, constant: 12),
            strokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            strokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            strokeLabel.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: strokeLabel.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1)
        ])
        
        NSLayoutConstraint.activate([
            terraLogo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 44.92),
            terraLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            terraLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            terraName.topAnchor.constraint(equalTo: terraLogo.bottomAnchor, constant: 1),
            terraName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            terraName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            terraInformationButton.topAnchor.constraint(equalTo: terraName.bottomAnchor, constant: 25),
            terraInformationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            terraInformationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraInformationButton.heightAnchor.constraint(equalToConstant: 137)
        ])
        
        NSLayoutConstraint.activate([
            terraAlgorithmsButton.topAnchor.constraint(equalTo: terraInformationButton.bottomAnchor, constant: 16),
            terraAlgorithmsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            terraAlgorithmsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraAlgorithmsButton.heightAnchor.constraint(equalToConstant: 137)
        ])
        
        NSLayoutConstraint.activate([
            terraProjectsButton.topAnchor.constraint(equalTo: terraAlgorithmsButton.bottomAnchor, constant: 16),
            terraProjectsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            terraProjectsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraProjectsButton.heightAnchor.constraint(equalToConstant: 137),
            terraProjectsButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])

    }
}
