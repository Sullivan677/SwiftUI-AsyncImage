import SwiftUI
struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}
let restaurants = [
    Restaurant(name: "Café La Place", image: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmVzdGF1cmFudHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
    Restaurant(name: "Joe Burger", image: "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHJlc3RhdXJhbnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
    Restaurant(name: "Original Joe's", image: "https://images.unsplash.com/photo-1599021344713-953a54a000fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJlc3RhdXJhbnRzfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60"),
    Restaurant(name: "Da giovanni", image: "https://media.istockphoto.com/photos/bakery-chef-prepare-pizza-picture-id1291299956?b=1&k=20&m=1291299956&s=170667a&w=0&h=Ys_FLtdY0Uzc7yTQl6JzvCHTQ3eRAuqNNU4x8EX1FB8="),
    Restaurant(name: "Sushi Art", image: "https://images.unsplash.com/photo-1611143669185-af224c5e3252?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VzaGl8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
]
struct RestaurantRow: View {
    var restaurant: Restaurant
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: restaurant.image),
                            content: { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(maxWidth: 140, maxHeight: 140)
                                     .cornerRadius(10)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
            Text(restaurant.name)
                .font(.system(size: 20, weight: .bold))
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(restaurants) { restaurant in
                RestaurantRow(restaurant: restaurant)
            }
        }
    }
}
