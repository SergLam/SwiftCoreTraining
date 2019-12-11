import UIKit
import Rswift

final class PrivacyDetailsCell: UITableViewCell {
    
    static let identifier = String(describing: self)
    
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
        backgroundColor = .white
        accessoryType = .none
        textLabel?.numberOfLines = 0
        textLabel?.font = UIFont.systemFont(ofSize: 15)
        
        contentView.addSubview(separatorView)
        separatorView.backgroundColor = .lightGray
        separatorView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func update(_ text: String) {
        
        textLabel?.text = text
    }
}
