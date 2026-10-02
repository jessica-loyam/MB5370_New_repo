# Basic arithmetic (e.g. wrangling sea surface temperatures)
24.5 + 1.2
32.0 / 4
#----------------------------#
 # MB5370: Techniques in Marine Science 1
 # Programming Fundamentals 
 # < Jessica > 
 # < 15/09/26 > 

#----------------------------#
# Workshop 01. Introduction ####

# R syntax and working in scripts ####
# This section introduces us to R by running simple calculations inside a script.

2 + 1 
## Result 
3

 #---------------------------#
#Functions and Arguments 
years_old <- 25.3
round(years_old) # rounds up
floor(years_old) # rounds down 

years_old <- 25.365 #Adding decimal digits for the propt below 
 round (years_old, 2) # comma after the object to specify argument (rounding to 2 decimal points)

 args(round) # query function arguments to discover the options for each function 
#?round, ? can also be used to go help
 
 args(round) # use args in the Console
#function (x, digits = 0)
   
#-----------------------------#
# Objects and the assignment operator 
## this section focuses on understanding how data is stored in r and why that matters.
 
 # Saving a single value 
   coral_count <- 42
 # Saving a vector of multiple fish lengths (in mm)
   fish_lengths <- c(124, 152, 98, 221, 146)

   # Manipulating objects 
    coral_count + 1 # adding value 
    coral_count + coral_count
  
    Coral_Count <- 1 
    coral_count + Coral_Count
    
# Object naming rules 
    #01_age <- 25 # starts with a number
    #Error: unexpected input in "01_"
    
    #> !_age <- 25 # no special symbols
    # Error: unexpected input in "!_"
    
   # > coral count <- 25 # no spaces
   # Error: unexpected symbol in "coral count"
    
    #> `coral count` <- 25 # spaces used but with back ticks
    
# debugging code 
    # Field survey data
    quadrat_area_m2 <- 0.25
    number_of_quadrats <- 16
    total_area_surveyed <- quadrat_area_m2 * number_of_quadrats
    
    # Let's print out the result
    print(total_area_surveyed)
  ## Result 
    4 
#-----------------------------------------#
# Packages 
    #Installing and loading tidyverse 
    #install.packages("tidyverse") # download and install
    library(tidyverse) # load into current session

#----------------------------------------#
    # Data types 
    # Assign variable values
    ## Exercise checking structures 
    site_name <- "Heron_Island"
    transect_depth_m <- 12.5
    bleaching_present <- TRUE
    
    # Check using function class()
    class(site_name)
    class(transect_depth_m)
    class(bleaching_present)
    
    # Check using function str()
    str(site_name)
    str(transect_depth_m)
    str(bleaching_present)
   
    ## Exercise rounding numbers 
    # Tracking the age of an old-growth Porites coral colony
    years_old <- 25.765
    
    # Clean this up for our summary report
    round(years_old, 2)
    # Result 
    25.76
    
    # Manipulating outpiuts 
    # Make variables
    years_old <- 25.765
    rounded_age <- round(years_old, 2)
    
    # Combine text and data variables
    paste("Average colony age is", rounded_age, "years old")
     # we want to change result ti]o 1 decimal place as show below
    years_old <- 25.765
    rounded_age <- round(years_old, 1)
   # Result 25.8
    
#----------------------------------------#
    # Data Structures 
    # Making a vector full of characters 
    coral_spp <- c("Porites", "Acropora", "Montastrea")
   
     ## Vectors 
    class(fish_lengths) # Numeric
    class(coral_spp) # Character 
    ### vectors with mixed variables 
    notes <- c("Acropora", 27.5, TRUE)
    notes[[1]] # ACropora 
    notes[[2]] # 27.5
    
# Data frames and tibbles 
    my_dataframe <- data.frame (no = c(1,2,3), c("Plectropomus", "Scarus", "Pomacentrus"), c("TRUE", "FALSE", "TRUE"))
    my_dataframe
    str (my_dataframe)
  
    # Sometimes it gets it wrong, so get into the habit of checking and changing it if necessary. You can do this by accessing the column and changing its type:

    my_dataframe$no = as.factor(my_dataframe$no)
    str (my_dataframe)
    
# R projects and workspace architecture 
  ## The working directory and saving your work 
    ### R projects: Escaping setwd()hell
    # not going to use setwd(), now using R Projects (.Rproj)
    # Exercise: Getting set up with R projects
    
    #source("file name ") - similar function to setwd()
    #getwd() - used to locate a directory 
#-----------------------------------------------#   
    # Workshop 2 #
    
