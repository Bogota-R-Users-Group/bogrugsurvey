box::use(
  src / r / templates,
  htmltools[doRenderTags],
  uuid[UUIDgenerate],
  tibble[tibble],
  purrr[imap_dfr],
)

box::use(
  src / r / db[submit_answer, leer_respuestas]
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

      submit_answer(respuestas)

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

#* @serializer csv
#* @get /api/respuestas
function() {
  leer_respuestas()
}
