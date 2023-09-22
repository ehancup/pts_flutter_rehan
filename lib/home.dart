// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pts_flutter/detail.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    Widget kategori(int index, String title) {
      return GestureDetector(
        onTap: () => setState(() {
          selectedindex = index;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
              color: selectedindex == index
                  ? const Color(0xff00b41f)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: selectedindex == index
                      ? const Color(0xff00b41f)
                      : const Color(0xfff2f2f7))),
          child: Text(
            title,
            style: GoogleFonts.inter(
                color: selectedindex == index
                    ? Colors.white
                    : const Color(0xff292D32),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    Widget barang(String photo, String title, String harga) {
      return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailPage(title: title,picture: photo,price: harga,) )),
        child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          width: 185,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: 185,
                height: 185,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Image.asset(
                  'assets/$photo',
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                  color: const Color(0xff292d32),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Rp$harga',
              style: GoogleFonts.inter(
                  color: const Color(0xff292d32),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ]),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          // backgroundColor: Colors.blue,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 16, top: 16, left: 10),
            width: 283,
            decoration: BoxDecoration(
                color: const Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  backgroundColor: const Color(0xfff2f2f2)),
              decoration: InputDecoration(
                  icon: const Icon(LucideIcons.search),
                  hintText: 'Search anything',
                  hintStyle:
                      GoogleFonts.openSans(color: const Color(0xff6F7075)),
                  border: InputBorder.none),
            ),
          ),
          // i
          actions: [
            const Icon(LucideIcons.bell),
            const SizedBox(
              width: 24,
            ),
            const Icon(LucideIcons.shoppingCart),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/banner.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategori',
                    style: GoogleFonts.inter(
                        color: const Color(0xff292D32),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Lihat semua',
                    style: GoogleFonts.inter(
                        color: const Color(0xff00b41f),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16),
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    const SizedBox(
                      width: 24,
                    ),
                    kategori(0, 'Semua'),
                    const SizedBox(
                      width: 11,
                    ),
                    kategori(1, 'Kemeja'),
                    const SizedBox(
                      width: 11,
                    ),
                    kategori(2, 'Sepatu'),
                    const SizedBox(
                      width: 11,
                    ),
                    kategori(3, 'Aksesoris'),
                    const SizedBox(
                      width: 11,
                    ),
                    kategori(4, 'Laptop'),
                    const SizedBox(
                      width: 11,
                    ),
                    kategori(5, 'Hape'),
                    const SizedBox(
                      width: 11,
                    ),
                    kategori(6, 'Gadget'),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                children: <Widget>[
                  barang('1.png', 'Batik Pria Lengan Panjang', '199.000'),
                  barang('2.png', 'New Balance 992 Grey Original', '1.240.000'),
                  barang('3.png', 'Skinny Jeans Dark Blue Wanita', '379.000'),
                  barang('4.png', 'Kacamata Baca Anti Radiasi Blue Ray',
                      '125.000'),
                  barang('5.png', 'Kemeja Pria Polos Lengan Pendek Oxford',
                      '199.000'),
                  barang('6.png', 'Human Greatness Hoodie Hitam', '299.000'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(LucideIcons.home), label: 'Beranda'),
          const BottomNavigationBarItem(
            icon: Icon(
              LucideIcons.heart,
            ),
            label: 'Favorit',
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                LucideIcons.listChecks,
              ),
              label: 'Transaksi'),
          const BottomNavigationBarItem(
              icon: Icon(
                LucideIcons.userCircle2,
              ),
              label: 'Profile'),
        ],
        selectedItemColor: const Color(0xff00b41f),
        currentIndex: selectedItem,
        unselectedItemColor: const Color(0xff292d32),
        onTap: (value) => {
          setState(() {
            selectedItem = value;
          })
        },
      ),
    );
  }
}
