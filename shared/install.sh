sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/', dependencies = TRUE)\""
sudo su - -c "R -e \"install.packages('gtools', repos='http://cran.rstudio.com/', dependencies = TRUE)\""
sudo su - -c "R -e \"devtools::install_github('blernermhc/RDataTracker')\""