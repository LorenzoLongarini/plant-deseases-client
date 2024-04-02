import 'package:flutter/material.dart';
import 'package:plant_deseases_client/providers/llm_provider.dart';
import 'package:provider/provider.dart';

class LlmView extends StatefulWidget {
  const LlmView({super.key});

  @override
  State<LlmView> createState() => _LlmViewState();
}

class _LlmViewState extends State<LlmView> {
  TextEditingController newQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: newQueryController,
                decoration: const InputDecoration(
                  labelText: 'Question',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amberAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.purple)),
              child: const Text("Add"),
              onPressed: () {
                Provider.of<LlmProvider>(context, listen: false)
                    .addAnswer(newQueryController.text)
                    .then(
                      (value) =>
                          Provider.of<LlmProvider>(context, listen: false)
                              .getAnswer(),
                    );
                newQueryController.clear();
              },
            )
          ],
        ),
        FutureBuilder(
          future: Provider.of<LlmProvider>(context, listen: false).getAnswer(),
          builder: (ctx, snapshot) {
            // wait = snapshot.connectionState == ConnectionState.waiting;
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<LlmProvider>(
                    child: Center(
                      heightFactor: MediaQuery.of(context).size.height * 0.03,
                      child: const Text(
                        'You have no tasks.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    builder: (ctx, llmProvider, child) => llmProvider
                            .items.isEmpty
                        ? child as Widget
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: ListView.builder(
                                itemCount: llmProvider.items.length,
                                itemBuilder: (ctx, i) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: ListTile(
                                    tileColor: Colors.black12,
                                    title: Text(
                                        "${llmProvider.items[i].id}:${llmProvider.items[i].answer}"),
                                    trailing: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          Provider.of<LlmProvider>(context,
                                                  listen: false)
                                              .deleteAnswer(
                                                  llmProvider.items[i].id);
                                        }),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                  );
          },
        ),
      ],
    );
  }
}
