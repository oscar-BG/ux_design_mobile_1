import 'package:flutter/material.dart';
import 'package:ux_design_mobile_1/ui/input_decorations.dart';
import 'package:ux_design_mobile_1/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250,),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('Crear cuenta', style: Theme.of(context).textTheme.headlineSmall,),
                    const SizedBox(height: 30,),

                    _RegisterForm(),
                  ],
                ),
              ),

              const SizedBox(height: 50,),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: const Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
              ),

              const SizedBox(height: 50,),
            ],
          ),
        )
      )
   );
  }
}

class _RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Nombre', prefixIcon: Icons.perm_identity),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Primer apellido', prefixIcon: Icons.perm_identity),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Segundo apellido', prefixIcon: Icons.perm_identity),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(hintText: 'ejemplo@gmail.com', labelText: 'Correo electrónico', prefixIcon: Icons.alternate_email),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Teléfono', prefixIcon: Icons.phone),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Contraseña', prefixIcon: Icons.lock_outline),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Confirmar contraseña', prefixIcon: Icons.lock_outline),
            ),
          ],
        ),
      )
    );
  }
}