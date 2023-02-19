import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class HorarioScreen extends StatefulWidget {
  const HorarioScreen({Key? key}) : super(key: key);

  @override
  State<HorarioScreen> createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  bool btnState = true;

  DateTime selected = DateTime.now();
  DateTime now = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selected = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as List<Object>?;
    Peluqueria peluqueria = data?[0] as Peluqueria;
    Peluquero peluquero = data?[1] as Peluquero;
    List<Servicio> serviciosSeleccionados = data?[2];

    ResumenArgs resumen =
        ResumenArgs.sinFecha(peluqueria, peluquero, serviciosSeleccionados);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,
                color: AppTheme.secondaryTextColor),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 20),
            child: BigText(
              text: 'PELUCAPP',
              color: AppTheme.secondaryTextColor,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 8, bottom: 8, right: 35),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'notificaciones');
                    },
                    child: const Icon(
                      Icons.notifications_sharp,
                      color: AppTheme.secondaryTextColor,
                    )))
          ],
        ),
        body: Column(
          children: [
            TableCalendar(
              locale: 'en_US',
              rowHeight: 50,
              calendarFormat: CalendarFormat.twoWeeks,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              firstDay: now,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, selected),
              focusedDay: selected,
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppTheme.buttomColor),
                  onPressed: serviciosSeleccionados.isEmpty
                      ? null
                      : () => {
                            Navigator.pushNamed(context, 'resumen', arguments: [
                              peluqueria,
                              peluquero,
                              serviciosSeleccionados,
                              selected
                            ])
                          },
                  child:
                      const Text('Siguiente', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ));
  }
}
