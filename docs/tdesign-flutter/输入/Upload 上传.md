# Upload 上传

> 用于相册读取或拉起拍照的图片上传功能。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/upload)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_upload_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_upload_page.dart)

#### 1 组件类型

单选上传

```
  Widget _uploadSingle(BuildContext context) {
    return wrapDemoContainer('单选上传',
        child: TDUpload(
          files: files1,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files1, files, type)),
        ));
  }
```

单选上传(替换)

```
  Widget _uploadSingleWithReplace(BuildContext context) {
    return wrapDemoContainer('单选上传(替换)',
        child: TDUpload(
          files: files6,
          width: 60,
          height: 60,
          type: TDUploadBoxType.circle,
          enabledReplaceType: true,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files6, files, type)),
        ));
  }
```

多选上传

```
  Widget _uploadMultiple(BuildContext context) {
    return wrapDemoContainer('多选上传',
        child: TDUpload(
          files: files2,
          multiple: true,
          max: 9,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files2, files, type)),
        ));
  }
```

自定义upload按钮事件

```
  Widget _uploadTap(BuildContext context) {
    return wrapDemoContainer('自定义upload按钮事件',
        child: TDUpload(
          files: files7,
          multiple: true,
          max: 9,
          onUploadTap: onUploadTap,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files7, files, type)),
        ));
  }
```

#### 1 组件状态

加载状态

```
  Widget _uploadLoading(BuildContext context) {
    return wrapDemoContainer('上传图片',
        child: TDUpload(
          files: files3,
          multiple: true,
          max: 9,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files3, files, type)),
        ));
  }
```

重新上传

```
  Widget _uploadRetry(BuildContext context) {
    return wrapDemoContainer('上传图片',
        child: TDUpload(
          files: files4,
          multiple: true,
          max: 9,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files4, files, type)),
        ));
  }
```

上传失败

```
  Widget _uploadError(BuildContext context) {
    return wrapDemoContainer('上传图片',
        child: TDUpload(
          files: files5,
          multiple: true,
          max: 9,
          onClick: onClick,
          onCancel: onCancel,
          onError: print,
          onValidate: print,
          onChange: ((files, type) => onValueChanged(files5, files, type)),
        ));
  }
```

## API

1. [TDUpload](#tdupload)

#### TDUpload

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| disabled | bool? | false | 是否禁用 |
| enabledReplaceType | bool? | false | 是否启用replace功能 |
| files | List | - | 控制展示的文件列表 |
| height | double? | 80.0 | 图片高度 |
| key |  | - |  |
| max | int | 0 | 用于控制文件上传数量，0为不限制，仅在multiple为true时有效 |
| mediaType | List | const [TDUploadMediaType.image, TDUploadMediaType.video] | 支持上传的文件类型，图片或视频 |
| multiple | bool | false | 是否多选上传，默认false |
| onCancel | VoidCallback? | - | 监听取消上传 |
| onChange | TDUploadValueChangedEvent? | - | 监听添加, 删除和替换media事件 |
| onClick | TDUploadClickEvent? | - | 监听点击图片位 |
| onError | TDUploadErrorEvent? | - | 监听获取资源错误 |
| onMaxLimitReached | VoidCallback? | - | 监听文件超过最大数量 |
| onUploadTap | VoidCallback? | - | 自定义upload按钮事件 |
| onValidate | TDUploadValidatorEvent? | - | 监听文件校验出错 |
| sizeLimit | double? | - | 图片大小限制，单位为KB |
| type | TDUploadBoxType | TDUploadBoxType.roundedSquare | Box类型 |
| width | double? | 80.0 | 图片宽度 |
| wrapAlignment | WrapAlignment? | - | 多图对齐方式 |
| wrapRunSpacing | double? | - | 多图布局时的 runSpacing |
| wrapSpacing | double? | - | 多图布局时的 spacing |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

当需要进行图片上传时使用。

#### 组件搭配使用

###### 通常用于图片上传，点击上传按钮可唤起[动作面板](<../反馈/ActionSheet 动作面板.md>)，供用户选择不同渠道进行新的上传。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-1.png)

---

###### 点击已经上传的图片可跳转[图片预览](<../数据展示/ImageViewer 图片预览.md>)，让用户对已上传的图片进行快速查看。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-2.png)

#### 推荐/慎用示例

###### 若上传的文件有尺寸、格式、数量限制，推荐在文案中进行明确标识。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

---

###### 上传特定证件图片，特别是涉及到证件正反面时，推荐结合图示进行上传指引，更加直观。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)
