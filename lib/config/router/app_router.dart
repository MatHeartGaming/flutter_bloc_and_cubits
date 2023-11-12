import 'package:blocs_and_cubits/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/', 
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      name: CubitCounterScreen.name, 
      builder: (context, state) => const CubitCounterScreen(),
    ),

    GoRoute(
      path: '/bloc',
      name: BlocCounterScreen.name, 
      builder: (context, state) => const BlocCounterScreen(),
    ),

    GoRoute(
      path: '/new-user',
      name: RegisterScreen.name, 
      builder: (context, state) => const RegisterScreen(),
    ),
    
  ],
);
