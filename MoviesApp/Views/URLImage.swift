

import SwiftUI

struct URLImage: View {
    
    let url: String
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()
    
    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadedData {
            let img = UIImage(data: imageData)
            return AnyView(
                Image(uiImage: img!)
                    .resizable()
            )
        } else {
            return AnyView(
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
        }
    }

}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}



