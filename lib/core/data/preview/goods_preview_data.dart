import '../../model/entity/goods/goods.dart';

/// 商品预览数据
///
/// 使用与商品列表接口一致的 [Goods] 类型提供静态展示数据。
const List<Goods> previewGoods = <Goods>[
  Goods(
    id: 1,
    typeId: 1,
    title: '轻量透气日常运动鞋',
    subTitle: '柔软缓震鞋底，适合通勤与日常运动',
    mainPic:
        'https://cdn.dummyjson.com/product-images/mens-shoes/nike-air-jordan-1-red-and-black/thumbnail.webp',
    price: 699,
    sold: 2386,
    recommend: true,
    status: 1,
  ),
  Goods(
    id: 2,
    typeId: 2,
    title: '降噪蓝牙头戴式耳机',
    subTitle: '沉浸式音效，支持长时间无线续航',
    mainPic:
        'https://cdn.dummyjson.com/product-images/mobile-accessories/apple-airpods-max-silver/thumbnail.webp',
    price: 1299,
    sold: 1024,
    featured: true,
    status: 1,
  ),
  Goods(
    id: 3,
    typeId: 3,
    title: '14 英寸轻薄性能笔记本',
    subTitle: '高分辨率屏幕与长效续航，满足移动办公需求',
    mainPic:
        'https://cdn.dummyjson.com/product-images/laptops/apple-macbook-pro-14-inch-space-grey/thumbnail.webp',
    price: 12999,
    sold: 856,
    status: 1,
  ),
  Goods(
    id: 4,
    typeId: 4,
    title: '便携铝制随行杯',
    subTitle: '轻量杯身与简约造型，适合日常通勤携带',
    mainPic:
        'https://cdn.dummyjson.com/product-images/kitchen-accessories/black-aluminium-cup/thumbnail.webp',
    price: 129,
    sold: 5432,
    recommend: true,
    status: 1,
  ),
  Goods(
    id: 5,
    typeId: 5,
    title: '经典简约通勤手提包',
    subTitle: '大容量分区设计，满足通勤与短途出行需求',
    mainPic:
        'https://cdn.dummyjson.com/product-images/mens-bags/dior-carryall-bag/thumbnail.webp',
    price: 299,
    sold: 1678,
    status: 1,
  ),
];
