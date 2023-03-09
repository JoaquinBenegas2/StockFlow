import express from "express";
const router = express.Router();

import { loginUsuario, registerUsuario }
from "../controllers/UserController.js";

// Productos
router.post("/register", registerUsuario);
router.post("/login", loginUsuario);

export default router;