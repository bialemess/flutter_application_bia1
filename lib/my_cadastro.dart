import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  String nome = "";
  int senha = 0;
  TextEditingController campoSenha = TextEditingController();
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
                  controller: campoSenha,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("a Senha não pode ser vazia");
                    } else if (int.parse(campoSenha.text) < 10) {
                      //else if(campoRa.text.length<10){

                      return ("a Senha deve ser pelo menos 3 carácteres");
                    }

                    return null;
                  },

                  decoration: InputDecoration  (
                    //dentro de 1 parenteses é só vírgula
                    
                    labelText: "Senha",
                    ),
                ),
             
                TextFormField(
                  controller: campoNome,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Preencher nome do usuário");
                    } else {
                      if (campoNome.text.length < 5) {
                        return ("o nome precisa ter mais que 5 carácteres");
                      }
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    labelText: "Nome do usuário",
                  ),
                )
              ],
            ),
          ),
          
          ElevatedButton(

              onPressed: () {
                if (formKey.currentState!.validate()) {
                  mostrarMensagem();
                  senha = int.parse(campoSenha.text);
                  nome = campoNome.text;
                  setState(() {});
                }
              },
              child: Text("Entrar")),
          Text("Valores digitados: $senha, $nome"),
        ],
      )),
    );
  }

void mostrarMensagem(){
  ScaffoldMessenger.of(context).showSnackBar( 
    SnackBar(content: Text('Usuário correto!'))
  );
}


}
