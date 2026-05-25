class ItemModel {
  // Instansi variabel id nama dan deskripsi yang dibutuhkan
  final int id;
  final String name;
  final String description;

  // Instansi Model dan menyiapkan variabel yang di kirimkan di parameter class
  ItemModel({
    required this.id,
    required this.name,
    required this.description
  });

  // Konversi ke Map untuk disimpan ke SharedPreference
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'description' : description
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
  return ItemModel(
    id: map['id'],
    name: map['name'],
    description: map['description'],
  );
}
}