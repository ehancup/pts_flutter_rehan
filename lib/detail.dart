// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:pts_flutter/main.dart';
import 'package:pts_flutter/popup.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pts_flutter/cart.dart';
import 'package:intl/intl.dart';
import 'package:pts_flutter/provider/cart_p.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.index,
      required this.title,
      required this.picture,
      required this.price});

  final int index;
  final String title;
  final String picture;
  final int price;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLove = false;
  int selectedUkuran = 0;

  @override
  Widget build(
    BuildContext context,
  ) {

    Widget ukuran(int index, String angka) {
      return GestureDetector(
        onTap: () => setState(() {
          selectedUkuran = index;
        }),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: selectedUkuran == index
                      ? const Color(0xff00B14F)
                      : const Color(0xff292D32B2)),
              color: selectedUkuran == index
                  ? const Color.fromARGB(64, 17, 234, 50)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8)),
          child: Text(angka,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: selectedUkuran == index
                      ? const Color(0xff00B14F)
                      : const Color(0xff292D32B2))),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          centerTitle: true,
          surfaceTintColor: const Color(0xff00b41f),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Detail Produk',
            style: GoogleFonts.inter(
                color: const Color(0xff292d32),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            GestureDetector(
                onTap: () => setState(() {
                      isLove = !isLove;
                    }),
                child: Icon(
                  isLove ? Iconsax.heart5 : Iconsax.heart,
                  color: isLove ? Colors.red : const Color(0xff292d32),
                  size: 24,
                )),
            const SizedBox(
              width: 24,
            )
          ],
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 80,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: Image.asset(
                        'assets/${widget.picture}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.inter(
                                color: const Color(0xff292d32),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.star_15,
                                color: Colors.yellow,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: GoogleFonts.inter(fontSize: 14),
                                      children: [
                                    TextSpan(
                                        text: '4.8',
                                        style: GoogleFonts.inter(
                                            color: const Color(0xff292D32),
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: ' (102) | 67 ulasan',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromARGB(
                                                154, 45, 49, 178),
                                            fontWeight: FontWeight.w400))
                                  ])),
                            ],
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: GoogleFonts.inter(fontSize: 16),
                                  children: [
                                TextSpan(
                                    text:
                                        'Our Made US 992 men\'s sneaker has heritage styling, premium materials and comfort features to elevate your off-duty look. These men\'s fashion sneakers have a pigskin... ',
                                    style: GoogleFonts.inter(
                                        color: const Color(0xff292D32),
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: 'Baca selengkapnya',
                                    style: GoogleFonts.inter(
                                        color: const Color(0xff00b41f),
                                        fontWeight: FontWeight.w400))
                              ])),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pilih Ukuran',
                              style: GoogleFonts.inter(
                                  color: const Color(0xff292D32),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: <Widget>[
                              ukuran(0, '39'),
                              const SizedBox(
                                width: 16,
                              ),
                              ukuran(1, '40'),
                              const SizedBox(
                                width: 16,
                              ),
                              ukuran(2, '41'),
                              const SizedBox(
                                width: 16,
                              ),
                              ukuran(3, '42'),
                              const SizedBox(
                                width: 16,
                              ),
                              ukuran(4, '43'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                            .format(widget.price),
                        style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff292D32)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff00b41f)),
                        child: TextButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (BuildContext context) => popup(
                                    context,
                                    '${widget.title} berhasil ditambahkan',
                                    const CartPage())),
                            child: Text(
                              'Tambah Keranjang',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
