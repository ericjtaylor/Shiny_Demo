library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    
    
    library(ggplot2)
    library(dplyr)

    diamonds <- diamonds %>%
        select(price, carat, cut, color, clarity) #%>%
        #mutate(carat2 = carat^2, carat3 = carat^3)

    model <- lm(price ~ .*., data=diamonds)
    
    #accuracy <- data.frame(pred = predict(model, diamonds),actual = diamonds$price)
    #ggplot(accuracy, aes(pred, actual)) + geom_point() + geom_smooth(method="lm")
    
    output$hist = renderPlot({
        test2 <- head(diamonds, 1)
        a <- data.frame(price=0, carat=input$carat, cut=input$cut, color=input$color, clarity=input$clarity)#, carat2=input$carat^2, carat3=input$carat^3)
        test2 <- tail(rbind(test2, a), 1)
        predict(model, test2)
        result <- predict(model, test2)
        ggplot(diamonds, aes(price)) + geom_histogram() + geom_vline(aes(xintercept=result))
    })

    output$value = renderText({
        test2 <- head(diamonds, 1)
        a <- data.frame(price=0, carat=input$carat, cut=input$cut, color=input$color, clarity=input$clarity)#, carat2=input$carat^2, carat3=input$carat^3)
        test2 <- tail(rbind(test2, a), 1)
        predict(model, test2)
        result <- predict(model, test2)
        paste("This diamond is valued at an estimated $", round(result, 2), " USD.")
    })
    
    output$bling = renderText({
        test2 <- head(diamonds, 1)
        a <- data.frame(price=0, carat=input$carat, cut=input$cut, color=input$color, clarity=input$clarity)#, carat2=input$carat^2, carat3=input$carat^3)
        test2 <- tail(rbind(test2, a), 1)
        predict(model, test2)
        result <- predict(model, test2)
        paste("This diamond is more expensive than ", round(100*sum(diamonds$price<result) / nrow(diamonds), 2), "% of diamonds.")
    })
})
