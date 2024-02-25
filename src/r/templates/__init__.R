box::use(
  htmltools[tags, div, h1, p, tagList],
)

box::use(
  . / form
)

global_head <- function() {
  tags$head(
    tags$link(
      href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css",
      rel = "stylesheet",
      integrity = "sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH",
      crossorigin = "anonymous"
    ),
    tags$script(
      src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js",
      integrity = "sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz",
      crossorigin = "anonymous"
    ),
    tags$script(
      src = "https://unpkg.com/htmx.org@1.9.10",
      integrity = "sha384-D1Kt99CQMDuVetoL1lrYwg5t+9QdHe7NLX/SoJYkXDFfX37iInKRy5xLSi8nO7UC",
      crossorigin = "anonymous"
    )
  )
}

encuesta_dem <- function() {
  div(
    tags$h3("Datos demograficos"),
    tags$hr(),
    form$number("dem_edad", "¿Cuantos años tienes?", 18, 18, 100),
    form$choices(
      "dem_genero",
      "¿Cual es tu genero?",
      c("Dama", "Caballero", "No binario", "Prefiero no decir")
    ),
    form$choices(
      "dem_estudios",
      "¿Cual es to maximo nivel de educación?",
      c(
        "Colegio",
        "Diplomado",
        "Licenciado",
        "MSc",
        "Phd"
      )
    ),
    form$text(
      "dem_ciudad",
      "¿En que ciudad vives?"
    ),
    form$choices(
      "dem_localidad",
      "¿En que localidad de Bogotá vives?",
      c(
        "Antonio Nariño",
        "Barrios Unidos",
        "Bosa",
        "Chapinero",
        "Ciudad Bolívar",
        "Engativá",
        "Fontibón",
        "Kennedy",
        "La Candelaria",
        "Los Mártires",
        "Puente Aranda",
        "Rafael Uribe Uribe",
        "San Cristóbal",
        "Santa Fe",
        "Suba",
        "Sumapaz",
        "Teusaquillo",
        "Tunjuelito",
        "Usaquén",
        "Usme",
        "No vivo en Bogotá"
      )
    ),
    form$choices(
      "dem_work",
      "¿Utilizas R en tu trabajo?",
      c("Si", "No")
    ),
    form$choices(
      "dem_worktype",
      "¿Trabajar remoto o presencial?",
      c("Remoto", "Presencial", "Mixto")
    )
  )
}

encuesta_prog <- function() {
  div(
    tags$h3("Datos de programación"),
    tags$hr(),
    form$choices(
      "prog_exp",
      "¿Cuantos años de experiencia tienes programando en R?",
      c(
        "Menos de 1 año",
        "1-3 años",
        "4-8 años",
        "9-15 años",
        "Más de 15 años"
      )
    ),
    form$choices(
      "prog_level",
      "¿Cúal consideras ser tu nivel en R?",
      c(
        "¿Qué es R?",
        "Principiante",
        "Intermedio",
        "Avanzado",
        "Gurú"
      )
    ),
    form$choices(
      "prog_freq",
      "¿Con qué frecuencia programas en R?",
      c(
        "Nunca",
        "Un vez al año",
        "Un vez al mes",
        "Un vez a la semana",
        "Varios veces a la semana",
        "Todos los días"
      )
    ),
    form$text(
      "prog_activity",
      "¿Qué tipo de actividades realizas con R?"
    ),
    form$choices(
      "prog_shiny",
      "¿Has desarrollado aplicaciones con Shiny?",
      c("Si", "No")
    ),
    form$choices(
      "prog_paquete",
      "¿Has desarrollado paquetes de R?",
      c("Si", "No")
    ),
    form$choices(
      "prog_api",
      "¿Has consumido APIs con R?",
      c("Si", "No")
    ),
    form$choices(
      "prog_quarto",
      "¿Has utilizado R en Quarto?",
      c("Si", "No")
    ),
    form$text(
      "prog_lenguajes",
      "¿Qué otros lenguajes de programación utilizas?"
    )
  )
}

