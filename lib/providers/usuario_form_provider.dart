import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Usuario? usuario;

  ProductFormProvider(this.usuario);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
