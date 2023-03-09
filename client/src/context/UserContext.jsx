import React, { createContext, useContext, useRef, useState } from 'react'

import initialForm from '../views/Register/initialForm'
import validateForm from '../views/Register/validateForm'

import { registerUserRequest } from "../api/users.api"

export const UserContext = createContext()

export const useUser = () => {
  const context = useContext(UserContext)

  if (!context) {
    throw new Error ("useUser must be used within a UserContextProvider")
  }

  return context
}

export const UserContextProvider = ({ children }) => {
  const [form, setForm] = useState(initialForm)
  const [errors, setErrors] = useState({})
  const [loading, setLoading] = useState(false)
  const [response, setResponse] = useState({})

  const timerId = useRef(null)


  const handleChange = (e) => {
    const { name, value } = e.target
    
    setForm({
      ...form,
      [name]: value
    })
  }

  const handleBlur = (e) => {
    handleChange(e) // Update State
    setErrors(validateForm(form))
  } 

  const clearResponse = () => {
    clearTimeout(timerId.current)
    timerId.current = null
    setResponse({})
  }

  const showResponse = (response) => {
    setResponse(response)
    if (timerId.current) {
      clearTimeout(timerId.current)
      timerId.current = window.setTimeout(clearResponse, 5000)
    } else {
      timerId.current = window.setTimeout(clearResponse, 5000)
    }
  }

  const handleSubmit = async(e) => {
    e.preventDefault()
    
    if (Object.keys(errors).length === 0) {
      const { username, email, password} = form
      const data = { username, email, password}
      setLoading(true)

      try {
        const response = await registerUserRequest(data)
        console.log(response)
        
        if (!response.data.error) {
            setForm(initialForm)
        }

        setLoading(false)
        showResponse(response)
      } catch (error) {
        console.error(error)
        setLoading(false)
      }
    }
  }

  return (
    <UserContext.Provider
      value={
        {
          form,
          errors,
          loading,
          response,
          handleChange,
          handleBlur,
          handleSubmit
        }
      }
    >
      { children }
    </UserContext.Provider>
  )
}
