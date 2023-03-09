import { BrowserRouter, Routes, Route } from "react-router-dom";

// Views
import Dashboard from "../views/Dashboard/Dashboard"
import Login from "../views/Login/Login"
import Register from "../views/Register/Register"

export default function RoutesComponent() {
  return(
    <BrowserRouter>
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
        </Routes>
    </BrowserRouter>
  );
}
