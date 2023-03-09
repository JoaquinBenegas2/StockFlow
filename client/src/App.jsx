import React from "react";
import RoutesComponent from "./routes/routes"
import { UserContextProvider } from "./context/UserContext"

function App() {
  return (
    <UserContextProvider>
      <RoutesComponent />
    </UserContextProvider>
  );
}

export default App;
