import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ux_design_mobile_1/providers/register_form_provider.dart';
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

                    ChangeNotifierProvider(
                      create: (_) => RegisterFormProvider(),
                      child: _RegisterForm(),
                    ),
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

  
  
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final registerForm = Provider.of<RegisterFormProvider>(context);

    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Nombre', prefixIcon: Icons.perm_identity),
              onChanged: (value) => registerForm.firstName = value,
              validator: (value) {
                if(value != null && value.length <= 20){
                  return null;
                } else {
                  return 'El nombre no puede ser mayor a 20 caracteres';
                }
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Primer apellido', prefixIcon: Icons.perm_identity),
              onChanged: (value) => registerForm.lastName = value,
              validator: (value) {
                if(value != null && value.length <= 30){
                  return null;
                } else {
                  return 'El primer apellido no puede ser mayor a 30 caracteres';
                }
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Segundo apellido', prefixIcon: Icons.perm_identity),
              onChanged: (value) => registerForm.secondLastName = value,
              validator: (value) {
                if(value != null && value.length <= 30){
                  return null;
                } else {
                  return 'El segundo apellido no puede ser mayor a 30 caracteres';
                }
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(hintText: 'ejemplo@gmail.com', labelText: 'Correo electrónico', prefixIcon: Icons.alternate_email),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingrese un correo válido';
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Teléfono', prefixIcon: Icons.phone),
              onChanged: (value) => registerForm.phoneNumber = value,
              validator: (value) {
                if(value != null && value.length >= 10){
                  return null;
                } else {
                  return 'El teléfono debe de ser de 10 dígitos';
                }
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Contraseña', prefixIcon: Icons.lock_outline),
              controller: _passwordController,
              onChanged: (value) => registerForm.password = value,
              validator: (value) {
                if(value ==null || value.isEmpty){
                  return 'Ingrese una contraseña';
                } else if(value.length < 8){
                  return 'La contraseña debe de ser de 8 caracteres';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(hintText: '', labelText: 'Confirmar contraseña', prefixIcon: Icons.lock_outline),
              controller: _confirmPasswordController,
              onChanged: (value) => registerForm.confirmPassword = value,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Ingrese una contraseña';
                } else if (value.length < 8){
                  return 'La contraseña debe de ser de 8 caracteres';
                } else if (value != _passwordController.text){
                  return 'Las contraseñas no coinciden';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: registerForm.isLoading ? null : () async {

                FocusScope.of(context).unfocus();
                if(!registerForm.validateForm()) return;

                registerForm.isLoading = true;

                await Future.delayed(const Duration(seconds: 2));

                registerForm.isLoading = false;

                Navigator.pushReplacementNamed(context, 'home');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child:  Text(
                  registerForm.isLoading
                    ? 'Espere...'
                    : 'Registrarse', 
                  style: const TextStyle(color: Colors.white),)
              ),
            )
          ],
        ),
      )
    );
  }
}