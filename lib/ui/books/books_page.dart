import 'package:default_project/cubits/book/books_cubit.dart';
import 'package:default_project/data/models/books/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  void initState() {
    BlocProvider.of<BooksCubit>(context).getAllBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books Page"),
      ),
      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state.formzStatus == FormzStatus.submissionInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.formzStatus == FormzStatus.submissionFailure) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return ListView(
              children: List.generate(
                state.books.length,
                (index) => ListTile(
                  title: Text(state.books[index].title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context
                          .read<BooksCubit>()
                          .deleteBookById(state.books[index].id);
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "asdfgf",
            onPressed: () => context.read<BooksCubit>().getAllBooks(),
            child: const Icon(Icons.download),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "qwer",
            onPressed: () {
              BookModel bookModel = BookModel(
                id: -1,
                title: "Sho'x bola",
                genre: 4,
                isbn: "",
                language: 0,
                numberOfPages: 200,
                price: 30000,
                publisherId: 5,
                publishYear: 2022,
              );
              context.read<BooksCubit>().addBook(bookModel);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
