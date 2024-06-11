import 'package:aula_estado/constants/images.dart';

class OnboardingModel {
  final String title, description, image;

  OnboardingModel(
      {required this.title, required this.description, required this.image});
}

final List<OnboardingModel> onboardingContent = [
  OnboardingModel(
    title: "Bem-Vindo a Loja CALANGO",
    description: "CALANGO é uma loja Nordestina!",
    image: onboardingImage1,
  ),
  OnboardingModel(
    title: "Compra Segura",
    description: "Transações seguras de compras e vendas",
    image: onboardingImage2,
  ),
  OnboardingModel(
    title: "Entrega Rápida",
    description: "Envio em até 48h",
    image: onboardingImage3,
  ),
];
