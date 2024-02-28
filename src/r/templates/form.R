box::use(
  htmltools[div, tags],
  purrr[map]
)

number <- function(id, label = NULL, value = 0, min = 0, max = 100, step = 1) {
  div(
    class = "mb-3",
    tags$label(
      `for` = id,
      label
    ),
    tags$input(
      type = "number",
      id = id,
      class = "form-control",
      name = id,
      value = value,
      min = min,
      max = max,
      step = step,
      required = NA
    )
  )
}

choices <- function(id, label = NULL, options = NULL, size = 1) {
  div(
    class = "mb-3",
    tags$label(
      `for` = id,
      label
    ),
    tags$select(
      id = id,
      name = id,
      required = NA,
      class = "form-control",
      map(
        options,
        ~ tags$option(
          value = .x,
          .x
        )
      )
    )
  )
}

text <- function(id, label = NULL, value = "") {
  div(
    class = "mb-3",
    tags$label(
      `for` = id,
      label
    ),
    tags$input(
      required = NA,
      type = "text",
      id = id,
      name = id,
      class = "form-control",
      value = value
    )
  )
}
