import UIKit
import Photos

class ViewController: UIViewController {
    
    let albumName = "Photo Frame"
    let cycleMinutes = 30.0
    
    var i = -1
    var imageView = UIImageView()
    let bounds:CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.bounds.size.width,
            height: self.bounds.size.height
        )
        
        // Initial fetch of photos
        fetchPhotos()
         
        // Cycle thorugh images, re-fetching the album each time
        Timer.scheduledTimer(
            timeInterval: 60.0 * self.cycleMinutes,
            target: self,
            selector: #selector(fetchPhotos),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    func fetchPhotos() {
        let imgManager = PHImageManager.default()
        
        // Fetch the photo album
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(
            format: "title = %@", self.albumName
        )
        let resultCollections = PHAssetCollection.fetchAssetCollections(
            with: .album,
            subtype: .albumCloudShared,
            options: fetchOptions
        )
        
        // Assume the above worked and fetch the contents of the first album found
        let fetchOptionsImage=PHFetchOptions()
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(
            in: resultCollections[0],
            options: fetchOptionsImage
        )
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        if i >= (fetchResult.count - 1) {
            i = 0
        }
        else {
            i += 1
        }
        
        var nextImage = UIImage()
        
        imgManager.requestImage(
            for: fetchResult.object(at: i) as PHAsset,
            targetSize: CGSize(width: self.bounds.size.width, height: self.bounds.size.height),
            contentMode: .aspectFit,
            options: requestOptions,
            resultHandler: { (image, error) in nextImage = image!}
        )

        UIView.transition(
            with: self.imageView,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { self.imageView.image = nextImage },
            completion: nil
        )
        
        view.addSubview(imageView)
    }
}
