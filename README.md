
<!-- README.md is generated from README.Rmd. Please edit that file -->

# demdebates2020

The goal of `demdebates2020` is to provide access to all transcripts of
the Democratic debates of the 2020 Presidential Election.

## Installation

You can install `demdebates2020` from GitHub with:

``` r
devtools::install_github("favstats/demdebates2020")
```

Next you can load in the package:

``` r
library(demdebates2020)
```

The package includes a single dataset: `debates`. This dataset
represents the spoken words of all Democratic candidates for US
president at eight Democratic debates. The following sources have been
used to compile the list: Washington Post, Des Moines Register and
rev.com. The dataset has the following seven columns:

  - `speaker`: Who is speaking
  - `background`: Reactions from the audience, includes `(APPLAUSE)` or
    `(LAUGHTER)` (only availabe for the first seven debates)
  - `speech`: Transcribed speech
  - `type`: Candidate, Moderator or Protester
  - `gender`: The gender of the person speaking
  - `debate`: Which debate
  - `day`: Which day of the debate (first and second debate were split
    on two separate days)

<!-- end list -->

``` r
debates %>% 
  dplyr::slice(1502:1510) %>% 
  knitr::kable()
```

| speaker        | background | speech                                                                                                                                                                                                                                                                                                                                                                                                                     | type      | debate | day | gender |
| :------------- | :--------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- | -----: | --: | :----- |
| Joe Biden      | NA         | I also think we should not have combat troops in Afghanistan. It’s long overdue. It should end.                                                                                                                                                                                                                                                                                                                            | Candidate |      1 |   2 | male   |
| Joe Biden      | (APPLAUSE) | NA                                                                                                                                                                                                                                                                                                                                                                                                                         | Candidate |      1 |   2 | male   |
| Joe Biden      | NA         | And, thirdly, I believe that you’re not going to find anybody who has pulled together more of our alliances to deal with what is the real stateless threat out there. We cannot go it alone in terms of dealing with terrorism.                                                                                                                                                                                            | Candidate |      1 |   2 | male   |
| Joe Biden      | NA         | So I would eliminate the act that allowed us to go into war, and not - the AUMF, and make sure that it could only be used for what its intent was, and that is to go after terrorists, but never do it alone. That’s why we have to repair our alliances. We put together 65 countries to make sure we dealt with ISIS in Iraq and other places. That’s what I would do. That’s what I have done. And I know how to do it. | Candidate |      1 |   2 | male   |
| Rachel Maddow  | NA         | Senator Sanders, 30 seconds.                                                                                                                                                                                                                                                                                                                                                                                               | Moderator |      1 |   2 | female |
| Rachel Maddow  | (APPLAUSE) | NA                                                                                                                                                                                                                                                                                                                                                                                                                         | Moderator |      1 |   2 | female |
| Bernie Sanders | NA         | One of the differences - one of the differences that Joe and I have in our record is Joe voted for that war, I helped lead the opposition to that war, which was a total disaster.                                                                                                                                                                                                                                         | Candidate |      1 |   2 | male   |
| Bernie Sanders | (APPLAUSE) | NA                                                                                                                                                                                                                                                                                                                                                                                                                         | Candidate |      1 |   2 | male   |
| Bernie Sanders | NA         | Second of all, I helped lead the effort for the first time to utilize the War Powers Act to get the United States out of the Saudi-led intervention in Yemen, which is the most horrific humanitarian disaster on Earth.                                                                                                                                                                                                   | Candidate |      1 |   2 | male   |

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
