import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/model/soft_skill_model.dart';
import 'package:myportfolio_getx_mvvm/viewmodel/soft_skill_viemodel.dart';

class SoftSkillView extends StatelessWidget {
  final SoftSkillViewModel _controller = Get.put(SoftSkillViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soft Skills'),
      ),
      body: GetBuilder<SoftSkillViewModel>(
        builder: (_controller) => ListView.builder(
          itemCount: _controller.softSkills.length,
          itemBuilder: (context, index) {
            SoftSkillModel skill = _controller.softSkills[index];
            return Column(
              children: [
                Image.network(skill.imageUrl),
                Text(skill.title),
                Text(skill.description),
              ],
            );
          },
        ),
      ),
    );
  }
}
