import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginPageState(); 
} 

class _loginPageState extends State<LoginPage> {

  // form login
final _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

@override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 30),
                _buildLoginButton(context),
                const SizedBox(height: 20),
                _buildSignUpLink(context),
              ],
            ),),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'welcome Back!',
          style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4C53A5),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'login to continue',
          style: TextStyle(fontSize: 16, color: Color(0xFF4C53A5)),
        )
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'email',
        prefixIcon: const Icon(Icons.email, color: Color(0xFF4C53A5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), 
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'email tidak boleh kosong';
        }
        if (!RegExp(r'').hasMatch(value)) {
          return 'format email tidak valid';
        }
        return null;
      }, 
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock, color: Color(0xFF4C53A5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), 
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        if (!RegExp(r'').hasMatch(value)) {
          return 'Password minimal 6 katakter';
        }
        return null;
      }, 
    );
  }

  Widget _buildLoginButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        Navigator.pushReplacementNamed(context, 'AccountPage');
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4C53A5),
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      'Login',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
 }

 Widget _buildSignUpLink(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/');
    },
    child: const Text(
      'don\'t have an account? Sign Up',
      style: TextStyle(color: Color(0xFF4C53A5)),
    ),
    );
  }
}
