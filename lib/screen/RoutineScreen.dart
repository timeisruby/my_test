import 'package:flutter/material.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/select');
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.amber.shade600,
          title: Text("Routine Page"),
          bottom: TabBar(
            tabs: [
              Tab(text: "가슴"),
              Tab(text: "어깨"),
              Tab(text: "등"),
              Tab(text: "하체"),
              Tab(text: "이두"),
              Tab(text: "삼두"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ExerciseCategory(category: "가슴운동"),
            ExerciseItem(name: "밀리터리프레스", description: "어깨 운동"),
            ExerciseItem(name: "데드리프트", description: "등 운동"),
            ExerciseItem(name: "스쿼트", description: "하체 운동"),
            ExerciseItem(name: "덤벨 컬", description: "이두 운동"),
            ExerciseItem(name: "삼두운동", description: "삼두 운동"),
          ],
        ),
      ),
    );
  }
}

class ExerciseCategory extends StatelessWidget {
  final String category;

  const ExerciseCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExerciseItem(name: "벤치 프레스", description: category),
        ExerciseItem(name: "덤벨 프레스", description: category),
        ExerciseItem(name: "딥스 프레스", description: category),
        ExerciseItem(name: "푸시업", description: category),
        ExerciseItem(name: "딥스", description: category),
      ],
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final String name;
  final String description;

  const ExerciseItem(
      {super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        onTap: () {
          _showSetsDialog(context);
        },
      ),
    );
  }

  void _showSetsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          int selectSets = 0;
          int selectedReps = 0;
          return AlertDialog(
            title: Text("Select Set"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "세트 수"),
                      onChanged: (value) {
                        selectSets = int.tryParse(value) ?? 1;
                      },
                    ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "반복 횟수"),
                        onChanged: (value) {
                          selectedReps = int.tryParse(value) ?? 10;
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("확인")),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 취소 버튼
                },
                child: Text("취소"),
              ),
            ],
          );
        });
  }
}
