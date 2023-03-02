import { BrowserRouter, Routes, Route } from "react-router-dom";

// Views
import Dashboard from "../views/Dashboard"

export default function RoutesComponent() {
  return(
    <BrowserRouter>
      <Routes>
        <Route path="/dashboard" element={<Dashboard />} />
      </Routes>
    </BrowserRouter>
  );
}
