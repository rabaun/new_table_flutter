import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/organization_model/organization_model.dart';
import '../screen/workplace_screen.dart';
import 'bloc_organization.dart';
import 'organization_dialog.dart';
import 'organization_event.dart';

class NewOrganizationBody extends StatelessWidget {
  const NewOrganizationBody({super.key, required this.organizationList});

  final List<OrganizationModel>? organizationList;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Список организаций")),
        centerTitle: true,
        actions: [
          _floatingButton(context),
        ],
      ),
      body: ListView.builder(
        itemCount: organizationList?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Переход на новый экран с анимацией
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => WorkplaceScreen(organization: organizationList?[index]),
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
              BlocProvider.of<OrganizationBloc>(context)
                  .add(OrganizationEvent.remove(organization: organizationList?[index]));
            },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Размещаем элементы по краям
                    children: [
                      Expanded(
                        child: Text(
                          organizationList?[index].organizationName ?? '',
                          // Отображаем название организации
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      updateButton(context, index),
                    ],
                  ),
                ),
              ));
        },
      ),
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
              return AddOrganizationDialog(
                organization:  organizationList?[index],
              );
            },
          );
        },
        icon: const Icon(Icons.edit, color: Colors.white), // Иконка
        label: const Text("ред.", style: TextStyle(color: Colors.white)), // Текст
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
    return Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddOrganizationDialog();
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
