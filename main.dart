import 'package:flutter/material.dart';

void main() {
  runApp(const MojeAplikace());
}

class MojeAplikace extends StatelessWidget {
  const MojeAplikace({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DomovskaStranka(),
    );
  }
}

class DomovskaStranka extends StatelessWidget {
  const DomovskaStranka({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Nadpis na horní liště
        title: const Text('Můj flopík'),
        // Pískově hnědá barva podle kožichu Flopy
        backgroundColor: const Color(0xFFC29B6D), 
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Načtení obrázku Flopy z internetu
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Zaoblené rohy
                child: Image.network(
                  'https://img-cdn.heureka.group/v1/7aebc812-e5e3-4baa-b4a9-84eabc0e0e8e.jpg?width=350&height=350',
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // OPAVENO: Funkční ikona zvířecí tlapky při výpadku internetu
                    return const Icon(Icons.pets, size: 100, color: Colors.grey);
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Tlačítko Přihlásit se
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC29B6D), // Stejná barva jako lišta
                  foregroundColor: Colors.white, // Bílý text
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  // Spodní vyskakovací lišta po kliknutí
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Přihlašování...')),
                  );
                },
                child: const Text(
                  'Přihlásit se',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
