import 'package:flutter/material.dart';
import 'package:gastosappg9/db/db_admin.dart';
import 'package:gastosappg9/widgets/item_gasto_widget.dart';
import 'package:gastosappg9/widgets/register_modal.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildBusquedaWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Buscar por título",
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.4),
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          contentPadding: EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  showRegisterModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RegisterModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // DbAdmin dbAdmin = DbAdmin();
          // dbAdmin.checkDataBase();
          // DbAdmin().obtenerGastos();
          // DbAdmin().updGasto();
          DbAdmin().delGasto();
          // dbAdmin.insertarGasto();
        }),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print("SE PRESIONA");
                    showRegisterModal();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "Agregar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Resumen de gastos",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Gestiona tus gastos de mejor forma",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        ),
                        buildBusquedaWidget(),
                        ItemGastoWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
