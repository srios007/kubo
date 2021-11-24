class Product {
  String code;
  List<Data> data;

  Product({this.code, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data.add(  Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String categoria;
  String cliente;
  String colores;
  String descripcion;
  String disponible;
  String estado;
  String fechaCreacion;
  String id;
  String nombre;
  String precio;
  String tallas;
  String video;
  String descripcionPromo;
  String idPromocion;
  String valorPromo;
  String idProductoPromo;
  String fechaPromo;
  String estadoPromo;
  String likes;
  String megusta;
  String galeria;
  String imagen;

  Data({
    this.categoria,
    this.cliente,
    this.colores,
    this.descripcion,
    this.disponible,
    this.estado,
    this.fechaCreacion,
    this.id,
    this.nombre,
    this.precio,
    this.tallas,
    this.video,
    this.descripcionPromo,
    this.idPromocion,
    this.valorPromo,
    this.idProductoPromo,
    this.fechaPromo,
    this.estadoPromo,
    this.likes,
    this.megusta,
    this.galeria,
    this.imagen,
  });

  Data.fromJson(Map<String, dynamic> json) {
    categoria = json['categoria'];
    cliente = json['cliente'];
    colores = json['colores'];
    descripcion = json['descripcion'];
    disponible = json['disponible'];
    estado = json['estado'];
    fechaCreacion = json['fecha_creacion'];
    id = json['id'];
    nombre = json['nombre'];
    precio = json['precio'];
    tallas = json['tallas'];
    video = json['video'];
    descripcionPromo = json['descripcion_promo'];
    idPromocion = json['id_promocion'];
    valorPromo = json['valor_promo'];
    idProductoPromo = json['id_producto_promo'];
    fechaPromo = json['fecha_promo'];
    estadoPromo = json['estado_promo'];
    likes = json['likes'];
    megusta = json['megusta'];
    galeria = json['galeria'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoria'] = categoria;
    data['cliente'] = cliente;
    data['colores'] = colores;
    data['descripcion'] = descripcion;
    data['disponible'] = disponible;
    data['estado'] = estado;
    data['fecha_creacion'] = fechaCreacion;
    data['id'] = id;
    data['nombre'] = nombre;
    data['precio'] = precio;
    data['tallas'] = tallas;
    data['video'] = video;
    data['descripcion_promo'] = descripcionPromo;
    data['id_promocion'] = idPromocion;
    data['valor_promo'] = valorPromo;
    data['id_producto_promo'] = idProductoPromo;
    data['fecha_promo'] = fechaPromo;
    data['estado_promo'] = estadoPromo;
    data['likes'] = likes;
    data['megusta'] = megusta;
    data['galeria'] = galeria;
    data['imagen'] = imagen;
    return data;
  }
}