encuesta_tools <- function() {
  div(
    tags$h3("Herramientas de programación"),
    tags$hr(),
    form$choices(
      "tools_ide",
      "¿Donde escribes la mayor parte de tu código en R?",
      c(
        "RStudio Desktop",
        "RStudio Workbench",
        "VSCode",
        "Sublime Text",
        "Vim / Neovim",
        "Otros IDEs",
        "No escribo código en R"
      )
    ),
    form$choices(
      "tools_vc",
      "¿Utilizas control de versiones? ¿Cual?",
      c(
        "No utilizo control de versiones",
        "GitHub",
        "GitLab",
        "Bitbucket",
        "SVN",
        "Gitea",
        "Otro"
      )
    ),
    form$text(
      "tools_favpack",
      "Nombre 3 de tus paquetes favoritos de R",
    ),
    form$choices(
      "tools_bi",
      "¿Cuál de estas herramientas de BI utilizas más?",
      c(
        "Power BI",
        "Tableau",
        "Grafana",
        "Spotfire",
        "Qlik",
        "Looker",
        "Otro",
        "No utilizo herramientas de BI"
      )
    ),
    form$choices(
      "tools_os",
      "¿Cúal es tu sistema operativo principal?",
      c(
        "Windows",
        "MacOS",
        "Linux",
        "Otro"
      )
    )
  )
}

encuesta_interests <- function() {
  div(
    tags$h3("Intereses"),
    tags$hr(),
    form$text(
      "int_opensource",
      "¿Estarías interesado en contribuir a proyectos de código abierto?"
    ),
    form$choices(
      "int_stars",
      "¿Cual crees que deberia ser el nivel de las charlas de este Users Group?",
      c(
        "1 estrella",
        "2 estrellas",
        "3 estrellas",
        "Variado"
      )
    ),
    form$text(
      "int_job",
      "¿Estás interesado en cambiar de trabajo?"
    )
  )
}

encuesta_movilidad <- function() {
  div(
    tags$h3("Movilidad"),
    tags$hr(),
    form$choices(
      "mov_medio",
      "¿Cual es tu medio de transporte principal?",
      c(
        "A pie",
        "Bicicleta",
        "Moto",
        "Carro",
        "Transporte público",
        "Taxi / Plataforma"
      )
    ),
    form$choices(
      "mov_portatil",
      "¿Cargas contigo un computador portatil?",
      c("Si", "No")
    ),
    form$choices(
      "mov_seg",
      "¿Te sientes seguro en tu desplazamiento?",
      c("Si", "No", "No pero no tengo otra opción", "No, prefiero quedarme en casa")
    ),
    form$text(
      "mov_hora",
      "¿En que horario te desplazas?"
    ),
    form$text(
      "mov_seguro",
      "¿Estarias interesado en contratar un seguro apra tu equipo poratil?",
    ),
    form$text(
      "mov_dataprotection",
      "¿Usas algun software de proteccion de informacion en caso de robo?"
    )
  )
}

#' @export
main <- function(...) {
  tags$html(
    global_head(),
    tags$body(
      div(
        class = "container",
        div(
          class = "row",
          div(
            class = "col",
            div(
              class = "card",
              div(
                class = "card-header",
                div(
                  class = "row",
                  div(
                    class = "col text-center align-self-center position-relative",
                    h1("Encuesta 2024"),
                    tags$img(
                      src = "/static/banner.webp",
                      align = "right",
                      class = "position-absolute top-0 end-0 h-100"
                    )
                  )
                )
              ),
              div(
                class = "card-body",
                p("Bienvenido a la encuesta 2024"),
                p("Por favor, responda las siguientes preguntas"),
                tags$form(
                  `hx-post` = "/submit_encuesta",
                  encuesta_dem(),
                  encuesta_prog(),
                  encuesta_tools(),
                  encuesta_interests(),
                  encuesta_movilidad(),
                  div(
                    class = "mb-3",
                    tags$input(
                      type = "submit",
                      class = "btn btn-primary",
                      value = "Enviar"
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
}
