export const regexUsernameMin = /^.{3,}$/
export const regexUsernameMax = /^.{0,32}$/
export const regexUsername = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{3,32}$/

export const regexEmail = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/

export const regexPasswordMin = /^.{8,}$/
export const regexPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/