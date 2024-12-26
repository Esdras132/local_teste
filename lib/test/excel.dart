import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'package:share_plus/share_plus.dart';

class ExcelExemplo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerar e Compartilhar Excel")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Gera o arquivo Excel
            String? filePath = await generateExcel();

            // Compartilha o arquivo, se foi gerado com sucesso
            if (filePath != null) {
              Share.shareXFiles([XFile(filePath)], text: 'Confira o arquivo de dados!');
            } else {
              print("Falha ao criar o arquivo Excel.");
            }
          },
          child: Text("Gerar e Compartilhar Excel"),
        ),
      ),
    );
  }

  // Função para gerar o arquivo Excel
  Future<String?> generateExcel() async {
    try {
      // Crie um objeto Excel
      var excel = Excel.createExcel();

      // Adicione dados à primeira planilha
      Sheet sheetObject = excel['Sheet1'];
      sheetObject.appendRow([TextCellValue('Nome'), TextCellValue('Idade'), TextCellValue('Profissão')]); // Cabeçalhos
      sheetObject.appendRow([TextCellValue('Alice'), TextCellValue('25'), TextCellValue('Engenheira')]);
      sheetObject.appendRow([TextCellValue('Bruno'), TextCellValue('30'), TextCellValue('Médico')]);
      sheetObject.appendRow([TextCellValue('Carla'), TextCellValue('28'), TextCellValue('Designer')]);


      // Obtenha o diretório para salvar o arquivo
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/dados.xlsx";

      // Salve o arquivo
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excel.encode()!);

      print("Arquivo Excel criado em: $filePath");
      return filePath;
    } catch (e) {
      print("Erro ao criar o arquivo Excel: $e");
      return null;
    }
  }
}

