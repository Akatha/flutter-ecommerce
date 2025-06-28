import 'package:async_provider/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final  _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(validateModeProvider(id: 2));
    final pass = ref.watch(passShowProvider(id: 2));
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
                name: 'Username',
                decoration: InputDecoration(
                  // suffixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter your Username',
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
                  FormBuilderValidators.minLength(8),
                  FormBuilderValidators.hasUppercaseChars(),
                  FormBuilderValidators.hasNumericChars()
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
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false))
                  {
                    final map = _formKey.currentState;
                    print(map);
                  }
                  else{
                    ref.read(validateModeProvider(id:1).notifier).change();
                  }
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
