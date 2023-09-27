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
  List<int> subTotal = [];
  List<int> jumlahBarang = [];

  @override
  Widget build(BuildContext context) {

    // item barang
    Widget barang(int index, String title, String ukuran, int uang, String img) {

      setState(() {
        jumlahBarang.add(1);
        subTotal.add(0);
        subTotal[index] = (uang * jumlahBarang[index]);
        // print('awal');
        // print(subTotal);

        // jumlahBarang[index] = 1;
      });

      String harga =
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(uang);
      // int jumlah = 1;

      void _increment() {
        setState(() {
          jumlahBarang[index] += 1;
          subTotal[index] = (uang * jumlahBarang[index]);
          // print('increment');
          // print(subTotal);
          

          // print(jumlahBarang[index]);
        });
      }

      void _decrement() {
        setState(() {
          if (jumlahBarang[index] != 0) {
            jumlahBarang[index] -= 1;
            subTotal[index] = (uang * jumlahBarang[index]);

          }
          // print('decrement');
          // print(subTotal);
          // print(jumlahBarang[index]);
        });
      }

      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(right: 16),
              child: Image.asset('assets/$img'),
            ),
            Container(
              margin: const EdgeInsets.only(right: 32),
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                        color: const Color(0xff292D32),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    ukuran,
                    style: GoogleFonts.inter(
                        color: const Color(0xff292D32).withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    harga,
                    style: GoogleFonts.inter(
                        color: const Color(
                          0xff292D32,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: const Color(0xff292D32).withOpacity(0.7), width: 1)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _decrement,
                    child: const Icon(
                      Iconsax.minus,
                      weight: 800,
                      color: Color(0xff292D32),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(jumlahBarang[index].toString()),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: _increment,
                    child: Icon(
                      Iconsax.add,
                      weight: 800,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    // bottom bar
    Widget bottomBar(BuildContext context) {
      int totalFormat = subTotal.reduce((value, element) => value + element);
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(
            color: const Color(0xff292D32).withOpacity(0.3),
            width: 1
          ))
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff292D32).withOpacity(0.7)),
                ),
                Text(
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(totalFormat),
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292D32)),
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongkir',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff292D32).withOpacity(0.7)),
                ),
                Text(
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(14000),
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292D32)),
                ),
              ],
            ),
            const SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff292D32).withOpacity(0.7)),
                ),
                Text(
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(totalFormat + 14000),
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff292D32)),
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff00b41f),
                borderRadius: BorderRadius.circular(8)
              ),
              child: TextButton(onPressed: () {}, child: Text('Beli sekarang' , style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),),),
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
            const SizedBox(
              width: 24,
            )
          ],
        ),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(

          children: [
            Positioned(
              top: 0,
            left: 0,
            right: 0,
            bottom: 248,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffF2F2F7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                            flex: 1,
                            child: Icon(
                              Iconsax.location,
                              color: Color(0xff292D32),
                            )),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dikirim ke',
                                style: GoogleFonts.inter(
                                    color: const Color(0xb4292d32),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Jakarta, Cibubur, Kota Wisata Madrid No 23',
                                style: GoogleFonts.inter(
                                    color: const Color(0xff292d32),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('Ubah',
                              style: GoogleFonts.inter(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              textAlign: TextAlign.end),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8, right: 24, left: 24),
                    child: Column(
                      children: [
                        barang(0, 'Batik Pria Lengan Panjang', '40', 199000, '1.png'),
                        barang(1, 'Skinny jeans Dark Blue Wanita', '40', 379000, '3.png'),
                        barang(2, 'New Balance 992 Grey Original', '40', 1240000, '2.png'),
                        barang(3, 'Kacamata Anti Radiasi Blue Ray', '40', 125000, '4.png'),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
            Positioned(
              bottom: 0,
                right: 0,
                left: 0,
                child: bottomBar(context)
            )
          ],
        ),
      ),
    );
  }
}
