import 'package:flutter/material.dart';

void main() {
  runApp(const Museum());
}

class Museum extends StatelessWidget {
  const Museum({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Museum", home: MuseumScaffold());
  }
}

class MainImage extends StatelessWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/mona_lisa.jpeg",
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Center(
            child: Icon(
              Icons.favorite,
              size: 100,
              color: Colors.white.withOpacity(0.75)
            ),
          ),
        ),
      ],
    );
  }
}


class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    });

  @override
  Center build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: MainImage(),
            ),
            const Text("Mona Lisa", style: TextStyle(fontFamily: 'Merriweather', fontSize: 30, color: Colors.brown),),
            const Text("Leonard De Vinci", style: TextStyle(fontFamily: 'Merriweather', fontSize: 15, fontWeight: FontWeight.w700, color: Colors.brown),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: const [
                Icon(Icons.article),
                Icon(Icons.favorite)
              ],
            )
          ]
        ),
      );
  }
}

class MuseumScaffold extends StatelessWidget {
  const MuseumScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Museum")),
      body: const BodyWidget(),
    );
  }
}