// Import modul yang dibutuhkan untuk mengelola widget flutter
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:listviewsharedpreference/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
// Instansi class MyApp yang menjadi widget utama untuk menjalankan aplikasi
  runApp(const MyApp());
}

// Class MyApp yang menjadi widget utama dari kumpulan widget yang dijalankan
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Overide method build sebagai method pembagun utama widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul Aplikasi
      title: "Aplikasi List Item",
      // Mengatur Tema Aplikasi
      theme: ThemeData(primarySwatch: Colors.blue),
      // Menentukan tampilan awal widget screen
      home: ItemListPage(),
    );
  }
}

// Class ItemListPage yang akan menampilkan seluruh list item barang
class ItemListPage extends StatefulWidget {
  // Instansi constuctor ItemListPage
  const ItemListPage({super.key});


  // Berfungsi menghubungkan stateless ke statefull 
  @override
  State<ItemListPage> createState() =>  _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  // Membuat list yang berisi list item nantinya  
  List<ItemModel> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();



  // Mengisi data dummy
  final List<ItemModel> _dummyItems = [
    ItemModel(id: 1, name: "Laptop", description: "Laptop gaming"),
    ItemModel(id: 2, name: "Mouse", description: "Mouse wireless"),
    ItemModel(id: 3, name: "Keyboard", description: "Keyboard mechanichal")
  ];

  // Function bertipe futre biasanya digunakan untuk CRUD, API, dll
  Future<void> _saveData() async {
    // Shared preferences untuk menyimpan state global
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Mengubah daftar item menjadi sebuah map
    List<Map<String, dynamic>> itemsMap =
        _items.map((item) => item.toMap()).toList();
    // Melakukan encode map menjadi sebuah string  
    String itemsString = json.encode(itemsMap);
    // Menambahkan string ke shared preference
    await prefs.setString('items_list', itemsString);
  }

  // Function bertipe futre biasanya digunakan untuk CRUD, API, dll
  Future<void> _addItem() async {
  // Jika kosong username dan deskripsi menampilkan alert
  if (_nameController.text.isEmpty || _descController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nama dan deskripsi tidak boleh kosong')),
    );
    return;
  }

  // Menghitung id yang dimiliki
  int newId = _items.isEmpty ? 1 : _items.last.id + 1;
  // Menambahkan model item
  ItemModel newItem = ItemModel(
    id: newId,
    name: _nameController.text,
    description: _descController.text,
  );

  // Menambahaan data kedalam state
  setState(() {
    _items.add(newItem);
  });

  // Mennambahkan data kedalam shared preference
  await _saveData();
  _nameController.clear();
  _descController.clear();

  // Mennghapus navigator sebelumnya
  Navigator.pop(context);

  // Menampilkan Pesan Alert sudah berhasil ditambahkan
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Item berhasil ditambahkan')),
  );
}

  // Menghapus Item berdasarkan id 
  Future<void> _deleteItem(int id) async {
  // Merubah state sekarang lalu mencari item yang dicari kemudian di hapus
  setState(() {
    _items.removeWhere((item) => item.id == id);
  });

  // Simpan data ke global state
  await _saveData();

  // Tampilkan alert
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Item berhasil dihapus')),
  );
  }

  Future<void> _loadData({String query = ''}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? itemsString = prefs.getString('items_list');

  if (itemsString != null) {
    List<dynamic> itemsMap = json.decode(itemsString);
    setState(() {
      _items = itemsMap.map((item) => ItemModel.fromMap(item)).toList();
      if (query.isNotEmpty) {
        _items = _items
            .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  } else {
    setState(() {
      _items = List.from(_dummyItems);
    });
    await _saveData();
  }
}


  // Kemudian instansi load data di initstate setiap data masuk
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _showAddDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Tambah Item Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Item'),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: _addItem,
            child: Text('Simpan'),
          ),
        ],
      );
    },
  );
}


  // Override method build untuk pembangun widget
  @override
  Widget build(BuildContext context) {
    // Menampilkan halaman screen Daftar Item
    return Scaffold(
      // Header dari screen Daftar Item
      appBar: AppBar(
        title: Text('Daftar Item'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) => _loadData(query: value),
              decoration: InputDecoration(
                hintText: 'Cari item...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
      ),
      // Jika items kosong maka tidak ada tambahan
      body: _items.isEmpty
          ? Center(
              child: Text('Tidak ada data. Tambahkan item baru.'),
            )
            // Jika tidak kosong maka tampilkan data dalam listview bilder
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    // Menampilkan sesuatu di sebelah kiri
                    leading: CircleAvatar(
                      child: Text('${item.id}'),
                      backgroundColor: Colors.blue,
                    ), 
                    // Menampilkan Judul
                    title: Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),   
                    // Menampilkan sub judul di bawah 
                    subtitle: Text(item.description),
                    // Menampilkan sesuatu di sebelah kanan
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteItem(item.id);
                      },
                    ), 
                  ),
                );
              },
            ),
            // Floating button untuk menambah item 
            floatingActionButton: FloatingActionButton(
              onPressed: _showAddDialog,
              child: Icon(Icons.add),
              tooltip: 'Tambah Item',
            ),
    );
  }  
}
