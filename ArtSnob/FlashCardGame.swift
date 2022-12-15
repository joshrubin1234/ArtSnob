import SwiftUI

struct PagingView: View {

    @Binding var index: Int
    let maxIndex: Int
    
    let content: [CardView]

    @State private var offset = CGFloat.zero
    @State private var dragging = false

    init(index: Binding<Int>, maxIndex: Int, content: [CardView]) {
        self._index = index
        self.maxIndex = maxIndex
        self.content = content
    }

    var body: some View {
        //ZStack(alignment: .bottomTrailing) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(content, id: \.self) { content in
                            content
                                .frame(width: geometry.size.width, alignment: .leading)
                        }
                    }
                }
                .content.offset(x: self.offset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture().onChanged { value in
                        self.dragging = true
                        self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                    }
                    .onEnded { value in
                        let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                        let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                        self.index = self.clampedIndex(from: predictedIndex)
                        withAnimation(.easeOut) {
                            self.dragging = false
                        }
                    }
                )
            }
            .clipped()
            .zIndex(1)
    }

    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(self.index) * geometry.size.width
        }
    }

    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else {
            return maxIndex
        }
        guard newIndex <= maxIndex else {
            return 0
        }
        return newIndex
    }
}

struct CardFront : View {
    @Binding var degree : Double
    
    @State private var degrees = 0.0
    @State private var flipped = false
    
    let description: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                           .fill(.red)
//                           .frame(width: width, height: height)
                           ///.shadow(color: .gray, radius: 2, x: 0, y: 0)

            Text(self.description)//.frame(width: width, height: height)
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    @Binding var degree : Double
    let image: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
//                .frame(width: width, height: height)
                //.shadow(color: .gray, radius: 2, x: 0, y: 0)

            Image(self.image)
                .resizable()
                .scaledToFit()
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardView: View, Hashable {
    // this function allows swift to compare to cardview objects based on the
    // flashcard property (even though we dont need to compare cardviews)
    static func == (lhs: CardView, rhs: CardView) -> Bool {
        return lhs.flashcard == rhs.flashcard
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(flashcard.description)
    }

    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    let durationAndDelay : CGFloat = 0.3
    
    let flashcard: FlashCard
    
    init(flashcard: FlashCard) {
        self.flashcard = flashcard
    }
    
    var body: some View {
        ZStack {
            CardFront(degree: $frontDegree, description: flashcard.description)
            CardBack(degree: $backDegree, image: flashcard.name)
        }.onTapGesture {
            flipCard()
        }
    }
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}

struct FlashCardGame: View {
    
    @State var counter = 0
    
    var cardViews = masterList.map({CardView(flashcard: $0)})

    //MARK: View Body
    var body: some View {
        VStack {
            Text("Flashcards").fontWeight(.bold).underline().font(.title)
        }
        HStack{
            ZStack {
                // This is a hack to overlap on top of the scrollview
                // The scrollview area is clipped and therefore not visible
                // but the invisible area is still clickable. We need
                // to cover it with a view to disable click interactions
                Rectangle().fill(.background).frame(width: 100)
                Button(
                    action: {
                        withAnimation {
                            if counter > 0 {
                                counter = counter - 1
                            } else {
                                counter = masterList.count - 1
                            }
                        }
                    },
                    label: {
                        Image("leftArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .frame(height: 100)
                    }
                )
            }.zIndex(100)

            PagingView(
                index: $counter,
                maxIndex: masterList.count - 1,
                content: cardViews
            ).zIndex(10)

            ZStack {
                Rectangle().fill(.background).frame(width: 100)
                Button(
                    action: {
                        withAnimation {
                            if counter < masterList.count-1 {
                                counter = counter + 1
                            } else {
                                counter = 0
                            }
                        }
                    },
                    label: {
                        Image("rightArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .frame(height: 100)
                            .zIndex(100)
                    }
                )
            }.zIndex(100)
        }
    }
}






//protocol Shape {
//    func numberOfSides() -> Int
//}

//class Square: Shape {
//    func numberOfSides() -> Int {
//        return 4
//    }
//}
//
//class Triangle: Shape {
//    func numberOfSides() -> Int {
//        return 4
//    }
//}
//
//class Pentagon: Shape {
//    func numberOfSides() -> Int {
//        return 5
//    }
//}
//
//class Hexagon: Shape {
//    func numberOfSides() -> Int {
//        return 5
//    }
//}
//
//func returnGreaterSidedShape(shape1: Shape, shape2: Shape) -> Shape {
//    if shape1.numberOfSides() > shape2.numberOfSides() {
//        return shape1
//    }
//    return shape2
//}


