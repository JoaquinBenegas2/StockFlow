import express from "express";
const router = express.Router();

import 
{
  getAllProductos, 
  getProducto,
  createProducto,
  updateProducto,
  deleteProducto 
}
from "../controllers/ProductController.js";

// Productos
router.get("/", getAllProductos);
router.get("/:id_producto", getProducto);
router.post("/create", createProducto);
router.put("/update/:id_producto", updateProducto);
router.delete("/delete/:id_producto", deleteProducto);

export default router;