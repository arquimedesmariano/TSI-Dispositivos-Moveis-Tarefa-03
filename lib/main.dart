import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

//Importa os componentes do Flutter.
//Importa biblioteca dos arquivos ".ogg"

void main(){
  runApp(const MeuAplicativo());
}

//Flutter execute meu Aplicativo

class MeuAplicativo extends StatelessWidget{
  const MeuAplicativo({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false,
      title:'Tarefa 03',
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget{
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal>{
  final AudioPlayer _player = AudioPlayer();

  Future<void> tocarSom(String caminho) async {
    try {
      await _player.stop();
      await _player.setAsset(caminho);
      await _player.play();
    } catch (e) {
      debugPrint('Erro ao reproduzir o som: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefa 03 - Sons'),
        centerTitle: true,
      ),

      body:Center(
        child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon
              (Icons.music_note, size: 80,
            ),
            const SizedBox(height: 20),

            const Text(
              'Escolha um som',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                tocarSom('assets/sons/som1.ogg');
              },
              child: const Text('Som 1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                tocarSom('assets/sons/som2.ogg');
              },
              child: const Text('Som 2'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                tocarSom('assets/sons/som3.ogg');
              },
              child: const Text('Som 3'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                tocarSom('assets/sons/som4.ogg');
              },
              child: const Text('Som 4'),
            ),
          ],
         ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}