import axios from "axios";

export const registerUserRequest = async (user) => {
  return await axios.post("http://localhost:4000/api/auth/register", user);
};
