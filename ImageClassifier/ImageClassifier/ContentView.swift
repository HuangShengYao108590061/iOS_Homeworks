import SwiftUI

struct ContentView: View {
    
    let photos = ["cat","dog","bird","kiwibird","hamster"]
    @State private var currentIndex: Int = 0
    @State private var classificationLabel1: String = "Click Classify"
    @State private var classificationLabel2: String = "Click Classify"

    let model1 = MobileNetV2()
    let model2 = Resnet50()

    private func imageClassification() {
        let currentImageName = photos[currentIndex]
        guard let img = UIImage(named: currentImageName),
        let resizedImage1 = img.resizeTo(size: CGSize(width: 224, height: 224)),
        let resizedImage2 = img.resizeTo(size: CGSize(width: 224, height: 224)),
        let buffer1 = resizedImage1.toBuffer(),
        let buffer2 = resizedImage2.toBuffer()
        else {
            return
        }

        let output1 = try? model1.prediction(image: buffer1)
    
        let output2 = try? model2.prediction(image: buffer2)
        
        if let output = output1 {
            let results = output.classLabelProbs.sorted {
                $0.1 > $1.1
            }
            
            let result = results.map {(key, value)in
                return "\(key) = \((value*100))%"
            }.joined(separator: "\n")
            
            classificationLabel1 = result
        }
    
        
        if let outputs = output2 {
            let results1 = outputs.classLabelProbs.sorted {
                $0.1 > $1.1
            }

            let result1 = results1.map {(key, value)in
                return "\(key) = \((value*100))%"
            }.joined(separator: "\n")
            
            classificationLabel2 = result1
    }
}
    
    var body: some View {
        VStack {
            Text("MobileNetV2 vs Resnet50").font(.largeTitle)
            Image(photos[currentIndex])
            .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous"){
                    if self.currentIndex > 0 {
                        self.currentIndex = self.currentIndex - 1
                    }
                    else{
                        self.currentIndex = self.photos.count - 1
                    }
                    self.classificationLabel1 = "Click Classify"
                    self.classificationLabel2 = "Click Classify"
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    }
                    else{
                        self.currentIndex = 0
                    }
                    self.classificationLabel1 = "Click Classify"
                    self.classificationLabel2 = "Click Classify"
                }.padding()
                .foregroundColor(Color.white)
                .frame(width: 100)
                .background(Color.blue)
                .cornerRadius(10)
            }.padding()
            
            Button("Classify") {
                // classify the image here
                self.imageClassification()
            }.padding()
            .foregroundColor(Color.black)
            .background(Color.green)
            .cornerRadius(8)
            
            HStack {
                VStack {
                    Text("MobileNetV2:")
                        .font(.largeTitle)
                        .padding()
                    Text(classificationLabel1)
                        .padding()
                }
                Spacer()
                VStack {
                    Text("Resnet50:")
                        .font(.largeTitle)
                        .padding()
                    Text(classificationLabel2)
                        .padding()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
