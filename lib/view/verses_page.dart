import 'package:bhagwat_geeta/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_page.dart';


class VersesPage extends StatelessWidget {
  const VersesPage({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffb20202),
        centerTitle: true,
        title: const Text(
          'Shree Bhagwat Geeta',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: geetaProvider.geetaList[selectedindex].verses.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedIndex = index;
            Navigator.of(context).pushNamed('/detail');
          },
          child: Wrap(
            children: [
            SizedBox(
              height: 200,
              child: Card(
                color: const Color(0xfffcc94a),
                child: Center(
                  child: ListTile(
                    leading: Text(
                      "${geetaProvider.geetaList[selectedindex].verses[index].verseNumber}.",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                        geetaProvider.geetaList[selectedindex].verses[index].language.english,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),]
          ),
        ),
      ),
    );
  }
}

int selectedIndex = 0;
