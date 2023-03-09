import React from "react"
import { Link } from "react-router-dom"

import { useUser } from "../../context/UserContext"

// Styles
import "./Register.scss"

const Register = () => { 
  const { form, errors, loading, response, handleChange, handleBlur, handleSubmit } = useUser()

  return (
    <div className="register">
      <div className="card"> 
        <div className="card-header"> 
          <h3> REGISTER </h3>
        </div>
        <div className="card-body">
          <form className="form" onSubmit={handleSubmit}>
            <div className="form-item">
              <div className="form-label-container">
                <label className={`form-label ${errors.email ? "label-error" : ""}`.trimEnd()}> Email: </label>
                { errors.email && <p className="form-error"> {errors.email} </p>}
              </div>
              <input 
                type="email" 
                name="email"
                className={`form-input ${errors.email ? "input-error" : ""}`.trimEnd()} 
                value={form.email} 
                onChange={handleChange}   
                onBlur={handleBlur}    
                required 
              />
              
            </div>
            <div className="form-item">
              <div className="form-label-container">
                <label className={`form-label ${errors.username ? "label-error" : ""}`.trimEnd()}> Username: </label>
                { errors.username && <p className="form-error"> {errors.username} </p>}
              </div>
              <input 
                type="text" 
                name="username"
                className={`form-input ${errors.username ? "input-error" : ""}`.trimEnd()} 
                value={form.username} 
                onChange={handleChange}   
                onBlur={handleBlur}    
                required 
              />
            </div>
            <div className="form-item">
              <div className="form-label-container">
                <label className={`form-label ${errors.password ? "label-error" : ""}`.trimEnd()}> Password: </label>
                { errors.password && <p className="form-error"> {errors.password} </p>}
              </div>
              <input 
                type="password" 
                name="password"
                className={`form-input ${errors.password ? "input-error" : ""}`.trimEnd()} 
                value={form.password} 
                onChange={handleChange}   
                onBlur={handleBlur}    
                required 
              />
            </div>
            <div className="form-item">
              <div className="form-label-container">
                <label className={`form-label ${errors.repeatedPassword ? "label-error" : ""}`.trimEnd()}> Repeat Password: </label>
                { errors.repeatedPassword && <p className="form-error"> {errors.repeatedPassword} </p>}
              </div>
              <input 
                type="password" 
                name="repeatedPassword"
                className={`form-input ${errors.repeatedPassword ? "input-error" : ""}`.trimEnd()} 
                value={form.repeatedPassword} 
                onChange={handleChange}   
                onBlur={handleBlur}    
                required 
              />
            </div>

            <div className="form-footer"> 
              <div 
                className={
                `
                  form-response 
                  ${ response?.data?.error ? "error" : response?.data?.message && "succes" } 
                  ${ Object.keys(response).length === 0 ? "hide-response" : "" }
                `.trimEnd()}
              > 
                { response?.data?.error ? response.data.error : response?.data?.message && response.data.message } 
              </div>
              <button 
                className="button" 
                type="submit" 
                disabled={ loading }
              > 
                REGISTER 
              </button>
              <p> Already have an account? <Link to="/login"> Login </Link> </p>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}

export default Register