
import 'package:async_provider/provider/auth/sign_up_provider.dart';
import 'package:async_provider/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../commonwidget/toast_show.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final  _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(signUpProvider, (prev, next){
      next.maybeWhen(data: (d){
        context.pop();
        showToast(context, 'successfully register');
      },
          error: (err, st){
            showToast(context, '$err');
          },
          orElse: ()=> null);
    });
    final mode = ref.watch(validateModeProvider(id: 2));
    final pass = ref.watch(passShowProvider(id: 2));
    final signUpState = ref.watch(signUpProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Sign Up')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          autovalidateMode: mode,
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                name: 'username',
                decoration: InputDecoration(
                  // suffixIcon: Icon(Icons.email_outlined),
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),

                ]),
              ),

              const SizedBox(height: 30,),


              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  // suffixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'password',
                obscureText: pass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(passShowProvider(id: 2).notifier).toggle();
                    },
                    icon: Icon(Icons.remove_red_eye_outlined),
                  ),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(5),


                ]),
              ),
              const SizedBox(height: 20),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(onPressed: (){
                      context.pop();
                    }, child: Text('Login'))
                  ]),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                ),
                onPressed: signUpState.isLoading ? null :() {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false))
                  {
                    final map = _formKey.currentState!.value;
                    ref.read(signUpProvider.notifier).registerUser(map);
                  }
                  else{
                    ref.read(validateModeProvider(id:1).notifier).change();
                  }
                },
                child:signUpState.isLoading ? CircularProgressIndicator(): Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
