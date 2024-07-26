import 'package:bhagwat_geeta/provider/provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        itemCount: geetaProvider.geetaList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedindex = index;
            Navigator.of(context).pushNamed('/verse');
          },
          child: SizedBox(
            height: 80,
            child: Card(
              color: const Color(0xfffcc94a),
              child: Center(
                child: ListTile(
                  leading: Text(
                    "${geetaProvider.geetaList[index].Chapter}.",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                      geetaProvider.geetaList[index].chapterName.english,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


int selectedindex = 0;