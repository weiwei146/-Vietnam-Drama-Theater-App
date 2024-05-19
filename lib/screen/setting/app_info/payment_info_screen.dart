import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../../features/authentication/controllers/profile_controller.dart';
import '../../../features/authentication/models/user_model.dart';

class PaymentInfoScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Future<UserModel?>? futureUserData = controller.getUserData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Phương thức thanh toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: FutureBuilder<UserModel?>(
          future: futureUserData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.data == null) {
              return _buildNotLoggedInView(context);
            } else {
              UserModel user = snapshot.data!;
              return _buildLoggedInView(context, user);
            }
          },
        ),
      ),
    );
  }

  Widget _buildNotLoggedInView(BuildContext context) {
    return Center(
      child: Text(
        'Bạn chưa đăng nhập. Vui lòng đăng nhập để xem thông tin thanh toán.',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoggedInView(BuildContext context, UserModel user) {
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: mediaQuery.height * 0.02),
        PaymentCardInfo(
          imagePath: 'assets/images/visa.png',
          cardType: 'Visa',
          cardNumber: '4916 6217 5616 1292',
        ),
        SizedBox(height: mediaQuery.height * 0.03),
        CreditCardUi(
          cardHolderFullName: user.name,
          cardNumber: '1234567812345678',
          validFrom: '01/23',
          validThru: '01/28',
          topLeftColor: Colors.blue,
          doesSupportNfc: true,
          placeNfcIconAtTheEnd: true,
          cardType: CardType.debit,
          cardProviderLogo: FlutterLogo(),
          cardProviderLogoPosition: CardProviderLogoPosition.right,
          showBalance: true,
          balance: 128.32434343,
          autoHideBalance: true,
        ),
        SizedBox(height: mediaQuery.height * 0.03),
        PaymentCardInfo(
          imagePath: 'assets/images/momo.png',
          cardType: 'Momo',
          cardNumber: user.phoneNumber ?? 'N/A',
        ),
        SizedBox(height: mediaQuery.height * 0.03),
        CreditCardUi(
          cardHolderFullName: user.name,
          cardNumber: user.phoneNumber ?? 'N/A',
          validThru: '',
          topLeftColor: Colors.red,
          bottomRightColor: Colors.purpleAccent,
        ),
      ],
    );
  }
}

class PaymentCardInfo extends StatelessWidget {
  final String imagePath;
  final String cardType;
  final String cardNumber;

  const PaymentCardInfo({
    required this.imagePath,
    required this.cardType,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Row(
      children: [
        Image.asset(imagePath, width: mediaQuery.width * 0.1),
        SizedBox(width: mediaQuery.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardType,
              style: TextStyle(
                fontSize: mediaQuery.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cardNumber,
              style: TextStyle(
                fontSize: mediaQuery.width * 0.04,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PaymentButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.02),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: mediaQuery.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
