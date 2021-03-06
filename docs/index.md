# About

A series of lecture notes and workbooks from a short, master's level course about data science in R. The content is based mostly on the excellent book [*R For Data Science*](https://r4ds.had.co.nz/). (For solutions to the chapter exercises check out Jeffrey Arnold's [book](https://jrnold.github.io/r4ds-exercise-solutions/index.html).)

Emphasis is placed on using code to build models. Less attention is given to tasks like data cleaning. Assumes no background in R programming.

# Notebooks

All the lectures are delivered as R Notebooks. Each lecture has two notebooks: a student copy (e.g., `logit_student.Rmd`) and an instructor copy (`logit_completed.Rmd`). 

The idea is that during lecture you work through the student copy as a class or in small groups. The notebooks have checkpoints in which students answer questions. Answers are given in the instructor copy. 

Code chunks are named and each checkpoint is a third-level header (`<h3>` or `###`) so you can use R Studio's navigation panes to jump from one exercise or section to another.

## Completed notebooks

1. [Why code?](intro.pdf)
2. [Introduction to R](intro_to_r_completed.nb.html)
3. [Exploratory Data Analysis](ch7_completed.nb.html)
4. [Tibbles and Tidying](ch10-12_completed.nb.html)
5. [Relational Data](ch13_completed.nb.html)
6. [Functions](ch19_completed.nb.html)
7. [Iteration](ch21_completed.nb.html)
8. [Linear Models](ols_completed.nb.html)
9. [Nonlinear Models](logit_completed.nb.html)
10. [Memo on visualizing models](visualize_models.nb.html)
11. [Final exam](final_exam_solutions.html)


# Highlights

## Data

The lectures use a few interesting data sets not found in the book, including:

* [Covid-19 data from Johns Hopkins](https://github.com/CSSEGISandData/COVID-19)
* [Avocado prices](https://www.kaggle.com/neuromusic/avocado-prices/) from the [Hass Avocado Board](https://hassavocadoboard.com/)
* [NHANES II](https://wwwn.cdc.gov/Nchs/Nhanes/nhanes2/default.aspx) (The second wave of the CDC's National Health and Nutrition Examination Survey)
* [Mortgage applications from Boston in 1990 (HMDA)](https://rdrr.io/cran/AER/man/HMDA.html)
* [FY2018 Boston property prices and attributes](https://data.boston.gov/dataset/property-assessment/resource/bac18ae6-b8fd-4cd3-a61c-c5e1a11f716c) from [Analyze Boston](https://data.boston.gov/)

The Covid-19, avocado prices, NHANES II and Boston property data sets are hosted on GitHub. The HMDA data set is imported by the `AER` package.

## Modeling

Since model building is the main emphasis of this short course, the majority of the code exercises have something to do with stats/econometrics/modeling in general. For example:

* The lecture on [exploratory data analysis](ch7_completed.nb.html) builds up to a linear model with dummies and interaction effects.
* The lecture on [programming functions](ch19_completed.nb.html) includes a checkpoint in which students code a function to manually implement OLS.
* The lecture on [iteration](ch21_completed.nb.html) has a section in which students learn to simulate sampling distributions and visualize the Central Limit Theorem.

## Exams

The final exam is an R Markdown file with blank code chunks and custom-made writing chunks (so students know where to write their non-code answers).

Students submit their completed .Rmd files. I use a [script](https://github.com/lrdegeest/r_for_data_science/blob/main/exams/render_submissions.R) to auto-render each file to HTML and log which files could or could not render. A log file is written for each submission that tells which code chunks failed to compile, if any. A summary report for all submissions is also generated. 

# Dependencies

You need the following packages installed to run the notebooks: 

* `tidyverse` for all things tidy ([link](https://www.tidyverse.org/))
* `patchwork` to combine `ggplot`s ([link](https://patchwork.data-imaginist.com/))
* `sjPlot` to visualize models ([link](https://strengejacke.github.io/sjPlot/))
* `broom` for tidy model objects ([link](https://broom.tidymodels.org/))
* `AER` for some data sets ([link](https://cran.r-project.org/web/packages/AER/index.html))

# Use

These notebooks are published with an MIT License. Feel free to use and modify them for your own needs. Let me know if you find any bugs by [posting an issue on GitHub](https://github.com/lrdegeest/r_for_data_science/issues).  

# Last updated

May 2021
