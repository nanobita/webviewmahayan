import 'package:flutter/material.dart';

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              FutureBuilder(
                // future: _radioPlayer.getMetadataArtwork(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Image artwork;
                  if (snapshot.hasData) {
                    artwork = snapshot.data;
                  } else {
                    artwork = Image.asset(
                      'assets/ma.gif',
                      fit: BoxFit.cover,
                    );
                  }
                  return Container(
                    height: 300,
                    width: 300,
                    child: ClipRRect(
                      child: artwork,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );
                },
              ),
              // SizedBox(
              //   width: 50,
              // )
            ],
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              Text(
                'ติดต่อทีมงาน\n  คลื่นมหายาน FM 101.25 MHz \n โทร.081-137-8680',
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // SizedBox(
              //   width: 100,
              // )
            ],
          ),

          SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              Text(
                'วัดธรรมปัญญารามบางม่วง \n  โทร.085-177-9169',
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // SizedBox(
              //   width: 100,
              // )
            ],
          ),

          SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              Text(
                'ติดต่อผู้พัฒนา\n  โทร.092-456-2592',
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // SizedBox(
              //   width: 100,
              // )
            ],
          ),

          // Text(
          //   mahayan?[1] ?? '',
          //   softWrap: false,
          //   overflow: TextOverflow.fade,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          // ),
          SizedBox(height: 150),
        ],
      ),
    ));
  }
}
