
import UIKit

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
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let separatorViewConstraints: [NSLayoutConstraint] = [
        
            separatorView.heightAnchor.constraint(equalToConstant: 1.0),
            separatorView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(separatorViewConstraints)
        
    }
    
    func update(_ text: String) {
        
        textLabel?.text = text
    }
}
