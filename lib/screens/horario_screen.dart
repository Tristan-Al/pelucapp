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

    Color _colorBase = Colors.indigo;
    Color _colorSeleccionado = Colors.indigoAccent;
    bool _horaSeleccionada = false;

    Color _colorboton1000 = _colorBase;
    Color _colorboton1015 = _colorBase;
    Color _colorboton1030 = _colorBase;
    Color _colorboton1045 = _colorBase;
    Color _colorboton1100 = _colorBase;
    Color _colorboton1115 = _colorBase;
    Color _colorboton1130 = _colorBase;
    Color _colorboton1145 = _colorBase;
    Color _colorboton1200 = _colorBase;
    Color _colorboton1215 = _colorBase;
    Color _colorboton1230 = _colorBase;
    Color _colorboton1245 = _colorBase;
    Color _colorboton1300 = _colorBase;
    Color _colorboton1315 = _colorBase;
    Color _colorboton1330 = _colorBase;
    Color _colorboton1345 = _colorBase;
    Color _colorboton1700 = _colorBase;
    Color _colorboton1715 = _colorBase;
    Color _colorboton1730 = _colorBase;
    Color _colorboton1745 = _colorBase;
    Color _colorboton1800 = _colorBase;
    Color _colorboton1815 = _colorBase;
    Color _colorboton1830 = _colorBase;
    Color _colorboton1845 = _colorBase;
    Color _colorboton1900 = _colorBase;
    Color _colorboton1915 = _colorBase;
    Color _colorboton1930 = _colorBase;
    Color _colorboton1945 = _colorBase;

    void swapSeleccionada() {
      if (_horaSeleccionada) {
        _horaSeleccionada = false;
      } else {
        _horaSeleccionada = true;
      }
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.mainTextColor),
          ),
          title: BigText(
            text: 'PELUCAPP',
            color: AppTheme.primary,
            size: 25,
          ),
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
            Container(
              height: 350,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1000,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        10,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1000 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("10:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        10,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("10:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        10,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("10:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        10,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("10:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        11,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("11:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        11,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("11:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        11,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("11:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        11,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("11:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        12,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("12:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        12,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("12:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        12,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("12:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        12,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("12:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        13,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("13:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        13,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("13:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        13,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("13:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        13,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("13:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        17,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("17:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        17,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("17:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        17,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("17:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        17,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("17:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        18,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("18:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo,
                                ),
                                onPressed: () {},
                                child: Text("18:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        18,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("18:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        18,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("18:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        19,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("19:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        19,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("19:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        19,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("19:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        19,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("19:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        20,
                                        00,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("20:00"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        20,
                                        15,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("20:15"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        20,
                                        30,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("20:30"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: _colorboton1015,
                                ),
                                onPressed: () {
                                  if (!_horaSeleccionada) {
                                    selected = DateTime(
                                        selected.year,
                                        selected.month,
                                        selected.day,
                                        20,
                                        45,
                                        selected.millisecond,
                                        selected.microsecond);
                                    /*setState(() {
                                      _colorboton1015 = _colorSeleccionado;
                                    });*/
                                  }
                                },
                                child: Text("20:45"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
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
