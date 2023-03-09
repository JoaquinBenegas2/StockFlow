import {
  regexEmail,
  regexUsername,
  regexPassword,
  regexUsernameMin,
  regexUsernameMax,
  regexPasswordMin,
} from "../../utils/regularExpresions";

const validateForm = (form) => {
  let errors = {};

  // Email
  if (!form.email.trim()) {
    errors.email = "The field is required";
  } else if (!regexEmail.test(form.email.trim())) {
    errors.email = "The field contains invalid characters";
  }

  // Username
  else if (!form.username.trim()) {
    errors.username = "The field is required";
  } else if (!regexUsernameMin.test(form.username.trim())) {
    errors.username = "The field requires at least 3 characters";
  } else if (!regexUsernameMax.test(form.username.trim())) {
    errors.username = "The field can have a maximum of 32 characters";
  } else if (!regexUsername.test(form.username.trim())) {
    errors.username = "The field contains invalid characters";
  }

  // Password
  else if (!form.password.trim()) {
    errors.password = "The field is required";
  } else if (!regexPasswordMin.test(form.password.trim())) {
    errors.password = "The field requires at least 8 characters";
  } else if (!regexPassword.test(form.password.trim())) {
    errors.password = "Include lowercase, uppercase and at least one number";
  }

  // Repeated Password
  else if (!form.repeatedPassword.trim()) {
    errors.repeatedPassword = "The field is required";
  } else if (form.repeatedPassword !== form.password) {
    errors.repeatedPassword = "Both password fields must match";
  }

  return errors;
};

export default validateForm;
