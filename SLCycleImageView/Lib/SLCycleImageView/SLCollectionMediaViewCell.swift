import DACircularProgress
import BMPlayer

class SLCollectionMediaViewCell: UICollectionViewCell {
    weak var playerView: BMPlayer!
    weak var playerButton: UIButton!
    weak var controlView: BMPlayerControlView!
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
        
        let controlView = BMPlayerControlView()
        self.controlView = controlView
        controlView.isHidden = true
        let playerView = BMPlayer(customControlView: controlView)
        BMPlayerConf.topBarShowInCase = .none
//        playerView.controlView.hideSeekToView()
//        controlView.hideSeekToView()
        self.playerView = playerView
        playerView.isUserInteractionEnabled = false
        self.contentView.addSubview(playerView)
        let playButton = UIButton()
        playButton.tag = BMPlayerControlView.ButtonType.replay.rawValue
        self.playerButton = playButton
//        playButton.backgroundColor = .red
        playButton.setImage(UIImage(named: "player"), for: .normal)
        self.contentView.addSubview(playButton)
        playButton.isHidden = true
        self.playerView.isPlayingStateChanged = {[unowned self] isPlaying in
            self.playerButton.isHidden = isPlaying
        }
        playButton.frame = CGRect(x: 0, y: 0, width: 67, height: 67)
        playButton.addTarget(self, action: #selector(SLCollectionMediaViewCell.play), for: .touchUpInside)
    }
    
    @objc func play() {
        playerView.controlView(controlView: self.controlView, didPressButton: self.playerButton)
    }

    func setupTitleLabel() {
        let titleLabel = UILabel()
        self.titleLabel = titleLabel
        self.titleLabel.isHidden = true
        self.contentView.addSubview(titleLabel)
    }
    
    func loadImage(url:URL,placeholderImage:URL?=nil,title:String="") {
        self.loadingIndicator.progress = 0
        self.loadingIndicator.isHidden = placeholderImage != nil
        let asset = BMPlayerResource(name: title, definitions: [
            BMPlayerResourceDefinition(url: url, definition: "")
        ], cover: placeholderImage)
        self.playerView.setVideo(resource: asset)
//        self.controlView?.
//        Thread.main.sl
        self.controlView?.controlViewAnimation(isShow: false)
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if self.onlyDisplayText {
            self.titleLabel.frame = self.bounds
        }
        else {
            self.playerView.frame = self.bounds
            self.playerButton.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
            self.loadingIndicator.frame.origin = CGPoint(x: floor((self.bounds.size.width - loadingIndicator.frame.size.width) / 2), y: floor((self.bounds.size.height - loadingIndicator.frame.size.height) / 2))
            let titleLabelW: CGFloat = self.sd_width
            let titleLabelH: CGFloat = titleLabelHeight
            let titleLabelX: CGFloat = 0
            let titleLabelY: CGFloat = self.sd_height - titleLabelH
            self.titleLabel.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelW, height: titleLabelH)
        }
    }
}
