class Product{

  final String img;
  final String nombre;
  final String vendedor;
  final String calificacion;
  final int favorito;

  Product({required this.img, required this.nombre, required this.vendedor, required this.calificacion, required this.favorito});

  factory Product.fromMap(Map<String, dynamic>json) => Product(
    img: json["id"], 
    nombre: json["nombre"], 
    vendedor: json["vendedor"], 
    calificacion: json["calificacion"], 
    favorito: json["favorito"]
  );

  Map<String, dynamic> toMap(){
    return{
      "img": img,
      "nombre": nombre,
      "vendedor": vendedor,
      "calificacion":calificacion,
      "favorito": favorito,
    };
  }
}