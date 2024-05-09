import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  final peso = TextEditingController();
  final altura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter : IMC")),
      body: Center(
        child: Column(
          children: [
            getField(peso, "Peso"),
            getField(altura, "Altura"),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AboutDialog(
                          applicationName: "Cálculo",
                          children: [Text("IMC: ${((double.tryParse(peso.text) ?? 0) / ((double.tryParse(altura.text) ?? 1) * (double.tryParse(altura.text) ?? 1))).toStringAsFixed(2)}")]
                        );
                    }
                  );
                },
                child: const Text("Calcular"))
          ],
        ),
      ),
    );
  }

  TextField getField(TextEditingController editingController, String label) {
    return TextField(
      controller: editingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        ),
    );
  }
}