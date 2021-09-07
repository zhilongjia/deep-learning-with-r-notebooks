# Chinese Version


* P75 代码清单4.1 第二行 为 定义验证集， 而不是 测试集， 英文原文为 validation set。

* P84 被感动  应为 调动， 英文原文为 get moved。


* P67 代码3.24 
    原文： all_scores <- c(all_scores, results$mean_absolute_error )
    应为：all_scores <- c(all_scores, results["mae"] )
    results 是个2维向量，列名分别为loss和mae

* P68 代码3.25 
    原文： mae_history <- history$metrics$val_mean_absolute_error
    应为：mae_history <- history$metrics$mae


# English version
* code 3.24 
    original： all_scores <- c(all_scores, results$mean_absolute_error )
    should be：all_scores <- c(all_scores, results["mae"] )
    since the results object is a numeric vector.
* code 3.25 
    原文： mae_history <- history$metrics$val_mean_absolute_error
    应为：mae_history <- history$metrics$mae


# sessionInfo()

```
R version 4.0.4 (2021-02-15)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 20.10

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.9.0
LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.9.0

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C               LC_TIME=en_GB.UTF-8        LC_COLLATE=en_US.UTF-8     LC_MONETARY=en_GB.UTF-8   
 [6] LC_MESSAGES=en_US.UTF-8    LC_PAPER=en_GB.UTF-8       LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_GB.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] yardstick_0.0.8    workflowsets_0.1.0 workflows_0.2.3    tune_0.1.6         tidyr_1.1.3        tibble_3.1.1       rsample_0.0.9     
 [8] recipes_0.1.16     purrr_0.3.4        parsnip_0.1.7      modeldata_0.1.1    infer_1.0.0        ggplot2_3.3.3      dplyr_1.0.5       
[15] dials_0.0.9        scales_1.1.1       broom_0.7.6        tidymodels_0.1.3   keras_2.3.0.0     

loaded via a namespace (and not attached):
 [1] jsonlite_1.7.2     splines_4.0.4      foreach_1.5.1      warp_0.2.0         prodlim_2019.11.13 assertthat_0.2.1   GPfit_1.0-8       
 [8] yaml_2.2.1         globals_0.14.0     ipred_0.9-11       pillar_1.6.0       backports_1.2.1    lattice_0.20-41    glue_1.4.2        
[15] reticulate_1.20    pROC_1.18.0        digest_0.6.27      hardhat_0.1.6      colorspace_2.0-0   htmltools_0.5.1.1  Matrix_1.3-2      
[22] plyr_1.8.6         timeDate_3043.102  pkgconfig_2.0.3    lhs_1.1.1          DiceDesign_1.9     listenv_0.8.0      slider_0.2.1      
[29] whisker_0.4        gower_0.2.2        lava_1.6.10        mgcv_1.8-35        farver_2.1.0       generics_0.1.0     ellipsis_0.3.1    
[36] withr_2.4.2        furrr_0.2.2        nnet_7.3-15        cli_2.4.0          survival_3.2-10    magrittr_2.0.1     crayon_1.4.1      
[43] evaluate_0.14      future_1.21.0      fansi_0.4.2        parallelly_1.24.0  nlme_3.1-152       MASS_7.3-53.1      class_7.3-18      
[50] rsconnect_0.8.17   tools_4.0.4        lifecycle_1.0.0    munsell_0.5.0      compiler_4.0.4     rlang_0.4.10       grid_4.0.4        
[57] iterators_1.0.13   rstudioapi_0.13    labeling_0.4.2     base64enc_0.1-3    rmarkdown_2.7      gtable_0.3.0       codetools_0.2-18  
[64] DBI_1.1.1          R6_2.5.0           tfruns_1.5.0       lubridate_1.7.10   knitr_1.32         tensorflow_2.5.0   future.apply_1.7.0
[71] utf8_1.2.1         zeallot_0.1.0      parallel_4.0.4     Rcpp_1.0.6         vctrs_0.3.7        rpart_4.1-15       png_0.1-7         
[78] xfun_0.22          tidyselect_1.1.0  
```