// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> jumlahBarang=[];
  @override
  Widget build(BuildContext context) {

    Widget barang(int index, String title, String ukuran, double uang) {
      setState(() {
        jumlahBarang.add(1);
        // jumlahBarang[index] = 1;
      });
      String harga = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp'
      ).format(uang);
      // int jumlah = 1;
      return Container(
        margin: EdgeInsets.only(bottom:24),
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(right: 16),
              child: Image.asset('assets/2.png'),
            ),
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.inter(
                    color: Color(0xff292D32),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  const SizedBox(height: 4,),
                  Text(ukuran, style: GoogleFonts.inter(
                    color: const Color(0xff292D32).withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),),
                  const SizedBox(height: 16,),
                  Text(harga, style: GoogleFonts.inter(
                    color: const Color(0xff292D32,),
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xff292D32).withOpacity(0.7),
                  width: 1
                )
              ),
              child: Row(
                children: [
                  GestureDetector(child: Icon(Iconsax.minus, weight: 800,),onTap: () {
                    setState(() {
                      jumlahBarang[index] += 1;
                      print(jumlahBarang[index]);
                    });
                  },),
                  Text(jumlahBarang[index].toString()),
                  GestureDetector(child: Icon(Iconsax.add, weight: 800),)
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          centerTitle: true,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Keranjang',
            style: GoogleFonts.inter(
                color: const Color(0xff292d32),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            const Icon(LucideIcons.moreHorizontal),
            const SizedBox(width: 24,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF2F2F7)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1,child: const Icon(Iconsax.location, color: Color(0xff292D32),)),
                  Expanded(
                    flex: 5,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dikirim ke', style: GoogleFonts.inter(
                          color: const Color(0xb4292d32),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),),
                        const SizedBox(height: 12,),
                        Text('Jakarta, Cibubur, Kota Wisata Madrid No 23', style: GoogleFonts.inter(
                          color: const Color(0xff292d32),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Ubah', style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),textAlign: TextAlign.end),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:8, right: 24, left: 24),
              child: Column(
                children: [
                  barang(0,'New Balance 992 Grey Original', '40', 3000)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
