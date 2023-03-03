import React, { useState }  from "react"
import { Link } from "react-router-dom"

// Styles
import "./Sidebar.scss"

// Components
import MenuIcon from "./MenuIcon"

const Sidebar = ({ menu, logo }) => {
  const [open, setOpen] = useState(true)

  const handleBarsClick = () => {
    setOpen(!open)
  }

  return (
    <div className={`sidebar ${ open ? "open" : "" }`.trimEnd()}>
      <div className={`sidebar-header ${!open ? "close" : ""}`.trimEnd()}>
        <div className="header-icon">
          <MenuIcon open={open} handleBarsClick={handleBarsClick} />
        </div>
        <div className="header-logo">
          { logo }
        </div>
      </div>

      <div className="sidebar-menu">
        { menu?.map( (item, i) => (
          <Link 
            key={i}
            to={item?.link} 
            className={ `sidebar-menu-item ${item.active ? "active " : ""}` + `${!open ? "close" : ""}`.trimEnd() }
          > 
            {item?.icon}
            <p> {item?.text} </p> 
          </Link>
        ) ) }
      </div>
    </div>
  )
}

export default Sidebar