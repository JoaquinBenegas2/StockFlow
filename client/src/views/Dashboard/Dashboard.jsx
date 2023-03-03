import React from "react"
import Menu from "./dashboardMenu"

// Styles
import "./Dashboard.scss"

// Assets
import LogoDesign from "../../assets/img/logo-design.png"

// Components
import Sidebar from "../../components/common/Sidebar"
import DashboardHeader from "./DashboardHeader"


const Dashboard = () => {
  const Logo = <img src={ LogoDesign } alt="" />

  return (
    <section className="dashboard">
      <Sidebar logo={Logo} menu={Menu} />
      <DashboardHeader />
    </section>
  )
}

export default Dashboard