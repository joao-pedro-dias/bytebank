import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formulario.dart';

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        })).then((transferenciaRecebida) {
            Future.delayed(const Duration (milliseconds: 800), () => _atualiza(transferenciaRecebida!));
          });
        },
      ),
    );
  }
  void _atualiza(Transferencia transferenciaRecebida){
    if (transferenciaRecebida != null) {
      setState(() => widget._transferencias.add(transferenciaRecebida));
    }
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}