import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/stationery_item.dart';

class DetailPage extends StatefulWidget {
  final int productIndex;
  const DetailPage({super.key, required this.productIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final TextEditingController _qtyController;
  late final TextEditingController _priceController;
  late final TextEditingController _deskripsiController;

  StationeryItem get item => StationeryItem.sampleData[widget.productIndex];

  // Jumlah pcs dari input, kosong dianggap 0
  int get _qty => int.tryParse(_qtyController.text) ?? 0;
  int get _price => int.tryParse(_priceController.text) ?? item.price;
  String get _deskripsi => _deskripsiController.text;

  @override
  void initState() {
    super.initState();
    _qtyController = TextEditingController(text: item.stock.toString());
    _priceController = TextEditingController(text: item.price.toString());
    _deskripsiController = TextEditingController(text: item.description);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _priceController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _save() {
    item.stock = _qty;
    item.price = _price;
    item.description = _deskripsi;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Rp ${item.formattedPrice} / pcs',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _deskripsiController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi',
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _qtyController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Stok tersedia (pcs)',
                      prefixIcon: Icon(Icons.format_list_numbered),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Harga (Rp)',
                      prefixIcon: Icon(Icons.format_list_numbered),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _save,
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
