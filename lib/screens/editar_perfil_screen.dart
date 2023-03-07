import 'package:flutter/material.dart';

import 'package:pelucapp/providers/usuario_form_provider.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EditarPerfilScreen extends StatelessWidget {
  const EditarPerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsuariosServices usuariosServices =
        Provider.of<UsuariosServices>(context);

    final Map<String, String> formValues = {
      'nombre': '${usuariosServices.usuarioLogin?.nombre}',
      'telefono': '${usuariosServices.usuarioLogin?.telefono}',
      'email': '${usuariosServices.usuarioLogin?.email}',
      'password': '${usuariosServices.usuarioLogin?.password}',
      'confirmacion': '${usuariosServices.usuarioLogin?.password}'
    };

    return ChangeNotifierProvider(
      create: ((context) => UsuarioFormProvider(usuariosServices.usuarioLogin)),
      child: _EditarPerfilScreenBody(
          usuariosServices: usuariosServices, formValues: formValues),
    );
  }
}

class _EditarPerfilScreenBody extends StatelessWidget {
  const _EditarPerfilScreenBody({
    super.key,
    required this.formValues,
    required this.usuariosServices,
  });

  final UsuariosServices usuariosServices;
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    final usuarioForm = Provider.of<UsuarioFormProvider>(context);
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
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: usuarioForm.formKey,
          child: Column(children: [
            const SizedBox(height: 25),
            const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg'),
                maxRadius: 100),
            const SizedBox(height: 40),
            FormFieldPers(
              value: usuariosServices.usuarioLogin?.nombre,
              ocultar: false,
              hintText: 'Cambiar nombre usuario',
              icon: Icons.group_outlined,
              formProperty: 'nombre',
              formValues: formValues,
            ),
            const SizedBox(height: 20),
            FormEmail(
              value: usuariosServices.usuarioLogin?.email,
              ocultar: false,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              formProperty: 'email',
              formValues: formValues,
            ),
            const SizedBox(height: 20),
            FormFieldPers(
              value: usuariosServices.usuarioLogin?.telefono.toString(),
              ocultar: false,
              keyboardType: TextInputType.number,
              hintText: 'Editar número',
              icon: Icons.phone_android_outlined,
              formProperty: 'telefono',
              formValues: formValues,
            ),
            const SizedBox(height: 20),
            FormFieldPers(
              value: '',
              ocultar: true,
              keyboardType: TextInputType.text,
              hintText: 'Nueva contraseña',
              icon: Icons.key,
              formProperty: 'password',
              formValues: formValues,
            ),
            const SizedBox(height: 20),
            FormFieldPers(
              value: '',
              ocultar: true,
              keyboardType: TextInputType.text,
              hintText: 'Confirma contraseña',
              icon: Icons.key,
              formProperty: 'confirmacion',
              formValues: formValues,
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () async {
                  if (!usuarioForm.isValidForm()) return;
                  usuarioForm.usuario?.id = usuariosServices.usuarioLogin?.id;
                  usuarioForm.usuario?.nombre = formValues['nombre']!;
                  usuarioForm.usuario?.email = formValues['email']!;
                  usuarioForm.usuario?.telefono =
                      int.parse(formValues['telefono'] ?? '000000000');
                  usuarioForm.usuario?.password = formValues['password']!;
                  usuarioForm.usuario?.verificado = true;

                  await usuariosServices
                      .guardarOCrearUsuario(usuarioForm.usuario!);
                  Navigator.pushNamed(context, 'home');
                },
                child: const Text('Guardar cambios usuario',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 50)
          ]),
        ),
      ),
    );
  }
}
