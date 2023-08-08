import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  String nome = "";
  int ra = 0;
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                
                TextFormField(
                  controller: campoRa,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("o Ra não pode ser vazio");
                    } else if (int.parse(campoRa.text) < 10) {
                      //else if(campoRa.text.length<10){

                      return ("o RA deve ser maior que 10");
                    }

                    return null;
                  },
                ),
             
                TextFormField(
                  controller: campoNome,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("o nome não pode ser vazio");
                    } else {
                      if (campoNome.text.length < 5) {
                        return ("o nome precisa ter mais que 5 caracteres");
                      }
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
          
          ElevatedButton(

              onPressed: () {
                if (formKey.currentState!.validate()) {
                  mostrarMensagem();
                  ra = int.parse(campoRa.text);
                  nome = campoNome.text;
                  setState(() {});
                }
              },
              child: Text("Cadastrar")),
          Text("Valores digitados: $ra, $nome"),
        ],
      )),
    );
  }

void mostrarMensagem(){
  ScaffoldMessenger.of(context).showSnackBar( 
    SnackBar(content: Text('Aluno cadastrado com sucesso'))
  );
}


}
