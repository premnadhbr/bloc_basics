import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: BlocListener<CounterBloc, CounterState>(
                listener: (context, state) {
                  if (state is IncrementState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('increased Value...'),
                      duration: Duration(seconds: 2),
                    ));
                  } else if (state is DecrementState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Decresed Value...'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                child: Center(child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      'Counter value: ${state.counterValue}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterDecrementEvent()),
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrease'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterIncrementEvent()),
                      icon: const Icon(Icons.add),
                      label: const Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
