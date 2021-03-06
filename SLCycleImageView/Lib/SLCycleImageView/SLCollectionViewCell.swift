import DACircularProgress

class SLCollectionViewCell: UICollectionViewCell {
    weak var imageView: UIImageView!
    lazy var loadingIndicator:DACircularProgressView = {
        let loadingIndicator = DACircularProgressView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        loadingIndicator.isUserInteractionEnabled = false
        loadingIndicator.thicknessRatio = 0.1
        loadingIndicator.roundedCorners = 0
        self.addSubview(loadingIndicator)
        return loadingIndicator
    }()
    var title: String = "" {
        didSet {
            self.titleLabel.text = "   \(title)"
            if titleLabel.isHidden {
                self.titleLabel.isHidden = false
            }
        }
    }

    var titleLabelTextColor: UIColor = UIColor.white {
        didSet {
            self.titleLabel.textColor = titleLabelTextColor
        }
    }

    var titleLabelTextFont: UIFont = UIFont.boldSystemFont(ofSize: 14){
        didSet {
            self.titleLabel.font = titleLabelTextFont
        }
    }

    var titleLabelBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.titleLabel.backgroundColor = titleLabelBackgroundColor
        }
    }
    
    var titleLabelHeight: CGFloat!
    var hasConfigured: Bool = false
    /** 只展示文字轮播 */
    var onlyDisplayText: Bool = false
    var titleLabel: UILabel!



    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupImageView()
        self.setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupImageView() {
        let imageView = UIImageView()
        self.imageView = imageView
        self.contentView.addSubview(imageView)
    }

    func setupTitleLabel() {
        let titleLabel = UILabel()
        self.titleLabel = titleLabel
        self.titleLabel.isHidden = true
        self.contentView.addSubview(titleLabel)
    }
    
    func loadImage(url:URL,placeholderImage:UIImage?=nil) {
        self.loadingIndicator.progress = 0
        self.loadingIndicator.isHidden = placeholderImage != nil
        imageView.kf.setImage(with: url, placeholder: placeholderImage, options: nil, progressBlock: {[weak self] (receivedSize, totalSize) in
            if totalSize > 0 {
                self?.loadingIndicator.progress = CGFloat(receivedSize) / CGFloat(totalSize)
            }
            }) {[weak self] (image, error, cacheType, imageURL) in
                self?.loadingIndicator.isHidden = true
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if self.onlyDisplayText {
            self.titleLabel.frame = self.bounds
        }
        else {
            self.imageView.frame = self.bounds
            self.loadingIndicator.frame.origin = CGPoint(x: floor((self.bounds.size.width - loadingIndicator.frame.size.width) / 2), y: floor((self.bounds.size.height - loadingIndicator.frame.size.height) / 2))
            let titleLabelW: CGFloat = self.sd_width
            let titleLabelH: CGFloat = titleLabelHeight
            let titleLabelX: CGFloat = 0
            let titleLabelY: CGFloat = self.sd_height - titleLabelH
            self.titleLabel.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelW, height: titleLabelH)
        }
    }
}