#Create first ggplot 
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy)) 

   ##ggplot creates a coordinate system 
   ##So ggplot(data = mpg) creates an empty graph, but it’s not very interesting
  ##The function geom_point() adds a layer of points to your plot, which creates a scatter plot
    ##The mapping argument is always paired with aes(), and the x and y arguments of aes() specify which variables to map to the x and y axes. 
    
#---------------------------------------------#
    #understanding the grammer of graphs 
    ## graphing template 
    ### In all cases, your ggplot code will follow a generic template like the one below. You  will always call ggplot, offer it data, and then provide a geom function with a collection of mappings, which dictate how your plot will look
    
 #Usual tamplate
    #ggplot(data = <DATA>) +
     # <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
    
    ggplot() # create window without data 
    ggplot(data = mpg)
    # adding a third variable such as class by mapping it into an aesthetic "aes()" includes shapes, size and color
  ## So when you’re creating a plot, you essentially need two attributes of a plot: a geom and aesthetics.
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy, colour = class))
    
  ## we just mapped class to color, but you map to the size aesthetic in the exact same way
    
    #change point size by class 
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy, size = class))
    #> Warning: Using size for a discrete variable is not advised.
    
    #Change point transparency by class (alpha).
    #Here the alpha aesthetic is what dictates the transparency.
    #Also consider trying a simple number, like 0.3 to this aesthetic, which globally applies a transparency to all points.
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
    
    # own note: the point size is goof but the color not recommanded 
    
    #change point shaoe by class 
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy, shape = class))
    
    #own note: shapes are good but they overlap and are of the same color 
    
    #You can also set these properties manually, such as by offering a number or a colour.Let’s make all of our points blue.
    
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
    
    #There are a range of manual aesthetics you can set to manually alter the appearance of your
    #plot. These include:
    #The name of a color as a character string.
    #The size of a point in mm.
    #The shape of a point as a number, as shown in Figure 3.1.
    
    ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
     # take note of spacing
     # everything to alter the aesthetic must be in the aesthetic brackets 
    
  #----------------------------------------------#
    #Troubleshooting 
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy))
    # the + should be on top line
    
 #-----------------------------------------------#
    #Facet and panel plots 
   # To facet your plot using a single variable, use facet_wrap().
    # Facet wrap syntax is in the function of a formula (kind of like a linear model formula), where the ~ dictates which variable you want to subset your data with.
    # Note: only use facet_wrap() for discrete variables.
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy)) +
      facet_wrap(~ class, nrow = 2) # break data displyed into subsets, as displyed into their classes 
    #faceting is basically ploting data into subsets 
    #If you want to do this with more than one variable, then use facet_grid(). Here you need two variables using ~ to split them up.
    #Facet plot on the combination of two variables using facet_grid(). Facet grid needs two variables separated by a ~
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy)) +
      facet_grid(drv ~ cyl)
    
  #Use a . if you do not want to facet in the rows or column dimension. Note what happens in this case:
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy)) +
      facet_grid(.~ cyl) # the display becomes more straight 
    
 #-----------------------------------------------# 
   #2.21 Fitting simple line ####
    # To display data as points, use geom_point().
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy))
    
    # To display the same data as a smooth line fit through the points use geom_smooth().
    ggplot(data = mpg) +
      geom_smooth(mapping = aes(x = displ, y = hwy)) # note that the geom_point() is not included to include the points 
    
    # recap
    # geom is an object that your plot uses to represent the data.
    # To change the geom type in your plot, simply change the geom function that you add to your plot template
    
    ggplot(data = mpg) +
      geom_point(mapping = aes(x = displ, y = hwy)) 
      # points horrible
     
      ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy)) 
      # try smooth line 
      
    # Combining points and lines 
      ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy)) + 
        geom_smooth(mapping = aes(x = displ, y = hwy))
      
      ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv)) +
        geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv)) # added the color by the drv 
      
      # Here we have two geoms on the same graph (points and lines)!
      #edit above to play with the geom####
      
      #Here we will use the group argument to show that our data is in fact grouped.
      #It won’t add a new legend but can easily be used to vary your plots by the discrete variable.
      
      #Set the group aesthetic to a categorical variable to draw multiple objects.
      
      
      ggplot(data = mpg) +
        geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
      
      # Change the color of each line based on drv value
    
      
     ggplot(data = mpg) +
        geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
        show.legend = FALSE,
      )
      #show.legend = FALSE, removes ledgend from graph
     
    # combining line and point geom as done previously 
     
     ggplot(data = mpg) +
       geom_point(mapping = aes(x = displ, y = hwy)) +
       geom_smooth(mapping = aes(x = displ, y = hwy))
     
     # however the mappings are duplicated, want to make it more efficient 
     
     ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_point() +
       geom_smooth()
     
     #changing colors 
     
     ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_point(mapping = aes(color = class)) +
       geom_smooth()
  
    #The same goes if you want to specify different data for each layer. 
     #Here, we use a filter(class ="subcompact") to select a subset of the data and plot only that subset.
     
     ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_point(mapping = aes(color = class)) +
       geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
     
   #question####  
     #own note:the line changes to following the class?
     
     ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_point(mapping = aes(color = class)) +
       geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
     #1. What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
     geom_line()
     geom_area()
     geom_boxplot()
     geom_histogram()
     
     #2. Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions. Will these two graphs look different? Why/why not? 
     #my predictions:both graphs would look the same 
     ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_point() +
       geom_smooth()
     
     
     ggplot() +
       geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
  #--------------------------------------------------------------#   
  #2.22 Transforming and stats####
     
     #The diamonds dataset comes in ggplot2 and contains information about ~54,000 diamonds, including the price, carat, color, clarity, and cut of each diamond.
     
     #2.22.1 Ploting statistics####
     
    # Our first bar chart shows that more diamonds are available with high quality cuts than low quality cuts. The quality of the shape the diamond has been cut literally!
     
     
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut))
     
     #On the x-axis, the chart displays cut, a variable from the diamonds dataset. On the y-axis, it displays count, but count is not a variable in diamonds! 
     #Where does count come from? Many graphs, like scatterplots, plot the raw values of your dataset. 
     #Other graphs, like bar charts, calculate new values to plot:
      # bar charts, histograms, and frequency polygons “bin” your data and then plot bin counts (the number of points that fall in each bin).
      # smoothers fit a model to your data and then plot predictions from the model.
      # boxplots compute a robust summary of the distribution and then display a specially formatted box.
     ### so absically the counts are done after analysing of viewing the dataset! using stat. 
     #The algorithm used to calculate new values for a graph is called a stat, short for statistical transformation.
     
     #You can generally use geoms and stats interchangeably. For example, you can recreate the
     #previous plot using stat_count() instead of geom_bar()
     
     ggplot(data = diamonds) +
       stat_count(mapping = aes(x = cut))
     
     #The main reason this is so easy is because every geom has a default stat and every stat has a default geom, which means you don’t need to worry about what’s going on.
     
     #2.22.2 Overview defaults in ggplot2####
      
     # The defaults stat are not the only thing you can do. 
     #defaults are there in the first place can have bug implications on results, so you should alwasy make an effort to understand any of these black box outputs.
     # Whats the default? How can it change? Whats it doing to my work?
     
     # Thus, you might want to overwrite it, a default stat, now that you understand what the defaults are
     # Change the default stat (which is a count, a summary) to identity (which is the raw value of a variable).
     
     #Don’t worry yet about the “tribble()” function from the code below. It’s just used to make tibble and we will learn about those in a bit (they’re basically a dataframe).
     
     demo <- tribble(
       ~cut,
       ~freq,
       "Fair"
       , 1610,
       "Good"
       , 4906,
       "Very Good"
       , 12082,
       "Premium"
       , 13791,
       "Ideal"
       , 21551
     )
     demo
     
     ggplot(data = demo) +
       geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
     
     #You can also override a default mapping from transformed variables to aesthetics.
     #For instance, you could display a bar chart of the proportion of your total diamond dataset rather than a count.
     
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
     #> Warning: `stat(prop)` was deprecated in ggplot2 3.4.0.
     #Displying according to total than count which is the default stat
     
     #2.22.3 Plotting statistical details#### 
     
     # showing more about these transformations
     ggplot(data = diamonds) +
       stat_summary(
       mapping = aes(x = cut, y = depth),
       fun.min = min,
       fun.max = max,
       fun = median
     )
     
     #2.23 Aesthetic adjustments####
     
     #Another way to boost the way you can convey information with plots using ggplot2 is to use aesthetics like colour or fill to change aspects of bar colours.
 
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, colour = cut)) # coloring the the cut, which may appear as a highlight 
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, fill = cut)) # filling the bars representing the cuts with color 
      # the difference is between the use of "fill" and "color
     
     
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, colour = cut)) # coloring the the cut, which may appear as a highlight 
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, fill = clarity)) #clarity is another style used to color fill the cut 
     
     #The ability to make position adjustments is vital,
     #it allows you to customise your plots in three ways:
     #identity (raw data), fill (changes heights) and dodge (which forces ggplot2 to not put things on top of each other)
     
     #if you use position = "identity", you will be able to place each object exactly where it falls in the context of the graph.
     
     #This is vital for point charts like scatter plots but makes a mess in a bar plot situation by showing too much information (a bar plot generally summarises information). So in this case we will need to alter the bar aesthetic.
     
     #To alter transparency (alpha)
     ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
       geom_bar(alpha = 1/5, position = "identity")
     #To color the bar outlines with no fill color
     ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +
       geom_bar(fill = NA, position = "identity") # the fill = NA removes any fill
        
     
     # position = "fill" worls like stacking but makes each of stacked bars the same height
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, fill = clarity), position =
           "fill") # the count also changes to account for the same height in bars reading the quality of cut
     
     #position = "dodge" places overlapping objects directly beside one another.
     
     ggplot(data = diamonds) +
       geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") # so not stacked but beside each other 
     
     #jitter, which slightly moves points so you can see them all (especially when they overlap). I’m sure you’ve seen really nice box plots with jittered points all over them, which you handle with this function.
      #position = "jitter" adds a small amount of random noise to each point to avoid overplotting when points overlap. This is useful for scatterplots but not barplots.
    
     
     ggplot(data = mpg) +
       geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
     # creates a bit of noise to avoid overlapping 
     
