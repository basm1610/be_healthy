import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Icon(Icons.more_horiz_rounded),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .75,
              height: 35,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 12),
                    prefixIcon: Icon(Icons.search),
                    // fillColor: Colors.red,
                    // hoverColor: Colors.red,
                    // focusColor: Colors.red,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                surfaceTintColor: Colors.transparent,
                elevation: 8,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text(
                    "choose your workout",
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  leading: CircleAvatar(
                      radius: 35,
                      child: Image.asset(
                        "assets/images/image2.png",
                        // fit: BoxFit.contain,
                        // width: 150,
                        // height: 150,
                      )),
                ),
              );
            }),
      ),
    );
  }
}
