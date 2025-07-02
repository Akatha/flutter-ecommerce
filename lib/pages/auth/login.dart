
import 'package:async_provider/commonwidget/toast_show.dart';
import 'package:async_provider/provider/login_provider.dart';
import 'package:async_provider/routes/route_enum.dart';
import 'package:async_provider/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final  _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {

    ref.listen(loginProviderProvider, (prev, next){
      next.maybeWhen(data: (d){
        showToast(context, 'Successful');
      },
      error: (err, st){
        showToast(context, '$err');
      },
          orElse: ()=> null);
    });

    final mode = ref.watch(validateModeProvider(id: 1));
    final pass = ref.watch(passShowProvider(id: 1));
    final loginState = ref.watch(loginProviderProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Login Page')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          autovalidateMode: mode,
          key: _formKey,
          child: ListView(
            children: [
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
                      ref.read(passShowProvider(id: 1).notifier).toggle();
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
                  // FormBuilderValidators.hasUppercaseChars(),
                  // FormBuilderValidators.hasNumericChars()
                ]),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('don\'t have an account?'),
                TextButton(onPressed: (){
                  context.pushNamed(AppRoute.register.name);
                }, child: Text('Sign Up'))
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
                onPressed: loginState.isLoading? null:() {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false))
                  {
                    final map = _formKey.currentState!.value;
                    ref.read(loginProviderProvider.notifier).loginUser(map);
                  }
                  else{
                    ref.read(validateModeProvider(id:1).notifier).change();
                  }
                },
                child: loginState.isLoading ? CircularProgressIndicator(): Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
