import '../../database/entity/demo_entity.dart';

/// 数据库示例预览数据
const List<DemoEntity> previewDemoEntities = <DemoEntity>[
  DemoEntity(id: 1, title: '第一条演示记录', description: '展示本地数据库记录内容'),
  DemoEntity(id: 2, title: '第二条演示记录', description: '支持新增、删除和清空操作'),
  DemoEntity(id: 3, title: '第三条演示记录', description: '预览环境不执行真实数据库读写'),
];
