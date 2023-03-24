
import UIKit

// a) загрузку изображения в фоновом потоке и показ его на экране.

/* из яндекс картинок

https://www.boxofficepro.com/wp-content/uploads/2021/02/Raya-and-the-Last-Dragon-cropped-from-official-poster-768x872.jpg
*/

class ViewControllerA: UIViewController {
    
    let imageURL = "https://i.ytimg.com/vi/RrcEQoyWFTo/hqdefault.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func loadingImage(_ sender: Any) {
        
        let url = URL(string: imageURL)!
        DispatchQueue.global(qos: .utility).async {
            let data = (try! Data(contentsOf: url))
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFill
    }
}
