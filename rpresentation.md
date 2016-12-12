rpresentation
========================================================
author: "Eric Taylor"
date: "December 11, 2016"
autosize: true

Concept
========================================================

Purchasing an engagement ring is a stressful experience. Individuals are confronted with conflicting issues:

- Are they paying a fair price? (looking to minimize cost) 
- Are they buying something with enough "bling" factor? (need to spend a lot of money) 

These 2 things pull in opposite directions. This app is trying to reduce stress by providing answers to both of these questions.

How does it work?
========================================================

A simple linear model was fit on ggplot2's diamonds dataset, including interaction terms. It focuses on the 4 Cs of diamonds:

1. Carats
2. Cut
3. Color
4. Clarity

Users then simply enter in the 4 Cs of the diamond they are considering, and report is generated advising them on their purchase.

What are the features?
========================================================

The model provides an estimated price. This is a point of reference to show if the store is **charging too much**.

The model provides the percentile rank of diamond by referencing the overall diamonds dataset. This is a point of reference to show if the diamond's value is **below the average purchase price**.

Model Code
========================================================


```r
    library(ggplot2)
    library(dplyr)

    diamonds <- diamonds %>%
        select(price, carat, cut, color, clarity)

    model <- lm(price ~ .*., data=diamonds)
    
    accuracy <- data.frame(predicted = predict(model, diamonds),actual = diamonds$price)
    ggplot(accuracy, aes(predicted, actual)) + geom_point(size=1, alpha = 0.02) + geom_abline(intercept = 0, slope = 1)
```

Is it Accurate?
========================================================

![plot of chunk unnamed-chunk-2](rpresentation-figure/unnamed-chunk-2-1.png)

There is room for improvement, with some clear non-linear effects. This model is just a proof of concept, it can be further refined and enhanced.
