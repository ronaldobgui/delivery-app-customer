import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class EnderecoAdd extends StatefulWidget {
  static const routeName = '/endereco-add';

  const EnderecoAdd({Key? key}) : super(key: key);

  @override
  State<EnderecoAdd> createState() => _EnderecoAddState();
}

class _EnderecoAddState extends State<EnderecoAdd> {
  late final GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace('AIzaSyCPUbNceTz40d8tlp66hega2LGEJeCn4v0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Endereço'),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Apelido',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Endereço',
                    ),
                    onChanged: (value) async {
                      if (value.isEmpty) {
                        debugPrint('error');
                        setState(() {
                          predictions = [];
                        });
                      }
                      //
                      else {
                        try {
                          var result = await googlePlace.autocomplete.get(
                            value,
                            language: 'pt_BR',
                          );
                          debugPrint(result.toString());
                          //
                          if (result != null && result.predictions != null) {
                            debugPrint(result.predictions!.length.toString());
                            setState(() {
                              predictions = result.predictions!;
                            });
                          }
                          //
                          else {
                            setState(() {
                              predictions = [];
                            });
                          }
                        }
                        //
                        catch (error) {
                          debugPrint(error.toString());
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (predictions.isNotEmpty) {
                  return ListView.separated(
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(predictions[index].description!),
                        onTap: () {
                          // debugPrint(predictions[index].placeId);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                        color: Colors.black26,
                      );
                    },
                  );
                }
                //
                else {
                  return const Text('Comece a digitar exibir as sugestões');
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
