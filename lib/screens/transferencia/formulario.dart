import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {

  static const _titleAppbar = 'Criando Transferência';
  static const _dicaNumeroConta = '0000';
  static const _rotuloNumeroConta = 'Número da conta';

  static const _dicaNumeroValor = '0.00';
  static const _rotuloNumeroValor = 'Valor';

  static const _textBtnConfirmar = 'Confirmar';

  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(_titleAppbar),
        ),
        body: SingleChildScrollView(
            // rotacionar a tela
            child: Column(
              children: <Widget>[
                Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: _dicaNumeroConta,
                  rotulo: _rotuloNumeroConta,
                ),
                Editor(
                  controlador: _controladorCampoValor,
                  dica: _dicaNumeroValor,
                  rotulo: _rotuloNumeroValor,
                  icone: Icons.monetization_on,
                ),
                ElevatedButton(
                  onPressed: () => _criaTransferencia(context),
                  // ignore: prefer_const_constructors
                  child: Text(_textBtnConfirmar),
                ),
              ],
        )));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}