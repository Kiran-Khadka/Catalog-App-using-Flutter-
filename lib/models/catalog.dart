class CatalogModel {
  static List<Item> items = [ 
    // CatalogModel is list items
  // final keyword is removed to make the use of CatalogModel as items list in home_page dart 
  Item(
   id: 1,
   name: "iPhone 12 Pro",
   desc: "Apple 12th generation of iPhone",
  price: 999,
  color: "#33505a",
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",

)
];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image}); // constructor with curly braces for making it named constructor
  
  // decoding the json file
 factory Item.fromMap(Map<String, dynamic> map){ // factory keyword is to label a default or named constructor and returns a instance from this constructor
   return Item(
     id: map["id"],
     name: map["name"],
     desc: map["desc"],
     price: map["price"],
     color: map["color"],
     image: map["image"],
   );
 }

toMap() => {
  "id": id,
  "name": name,
  "desc": desc,
  "price": price,
  "color": color,
  "image": image,
};


}
