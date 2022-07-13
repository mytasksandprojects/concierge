import 'package:concierge/Pages/Home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeViewModel>(
      view: () => const _HomeView(),
      viewModel: HomeViewModel(),
    );
  }
}
class _HomeView extends HookView<HomeViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _HomeView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return ListView(
      children: const <Widget>[
        Text('Home')
       ],
    );
  }
}




