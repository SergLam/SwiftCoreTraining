import UIKit
import Rswift

final class PrivacyTitleCell: UITableViewCell {
    
    static let identifier = "PrivacyTitleCell"
    
    private let separatorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        selectionStyle = .none
        textLabel?.numberOfLines = 0
        textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        addSubview(separatorView)
        separatorView.backgroundColor = .gray
        separatorView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func update(_ titleText: String, _ shouldExpand: Bool) {
        
        textLabel?.text = titleText
        
        let button = UIButton(type: .custom)
        button.bounds.size = CGSize(width: 15, height: 15)
        button.setImage(R.image.disclosureIndicatorGray(), for: .normal)
        
        if !shouldExpand {
            let rotationTransform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            button.transform = rotationTransform
        }
        accessoryView = button
    }
    
}
