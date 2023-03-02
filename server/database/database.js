import { Sequelize } from "sequelize";

const database = new Sequelize("stockflow", "root", "", 
  {
    host: "localhost",
    dialect: "mysql"
  }
);

export default database;
