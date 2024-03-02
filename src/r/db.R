box::use(
  RSQLite[SQLite],
  DBI[dbExecute, dbDisconnect, dbConnect, dbWriteTable, dbGetQuery],
)

create_db <- function(path) {
  con <- dbConnect(SQLite(), path)
  dbExecute(
    r"(
    CREATE TABLE IF NOT EXISTS respuestas (
      id TEXT,
      pregunta TEXT,
      respuesta TEXT
    )"
  )
  dbDisconnect(con)
}

db_path <- ".secrets/db.sqlite"

if (!file.exists(db_path)) {
  create_db(db_path)
}

conn <- dbConnect(
  SQLite(),
  dbname = db_path
)

#' @export
submit_answer <- function(respuestas) {
  dbWriteTable(
    conn,
    "respuestas",
    respuestas,
    append = TRUE
  )
}

#' @export
leer_respuestas <- function() {
  dbGetQuery(conn, "SELECT * FROM respuestas")
}
