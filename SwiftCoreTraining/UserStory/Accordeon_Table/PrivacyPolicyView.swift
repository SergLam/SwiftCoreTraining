import SnapKit
import UIKit

protocol PrivacyPolicyViewDelegate: class {
    
    func didTapCloseButton()
}

final class PrivacyPolicyView: UIView {
    
    weak var delegate: PrivacyPolicyViewDelegate?
    
    private let containerCornerRadius: CGFloat = 40.0
    private let containerBorder: CGFloat = 2.0
    private let containerView = UIView()
    
    private let titleLabel = UILabel()
    
    private let topSeparator = UIImageView()
    private let bottomSeparator = UIImageView()
    
    let tableView = UITableView()
    
    private static let buttonHeigth: CGFloat = 40
    private static let buttonWidth: CGFloat = 120
    private static let buttonSize = CGSize(width: PrivacyPolicyView.buttonWidth,
                                   height: PrivacyPolicyView.buttonHeigth)
    static let buttonFrame = CGRect(origin: .zero, size: buttonSize)
    
    let closeButton = UIButton.creareCloseButton(PrivacyPolicyView.buttonHeigth)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubview(containerView)
        
        containerView.backgroundColor = .white
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = containerCornerRadius
        containerView.layer.borderColor = UIColor.purple.cgColor
        containerView.layer.borderWidth = containerBorder
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).inset(20)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        containerView.addSubview(titleLabel)
        
        titleLabel.text = "Privacy policy"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        containerView.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(PrivacyPolicyView.buttonHeigth)
            make.width.equalTo(PrivacyPolicyView.buttonWidth)
            make.centerX.equalToSuperview()
        }
        
        closeButton.addAction = { [unowned self] in
            self.delegate?.didTapCloseButton()
        }
        
        containerView.addSubview(bottomSeparator)
        bottomSeparator.backgroundColor = .blue
        bottomSeparator.snp.makeConstraints { (make) in
            make.bottom.equalTo(closeButton.snp.top).offset(-10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
        
        containerView.addSubview(tableView)
        
        topSeparator.frame.size.height = 1.0
        topSeparator.backgroundColor = .blue
        tableView.tableHeaderView = topSeparator
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(bottomSeparator.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradient = UIView.createLinearGradient([.red,
                                                    .blue,
                                                    .green], PrivacyPolicyView.buttonFrame)
        closeButton.layer.insertSublayer(gradient, at: 0)
    }
    
}
