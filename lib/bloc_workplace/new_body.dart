import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_dialog.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_event.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/workplace_model/workplace_model.dart';
import '../screen/protocol_screen.dart';
import 'bloc_workplace.dart';

class NewWorkplaceBody extends StatelessWidget {
  const NewWorkplaceBody({super.key, required this.organization, this.workplaceList});

  final List<WorkplaceModel>? workplaceList;
  final OrganizationModel? organization;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WorkplaceBloc>(context)
        .add(WorkplaceEvent.getOrganization(organization: organization));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Список рабочих мест")),
        centerTitle: true,
        actions: [
          _floatingButton(context),
        ],
      ),
      body: ListView.builder(
        itemCount: workplaceList?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Переход на новый экран с анимацией
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ProtocolScreen(
                      organization: organization, workplaceName: workplaceList?[index]),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Начальная позиция (справа)
                    const end = Offset.zero; // Конечная позиция (центр)
                    const curve = Curves.easeInOut; // Кривая анимации

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              BlocProvider.of<WorkplaceBloc>(context)
                  .add(WorkplaceEvent.remove(workplace: workplaceList?[index]));
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  workplaceList?[index].workplaceName ?? '', // Отображаем название организации
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _floatingButton(context) {
    return Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddWorkplaceDialog(organization: organization);
              },
            );
          },
          icon: const Icon(Icons.add, color: Colors.black),
        ));
  }

  Widget _buildListItem(String title) {
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
          ],
        ),
      ),
    );
  }
}
