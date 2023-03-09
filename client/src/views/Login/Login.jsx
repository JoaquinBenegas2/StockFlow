import React from "react"
import { Link } from "react-router-dom"

// Styles
import "./Login.scss"

const Login = () => {
  return (
    <div className="login">
      <div className="card"> 
        <div className="card-header"> 
          <h3> LOGIN </h3>
        </div>
        <div className="card-body">
          <form className="form" action="">
            <div className="form-item">
              <label className="form-label" htmlFor=""> Username: </label>
              <input className="form-input" type="text" />
            </div>
            <div className="form-item">
              <label className="form-label" htmlFor=""> Password: </label>
              <input className="form-input" type="password" />
            </div>
            
            <div className="form-footer"> 
              <button className="button" type="submit"> LOGIN </button>
              <p> Don't have an account? <Link to="/register"> Register </Link> </p>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}

export default Login