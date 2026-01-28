import UIKit
import cubid_flutter

class ListTileNativeFactory: NSObject, CubidNativeAdFactory {

    func create(context: CubidNativeAdContext, options: [String: Any]?) -> UIView {

        let container = context.containerView
        container.isUserInteractionEnabled = true
        container.translatesAutoresizingMaskIntoConstraints = false

        let mediaView = UIView()
        let iconView = UIImageView()
        let titleLabel = UILabel()
        let bodyLabel = UILabel()
        let ctaButton = UIButton(type: .system)

        [mediaView, iconView, titleLabel, bodyLabel, ctaButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview($0)
        }

        titleLabel.numberOfLines = 1
        bodyLabel.numberOfLines = 2

        ctaButton.isUserInteractionEnabled = true
        ctaButton.isExclusiveTouch = true
        
        NSLayoutConstraint.activate([
            mediaView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            mediaView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            mediaView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            mediaView.heightAnchor.constraint(equalToConstant: 150),

            iconView.topAnchor.constraint(equalTo: mediaView.bottomAnchor, constant: 12),
            iconView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            iconView.widthAnchor.constraint(equalToConstant: 62),
            iconView.heightAnchor.constraint(equalToConstant: 62),

            titleLabel.topAnchor.constraint(equalTo: iconView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: ctaButton.leadingAnchor, constant: -8),

            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            ctaButton.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            ctaButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),

            
            ctaButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])


  
        context.mediaView = mediaView
        context.iconView = iconView
        context.titleLabel = titleLabel
        context.bodyLabel = bodyLabel
        context.callToActionButton = ctaButton
        context.priceLabel = nil

        return container
    }
}
