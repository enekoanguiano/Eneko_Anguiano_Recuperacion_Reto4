#*Transforma una variable categórica en Dummies
#*@param variable Nombre de la variable a transformar
#*@get /transformar
function(variable) {
  if (!variable %in% colnames(datos_imputado)) {
    return(list(
      status = "error",
      mensaje = paste("La variable", variable, "no existe en los datos")
    ))
  }
  if (is.factor(datos_imputado[[variable]]) || is.character(datos_imputado[[variable]])) {
    datos_imputado[[variable]] <-
      as.factor(datos_imputado[[variable]])
    dummies <- model.matrix(~ . - 1, data =
                              datos_imputado[variable])
    return(list(
      status="ok",
      mensaje=paste("Variable", variable, "transformada a Dummies"),
      columnas_dummies = colnames(dummies),
      data=as.data.frame(dummies)
    ))
  } else {
    return(list(
      status="error",
      mensaje = paste("La variable", variable, "no es categorica")
    ))
  }
}
