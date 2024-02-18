library(shiny)
library(shinysurveys)
library(googlesheets4)

options(
  # whenever there is one account token found, use the cached token
  gargle_oauth_email = TRUE,
  # specify auth tokens should be stored in a hidden directory ".secrets"
  gargle_oauth_cache = ".secrets"
)

gs4_auth(cache = ".secrets", email = "frenk.giorgetti@gmail.com")

df <- read_sheet("1XVQRWdx3f-W9pbRRCp3lP6lipXy386PXxfSSMspjiCg", sheet = "Sheet1")



ui <- fluidPage(
  surveyOutput(df = df, 
               survey_title = "Hola Bogotá R Users Group!",
               survey_description = "Bienvenidos! Participar en esta encuesta nos va a ayudar a conocernos mejor y crear mejores eventos.")
)

server <- function(input, output, session) {
  renderSurvey()
  
  observeEvent(input$submit, {
    # print(getSurveyData())
    showModal(
      modalDialog(title = "Mil Gracias! Nos vemos pronto!")
      )
  })
}

shinyApp(ui, server)

