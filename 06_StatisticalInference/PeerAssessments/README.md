## Introduction  

This is the project for the statistical inference class. In it, we will use simulation to explore inference and do some simple inferential data analysis. The project consists of two parts:

1. Simulation exercises.
2. Basic inferential data analysis.

# 1. Simulation Exercise  

The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also also 1/lambda. Set lambda = 0.2 for all of the simulations. In this simulation, we will investigate the distribution of averages of 40 exponential(0.2)s. Note that we will need to do a thousand or so simulated averages of 40 exponentials.

We illustrate via simulation and associated explanatory text the properties of the distribution of the mean of 40 exponential(0.2)s. We will

1. Show where the distribution is centered at and compare it to the theoretical center of the distribution.
2. Show how variable it is and compare it to the theoretical variance of the distribution.
3. Show that the distribution is approximately normal.
4. Evaluate the coverage of the confidence interval for $1/\lambda : \bar{X} \pm 1.96 \frac{S}{\sqrt{n}}$.

# 2. Basic Inferential Data Analysis

Now in the second portion of the class, we're going to analyze the ToothGrowth data in the R datasets package. 

1. Load the ToothGrowth data and perform some basic exploratory data analyses 
2. Provide a basic summary of the data.
3. Use confidence intervals and hypothesis tests to compare tooth growth by supp and dose. (Use the techniques from class even if there's other approaches worth considering)
4. State your conclusions and the assumptions needed for your conclusions.
