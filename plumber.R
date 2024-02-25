box::use(
  src / r / templates,
  htmltools[doRenderTags],
  uuid[UUIDgenerate],
  tibble[tibble],
  purrr[imap_dfr],
  readr[write_csv]
)

#* @serializer html
#* @get /
function() {
  templates$main() |> doRenderTags()
}

#* @serializer html
#* @paser form
#* @post /submit_encuesta
function(req) {
  tryCatch(
    expr = {

      submission_uuid <- UUIDgenerate() |>
        as.character()

      respuestas <- req$body |>
        imap_dfr(
          ~ tibble(
            id = submission_uuid,
            pregunta = .y,
            respuesta = .x
          )
        )

      write_csv(
        respuestas,
        file = "respuestas.csv",
        append = TRUE
      )

      "Gracias por participar en la encuesta!"

    },
    error = function(e) {

      writeLines(as.character(e), stderr())

      "Hubo un error al procesar la encuesta :("
    }
  )
}

#* @assets ./src/static /static
list()
