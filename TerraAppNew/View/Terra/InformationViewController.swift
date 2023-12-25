import UIKit

class InformationViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let informationLabel = UILabel(text: "Общая информация",
                                           font: .proDisplayBold18(),
                                           color: .specialBlack,
                                           line: 0)
    
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
    
    private let firstLabel = UILabel(text: "Год основания",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let secondLabel = UILabel(text: "2018",
                                      font: .proDisplayRegular14(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let thirdLabel = UILabel(text: "Численность",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let fourthLabel = UILabel(text: "Около 200 наставников, 1000 учеников",
                                      font: .proDisplayRegular14(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let fifthLabel = UILabel(text: "Видение, миссия",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let sixthLabel = UILabel(text: "Борьба с бедностью через обучение и развитие предпринимателей и управленцев.",
                                     font: .proDisplayRegular14(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let seventhLabel = UILabel(text: "История создания",
                                       font: .proDisplay18(),
                                       color: .specialBlack,
                                       line: 0)
    
    private let eighthLabel = UILabel(text: "Основатель компании после творческого переосмысления свой жизни понял, что потенциал нашей страны сдерживает трудность получения бесплатного финансового образования и поэтому в 2018 году, в марте он взял 20 предпринимателей и стал для них наставников. Чёткой системы не было, делал, как умел. В будущем его лекции стали Школой Управления. А маленькая группа людей превратилась в большое движение, порядка 10 000 человек.",
                                      font: .proDisplayRegular14(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let ninethLabel = UILabel(text: "Принципы и ценности Терры",
                                      font: .proDisplay18(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let tenthLabel: UILabel = {
        let tenthLabel = UILabel()
        let bullet = "•  "
        var strings = [String]()
        strings.append("Дарование")
        strings.append("Наставничество")
        strings.append("Окружение")
        strings.append("Нетворкинг")
        strings.append("Взаимопомощь")
        strings.append("Досуг")
        strings.append("Желание безвозмездно делиться знаниями и опытом")
        strings.append("Мы не ждем пока мир изменится, мы меняем его сами")
        strings = strings.map { return bullet + $0 }
        tenthLabel.font = .proDisplayRegular14()
        tenthLabel.textColor = .specialBlack
        tenthLabel.numberOfLines = 0
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .footnote)
        attributes[.foregroundColor] = UIColor.specialBlack
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = strings.joined(separator: "\n")
        tenthLabel.attributedText = NSAttributedString(string: string, attributes: attributes)
        return tenthLabel
    }()
    
    private let eleventhLabel = UILabel(text: "Факты о сообществе",
                                        font: .proDisplay18(),
                                        color: .specialBlack,
                                        line: 0)
    
    private let twelvethLabel = UILabel(text: "Холдинг состоит из 4 проектов в сфере IT и финан-совых технлогий. За 3 года организация увеличила доход в 5 раз и вышла в ТОП-3 рынка, более 10000 тысяч человек прошли обучение по бизнесу, есть 150 наставников ступени «Запуск», 50 наставников ступени «Прорыв», 5 потоков наставничества в год и более 20 направлений обучения, каждый наставник набирает себе группу из 10 обучающихся на 1 поток, который длится 2 месяца в «Запуске» и бессрочно в «Прорыве». Наставниками становятся менторы бизнес клуба Terra, предприниматели с действующим бизнесоми доходом от 300 тысяч рублей в «Запуске» и от 1 млн. рублей в «Прорыве».",
                                        font: .proDisplayRegular14(),
                                        color: .specialBlack,
                                        line: 0)
    
    private let thirtheenthLabel = UILabel(text: "Другие направления",
                                           font: .proDisplay18(),
                                           color: .specialBlack,
                                           line: 0)
    
    private let fourteenthLabel = UILabel(text: "Узнай подробнее в «Проектах Terra». Терра - не просто организация, завязанная на строгом обучении, также там проводятся развивающие игры, например, мафия, управленческие поединки и денежный поток. Эти мероприятия нацелены на улучшение технического и стратегического, финансового мышления.",
                                          font: .proDisplayRegular14(),
                                          color: .specialBlack,
                                          line: 0)
    
    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "InformationVС1")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "InformationVС2")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "InformationVС3")
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.specialGreen.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "InformationVС4")
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.specialGreen.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fourLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fiveLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sixthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var thirdStackView = UIStackView()
    private var imagesStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupUIStackView() {
        firstStackView = UIStackView(arrangedSubviews:
                                        [firstLabel,
                                         secondLabel,
                                         firstLineView,
                                         
                                         thirdLabel,
                                         fourthLabel,
                                         secondLineView,
                                         
                                         fifthLabel,
                                         sixthLabel,
                                         firstImageView],
                                     axis: .vertical,
                                     spacing: 9)
        
        secondStackView = UIStackView(arrangedSubviews:
                                        [seventhLabel,
                                         eighthLabel,
                                         thirdLineView,
                                         ninethLabel,
                                         tenthLabel],
                                      axis: .vertical,
                                      spacing: 7)
        
        imagesStackView = UIStackView(arrangedSubviews:
                                        [secondImageView,
                                         thirdImageView,
                                         fourthImageView],
                                      axis: .horizontal,
                                      spacing: 10)
        
        thirdStackView = UIStackView(arrangedSubviews:
                                        [eleventhLabel,
                                         twelvethLabel,
                                         fourLineView,
                                         thirtheenthLabel,
                                         fourteenthLabel],
                                     axis: .vertical,
                                     spacing: 7)
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        setupUIStackView()
        view.addSubview(sixthLineView)
        view.addSubview(scrollView)
        scrollView.addSubview(informationLabel)
        scrollView.addSubview(containerView)
        containerView.addSubview(firstStackView)
        containerView.addSubview(secondStackView)
        containerView.addSubview(imagesStackView)
        containerView.addSubview(thirdStackView)
    }
}

extension InformationViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            sixthLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            sixthLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sixthLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sixthLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: sixthLineView.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1)
        ])
        
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            informationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            informationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 17),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1),
            fourLineView.heightAnchor.constraint(equalToConstant: 1),
            fiveLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            firstStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            firstStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 12),
            secondStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            secondStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            imagesStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 12),
            imagesStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            imagesStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: 12),
            thirdStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            thirdStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            thirdStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -17)
        ])
        
    }
}
