import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/user/bloc/user_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  bool _valid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _valid = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IBM Quantum"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login to IBM Quantum",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Text(
                "Copy your API token from your IBM Quantum account page."),
            TextFormField(
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a token";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            ElevatedButton(
              onPressed: _valid
                  ? () => context.read<UserBloc>().add(Login(_controller.text))
                  : null,
              child: const Text("Login"),
            ),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoggedIn) {
                  context.read<UserBloc>().add(GetProfile());
                }
              },
              builder: (context, state) {
                if (state is UserLoading) {
                  return const CircularProgressIndicator();
                } else if (state is UserError) {
                  return Text(state.message);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
