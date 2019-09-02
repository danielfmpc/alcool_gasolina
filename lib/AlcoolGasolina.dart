import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
	TextEditingController _controllerAlcool = TextEditingController();
	TextEditingController _controllerGasolina = TextEditingController();

	var _resultado = "";


	void _verificaMelhor(){
		var alcool = double.tryParse(_controllerAlcool.text);
		var gasolina = double.tryParse(_controllerGasolina.text);

		if (alcool == null || gasolina == null){
			setState(() {
				_resultado = "Números inválido, digite números maiores que zero e utilizando (.)";
			});
		}else {

			if ((alcool / gasolina) > 0.7) {
				setState(() {
					_resultado = "Melhor comprar gasolina";
				});
			} else {
				setState(() {
					_resultado = "Melhor comprar álcool";
				});	
			}
			_limparCampos();
		}

		
	}
	void _limparCampos(){
			_controllerAlcool.text = "";
			_controllerGasolina.text = "";
		}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Álcool ou Gasolina"),
				backgroundColor: Colors.blue,
			),	
			body: Container(
				child: SingleChildScrollView(
					padding: EdgeInsets.all(32),
					child: Column(
						// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[
							Padding(
								padding: EdgeInsets.only(bottom: 32),
								child: Image.asset("images/logo.png"),
							),
							Padding(
								padding: EdgeInsets.only(bottom: 10),
								child: Text(
									"Saiba qual a melhor opção para abastecimento do seu carro",
									textAlign: TextAlign.justify,
									style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize: 25,
									),
								),
							),
							TextField(
								keyboardType: TextInputType.number,
								decoration: InputDecoration(
									labelText: "Preço Álcool, ex.: 1.59",
									fillColor: Colors.blue,
								),
								style: TextStyle(
									fontSize: 22,
								),
								controller: _controllerAlcool,
							),
							TextField(
								keyboardType: TextInputType.number,
								decoration: InputDecoration(
									labelText: "Preço Gasolina, ex.: 2.59"
								),
								style: TextStyle(
									fontSize: 22,
									color: Colors.blue,
								),
								controller: _controllerGasolina,
							),
							Padding(
								padding: EdgeInsets.only(top: 10),
								child: RaisedButton(
									onPressed: _verificaMelhor,
									color: Colors.blue,
									textColor: Colors.white,
									padding: EdgeInsets.all(15),
									child: Text(
										"Calcular",
										style: TextStyle(
											fontSize: 20
										),
									),
								)
							),
							Padding(
								padding: EdgeInsets.only(top: 20),
								child: Text(
									_resultado,
									style: TextStyle(
										fontSize: 22,
										fontWeight: FontWeight.bold,
									),
								),
							),
						],
					),
				),
			),
		);
	}
}