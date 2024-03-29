# system("quarto render")
quarto::quarto_render("index.qmd")

library(stringr)

# Read the HTML file
html_as_text <- readLines("index.html", warn = FALSE)
system(paste("rm", shQuote("index.html")))
# Sys.sleep(2)

# Next lecture number & dates
lec_n <- 7   ;  lec_nos <- str_c('0', as.character(1:lec_n))
lec_dates <- c('0206', '0213', '0220', '0227', '0305', '0312', '0319')

for (i in 1:length(lec_nos)){
  lec_no <- lec_nos[i]
  lec_date <- lec_dates[i]
  
  old_content <- str_c('lec-', lec_no, '-2024-', lec_date, '.html"')
  new_content <- str_c(old_content, " ", 'target="_blank"') 
  
  
  html_as_text <- str_replace_all(html_as_text,
                                  old_content,
                                  new_content)
}

old_content <- '<img src="./img/microcredential-badge.png" alt="" class="sidebar-logo py-0 d-lg-inline d-none">'
new_content <- '<img src="./img/microcredential-badge.png" alt="Home" title="Home - SUNY Geneseo Data Analytics Microcredential" class="sidebar-logo py-0 d-lg-inline d-none">'

html_as_text <- str_replace_all(html_as_text,
                                old_content,
                                new_content)

writeLines(html_as_text, 
           "index.html")



# file.copy("tmp/index.html", "index.html")

# Use system() to execute the rm command
# system(paste("rm", shQuote("index.html")))
# Sys.sleep(2)
# 
# file.rename("index2.html", "index.html")
