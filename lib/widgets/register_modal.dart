import 'package:flutter/material.dart';
import 'package:gastosappg9/widgets/field_modal_widget.dart';
import 'package:gastosappg9/widgets/item_type_widget.dart';

class RegisterModal extends StatefulWidget {
  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  TextEditingController _tituloController = TextEditingController();

  TextEditingController _montoController = TextEditingController();

  TextEditingController _fechaController = TextEditingController();

  showDateTimePicker() async {
    DateTime? datepicker = await showDatePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Registra el gasto"),
          SizedBox(
            height: 16,
          ),
          FieldModalWidget(
            hint: "Ingresa el título",
            controller: _tituloController,
          ),
          FieldModalWidget(
            hint: "Ingresa el monto",
            controller: _montoController,
            isNumberKeyBoard: true,
          ),
          FieldModalWidget(
            hint: "Ingresa la fecha",
            controller: _fechaController,
            isDatePicker: true,
            function: () {
              showDateTimePicker();
            },
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              ItemTypeWidget(),
              ItemTypeWidget(),
              ItemTypeWidget(),
              ItemTypeWidget(),
              ItemTypeWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
