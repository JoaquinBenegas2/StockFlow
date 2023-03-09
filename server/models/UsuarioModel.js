// Import connection
import database from "../database/database.js";

// Import sequelize
import { DataTypes } from "sequelize";

const UsuarioModel = database.define(
  "usuarios",
  {
    id_usuario: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    nombre_usuario: { 
      type: DataTypes.STRING 
    },
    dni: { 
      type: DataTypes.INTEGER 
    },
    nombre: { 
      type: DataTypes.STRING 
    },
    apellido: { 
      type: DataTypes.STRING 
    },
    razon_social: { 
      type: DataTypes.STRING 
    },
    cuit: { 
      type: DataTypes.STRING 
    },
    eslogan: { 
      type: DataTypes.STRING 
    },
    telefono: { 
      type: DataTypes.STRING 
    },
    email: { 
      type: DataTypes.STRING 
    },
    direccion: { 
      type: DataTypes.STRING 
    },
    barrio: { 
      type: DataTypes.STRING 
    },
    provincia: { 
      type: DataTypes.STRING 
    },
    contraseña: { 
      type: DataTypes.STRING 
    }
  }, 
  {
    timestamps: false,
  }
);

UsuarioModel.associate = (models) => {
  UsuarioModel.hasMany(models.productos)
}

export default UsuarioModel;
