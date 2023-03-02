import express from "express"
import { urlencoded } from "express";
import cors from "cors"
import database from "./database/database.js"

// Import Routers
import productosRoutes from "./routes/productosRoutes.js"


const app = express();


// Config / Middlewares:
app.use(cors())
app.use(express.json());
app.use(urlencoded({extended: false}));
//----------------------------------------------------------


// Database connection:
try {
  await database.authenticate()
  console.log("Successful connection to the Database")
} catch (error) {
  console.log("Error: ", error);
}
//----------------------------------------------------------


// Routes:
app.use("/productos", productosRoutes);
//----------------------------------------------------------


// Starting Server:
app.listen(4000, () => {
  console.log(`Server UP running in http://localhost:4000/`);
});
//----------------------------------------------------------