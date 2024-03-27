import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cerita Rakyat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  double playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void toggleAudio() async {
    if (isPlaying) {
      await audioPlayer.pause(); 
    } else {
      await audioPlayer.play(AssetSource('audio/andelumut.mp3'));
    }

    setState(() {
      isPlaying = !isPlaying; 
    });
  }

  void stopAudio() async {
    await audioPlayer.stop(); 
    setState(() {
      isPlaying = false;
    });
  }

  void changeSpeed(double speed) {
    setState(() {
      playbackSpeed = speed; 
    });

    if (isPlaying) {
      audioPlayer.setPlaybackRate(speed); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 246, 255),
        toolbarHeight: 75,
        title: const Text(
          "Ande Ande Lumut",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 238, 249, 251),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/andelumut.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Alkisah, ada seorang pangeran berparas tampan bernama Ande-ande Lumut, ia sedang mencari istri kemudian ia mengumumkannya pada khalayak umum.\n'
                '\n Semua gadis di desa langsung berlomba untuk mendapatkan Ande-ande Lumut dan hanya satu saja yang tidak berminat pada pengumuman tersebut. Perempuan itu bernama Klenting Kuning.\n'
                '\n Di dalam pikiran Klenting Kuning, ia masih mengingat jelas sosok Pangeran Kusumayuda yang diam-diam ia kasihi. Namun, karena mendapat nasihat dari bangau ajaib maka Klenting Kuning luluh dan berangkat ke kerajaan untuk mengikuti sayembara itu.\n'
                '\n Saat di jalan menuju ke kerajaan, gadis-gadis desa harus melewati sungai yang cukup lebar. Lalu munculah Yuyu Kangkang yang menawarkan bantuan pada mereka. Namun dengan satu syarat yaitu, diberi ciuman. Karena terdesak, para gadis desa pun menuruti hal tersebut dengan harapan Pangeran Ande-ande Lumut tak mengetahuinya. Akan tetapi tidak dengan Klenting Kuning, ia bahkan terpaksa memilih untuk membunuh Yuyu Kangkang yang terus memaksanya.\n'
                '\n Sesampainya di istana, ternyata Pangeran Ande-ande Lumut mengetahui peristiwa gadis desa dan Yuyu Kangkang. Tanpa pikir panjang ia pun memilih Klenting Kuning yang ternyata adalah gadis yang dahulu ia pernah jumpai namun kehilangan jejaknya. Klenting Kuning yang menyadari bahwa Pangeran Ande-ande Lumut juga merupakan sosok yang pernah dikasihinya, Pangeran Kusumayuda pun bersuka cita dan menerimanya.\n'
                '\n Tamat.\n',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 205, 246, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Audio (cerita)",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            FloatingActionButton(
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: toggleAudio,
              backgroundColor: Color.fromARGB(255, 133, 217, 234), 
              mini: true,
              heroTag: null, 
              elevation: 0, 
            ),
            const SizedBox(width: 3.0),
            FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: stopAudio,
              backgroundColor: Color.fromARGB(255, 133, 217, 234), 
              mini: true,
              heroTag: null, 
              elevation: 0, 
            ),
            const SizedBox(width: 3.0),
            FloatingActionButton(
              child: Text(
                '${playbackSpeed.toInt()}x',
                style: TextStyle(fontSize: 18), 
              ),
              onPressed: (){ 
                if (playbackSpeed == 1.0) {
                  changeSpeed(2.0); 
                } else if (playbackSpeed == 2.0) {
                  changeSpeed(3.0); 
                } else if (playbackSpeed == 3.0) {
                  changeSpeed(4.0); 
                } else {
                  changeSpeed(1.0); 
                }
              },
              backgroundColor: Color.fromARGB(255, 133, 217, 234), 
              mini: true,
              heroTag: null, 
              elevation: 0, 
            ),
          ],
        ),
      ),
    );
  }    
} 