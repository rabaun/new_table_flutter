import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/models/lighting_protocol_model/lighting_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_lighting_protocol.dart';
import 'lighting_protocol_dialog.dart';
import 'lighting_protocol_event.dart';

class NewLightingProtocolBody extends StatelessWidget {
  const NewLightingProtocolBody(
      {super.key, required this.lightingProtocolList, required this.protocolNameModel});

  final List<LightingProtocolModel>? lightingProtocolList;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LightingProtocolBloc>(context).add(LightingProtocolEvent.getProtocol(
        protocolName: protocolNameModel, workplaceName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по освещению")),
        centerTitle: true, // this is all you need
        actions: [
          lightingProtocolList != null && lightingProtocolList!.isEmpty
              ? _floatingButton(context)
              : Container(),
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () async {
              await _generatePdf(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: lightingProtocolList?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', primaryProtocolList?[index].id?.toString()),
                _buildListItem('Организация', lightingProtocolList?[index].organizationName),
                // _buildListItem('ИД организации', primaryProtocolList?[index].organizationId),
                _buildListItem('Дата измерения', lightingProtocolList?[index].measurementDate),
                _buildListItem('Рабочее место', lightingProtocolList?[index].workplace),
                // _buildListItem('ИД места работы', primaryProtocolList?[index].workplaceId),
                _buildListItem('Фамилия работника', lightingProtocolList?[index].familyName),
                _buildListItem('Название параметра', lightingProtocolList?[index].parameterName),
                _buildListItem(
                    'Значение уровня освещения №1', lightingProtocolList?[index].parameterValue1),
                _buildListItem(
                    'Значение уровня освещения №2', lightingProtocolList?[index].parameterValue2),
                _buildListItem(
                    'Значение уровня освещения №3', lightingProtocolList?[index].parameterValue3),
                _buildListItem('Среднее значение уровня освещения',
                    lightingProtocolList?[index].averageConcentration),
                updateButton(context, index)
              ],
            );
          }),
      // floatingActionButton: _floatingButton(context),
    );
  }

  Widget updateButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddLightingProtocolDialog(
                lightingProtocol: lightingProtocolList?[index],
                protocolName: protocolNameModel,
              );
            },
          );
        },
        icon: const Icon(Icons.edit, color: Colors.white), // Иконка
        label: const Text("Редактировать", style: TextStyle(color: Colors.white)), // Текст
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Цвет фона кнопки
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Отступы
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Закругленные углы
          ),
        ),
      ),
    );
  }

  Widget _floatingButton(context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
        child: Container(
            width: 40.0, // Установите ширину круга
            height: 40.0, // Установите высоту круга
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withOpacity(0.7), // Полупрозрачный красный фон
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Цвет тени
                  blurRadius: 10.0, // Размытие тени
                  spreadRadius: 2.0, // Расширение тени
                  offset: Offset(0, 4), // Смещение тени
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddLightingProtocolDialog(
                      protocolName: protocolNameModel,
                    );
                  },
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              iconSize: 20.0, // Размер иконк
            )));
  }

  Widget _buildListItem(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent, // Цвет фона карточки
          borderRadius: BorderRadius.circular(12), // Овальные углы
        ),
        padding: const EdgeInsets.all(16.0), // Отступы внутри карточки
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Заголовок с подчеркиванием
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline, // Подчеркивание
                  ),
                ),
              ],
            ),
            // Значение
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white, // Цвет фона для значения
                borderRadius: BorderRadius.circular(8), // Овальные углы
              ),
              child: Text(
                value ?? 'N/A',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal, // Жирный текст
                  fontSize: 18, // Увеличенный размер шрифта
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generatePdf(BuildContext context) async {
    final pdf = pw.Document();
    // Загрузка шрифта
    final ttf = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Regular.ttf'));

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Первичный протокол по шуму',
                  style: pw.TextStyle(fontSize: 24, font: ttf, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 20),
                // Добавление таблицы для данных
                pw.Table(
                  border: pw.TableBorder.all(),
                  children: [
                    // Заголовки таблицы
                    pw.TableRow(children: [
                      _buildHeaderCell('Параметр', ttf),
                      _buildHeaderCell('Значение', ttf),
                    ]),
                    // Данные протокола
                    for (var protocol in lightingProtocolList ?? []) ...[
                      pw.TableRow(children: [
                        _buildTableCell('Организация:', ttf),
                        _buildValueCell(protocol.organizationName, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Рабочее место:', ttf),
                        _buildValueCell(protocol.workplace, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Фамилия работника:', ttf),
                        _buildValueCell(protocol.familyName, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Название параметра:', ttf),
                        _buildValueCell(protocol.parameterName, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Значение уровня освещения №1:', ttf),
                        _buildValueCell(protocol.parameterValue1, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Значение уровня освещения №2:', ttf),
                        _buildValueCell(protocol.parameterValue2, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Значение уровня освещения №3:', ttf),
                        _buildValueCell(protocol.parameterValue3, ttf),
                      ]),
                      pw.TableRow(children: [
                        _buildTableCell('Среднее значение уровня освещения:', ttf),
                        _buildValueCell(protocol.averageConcentration, ttf),
                      ]),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    // Получаем директорию для сохранения файла
    final directory = await getApplicationDocumentsDirectory();
    // final directory = await getExternalStorageDirectory();
    final file = File('${directory.path}/первичный_протокол_освещения.pdf');

    // Сохраняем PDF в файл
    await file.writeAsBytes(await pdf.save());

    // Выводим путь к файлу в консоль
    print('PDF сохранен по пути: ${file.path}');
  }

// Функция для создания ячейки заголовка таблицы
  pw.Widget _buildHeaderCell(String text, pw.Font ttf) {
    return pw.Padding(
        padding: const pw.EdgeInsets.all(8.0),
        child: pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(text, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf)),
        ));
  }

// Функция для создания ячейки таблицы с текстом
  pw.Widget _buildTableCell(String label, pw.Font ttf) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Align(
        alignment: pw.Alignment.center,
        child: pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf)),
      ),
    );
  }

  // Обновленная функция для создания ячейки с значением по центру
  pw.Widget _buildValueCell(String value, pw.Font ttf) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Align(
        alignment: pw.Alignment.center,
        child: pw.Text(value, style: pw.TextStyle(font: ttf)),
      ),
    );
  }
}
