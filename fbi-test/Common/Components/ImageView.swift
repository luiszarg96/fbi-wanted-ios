//
//  ImageView.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import SwiftUI
import Combine

struct ImageView: View {
    
    // MARK: Wrapped Properties
    @StateObject var viewModel: ImageViewModel
    @State var isLoading: Bool = false
    
    // MARK: Initializer
    init(url: String) {
        _viewModel = StateObject(wrappedValue: ImageViewModel(url: url))
    }
    
    // MARK: Body
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

class ImageViewModel: ObservableObject {
    // MARK: Wrapped Properties
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    // MARK: Properties
    let imageUrl: String
    var cancellables = Set<AnyCancellable>()
    var cacheManager = ImageCacheManager.instance
    
    // MARK: Initializer
    init(url: String) {
        self.imageUrl = url
        getImage()
    }
    
    // MARK: Methods
    func getImage() {
        if let image = cacheManager.get(key: imageUrl) {
            self.image = image
        } else {
            downlaodImage()
        }
    }
    
    func downlaodImage() {
        isLoading = true
                
        guard let url = URL(string: self.imageUrl) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let image = returnedImage else { return }
                self.image = image
                self.cacheManager.add(key: self.imageUrl, image: image)
            }
            .store(in: &cancellables)
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url:"https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb")
    }
}
