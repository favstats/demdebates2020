#' plot_counts
#' @export
plot_counts <- function(.data, type = "heatmap"){ #"heatmap", "line"

  if(type == "heatmap"){
    viz <- .data %>%
      apexcharter::apex(
        type = type,
        mapping = aes(x = debate, y = speaker, fill = n)
      ) %>%
      apexcharter::ax_colors("#008FFB")
  } else {
    viz <- .data %>%
      apexcharter::apex(
        type = type,
        mapping = aes(x = debate, y = n, color = speaker)
      )
  }

  viz %>%
    apexcharter::ax_dataLabels(enabled = FALSE) %>%
    apexcharter::ax_title(
      style = list(fontSize = "22px")
    ) %>%
    apexcharter::ax_subtitle(
      style = list(fontSize = "16px", color = "#BDBDBD")
    )
}

#' count_words
#' @export
count_words <- function(.data){
  .data %>%
    tidytext::unnest_tokens(word, speech) %>%
    #dplyr::filter(type == "Candidate") %>%
    dplyr::mutate(speaker = as.factor(speaker)) %>%
    dplyr::mutate(debate = as.factor(debate)) %>%
    dplyr::count(speaker, debate, .drop = F)
}

#' plot_word_counts
#' @export
plot_word_counts <- function(.data, type = "heatmap"){
  .data %>%
    plot_counts(type) %>%
    apexcharter::ax_labs(
      title = "Word Counts by Candidates",
      subtitle = glue::glue("{head(.data$debate, 1)}st to {tail(.data$debate, 1)}th Democratic Debates")
    )
}

#' count_applauses
#' @export
count_applauses <- function(.data){
  .data %>%
    mutate(speaker = as.factor(speaker)) %>%
    mutate(debate = as.factor(debate)) %>%
    dplyr::count(background, speaker, debate, .drop = F) %>%
    drop_na() %>%
    filter(background == "(APPLAUSE)")
}

#' plot_applause_counts
#' @export
plot_applause_counts <- function(.data, type = "heatmap"){
  .data %>%
    plot_counts(type) %>%
    apexcharter::ax_labs(
      title = "Applause received by Candidates",
      subtitle = glue::glue("{head(.data$debate, 1)}st to {tail(.data$debate, 1)}th Democratic Debates")
    )
}

#' count_laughs
#' @export
count_laughs <- function(.data){
  .data %>%
    #filter(type == "Candidate")   %>%
    mutate(speaker = as.factor(speaker)) %>%
    mutate(debate = as.factor(debate)) %>%
    dplyr::count(background, speaker, debate, .drop = F) %>%
    drop_na() %>%
    filter(background == "(LAUGHTER)")
}

#' plot_laugh_counts
#' @export
plot_laugh_counts <- function(.data, type = "heatmap"){
  .data %>%
    plot_counts(type) %>%
    apexcharter::ax_labs(
      title = "Laughs received by Candidates",
      subtitle = glue::glue("{head(.data$debate, 1)}st to {tail(.data$debate, 1)}th Democratic Debates")
    )
}

#' plot_laugh_counts
#' @export
count_talks <- function(.data){
  .data %>%
    #filter(type == "Candidate")   %>%
    mutate(speaker = as.factor(speaker)) %>%
    mutate(debate = as.factor(debate)) %>%
    dplyr::count(background, speaker, debate, .drop = F) %>%
    drop_na() %>%
    filter(background == "(CROSSTALK)")
}

#' plot_talk_counts
#' @export
plot_talk_counts <- function(.data, type = "heatmap"){
  .data %>%
    plot_counts(type) %>%
    apexcharter::ax_labs(
      title = "Cross Talk by Candidates",
      subtitle = glue::glue("{head(.data$debate, 1)}st to {tail(.data$debate, 1)}th Democratic Debates")
    )
}
