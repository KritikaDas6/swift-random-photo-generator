import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Click me!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    // Replace this with your array of image names
    let imageNames: [String] = ["image1", "image2", "image3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center

        view.addSubview(button)

        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55
        )
    }

    func getRandomPhoto() {
        // Get a random image name from your array
        if let randomImageName = imageNames.randomElement() {
            if let image = UIImage(named: randomImageName) {
                imageView.image = image
            }
        }
    }
}
