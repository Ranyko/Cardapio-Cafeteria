import 'package:catcafe/Screens/Item_details/item_details_screen.dart';
import 'package:flutter/material.dart';
import '../cart/cart_screen.dart';
import '../auth/login_screen.dart';
import '../about/about_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../profile/profile_screen.dart';

import 'package:catcafe/models/cafe_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
Widget build(BuildContext context) {

   final List<CafeItem> menuItems = [
    CafeItem(
      id: 1,
      name: 'Mocha',
      description: 'Café expresso com leite vaporizado e uma fina camada de espuma.',
      price: 12.50,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1671559021617-63260def0504?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bW9jaGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400', 
    ),
    CafeItem(
      id: 2,
      name: 'Macchiato',
      description: 'Espresso "manchado" com uma delicada espuma de leite e um fio de calda de caramelo artesanal..',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1608591038246-4981d06b11e1?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWFjY2hpYXRvfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 3,
      name: 'Flat White',
      description: 'Mais intenso que o latte, nosso Flat White combina duas doses de espresso com leite vaporizado finamente.',
      price: 8.00,
      imageUrl: 'https://images.unsplash.com/photo-1577968897966-3d4325b36b61?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmxhdCUyMHdoaXRlfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 4,
      name: 'Iced Latte',
      description: 'Café espresso, leite e gelo, na medida certa para os dias mais quentes.',
      price: 12.50,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1677607237294-b041e4b57391?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8SWNlZCUyMExhdHRlfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=400', 
      imageAlignment: Alignment(0, -0.5)
    ),
    CafeItem(
      id: 5,
      name: 'Soda Italiana de Tutti Fruti',
      description: 'Uma combinação vibrante de xarope de Tutti Fruti, água com gás e gelo.',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1685156330898-88eb2fdd66aa?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169',
    ),
    CafeItem(
      id: 6,
      name: 'Cappuccino Italiano',
      description: 'A combinação perfeita de um terço de espresso, um terço de leite vaporizado.',
      price: 8.00,
      imageUrl: 'https://images.unsplash.com/photo-1682591813350-c057722748da?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fENhcHB1Y2Npbm8lMjBJdGFsaWFub3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 7,
      name: 'Cold Brew',
      description: ' Café infusionado a frio por 18 horas, resultando em uma bebida suave, com baixa acidez e notas complexas.',
      price: 12.50,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1671088575920-09f2a5970574?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q29sZCUyMEJyZXd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400', 
    ),
    CafeItem(
      id: 8,
      name: 'Frappuccino',
      description: 'Café, leite, gelo e o inconfundível sabor do brigadeiro.',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8RnJhcHB1Y2Npbm98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400',
      imageAlignment: Alignment(0, -0.2)
    ),
    CafeItem(
      id: 9,
      name: 'Espresso',
      description: 'Um shot intenso e aromático, com uma crema aveludada.',
      price: 8.00,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1675435644687-562e8042b9db?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZXNwcmVzc298ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 10,
      name: 'Croassaint de Presunto e Queijo',
      description: 'Massa folhada amanteigada e crocante, recheada com presunto de primeira e queijo derretido.',
      price: 12.50,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1692913216191-e6de0e265b55?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNyb3NzYWludHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=400', 
      imageAlignment: Alignment(0, -0.6)
    ),
    CafeItem(
      id: 11,
      name: 'Quiche Lorraine',
      description: 'Massa leve e recheio cremoso à base de ovos, creme de leite, bacon e queijo.',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1647275556041-ab0395841a38?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8UXVpY2hlJTIwTG9ycmFpbmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 12,
      name: 'Sanduíche Caprese',
      description: 'Pão ciabatta artesanal com fatias de tomate fresco, mussarela de búfala e um toque de pesto de manjericão.',
      price: 8.00,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1664391899815-b82e21b2e27b?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8U2FuZHUlQzMlQURjaGUlMjBDYXByZXNlfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=400',
    ),
CafeItem(
      id: 13,
      name: 'Empada de Frango',
      description: 'Massa que derrete na boca com um recheio generoso de frango desfiado e catupiry.',
      price: 12.50,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9yMI9oSYjlm7Io-m7RaErWtMH9iUqvhppAg&s', 
    ),
    CafeItem(
      id: 14,
      name: 'Brownie de Chocolate',
      description: 'Intenso e com uma casquinha crocante por fora.',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hvY29sYXRlJTIwYnJvd25pZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 15,
      name: 'Cookie de Chocolate',
      description: 'Crocante nas bordas e macio no meio, com generosas gotas de chocolate que derretem na boca.',
      price: 8.00,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1672073871234-7f2de18b9e5d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y29va2llfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=400',
    ),CafeItem(
      id: 16,
      name: 'Cheesecake',
      description: 'Base de biscoito crocante, recheio cremoso à base de queijo e uma cobertura artesanal de geleia de frutas vermelhas.',
      price: 12.50,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1722686461601-b2a018a4213b?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2hlZXNlY2FrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=400', 
    ),
    CafeItem(
      id: 17,
      name: 'Torta Banoffee',
      description: 'Uma combinação celestial de banana, doce de leite cremoso e chantilly fresco sobre uma base de biscoito.',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1615560725129-a1fa6edc3b93?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFub2ZmZWUlMjBwaWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400',
    ),
    CafeItem(
      id: 18,
      name: 'Affogato',
      description: 'Uma bola de sorvete de creme artesanal "afogada" em uma dose de café espresso bem quente.',
      price: 8.00,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1671559020847-2d9ef2efc3c2?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YWZmb2dhdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=400',
    ),


  ];

  return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
  title: const Text('Cardápio'),
  centerTitle: true,
  actions: [
    
    IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
      },
    ),
  ],
      ),
      drawer: Drawer(
  child: Column(
    children: [
      Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 66, 40, 110),
        ),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Café App',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Meu Perfil'),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.info_outline),
        title: const Text('Sobre'),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AboutScreen()),
          );
        },
      ),
      const Expanded(child: SizedBox()),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text('Sair', style: TextStyle(color: Colors.red)),
        onTap: () {
          context.read<AuthProvider>().logout();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        },
      ),
    ],
  ),
),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),

            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];

              return InkWell(
                onTap: (){

                  Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => ItemDetailsScreen(item: item))
                  );
                },
              child: Card(
                elevation: 4,
                // ignore: deprecated_member_use
                color: const Color.fromARGB(255, 248, 205, 234).withOpacity(0.9),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Image.network(item.imageUrl, fit: BoxFit.cover, alignment: item.imageAlignment,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ), 
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'R\$ ${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              );
            }
            ),
      ),
    );
  }
}