import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 18,
                  ),

                  //Geri butonu
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 28,
                    color: Color(0xFF0A1034),
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  //Kategori Text
                  const Text(
                    "Kategoriler",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  //Kategoriler
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          "All",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  //Navbar]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
