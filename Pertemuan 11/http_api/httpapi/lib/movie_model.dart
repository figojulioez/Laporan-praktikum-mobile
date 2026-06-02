// Class model untuk menyimpan data film 
class MovieModel { 
  // Variabel yang digunakan 
  final int id; 
  final String title; 
  final String overview; 
  final String posterPath; 
  // Constructor 
  MovieModel({ 
    required this.id, 
    required this.title, 
    required this.overview, 
    required this.posterPath,
  }); 
  
  // Konversi JSON menjadi object 
  factory MovieModel.fromJson(Map<String, dynamic> json) { 
    return MovieModel( 
      id: json['id'], 
      title: json['title'], 
      overview: json['overview'], 
      posterPath: json['poster_path'] ?? '', 
      ); 
  } 
}