import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Widget popup(BuildContext context, String title, Widget tujuan) {
  return AlertDialog(
    title: const Text('Masuk Keranjang!'),

    content: Text(title),
    actions: [
      TextButton(onPressed: () {
        Navigator.of(context).pop();
      }, child: const Text('kembali')),
      ElevatedButton.icon(onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) => tujuan));
      }, icon: const Icon(Iconsax.shopping_cart), label: const Text('cek keranjang'))
    ],
  );
}