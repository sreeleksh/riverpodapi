import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ApiService.dart';
import 'cartsapi.dart';
import 'Carts.dart';


void main() {
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Counter extends Notifier<List<dynamic>>
{
  List<dynamic>dlist= [];
  @override
  List build() => [];
  Future<void> fetch() async {
    ApiService apiService = ApiService();

    apiService.fetchproducts().then((value) {
      state = value;
      dlist=value;
    });
  }
}

final counterProvider = NotifierProvider<Counter, List<dynamic>>(Counter.new);

class Example extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(counterProvider);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final c = list[index] as Carts;
        return ListTile(
          title: Text('${c.userId}'),
          subtitle: Text('${c.total}'),
          trailing: Text('${c.discountedTotal}'),
        );
      },
    );
  }
}
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumer is a builder widget that allows you to read providers.
        child: Example(),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.notifier).fetch(),
        child: const Icon(Icons.add),
      ),
    );
  }
}