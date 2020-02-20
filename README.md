
<!-- README.md is generated from README.Rmd. Please edit that file -->

# demdebates2020

The goal of `demdebates2020` is to provide access to all transcripts of
the Democratic debates of the 2020 Presidential Election.

## Usage

The package includes a single dataset: `debates`. This dataset
represents the spoken words of all Democratic candidates for US
president at nine Democratic debates. The following
[sources](https://github.com/favstats/demdebates2020#sources) have been
used to compile the data: Washington Post, Des Moines Register and
rev.com. The dataset has the following eight columns:

  - `speaker`: Who is speaking
  - `background`: Reactions from the audience, includes `(APPLAUSE)` or
    `(LAUGHTER)`
      - only availabe for the first seven and ninth debates
  - `speech`: Transcribed speech
  - `type`: Candidate, Moderator or Protester
  - `gender`: The gender of the person speaking
  - `debate`: Which debate
  - `day`: Which day of the debate
      - first and second debate were held on two separate days
  - `order`: The order in which the speech acts were delivered

There are two ways in which you can access the dataset.

1.  Read .csv file directly from GitHub

<!-- end list -->

``` r
debates_url <- "https://raw.githubusercontent.com/favstats/demdebates2020/master/data/debates.csv"

debates <- readr::read_csv(debates_url)
```

2.  Install and load the R package like this:

<!-- end list -->

``` r
devtools::install_github("favstats/demdebates2020")

library(demdebates2020)
```

## Example

``` r
demdebates2020::debates %>% 
  dplyr::slice(1508:1510) %>% 
  knitr::kable()
```

| speaker        | background | speech                                                                                                                                                                                                                   | type      | gender | debate | day | order |
| :------------- | :--------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- | :----- | -----: | --: | ----: |
| Bernie Sanders | NA         | One of the differences - one of the differences that Joe and I have in our record is Joe voted for that war, I helped lead the opposition to that war, which was a total disaster.                                       | Candidate | male   |      1 |   2 |   759 |
| Bernie Sanders | (APPLAUSE) | NA                                                                                                                                                                                                                       | Candidate | male   |      1 |   2 |   760 |
| Bernie Sanders | NA         | Second of all, I helped lead the effort for the first time to utilize the War Powers Act to get the United States out of the Saudi-led intervention in Yemen, which is the most horrific humanitarian disaster on Earth. | Candidate | male   |      1 |   2 |   761 |

## Blog Post

Check out this [blog post](http://www.favstats.eu/post/demdebates/) for
some more data exploration.

![](https://raw.githubusercontent.com/favstats/demdebates2020/master/vignettes/images/gg9.png)

## Sources

  - Debate 1, Day 1:
    <https://www.washingtonpost.com/politics/2019/06/27/transcript-night-one-first-democratic-debate-annotated/>
  - Debate 1, Day 2:
    <https://www.washingtonpost.com/politics/2019/06/28/transcript-night-first-democratic-debate/>
  - Debate 2, Day 1:
    <https://www.washingtonpost.com/politics/2019/07/31/transcript-first-night-second-democratic-debate/>
  - Debate 2, Day 2:
    <https://www.washingtonpost.com/politics/2019/08/01/transcript-night-second-democratic-debate/>
  - Debate 3:
    <https://www.washingtonpost.com/politics/2019/09/13/transcript-third-democratic-debate/>
  - Debate 4:
    <https://www.washingtonpost.com/politics/2019/10/15/october-democratic-debate-transcript/>
  - Debate 5:
    <https://www.washingtonpost.com/politics/2019/11/21/transcript-november-democratic-debate/>
  - Debate 6:
    <https://www.washingtonpost.com/politics/2019/12/20/transcript-december-democratic-debate/>
  - Debate 7:
    <https://www.desmoinesregister.com/story/news/elections/presidential/caucus/2020/01/14/democratic-debate-transcript-what-the-candidates-said-quotes/4460789002/>
  - Debate 8:
    <https://www.rev.com/blog/transcripts/new-hampshire-democratic-debate-transcript>
  - Debate 9:
    <https://www.nbcnews.com/politics/2020-election/full-transcript-ninth-democratic-debate-las-vegas-n1139546>
