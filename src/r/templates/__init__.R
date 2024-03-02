box::use(
  htmltools[tags, div, h1, p, tagList],
)

box::use(
  . / form
)

global_head <- function() {
  tags$head(
    tags$link(
      href = "/static/bootstrap.min.css",
      rel = "stylesheet"
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

#' @title Encuesta Demografica
encuesta_dem <- function() {
  div(
    form$number("dem_edad", "¿Cuantos años tienes?", NA, 15, 100),
    form$choices(
      "dem_genero",
      "¿Cual es tu genero?",
      c("Femenino", "Masculino", "No binario", "Prefiero no decir")
    ),
    form$choices(
      "dem_estudios",
      "¿Cual es to maximo nivel de educación?",
      c(
        "Bachiller",
        "Universitario",
        "Técnico / Tecnólogo",
        "Maestría",
        "Doctorado"
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
        "No vivo en Bogotá",
        "No vivo en Colombia"
      )
    ),
    form$choices(
      "dem_work",
      "¿Utilizas R en tu trabajo?",
      c("Sí", "No")
    ),
    form$choices(
      "dem_worktype",
      "¿Trabajar remoto o presencial?",
      c("Remoto", "Presencial", "Híbrido", "No trabajo")
    )
  )
}

#' @title Encuesta de programación
encuesta_prog <- function() {
  div(
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
        "Avanzado"
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
      c("Sí", "No")
    ),
    form$choices(
      "prog_paquete",
      "¿Has desarrollado paquetes de R?",
      c("Sí", "No")
    ),
    form$choices(
      "prog_api_consumo",
      "¿Has consumido APIs con R?",
      c("Sí", "No")
    ),
    form$choices(
      "prog_api_creacion",
      "¿Has desarrollado APIs con R?",
      c("Sí", "No")
    ),
    form$choices(
      "prog_rmarkdown",
      "¿Has utilizado R en RMarkdown?",
      c("Sí", "No")
    ),
    form$choices(
      "prog_quarto",
      "¿Has utilizado R en Quarto?",
      c("Sí", "No")
    ),
    form$text(
      "prog_lenguajes",
      "¿Qué otros lenguajes de programación utilizas?"
    )
  )
}

#' @title Encuesta de herramientas
encuesta_tools <- function() {
  div(
    form$choices(
      "tools_ide",
      "¿Donde escribes la mayor parte de tu código en R?",
      c(
        "RStudio Desktop",
        "RStudio Server (Open Source)",
        "RStudio Workbench",
        "R Commander",
        "Jupyter Notebook",
        "Notepad++",
        "Google Colab",
        "VSCode",
        "Sublime Text",
        "BlueSky Statistics",
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
        "Looker Data Studio",
        "QuickSight",
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

#' @title Encuesta de intereses
encuesta_interests <- function() {
  div(
    tags$p(
      "Estas preguntas son con el fin de conocer tus intereses y preferencias.",
      "Potencialmente estan relacionadas con futuras actividades del grupo."
    ),
    form$text(
      "int_opensource",
      "¿Estarías interesado en contribuir a proyectos de código abierto? (Si es así, ¿cómo? ¿por qué?)"
    ),
    form$choices(
      "int_stars",
      "¿Cual crees que deberia ser el nivel de las charlas de este Users Group?",
      c(
        "1 estrella (principiantes)",
        "2 estrellas (intermedio)",
        "3 estrellas (avanzado)",
        "Variado (un poco de todo)"
      )
    ),
    form$choices(
      "int_job",
      "¿Estás buscando trabajo relacionado con R?",
      c("Sí", "No")
    )
  )
}

#' @title Encuesta de movilidad
encuesta_movilidad <- function() {
  div(
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
      "¿Te desplazas a diario con un computador portatil?",
      c("Sí", "No")
    ),
    form$choices(
      "mov_seg",
      "¿Te sientes seguro en tu desplazamiento?",
      c("Sí", "No", "No pero no tengo otra opción", "No, prefiero quedarme en casa")
    ),
    form$text(
      "mov_hora",
      "¿En que horario te desplazas?"
    ),
    form$text(
      "mov_seguro",
      "¿Estarias interesado en contratar un seguro para tu equipo poratil?",
    ),
    form$text(
      "mov_dataprotection",
      "¿Usas algun software de proteccion de informacion en caso de robo? (Sí, No, ¿Cual?)"
    )
  )
}

card <- function(title, body) {
  div(
    class = "card mb-3",
    div(
      class = "card-header bg-primary text-white",
      tags$h5(
        class = "card-title",
        title
      )
    ),
    div(
      class = "card-body bg-light",
      body
    )
  )
}

#' @export
main <- function(...) {
  tags$html(
    global_head(),
    tags$body(
      div(
        class = "container py-3",
        div(
          class = "row",
          div(
            card(
              "Encuesta de Usuarios de R en Bogotá",
              div(
                class = "w-100",
                tags$img(
                  src = "/static/banner.webp",
                  width = "250px",
                  class = "rounded mx-auto d-block"
                )
              )
            )
          ),
          tags$form(
            `hx-post` = "/submit_encuesta",
            card("Datos demograficos", encuesta_dem()),
            card("Datos de programación", encuesta_prog()),
            card("Herramientas de programación", encuesta_tools()),
            card("Intereses", encuesta_interests()),
            card("Movilidad", encuesta_movilidad()),
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
}
