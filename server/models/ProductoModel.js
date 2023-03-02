// Import connection
import database from "../database/database.js";

// Import sequelize
import { DataTypes } from "sequelize";

const ProductoModel = database.define("productos", 
  {
    id_producto: { type: DataTypes.INTEGER, primaryKey: true },
    id_imagen_producto: { type: DataTypes.INTEGER },	
    nombre: { type: DataTypes.STRING },
    id_categoria: { type: DataTypes.INTEGER },
    modelo: { type: DataTypes.STRING },
    id_marca: { type: DataTypes.INTEGER },
    id_color: { type: DataTypes.INTEGER },
    id_pais: { type: DataTypes.INTEGER },
    caracteristicas: { type: DataTypes.STRING },
    peso: { type: DataTypes.INTEGER },
    id_unidad_peso: { type: DataTypes.INTEGER },
    alto: { type: DataTypes.INTEGER },
    ancho: { type: DataTypes.INTEGER },
    profundidad: { type: DataTypes.INTEGER },
    id_unidad_longitud: { type: DataTypes.INTEGER },
    garantia: { type: DataTypes.INTEGER },
    stock: { type: DataTypes.INTEGER },
    precio_actual: { type: DataTypes.INTEGER },
    id_usuario: { type: DataTypes.INTEGER }
  },
  {
    timestamps: false
  }
);

export default ProductoModel;