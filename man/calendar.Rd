% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calendar.R
\name{calendar}
\alias{calendar}
\alias{update_calendar}
\title{Create Semantic UI Calendar}
\usage{
calendar(
  input_id,
  value = NULL,
  placeholder = NULL,
  type = "date",
  min = NA,
  max = NA
)

update_calendar(session, input_id, value = NULL, min = NULL, max = NULL)
}
\arguments{
\item{input_id}{ID of the calendar that will be updated}

\item{value}{Initial value of the numeric input.}

\item{placeholder}{Text visible in the input when nothing is inputted.}

\item{type}{Select from \code{'year'}, \code{'month'}, \code{'date'} and \code{'time'}}

\item{min}{Minimum allowed value.}

\item{max}{Maximum allowed value.}

\item{session}{The \code{session} object passed to function given to
\code{shinyServer}.}
}
\description{
This creates a default calendar input using Semantic UI. The input is available
under \code{input[[input_id]]}.

This function updates the date on a calendar
}
\examples{
# Basic calendar
if (interactive()) {

  library(shiny)
  library(shiny.semantic)

  ui <- shinyUI(
    semanticPage(
      title = "Calendar example",
      calendar("date"),
      p("Selected date:"),
      textOutput("selected_date")
    )
  )

   server <- shinyServer(function(input, output, session) {
     output$selected_date <- renderText(
       as.character(input$date)
     )
   })

   shinyApp(ui = ui, server = server)
 }

\dontrun{
# Calendar with max and min
calendar(
  name = "date_finish",
  placeholder = "Select End Date",
  min = "2019-01-01",
  max = "2020-01-01"
)

# Selecting month
calendar(
  name = "month",
  type = "month"
)
}
}
