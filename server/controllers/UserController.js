// Import Model
import UsuarioModel from "../models/UsuarioModel.js";

import bcrypt from "bcrypt";

import { Op } from "sequelize"

// CRUD Methods

// Register a Usuario
export const registerUsuario = async (req, res) => {
  try {
    const { username, email, password } = req.body;
    const password_hash = await bcrypt.hash(password, 10);

    const exists = await UsuarioModel.findOne({
      where: { 
        [Op.or]: [
          { nombre_usuario: username },
          { email: email }
        ]
      }
    })

    if (exists) {
      res.json({ error: "The user already Exists" })
    } else {
      await UsuarioModel.create({
        nombre_usuario: username,
        email: email,
        contraseña: password_hash
      });
      res.json({
        message: "¡Row created successfully!",
      });
    }

  } catch (error) {
    res.json({ message: error.message });
  }
};

// Usuario Login
export const loginUsuario = async (req, res) => {
  const { username, password} = req.body
  
  const usuario = await UsuarioModel.findOne({
    where: {nombre_usuario: username}
  })

  if (!usuario) {
    res.json({ error: "User Does not Exist" })
  }
  
  else if (! (await bcrypt.compare(password, usuario.contraseña)) ) {
    res.json({ error: "User and password Do not Match" })
  }

  else {
    res.json({ message: "Successful login" })
  }
}
