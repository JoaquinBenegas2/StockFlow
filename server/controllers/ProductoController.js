// Import Model
import ProductoModel from "../models/ProductoModel.js";


// CRUD Methods

// Show Productos
export const getAllProductos = async (req, res) => {
  try {
    const productos = await ProductoModel.findAll()
    res.json(productos)
  } catch (error) {
    res.json({ message: error.message })
  }
}

// Show a single Producto
export const getProducto = async (req, res) => {
  try {
    const producto = await ProductoModel.findAll({
      where: { id_producto: req.params.id_producto }
    })
    res.json(producto[0])
  } catch (error) {
    res.json({ message: error.message })
  }
}

// Create a Producto
export const createProducto = async (req, res) => {
  try {
    await ProductoModel.create(req.body)
    res.json({
      "message": "¡Row created successfully!"
    })
  } catch (error) {
    res.json({ message: error.message })
  }
}

// Update a Producto
export const updateProducto = async (req, res) => {
  try {
    await ProductoModel.update(req.body, {
      where: { id_producto: req.params.id_producto }
    })
    res.json({
      "message": "¡Row updated successfully!"
    })
  } catch (error) {
    res.json({ message: error.message })
  }
}

// Delete a Producto
export const deleteProducto = async (req, res) => {
  try {
    await ProductoModel.destroy({
      where: { id_producto: req.params.id_producto }
    })
    res.json({
      "message": "¡Row deleted successfully!"
    })
  } catch (error) {
    res.json({ message: error.message })
  }
}