#--------------------------------------------------#     
    
      #2.24 The layered grammer of graphics#### 
      
    #Most of the time you won’t need to populate all of these, because ggplot2 has defaults for most of them, but overall you have enough here to build almost any plot
     
     # ggplot(data = <DATA>) +
      #  <GEOM_FUNCTION>(
        #  mapping = aes(<MAPPINGS>),
        #  stat = <STAT>,
        #  position = <POSITION>
      #  ) +
      #  <FACET_FUNCTION>
#own build       
       
#--------------------------------------------------#     
       #setting up Git anf Github####
     
    #install.packages("usethis")
     #credentials::git_credential_ask() # where you place in your username and token as password 
     #usethis::git_sitrep() # like a check
     
     #--------------------------------------------------#
     #Workshop 4. AI####
     #Step 1 - Preparing workplace 
     
     #Load tidyverse and palmerpenguins libraries
     library(tidyverse)
     library(palmerpenguins)
     install.packages("palmerpenguins")
     
     #Step 2 - Prompt for a multi-variable scatter plot 
     
     # Create a ggplot scatter plot using the penguins dataset. 
     # Plot bill_length_mm on the x-axis and bill_depth_mm on the y-axis.
     # Color points by species and use geom_point with size 3.
     # Add a minimal theme and clean labels.
     
     ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
       geom_point(size = 3) +
       theme_minimal() +
       labs(title = "Bill Length vs Bill Depth by Species",
            x = "Bill Length (mm)",
            y = "Bill Depth (mm)",
            color = "Species")
     
     #Step 3 - open-end comparitive plotting 
     # build a scatter plot mapping body_mass_g against flipper_length_mm, adding a linear regression trend line (geom_smooth) for each species. 
     ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
       geom_point(size = 3) +
       geom_smooth(method = "lm", se = FALSE) +
       theme_minimal() +
       labs(title = "Body Mass vs Flipper Length by Species",
            x = "Flipper Length (mm)",
            y = "Body Mass (g)",
            color = "Species")
     
     # generate a boxplot comparing flipper_length_mm across different species, faceted by island, using custom color palettes. 
     ggplot(data = penguins, mapping = aes(x = species, y = flipper_length_mm, fill = species)) +
       geom_boxplot() +
       facet_wrap(~ island) +
       scale_fill_brewer(palette = "Set2") +
       theme_minimal() +
       labs(title = "Flipper Length by Species and Island",
            x = "Species",
            y = "Flipper Length (mm)",
            fill = "Species")
     
     # The boxplot was choisen to compare the distribution of flipper lengths across species, while faceting by island allows for a clear comparison of how these distributions vary across different geographic locations. 
     # The custom color palette enhances visual distinction between species. 
     # While compared to the scatter plot option, information displayed where less clearly visualized compared to the boxplot.
     
     ggplot(data = penguins, mapping = aes(x = species, y = flipper_length_mm, fill = species)) +
       geom_boxplot() +
       facet_wrap(~ island) +
       scale_fill_brewer(palette = "Set2") +
       theme_minimal() +
       labs(title = "Flipper Length by Species and Island",
            x = "Species",
            y = "Flipper Length (mm)",
            fill = "Species")
     
     #Copilot was used to generate plots and a few descriptive text within workshop 4. 
     
     
     
     
     