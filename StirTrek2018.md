Machine Learning in R
========================================================
author: Tim Hoolihan (@thoolihan)
date: 2018.05.04
autosize: true


Tim Hoolihan
========================================================
- Organizer of the Cleveland R User Group
- Sr. Director of Data Science at DialogTech
- Advisory Board Member at DriveIT in Akron
- Author of a Packt Pub Video Series on Machine Learning in R
- @thoolihan on github & twitter

========================================================
![Questions? Feedback?](images/StirTrek2018-SessionSlack.png)

## We are in \#2018--purple

About the Talk
========================================================

1. Super-brief crash course in R
2. What is machine learning
3. Regression - Predicting Continuous Values
4. Classification - Predicting Discrete(Categorical) Values
5. Unsupervised Learning
5. Deep Learning
6. Your Next Steps

R
========================================================
- An implementation of the S language, that has evolved on it's own
- Built-in support for Statistics
- Lots of packages for a variety of STEM domains
  - Considered a large reason for the growth of the R Community
- Integrations with a lot of systems (Most RDBMSs, Hadoop, Spark, ElasticSearch, etc)
- [r-project.org](r-project.org)

Unique Things About R Syntax
========================================================
Assignment supports `=`, but `<-` is dominant in practice


```r
x = 5

# above is the same as below

x <- 5
```

Unique Things About R Syntax
========================================================
Functions declared through assignment, implied return

```r
foo <- function(x, y) {
  return(x + y)
}

# above is the same as below

foo <- function(x, y) {
  x + y
}
```

Vectors and Vector Operations
=======================================================

```r
heights <- c(1.7, 1.72, 1.68, 1.6, 1.8)
length(heights)
```

```
[1] 5
```

```r
mean(heights)
```

```
[1] 1.7
```

```r
sd(heights)
```

```
[1] 0.07211103
```

Vectors and Vector Operations
=======================================================

```r
heights <- c(1.7, 1.72, 1.68, 1.6, 1.8)
feet_per_meter <- 3.28

tmp <- heights * feet_per_meter

# above is preferred and more performant than

tmp <- c()
for(height in heights){
  tmp <- c(tmp, height * feet_per_meter)
}
```

Distributions
=======================================================

```r
# normal distribution
heights = rnorm(500, mean = 66, sd = 3.5)
heights[1:5]
```

```
[1] 60.62870 73.56895 65.95143 67.09202 63.73548
```

Histogram
=======================================================

```r
hist(heights, breaks = 12)
```

![plot of chunk unnamed-chunk-6](StirTrek2018-figure/unnamed-chunk-6-1.png)

Let's make a related variable with some noise
=======================================================

```r
# uniform distrubution added to heights
armspans <- heights + runif(500, min = -3, max = 3)
armspans[1:5]
```

```
[1] 60.87137 71.33070 68.47055 69.01529 61.62902
```

Data Frames
=======================================================

```r
people <- data.frame(height = heights, armspan = armspans)
head(people)
```

```
    height  armspan
1 60.62870 60.87137
2 73.56895 71.33070
3 65.95143 68.47055
4 67.09202 69.01529
5 63.73548 61.62902
6 65.77522 67.41507
```

Data Frames
=======================================================
The dim function (dimensions) shows 500 observations of 2 variables

```r
dim(people)
```

```
[1] 500   2
```

Indexing Data Frame
=======================================================
Here's how we examine a column

```r
people$height
```

```
  [1] 60.62870 73.56895 65.95143 67.09202 63.73548 65.77522 66.38611
  [8] 60.03454 63.09837 64.64022 67.35349 63.67888 64.57144 66.18271
 [15] 64.48197 68.33149 68.95761 62.87885 71.63755 66.31921 61.32802
 [22] 63.17403 61.24231 65.21418 73.47149 69.75793 66.11212 63.71224
 [29] 64.13810 66.16100 65.27679 70.31386 64.35038 68.00411 67.32321
 [36] 71.01687 65.18402 67.95023 62.03783 67.26596 68.03087 61.40453
 [43] 61.92934 67.49580 66.67926 69.43714 68.28942 67.23306 61.17816
 [50] 64.31405 64.40716 65.93094 66.36876 70.53179 62.51292 68.04629
 [57] 63.62123 67.81403 60.96798 59.94048 66.18714 64.71973 68.08964
 [64] 64.42948 70.83155 68.01862 68.62457 64.92248 68.92371 65.72029
 [71] 65.12229 65.50999 61.95921 68.86296 68.19836 65.27526 62.99073
 [78] 72.81346 59.75806 65.18434 73.78684 64.67633 73.88640 65.76192
 [85] 68.70547 63.80814 73.46139 66.64308 70.97057 62.60147 64.40761
 [92] 63.31632 62.67067 63.51691 66.94662 68.40541 69.94629 58.05241
 [99] 69.59998 65.69709 65.12179 69.47981 68.24155 60.27286 60.46947
[106] 70.48652 67.39169 68.17440 69.60405 67.51312 62.63882 56.10957
[113] 62.75392 63.73545 65.02181 77.27485 62.38748 63.10171 67.31369
[120] 62.79321 73.02578 64.59256 65.63077 67.99315 65.52305 59.82668
[127] 71.92276 64.11959 65.31827 68.23354 63.66959 67.18444 66.87658
[134] 70.89969 65.39296 65.07793 63.58700 72.26444 66.60413 59.71390
[141] 65.26257 64.57844 64.45371 71.35544 68.06994 64.74630 63.69623
[148] 65.74555 69.75574 68.25864 62.50905 62.73677 66.81269 61.97506
[155] 68.66917 65.41201 69.95726 70.91214 69.12110 66.05212 73.06126
[162] 64.93482 65.73257 59.93916 67.58264 68.19643 67.02359 72.01009
[169] 65.09119 66.50834 63.83636 70.93393 66.05243 73.27740 61.52315
[176] 62.82668 68.43167 65.14653 61.37096 71.54715 68.44545 67.21152
[183] 66.08876 64.47169 65.51361 66.43280 69.74323 66.67103 70.19243
[190] 68.43197 62.25435 75.01762 62.25037 70.69740 62.14842 66.82448
[197] 67.24732 70.04974 67.59441 65.53377 61.12143 70.66022 65.79065
[204] 62.68359 64.92492 60.00128 78.10018 68.01728 68.82824 66.89575
[211] 71.27420 71.00045 64.58460 71.95882 74.56729 72.69288 68.01344
[218] 64.78008 68.05000 63.41676 67.45624 66.89028 66.13992 61.64565
[225] 72.78303 63.06280 62.54173 60.52306 64.79181 73.09336 67.89819
[232] 72.58878 60.94478 59.63943 61.67703 69.05040 62.76401 61.73795
[239] 69.62148 68.28080 63.52788 68.46964 68.78898 65.05764 68.35597
[246] 70.58196 69.07163 66.57263 62.17133 69.05888 70.03955 69.81680
[253] 62.52447 67.22600 74.30514 64.51073 68.24466 62.78329 66.14063
[260] 70.86651 72.29287 63.61936 67.86107 65.59159 68.03930 71.50956
[267] 59.46389 66.74784 65.41965 66.05451 67.15774 71.06698 66.36099
[274] 60.70044 64.55880 62.22943 62.84438 65.22406 60.12442 61.31367
[281] 65.95675 64.40532 65.32963 66.29778 73.66363 65.26409 68.17779
[288] 76.08612 57.12575 63.64665 69.07726 65.57866 68.19108 65.22301
[295] 65.08067 64.87229 67.95642 64.35121 69.63280 67.91065 70.47380
[302] 62.47596 66.03875 66.15167 59.76509 68.76288 69.76901 65.47378
[309] 66.31679 67.01242 66.61873 65.41921 65.94592 62.79955 60.25100
[316] 70.93250 65.57985 68.14299 70.98151 64.70934 66.93683 76.55776
[323] 65.98704 67.40567 71.49025 65.35095 67.25122 63.74499 74.18365
[330] 70.76935 72.05925 71.80645 65.30472 69.23811 61.53564 70.50125
[337] 68.86354 68.46742 67.52113 70.33257 60.82981 64.85267 65.29563
[344] 62.98867 73.56694 67.19767 65.17900 68.18808 72.92542 66.79593
[351] 60.60274 63.84026 67.68119 63.43628 68.95476 67.06900 67.63089
[358] 67.57084 69.40879 64.86222 67.74107 63.92308 68.58149 64.94003
[365] 64.70776 69.90590 60.88474 63.89577 62.99582 69.55412 68.33736
[372] 64.22386 60.79042 70.47499 66.11643 67.32704 65.87842 66.01970
[379] 62.45457 65.70133 72.30919 68.98563 60.34540 65.98672 62.45777
[386] 63.67251 67.57613 61.71024 65.37755 62.82172 66.25270 71.74910
[393] 69.93682 62.31402 66.29842 68.42810 61.95063 67.19873 71.29669
[400] 70.17617 64.81337 69.14547 65.46255 65.06654 63.14364 65.12586
[407] 67.23247 67.62110 70.02647 69.30029 72.99750 64.94413 62.10118
[414] 69.52684 71.15921 65.57724 65.32443 69.20753 66.71795 68.25052
[421] 66.06511 61.21388 69.99306 67.33811 66.58575 60.92931 61.71373
[428] 63.70836 67.31115 61.65879 71.12888 66.54122 61.76261 68.34315
[435] 65.58440 64.29985 65.62579 64.97857 65.74737 62.71308 69.45046
[442] 68.98801 61.94261 62.68882 61.05315 71.76333 66.38864 64.65740
[449] 68.37692 67.62022 69.49350 62.02332 58.07529 68.16860 65.57613
[456] 69.16065 63.76305 65.38228 67.70117 62.74346 64.36608 70.83828
[463] 67.16180 69.31872 74.54827 66.80545 69.03882 67.34174 66.68564
[470] 60.82888 66.19340 69.82842 62.32559 63.98741 66.56513 69.04712
[477] 71.36017 65.87823 62.59562 68.78528 60.76952 61.37059 69.48542
[484] 68.08233 74.16197 64.49671 61.14482 66.12192 65.51637 64.41974
[491] 65.20649 71.36714 66.40974 66.24808 65.58922 64.00654 61.80511
[498] 62.51984 66.06400 66.57682
```

Indexing Data Frame
=======================================================
Here's how we examine a row

```r
people[2,]
```

```
    height armspan
2 73.56895 71.3307
```

Indexing Data Frame
=======================================================
Here's how we index both a row and column

```r
people[2, 'height']
```

```
[1] 73.56895
```

Libraries
=======================================================

```r
library(ggplot2)
```

Plot Data
=======================================================

```r
qplot(x = height, y = armspan, data = people)
```

![plot of chunk unnamed-chunk-14](StirTrek2018-figure/unnamed-chunk-14-1.png)

Syntax Convention
=======================================================
Notice that we didn't say people$height in the x parameter...

```r
qplot(x = height, y = armspan, data = people)
```

in most languages you would need to do something like this:


```r
with(people, 
     {qplot(x = height, y = armspan)}
)
```

A lot of functions take a data argument as the environment in which they evaluate the arguments

Formula
=======================================================
- `armspan ~ height` is a formula, can be read as "armspan by height"

```r
reg_form <- lm(armspan ~ height, data = people)
```

Summary of our Regression Line
=======================================================

```r
summary(reg_form)
```

```

Call:
lm(formula = armspan ~ height, data = people)

Residuals:
     Min       1Q   Median       3Q      Max 
-3.08956 -1.56482  0.07192  1.57984  3.08450 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.48462    1.47120   1.009    0.313    
height       0.97749    0.02213  44.179   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.76 on 498 degrees of freedom
Multiple R-squared:  0.7967,	Adjusted R-squared:  0.7963 
F-statistic:  1952 on 1 and 498 DF,  p-value: < 2.2e-16
```

Regression
=======================================================
- lm is a function to fit a linear model

```r
reg_form$coefficients
```

```
(Intercept)      height 
  1.4846226   0.9774937 
```
- Remember y = mx + b
  - armspan = 0.9774937 * height + 1.4846226

Apply Formula
=======================================================

```r
people$rline <- predict(reg_form, newdata = people)
people$rline
```

```
  [1] 60.74879 73.39781 65.95173 67.06665 63.78566 65.77949 66.37662
  [8] 60.16801 63.16288 64.67004 67.32224 63.73033 64.60280 66.17781
 [15] 64.51535 68.27823 68.89025 62.94831 71.50988 66.31124 61.43237
 [22] 63.23684 61.34860 65.23108 73.30254 69.67256 66.10880 63.76293
 [29] 64.17921 66.15659 65.29228 70.21598 64.38671 67.95822 67.29264
 [36] 70.90317 65.20160 67.90555 62.12622 67.23668 67.98437 61.50717
 [43] 62.02017 67.46134 66.66319 69.35899 68.23710 67.20451 61.28589
 [50] 64.35121 64.44222 65.93171 66.35967 70.42900 62.59061 67.99945
 [57] 63.67398 67.77242 61.08044 60.07607 66.18213 64.74776 68.04182
 [64] 64.46403 70.72202 67.97240 68.56471 64.94594 68.85712 65.72580
 [71] 65.14125 65.52023 62.04936 68.79773 68.14810 65.29078 63.05766
 [78] 72.65932 59.89775 65.20191 73.61080 64.70533 73.70812 65.76649
 [85] 68.64379 63.85668 73.29267 66.62782 70.85791 62.67717 64.44266
 [92] 63.37593 62.74481 63.57200 66.92453 68.35048 69.85668 58.23049
 [99] 69.51817 65.70312 65.14077 69.40070 68.19031 60.40096 60.59315
[106] 70.38475 67.35958 68.12467 69.52214 67.47827 62.71367 56.33137
[113] 62.82618 63.78562 65.04304 77.02031 62.46800 63.16615 67.28333
[120] 62.86459 72.86686 64.62344 65.63829 67.94750 65.53299 59.96483
[127] 71.78867 64.16112 65.33282 68.18248 63.72124 67.15699 66.85606
[134] 70.78862 65.40583 65.09789 63.64051 72.12266 66.58974 59.85459
[141] 65.27838 64.60964 64.48772 71.23412 68.02256 64.77373 63.74729
[148] 65.75048 69.67043 68.20702 62.58682 62.80942 66.79361 62.06486
[155] 68.60831 65.42446 69.86741 70.80080 69.05007 66.05016 72.90155
[162] 64.95800 65.73780 60.07477 67.54623 68.14621 66.99976 71.87404
[169] 65.11085 66.49610 63.88426 70.82209 66.05046 73.11283 61.62312
[176] 62.89731 68.37615 65.16495 61.47435 71.42152 68.38962 67.18346
[183] 66.08597 64.50529 65.52376 66.42226 69.65819 66.65513 70.09729
[190] 68.37645 62.33786 74.81388 62.33396 70.59089 62.23431 66.80513
[197] 67.21845 69.95780 67.55773 65.54347 61.23044 70.55455 65.79457
[204] 62.75744 64.94833 60.13550 77.82706 67.97108 68.76380 66.87480
[211] 71.15470 70.88712 64.61567 71.82391 74.37368 72.54146 67.96734
[218] 64.80674 68.00307 63.47411 67.42267 66.86945 66.13598 61.74286
[225] 72.62958 63.12811 62.61877 60.64553 64.81821 72.93293 67.85468
[232] 72.43970 61.05776 59.78179 61.77354 68.98096 62.83605 61.83308
[239] 69.53918 68.22867 63.58273 68.41327 68.72542 65.07806 68.30215
[246] 70.47805 69.00171 66.55895 62.25671 68.98924 69.94785 69.73011
[253] 62.60190 67.19762 74.11743 64.54346 68.19335 62.85489 66.13667
[260] 70.75619 72.15045 63.67215 67.81839 65.59999 67.99261 71.38477
[267] 59.61021 66.73022 65.43192 66.05249 67.13090 70.95215 66.35207
[274] 60.81893 64.59045 62.31350 62.91461 65.24073 60.25587 61.41835
[281] 65.95693 64.44041 65.34392 66.29029 73.49036 65.27986 68.12799
[288] 75.85833 57.32469 63.69883 69.00721 65.58735 68.14098 65.23970
[295] 65.10057 64.89688 67.91160 64.38753 69.55025 67.86686 70.37232
[302] 62.55448 66.03708 66.14746 59.90462 68.69991 69.68340 65.48483
[309] 66.30887 66.98885 66.60401 65.43149 65.94634 62.87078 60.37960
[316] 70.82070 65.58852 68.09397 70.86860 64.73760 66.91496 76.31935
[323] 65.98654 67.37325 71.36590 65.36477 67.22227 63.79495 73.99867
[330] 70.66122 71.92208 71.67498 65.31958 69.16444 61.63532 70.39916
[337] 68.79830 68.41109 67.48611 70.23427 60.94538 64.87770 65.31069
[344] 63.05566 73.39585 67.16993 65.19669 68.13804 72.76876 66.77723
[351] 60.72342 63.88808 67.64257 63.49319 68.88747 67.04415 67.59339
[358] 67.53470 69.33128 64.88703 67.70110 63.96903 68.52260 64.96310
[365] 64.73606 69.81720 60.99908 63.94234 63.06264 69.47334 68.28396
[372] 64.26304 60.90688 70.37349 66.11302 67.29638 65.88036 66.01847
[379] 62.53357 65.70726 72.16640 68.91764 60.47187 65.98623 62.53670
[386] 63.72410 67.53987 61.80600 65.39077 62.89246 66.24622 71.61892
[393] 69.84743 62.39619 66.29092 68.37266 62.04098 67.17096 71.17669
[400] 70.08139 64.83928 69.07389 65.47385 65.08676 63.20714 65.14474
[407] 67.20394 67.58383 69.93506 69.22523 72.83923 64.96710 62.18814
[414] 69.44667 71.04231 65.58597 65.33885 69.13455 66.70100 68.19908
[421] 66.06285 61.32081 69.90240 67.30720 66.57178 61.04264 61.80940
[428] 63.75914 67.28085 61.75570 71.01266 66.52825 61.85719 68.28962
[435] 65.59296 64.33732 65.63342 65.00077 65.75227 62.78627 69.37201
[442] 68.91997 62.03314 62.76255 61.16370 71.63283 66.37910 64.68682
[449] 68.32264 67.58297 69.41408 62.11203 58.25285 68.11900 65.58488
[456] 69.08872 63.81261 65.39539 67.66209 62.81596 64.40207 70.72860
[463] 67.13486 69.24323 74.35509 66.78653 68.96963 67.31075 66.66942
[470] 60.94447 66.18825 69.74146 62.40750 64.03192 66.55163 68.97775
[477] 71.23874 65.88018 62.67145 68.72180 60.88645 61.47399 69.40619
[484] 68.03467 73.97748 64.52975 61.25330 66.11839 65.52646 64.45452
[491] 65.22356 71.24555 66.39973 66.24171 65.59767 64.05062 61.89873
[498] 62.59738 66.06177 66.56304
```

Plot Regression
=======================================================

```r
ggplot(data = people, aes(x = height)) +
  geom_point(aes(y = armspan)) +
  geom_line(aes(y = rline, color = 'regression line'))
```

![plot of chunk unnamed-chunk-21](StirTrek2018-figure/unnamed-chunk-21-1.png)


What is Our Regression Formula/Line?
=======================================================
It describes the relationship between the response variable (armspan) and the dependent variable (height). In other words, it describes how armspan is expected to change when height changes.

How It Was Created
=======================================================
We did not explicitly program the relationship with rules, we used an alogorithm that could infer the relationship based on example data.

Does The Relationship Hold?
=======================================================
Let's assume that was real data from American adults (18-50) measured in the last 10 years...
- Is the relationship valid for adults (18-50) in France?
- Is the relationship valid for children?
- Is the relationship valid for senior citizens?
- Is the relationship valid for ancient Neanderthal people?

This Is Machine Learning
=======================================================
The "rules" of our model weren't program in if-else like statements by a programmer, they were patterns recognized by an algorithm from data.

The model to describe the relationship can be used to to predict the response variable, based on the input variable(s). It's not a perfect predictor, but can be a useful prediction. Among other considerations, it's best that you're trying to predict on a subject that is of the same type as the data used to train the model.

As an example, our model for American adults should not be applied to children, as they were not represented in the set and have meaningful physiological differences.


So Let's Make a Prediction
=======================================================
We meet someone new with a height of 70 inches. What does our model predict their armspan is?

```r
new_person = list(height = 70)
predict(reg_form, newdata = new_person)
```

```
       1 
69.90918 
```

A Word on Data Sets
=======================================================
# When Supervised Learning...
## Train
Data used to train and tune the algorithm

## Validation
Data used to validate the model being built

## Test
Data used with final model to estimate model fit

Caret Package
=======================================================
* Name is short for **C**lassification **A**nd **RE**gression **T**raining

Contains tools for:

* data splitting
* pre-processing
* feature selection
* model tuning using resampling
* variable importance estimation

Regression: Predicting HP
=======================================================

```r
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

Select Continuous Columns
=======================================================

```r
x <- mtcars[, c('hp', 'mpg', 'disp', 'wt', 'qsec')]
head(x)
```

```
                   hp  mpg disp    wt  qsec
Mazda RX4         110 21.0  160 2.620 16.46
Mazda RX4 Wag     110 21.0  160 2.875 17.02
Datsun 710         93 22.8  108 2.320 18.61
Hornet 4 Drive    110 21.4  258 3.215 19.44
Hornet Sportabout 175 18.7  360 3.440 17.02
Valiant           105 18.1  225 3.460 20.22
```

Let's Look At Correlation
=======================================================

```r
pairs(x)
```

![plot of chunk unnamed-chunk-25](StirTrek2018-figure/unnamed-chunk-25-1.png)

Split Our Data
=======================================================

```r
library(caret)

training_index <- createDataPartition(x$hp, p = 0.7, list = FALSE)
train_data <- x[training_index, ]
test_data <- x[-training_index, ]  # note the '-' in front of the index

dim(train_data)
```

```
[1] 24  5
```

Create Our Model
=======================================================

```r
model <- train(hp ~ .,
               data = train_data,
               method = "lm")

summary(model)
```

```

Call:
lm(formula = .outcome ~ ., data = dat)

Residuals:
   Min     1Q Median     3Q    Max 
-34.64 -15.73  -4.13  15.43  43.34 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 349.6838    77.1400   4.533 0.000227 ***
mpg          -1.7725     2.1070  -0.841 0.410671    
disp          0.2113     0.1204   1.756 0.095270 .  
wt            5.6126    16.5219   0.340 0.737806    
qsec        -13.3088     3.9790  -3.345 0.003404 ** 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 24.76 on 19 degrees of freedom
Multiple R-squared:  0.8545,	Adjusted R-squared:  0.8239 
F-statistic:  27.9 on 4 and 19 DF,  p-value: 1.015e-07
```

Predict On Test Data
=======================================================

```r
test_data$predicted <- predict(model, test_data)

test_data$miss <- test_data$predicted - test_data$hp

test_data[, c('hp', 'predicted', 'miss')]
```

```
                  hp predicted        miss
Mazda RX4 Wag    110 135.89127   25.891270
Duster 360       245 209.63361  -35.366395
Merc 450SE       180 170.16383   -9.836174
Fiat 128          66  62.11056   -3.889439
Honda Civic       52  74.38162   22.381618
Pontiac Firebird 175 194.84054   19.840542
Maserati Bora    335 212.42861 -122.571387
Volvo 142E       109 105.38018   -3.619821
```

Measuring Error
=======================================================

```r
library(ModelMetrics)
mse(test_data$hp, test_data$predicted)
```

```
[1] 2245.556
```


```r
mae(test_data$hp, test_data$predicted)
```

```
[1] 30.42458
```

Housing Prices
=======================================================
Let's look at a larger size data set:

```r
houses_raw <- read.csv("data/housing/train.csv")

houses <- houses_raw[, c('LotArea', 'Neighborhood',
                         'YearBuilt', 'TotRmsAbvGrd',
                         'FullBath', 'HalfBath',
                         'GrLivArea', 'TotalBsmtSF',
                         'SalePrice')]
dim(houses)
```

```
[1] 1460    9
```

Categorical Features
=======================================================

```r
class(houses$Neighborhood)
```

```
[1] "factor"
```

```r
summary(houses$Neighborhood)
```

```
Blmngtn Blueste  BrDale BrkSide ClearCr CollgCr Crawfor Edwards Gilbert 
     17       2      16      58      28     150      51     100      79 
 IDOTRR MeadowV Mitchel   NAmes NoRidge NPkVill NridgHt  NWAmes OldTown 
     37      17      49     225      41       9      77      73     113 
 Sawyer SawyerW Somerst StoneBr   SWISU  Timber Veenker 
     74      59      86      25      25      38      11 
```

Cross Validation
=======================================================
![kfold cross val](images/kfold.jpg)

[creative commons - wikimedia]

Cross Validation
=======================================================

```r
folds <- 10
trctl <- trainControl(method = "cv", number = folds, savePredictions = TRUE)

model <- train(SalePrice ~ .,
               data = houses,
               method = "lasso",  # another regression model
               trControl = trctl,
               preProcess = c('center', 'scale'))
```

Examine Housing Results
=======================================================

```r
mae(houses$SalePrice, model$pred$pred)
```

```
[1] 71168.93
```

A Word On Centering
=======================================================

```r
center <- function(data) {
  return(data - mean(data))
}

center(0:10)
```

```
 [1] -5 -4 -3 -2 -1  0  1  2  3  4  5
```

A Word On Scaling
=======================================================

```r
scale <- function(data) {
  data <- data - min(data)
  return(data / max(data))
}

scale(0:10)
```

```
 [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
```

Combined
=======================================================

```r
data <- runif(10, min = 1e4, max = 5e6)
data
```

```
 [1] 2929670.0 2316389.7 2166179.7  227675.9  993271.3 4907249.0 2028033.9
 [8] 4248921.2  297865.0  953574.8
```


```r
center(scale(data))
```

```
 [1]  0.17582522  0.04477046  0.01267137 -0.40157662 -0.23797294
 [6]  0.59842338 -0.01684964  0.45774222 -0.38657759 -0.24645586
```

Preprocessing
=======================================================
Caret just handled that with:

```r
preProcess = c('center', 'scale')
```

Missing Data
=======================================================
Caret can impute missing values:

```r
preProcess = c('knnImpute')
```

Your mileage may vary with auto-imputing, you will often want to think through how your are imputing

Classification
=======================================================

```r
actual <- factor(c('Hero', 'Hydra', 'Shield', 'Cannon Fodder', 'Hydra'))
predicted <- factor(c('Hero', 'Shield', 'Hydra', 'Cannon Fodder', 'Hydra'))
table(actual, predicted)
```

```
               predicted
actual          Cannon Fodder Hero Hydra Shield
  Cannon Fodder             1    0     0      0
  Hero                      0    1     0      0
  Hydra                     0    0     1      1
  Shield                    0    0     1      0
```

Classification
=======================================================
iris data set

```r
head(iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

SVM for Classification
=======================================================
Support Vector Machine

```r
trctl <- trainControl(method="cv", repeats=3,
                      savePredictions = TRUE)

model <- train(Species ~ .,
               data = iris,
               method = "svmRadial",
               trControl = trctl,
               preprocess = c('scale'))
```

SVM Results
=======================================================
Confusion Matrix

```r
#prefix with library, but ModelMetrics also has a confusion matrix function
caret::confusionMatrix(model$pred$obs, model$pred$pred)$table
```

```
            Reference
Prediction   setosa versicolor virginica
  setosa        147          2         1
  versicolor      0        144         6
  virginica       0          9       141
```

What Feature mattered?
=======================================================
Caret will assess variable importance:

```r
caret::varImp(model)
```

```
ROC curve variable importance

  variables are sorted by maximum importance across the classes
             setosa versicolor virginica
Petal.Length 100.00     100.00     100.0
Petal.Width  100.00     100.00     100.0
Sepal.Length  90.70      59.30      90.7
Sepal.Width   54.59      54.59       0.0
```

Unsupervised Learning
=======================================================
The algorithm looks for patterns without answers. This is useful for exploring your data.

Clustering with labelled classification data before doing supervised learning, can be a great way to decide if the categories you selected may have overlap, or other issues.

Projection
=======================================================

![plot of chunk unnamed-chunk-47](StirTrek2018-figure/unnamed-chunk-47-1.png)

***

![plot of chunk unnamed-chunk-48](StirTrek2018-figure/unnamed-chunk-48-1.png)

Unsupervised Learning
=======================================================
Let's load up Satellite image data that could be used in a classification problem


```r
library(mlbench)
library(tsne)

data("Satellite")
dim(Satellite)
```

```
[1] 6435   37
```

Clustering Satellite Data
=======================================================
What fields to do we have?


```r
names(Satellite)
```

```
 [1] "x.1"     "x.2"     "x.3"     "x.4"     "x.5"     "x.6"     "x.7"    
 [8] "x.8"     "x.9"     "x.10"    "x.11"    "x.12"    "x.13"    "x.14"   
[15] "x.15"    "x.16"    "x.17"    "x.18"    "x.19"    "x.20"    "x.21"   
[22] "x.22"    "x.23"    "x.24"    "x.25"    "x.26"    "x.27"    "x.28"   
[29] "x.29"    "x.30"    "x.31"    "x.32"    "x.33"    "x.34"    "x.35"   
[36] "x.36"    "classes"
```

Clustering Satellite Data
=======================================================
What does our input data look like?


```r
class(Satellite$x.10)
```

```
[1] "numeric"
```



```r
summary(Satellite$x.10)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  27.00   71.00   85.00   82.89  102.00  130.00 
```

Clustering Satellite Data
=======================================================
What does our label data look like?


```r
class(Satellite$classes)
```

```
[1] "factor"
```



```r
summary(Satellite$classes)
```

```
           red soil         cotton crop           grey soil 
               1533                 703                1358 
     damp grey soil  vegetation stubble very damp grey soil 
                626                 707                1508 
```

Split into X, y
=======================================================
In preparation for projecting...

We're going to use principle components and tsne to create a 2d projection of 36 dimensional data.


```r
X <- Satellite[, -37] #drop last column
y <- Satellite$classes
```



Project Into Lower Dimensions
=======================================================
1. project with principle components down to 4 dimensions
2. project with that to 2 dimensions with tsne


```r
pca <- princomp(X)
X_t <- predict(pca, X)[,1:2]

data <- data.frame(X_t,
                   y = as.factor(y))
data
```

```
           Comp.1        Comp.2                   y
1    -38.46692577 -33.334869060           grey soil
2    -33.87146415 -15.629939294           grey soil
3    -32.96125991 -13.178900238           grey soil
4    -29.89770016  -9.401104505           grey soil
5    -26.87398013  -4.257848873           grey soil
6    -29.91296837  -5.560905159           grey soil
7    -25.94906956 -18.510702578           grey soil
8    -26.33933578 -16.387504448           grey soil
9    -21.66933451   2.089131305      damp grey soil
10   -27.47464751  -0.127040499      damp grey soil
11   -28.16646534   3.540188506      damp grey soil
12   -21.42795544  10.670304062      damp grey soil
13   -16.78050479   6.422155296      damp grey soil
14   -20.22476818   9.170145465      damp grey soil
15   -17.60327895  23.267824052      damp grey soil
16   -14.71715811  17.806675939      damp grey soil
17   -14.51649975   9.756739425      damp grey soil
18   -19.15842181  -4.683341656      damp grey soil
19   -24.03295023 -18.301537536           grey soil
20   -36.80993948 -35.572194257           grey soil
21   -19.34197516 -22.667144066           grey soil
22   -21.93090613 -23.836821501           grey soil
23   -38.80687538 -32.120363891           grey soil
24   -41.21092282 -46.365027108           grey soil
25   -28.87649653 -27.474204589           grey soil
26   -25.85575869 -26.044166222           grey soil
27   -31.03541102 -28.450857694           grey soil
28   -35.53588963 -34.932481231           grey soil
29   -38.75720813 -40.917240623           grey soil
30   -39.78238354 -32.130934799           grey soil
31   -37.82189074 -26.805439512           grey soil
32   -29.19341326 -17.966565260           grey soil
33   -33.86007611 -18.102199966           grey soil
34   -32.94661532 -17.771234131           grey soil
35   -31.35586206 -18.944346674           grey soil
36   -36.67281292 -26.217090498           grey soil
37   -38.83849400 -29.666571625           grey soil
38   -32.33436101 -28.962709061           grey soil
39   -34.12741108 -31.897864492           grey soil
40   -36.14888771 -28.439200569           grey soil
41   -35.30552101 -25.515811252           grey soil
42   -30.37619149 -16.930923869           grey soil
43   -27.68314462 -11.210442987           grey soil
44   -19.42986443  -4.929506852  vegetation stubble
45    -8.40202323   6.635816834  vegetation stubble
46    10.76996545  31.095866276  vegetation stubble
47    -8.21367090   4.113513299 very damp grey soil
48   -26.93114763   2.035183974 very damp grey soil
49   -11.30814923  36.151095404 very damp grey soil
50    -3.57631926  43.567339139 very damp grey soil
51    -1.80925231  34.674063241  vegetation stubble
52    15.09160862  42.298851880  vegetation stubble
53    25.51211756  56.403784304  vegetation stubble
54    27.43655336  60.164455173  vegetation stubble
55   -48.30254036 -59.426164510           grey soil
56   -39.92571978 -27.817634065           grey soil
57   -33.75209393 -13.794301098           grey soil
58   -31.57425130 -12.802597860           grey soil
59   -28.11266163 -12.878587288           grey soil
60   -22.71288976 -25.769599525           grey soil
61   -26.52308334 -34.295986836           grey soil
62   -32.65187923 -37.139823474           grey soil
63   -34.04763424 -33.503986617           grey soil
64   -23.31701550  -0.787807291      damp grey soil
65   -24.81535226  -2.938653082      damp grey soil
66   -22.61668087  -2.280071388      damp grey soil
67   -22.96662888  -0.477088754      damp grey soil
68   -19.90266866   3.306063252      damp grey soil
69   -15.02421257  27.030988551      damp grey soil
70   -14.14204815  29.818172814      damp grey soil
71   -15.96902640  26.548963440      damp grey soil
72   -15.02421257  27.030988551      damp grey soil
73   -22.38602178   0.457519522      damp grey soil
74   -26.82257530 -14.695317756           grey soil
75   -32.06467430 -21.589154453           grey soil
76   -32.43680161 -42.132716946           grey soil
77   -36.37096286 -34.186052655           grey soil
78   -29.00715841 -20.276404307           grey soil
79   -31.02372379 -25.537120235           grey soil
80   -34.65160245 -38.273111916           grey soil
81   -38.78272680 -44.593334103           grey soil
82   -39.17558244 -49.780607287           grey soil
83   -38.25692433 -52.230534386           grey soil
84   -40.81064777 -43.605072040           grey soil
85   -38.59092792 -33.471700666           grey soil
86   -37.43569382 -33.047029792           grey soil
87   -40.90864500 -41.345025084           grey soil
88   -40.36371122 -45.868209127           grey soil
89   -36.64670697 -39.336481152           grey soil
90   -36.24130945 -39.139553375           grey soil
91   -34.98155768 -38.496853227           grey soil
92   -34.64156985 -31.601629462           grey soil
93   -31.57882151 -30.146601771           grey soil
94   -34.55470142 -24.230542945           grey soil
95   -31.17897557 -18.800841881           grey soil
96   -32.43761321 -19.428853160           grey soil
97   -31.15844297 -21.252944879           grey soil
98   -30.39358429 -25.358536914           grey soil
99   -35.56851672 -30.234389403           grey soil
100  -36.00317487 -27.955322605           grey soil
101  -33.81931918 -26.980146784           grey soil
102  -32.01964204 -24.174475383           grey soil
103  -27.02499442  -4.743419301           grey soil
104  -11.10955710  13.324550601           grey soil
105  -11.67793767  -3.728487691           grey soil
106  -21.08837735  -3.967055792 very damp grey soil
107  -18.51152287   5.919034841 very damp grey soil
108  -12.32450234  30.298925012 very damp grey soil
109  -14.88374149  35.299342477 very damp grey soil
110  -12.09361754  38.600546959  vegetation stubble
111   -1.42082761  41.239994622  vegetation stubble
112   15.27211282  49.259950025  vegetation stubble
113   23.08997532  59.252793698  vegetation stubble
114   19.60408540  63.785073100  vegetation stubble
115   19.93620909  65.860540135  vegetation stubble
116  -54.62441647 -84.672958323           grey soil
117  -55.74660930 -88.224513922           grey soil
118  -46.16428786 -73.397477973           grey soil
119  -32.95744615 -22.062883007           grey soil
120  -31.89827557 -12.354511653           grey soil
121  -34.06072437 -13.332293067           grey soil
122  -33.82669123 -20.379324869           grey soil
123  -31.47578999 -26.484242351           grey soil
124  -31.81677363 -14.525628334           grey soil
125  -29.10124679  -8.919448551      damp grey soil
126  -26.72506504  -1.506901207      damp grey soil
127  -25.10773532  -2.667071160      damp grey soil
128  -22.04624651   0.760508467      damp grey soil
129  -23.99493942  14.233371255      damp grey soil
130  -21.85410905  10.001821465      damp grey soil
131  -21.83132250  19.820544583      damp grey soil
132  -18.86742776  30.150042255      damp grey soil
133  -10.86823164  37.706890765         cotton crop
134   -7.96666436  34.741582468         cotton crop
135   -0.02220907  20.818341761         cotton crop
136  -25.72252248 -21.100754229         cotton crop
137  -25.63378732 -26.004064366           grey soil
138  -29.40712151 -23.351273967           grey soil
139  -34.63145960 -27.761991281           grey soil
140  -37.23814472 -28.926879793           grey soil
141  -34.10086239 -23.147551278           grey soil
142  -30.64792677 -23.981144059           grey soil
143  -32.80918997 -27.429214799           grey soil
144  -31.20767294 -28.606442773           grey soil
145  -33.59848024 -34.649156090           grey soil
146  -37.36283134 -37.539474411           grey soil
147  -38.91968868 -38.344708409           grey soil
148  -43.02700794 -44.647208970           grey soil
149  -41.04740213 -46.116420421           grey soil
150  -38.20503648 -39.378338140           grey soil
151  -39.60758395 -34.643266310           grey soil
152  -37.11195612 -32.451034682           grey soil
153  -35.55703227 -31.668982023           grey soil
154  -37.13762188 -29.385905936           grey soil
155  -37.13762188 -29.385905936           grey soil
156  -34.97517308 -28.408124522           grey soil
157  -36.54632849 -29.210371398           grey soil
158  -37.35481613 -34.449596997           grey soil
159  -37.04751530 -36.293216795           grey soil
160  -36.46212180 -33.031230985           grey soil
161  -38.08730525 -29.397672050           grey soil
162  -33.25170185 -22.676759020           grey soil
163  -28.14345883 -13.374617166           grey soil
164  -30.09325508  -7.574958117           grey soil
165  -29.48142908  -9.851526576           grey soil
166  -32.54185500 -13.633550273           grey soil
167  -34.19785092 -22.687396825           grey soil
168  -31.08837876 -19.249480202           grey soil
169  -31.10271705 -19.244617990           grey soil
170  -33.48862835 -11.176042837           grey soil
171  -25.98204600  -7.927644405           grey soil
172  -24.72110862  -9.755233583           grey soil
173  -21.32806202  -7.813295683           grey soil
174   -8.10773309   6.643476301           grey soil
175  -29.35351950 -15.990375372           grey soil
176  -28.52576610  -8.760972034           grey soil
177  -23.94697986   6.099570516           grey soil
178  -18.72563466  18.339690251 very damp grey soil
179  -12.91962239  27.372831691 very damp grey soil
180   -6.38942161  36.825401376 very damp grey soil
181    0.81971510  40.157846644  vegetation stubble
182   10.22213912  44.157611610  vegetation stubble
183   19.75041781  46.691038557  vegetation stubble
184   24.87073450  52.980718957  vegetation stubble
185   25.26265111  63.542361608  vegetation stubble
186   27.83292126  66.765963501  vegetation stubble
187  -38.78101960 -35.560991281           grey soil
188  -38.64510113 -48.890834475           grey soil
189  -43.97571212 -62.915747084           grey soil
190  -37.46603704 -44.515278162           grey soil
191  -28.50984888 -19.488588086           grey soil
192  -31.07943293 -14.480918993           grey soil
193  -30.14155646 -12.000028402           grey soil
194  -27.06699306   5.912253670      damp grey soil
195  -25.96244060  13.256909639      damp grey soil
196  -24.33412332   9.619122740      damp grey soil
197  -22.20491911  10.587061219      damp grey soil
198  -20.71915599  17.680457009      damp grey soil
199  -23.92039416  22.489497638      damp grey soil
200  -23.25605832  18.842931746      damp grey soil
201  -25.76598372  20.023705346      damp grey soil
202  -22.01631596  19.827245908      damp grey soil
203  -15.13882604  22.753237275      damp grey soil
204  -14.96635804  33.010895801         cotton crop
205   -5.55947958  29.133588315         cotton crop
206   13.65310592  25.104500116         cotton crop
207   39.61297086  11.187241061         cotton crop
208   86.15111239 -18.897907596         cotton crop
209   86.51065797 -21.219022964         cotton crop
210   -4.12993186  -2.379598568         cotton crop
211  -32.82010190 -26.036484806           grey soil
212  -35.00351691 -27.008179443           grey soil
213  -34.07436614 -24.544310332           grey soil
214  -34.07436614 -24.544310332           grey soil
215  -39.61436744 -36.014725518           grey soil
216  -38.78101960 -35.560991281           grey soil
217  -34.68662147 -37.976011758           grey soil
218  -34.71193569 -37.983660984           grey soil
219  -38.78101960 -35.560991281           grey soil
220  -37.35824298 -32.529361664           grey soil
221  -32.45876084 -30.644043162           grey soil
222  -31.82601473 -30.184154299           grey soil
223  -32.96972468 -15.307558736           grey soil
224  -31.33747261 -18.938861052           grey soil
225  -35.44864835 -31.404076283           grey soil
226  -36.56105454 -36.275343270           grey soil
227  -34.21788596 -33.237525968           grey soil
228  -31.67569854 -17.450119671           grey soil
229  -32.37077444 -11.017164387           grey soil
230  -29.89202270 -11.857564815           grey soil
231  -28.26953947 -13.040879565           grey soil
232  -28.91698413 -13.503137580           grey soil
233  -27.70860769 -10.885870178           grey soil
234  -29.57465183  -9.859671343           grey soil
235  -29.23572561 -11.669175101           grey soil
236  -24.84110436 -13.869513879           grey soil
237  -29.07043414 -26.232944244           grey soil
238  -27.96634900 -17.326363613           grey soil
239  -23.41269062   7.682413905 very damp grey soil
240  -15.26706465  26.401751602 very damp grey soil
241  -11.51504818  28.676709800 very damp grey soil
242  -11.29352794  34.790749896 very damp grey soil
243    1.38095239  44.613879771 very damp grey soil
244    7.98434803  52.983497638 very damp grey soil
245   13.99843284  55.830739777  vegetation stubble
246   20.26284145  52.997860335 very damp grey soil
247   25.99803843  54.736676320  vegetation stubble
248  -37.75178040 -36.511636732           grey soil
249  -36.58026318 -30.958931105           grey soil
250  -33.39910595 -33.787538119           grey soil
251  -33.37748867 -58.014966674           grey soil
252  -43.16978955 -79.484546157           grey soil
253  -44.74744051 -56.065283680           grey soil
254  -27.79191417 -18.545042237           grey soil
255  -25.50191698 -10.678330960           grey soil
256  -28.15770705  -1.241004495           grey soil
257  -28.24776758   4.623358030      damp grey soil
258  -27.33604870   7.094442228      damp grey soil
259  -27.94585662  12.735831253      damp grey soil
260  -27.57776815  15.293387842      damp grey soil
261  -26.43056436  12.014642301      damp grey soil
262  -26.07006562  14.570211267      damp grey soil
263  -22.54493762  17.654520001      damp grey soil
264  -17.82819480  17.464486681      damp grey soil
265  -20.01717985  16.471887589      damp grey soil
266  -22.47335095  11.593251262      damp grey soil
267  -20.98973683   8.390261044         cotton crop
268  -17.51082511  22.131510499         cotton crop
269    4.25767083  18.930056538         cotton crop
270   56.92011832 -14.917600117         cotton crop
271   83.41405239 -24.491741292         cotton crop
272   96.15147495 -27.661840209         cotton crop
273   99.04220112 -28.753554632         cotton crop
274   28.60460973   3.146429539         cotton crop
275  -16.05353501  -1.971935982           grey soil
276  -30.12710232 -19.239901790           grey soil
277  -27.21819687 -18.523285101           grey soil
278  -28.43870546 -20.859741023           grey soil
279  -31.32580353 -21.573607032           grey soil
280  -35.41882472 -27.879094715           grey soil
281  -37.67293940 -35.818425027           grey soil
282  -39.23977538 -39.095189193           grey soil
283  -37.08788507 -33.994275891           grey soil
284  -38.36425217 -32.190157997           grey soil
285  -31.03804077 -30.759790022           grey soil
286  -36.24574489 -32.785385024           grey soil
287  -41.20341358 -31.167072313           grey soil
288  -36.02668964 -21.998839803           grey soil
289  -36.74122745 -27.351362740           grey soil
290  -33.45098958 -23.297519594           grey soil
291  -32.27415729 -20.203761380           grey soil
292  -38.65865751 -34.802936032           grey soil
293  -38.36816945 -32.184873042           grey soil
294  -36.00164412 -35.468791030           grey soil
295  -31.82191743 -24.182049848           grey soil
296  -31.93346736 -16.201111562           grey soil
297  -28.35674144  -7.673401275           grey soil
298  -24.58610748  -7.875947490           grey soil
299  -26.39428885 -13.131228829           grey soil
300  -29.81217000 -17.226227681           grey soil
301  -29.93570619  -8.967193131           grey soil
302  -28.69810621  -5.848116880           grey soil
303  -27.96485602  -9.820872512           grey soil
304  -25.85230359 -10.989049498           grey soil
305  -29.81217000 -17.226227681           grey soil
306  -31.01753934 -19.556833268           grey soil
307  -33.21591458 -18.096433509           grey soil
308  -34.14845565 -16.709529836           grey soil
309  -34.14060191 -19.182918818           grey soil
310  -14.05394857  33.495173899 very damp grey soil
311  -10.04150247  39.261113853 very damp grey soil
312   -0.12648138  60.916042327 very damp grey soil
313    2.43540850  55.916471094 very damp grey soil
314    8.45619492  54.834647160 very damp grey soil
315  -44.84868441 -57.454021738           grey soil
316  -43.16437847 -56.612489365           grey soil
317  -40.99761257 -70.124750393           grey soil
318  -48.73568672 -76.079025505           grey soil
319  -47.50496530 -68.300279065           grey soil
320  -27.81203872 -20.991438909           grey soil
321  -29.49978052 -19.358171913           grey soil
322  -32.47789591 -14.543202634           grey soil
323  -32.15533366 -12.529415991           grey soil
324  -28.20681895 -10.661501955      damp grey soil
325  -26.35358055  -1.583682161      damp grey soil
326  -26.24739089  10.938910652      damp grey soil
327  -24.64199304   5.173464216      damp grey soil
328  -25.31435930   8.814561302      damp grey soil
329  -25.32102743   8.817660957      damp grey soil
330  -17.84779912  14.998386507         cotton crop
331   -6.96303137  11.502512240         cotton crop
332   73.17917530 -16.996113782         cotton crop
333   90.54487483 -25.944218682         cotton crop
334   99.62202647 -32.639745815         cotton crop
335  104.53264691 -35.285829070         cotton crop
336   99.82814915 -32.506515420         cotton crop
337  101.20497603 -36.157402411         cotton crop
338  101.85137749 -34.062434080         cotton crop
339   12.62883464   0.528934817         cotton crop
340  -25.35062484 -11.254455875           grey soil
341  -31.27087191 -22.766263253           grey soil
342  -29.94374858 -19.745866489           grey soil
343  -26.70705749 -15.760572047           grey soil
344  -41.31354371 -39.992330759           grey soil
345  -46.18700571 -42.194877635           grey soil
346  -43.59343306 -43.497291329           grey soil
347  -41.14891787 -40.510667455           grey soil
348  -38.54771012 -34.999433682           grey soil
349  -36.18513031 -31.951640443           grey soil
350  -34.30125379 -32.979698091           grey soil
351  -38.21570960 -38.999796109           grey soil
352  -39.18185540 -37.664199500           grey soil
353  -37.96659225 -30.707180521           grey soil
354  -33.95086717 -32.668979554           grey soil
355  -33.93166418 -36.502694318           grey soil
356  -42.84584381 -32.574030616           grey soil
357  -35.21061895 -33.311679702           grey soil
358  -31.76921538 -35.524912904           grey soil
359  -32.72589436 -34.166732458           grey soil
360  -34.88001794 -35.132848666           grey soil
361  -31.81770979 -31.696776569           grey soil
362  -31.77127695 -25.019334158           grey soil
363  -30.33204935 -19.920097895           grey soil
364  -33.10070152 -17.336884699           grey soil
365  -30.25205912 -17.927021041           grey soil
366  -35.45601209 -29.081855479           grey soil
367  -36.61625415 -29.671445336           grey soil
368  -34.79020020 -24.419897899           grey soil
369  -32.64680959 -20.968093257           grey soil
370  -32.44819839 -16.385267004           grey soil
371  -29.11647625 -23.638164899           grey soil
372  -31.46968251 -31.672161547           grey soil
373  -37.12051561 -31.966393679           grey soil
374  -34.79948000 -23.925676007           grey soil
375  -29.91616560 -17.077482745           grey soil
376  -28.09094959 -21.116957531           grey soil
377  -18.35618907  24.389539130 very damp grey soil
378  -17.05237070  27.515769549 very damp grey soil
379  -19.52187747  22.454725503 very damp grey soil
380  -12.87558453  31.367612072 very damp grey soil
381  -14.08611811  36.556530977 very damp grey soil
382  -13.56417160  42.555641187 very damp grey soil
383  -48.43048085 -73.314603911           grey soil
384  -42.76469785 -60.967777703           grey soil
385  -40.68585826 -77.321442862           grey soil
386  -39.34006593 -80.984807740           grey soil
387  -33.30530831 -22.485070911           grey soil
388  -29.54377924  -9.089257659           grey soil
389  -29.92836220  -5.574826983           grey soil
390  -27.41037827   8.079281427      damp grey soil
391  -24.35800031   7.478762495      damp grey soil
392  -30.11343928   6.857054660      damp grey soil
393  -29.03556173  11.712840362      damp grey soil
394  -26.64287116  14.774704500         cotton crop
395  -19.45630427  16.201095775         cotton crop
396  -13.17927922  14.816647651         cotton crop
397    2.19786640  11.398587832         cotton crop
398   37.46301525  -2.888826470         cotton crop
399   73.81350342 -24.486255875         cotton crop
400   94.48150938 -37.423351025         cotton crop
401  101.40547194 -41.405501980         cotton crop
402  104.83314650 -34.221457133         cotton crop
403  105.76845700 -39.254098157         cotton crop
404  104.89313874 -39.700464042         cotton crop
405  106.87689409 -41.265361366         cotton crop
406  108.29709600 -43.525805775         cotton crop
407   98.62921150 -33.445269897         cotton crop
408   48.72247274 -10.625752672         cotton crop
409  -10.25995698  -8.969960018         cotton crop
410  -35.39252854 -28.026493347           grey soil
411  -34.65342318 -34.615868372           grey soil
412  -40.93719459 -33.231250704           grey soil
413  -41.39640275 -28.496135022           grey soil
414  -35.68782828 -20.902166120           grey soil
415  -34.40087576 -22.714668624           grey soil
416  -39.76946143 -29.679914475           grey soil
417  -41.69360892 -37.440454739           grey soil
418  -40.79298283 -37.455589579           grey soil
419  -39.68186070 -32.589960942           grey soil
420  -36.97751564 -31.362095824           grey soil
421  -31.95379803 -30.918842236           grey soil
422  -35.22110132 -36.770708215           grey soil
423  -38.09464174 -33.764201794           grey soil
424  -40.75973824 -37.445746644           grey soil
425  -40.42441733 -41.736076626           grey soil
426  -36.46473837 -39.866921747           grey soil
427  -42.10176033 -46.687314858           grey soil
428  -34.11311301 -31.900851614           grey soil
429  -36.64378080 -33.187492752           grey soil
430  -38.23413359 -32.009023936           grey soil
431  -36.52647506 -26.294716454           grey soil
432  -36.94091192 -21.547965923           grey soil
433  -37.05058773 -28.440629688           grey soil
434  -36.48870683 -34.940019381           grey soil
435  -30.38349670 -41.238448585           grey soil
436  -36.11531873 -46.372950330           grey soil
437  -34.88441602 -30.265661439           grey soil
438  -38.42082486 -31.941622444           grey soil
439  -37.54307832 -29.155848567           grey soil
440  -33.10859391 -22.199717602           grey soil
441  -31.85842029 -24.023191350           grey soil
442  -31.14371018 -10.376962739 very damp grey soil
443  -28.59958340 -11.212366167 very damp grey soil
444  -27.02194261 -14.852780915 very damp grey soil
445  -27.71797530  -8.755352868 very damp grey soil
446  -27.19909360  -0.301805286 very damp grey soil
447  -24.31933501  11.190760989 very damp grey soil
448  -17.97614639  22.943147150 very damp grey soil
449  -15.67689936  34.514619763 very damp grey soil
450  -42.44767866 -83.032742600           grey soil
451  -40.26668618 -76.605120686           grey soil
452  -39.74285060 -71.016463092           grey soil
453  -41.43952006 -66.926371074           grey soil
454  -39.26691527 -55.829006572           grey soil
455  -37.13019447 -41.889315451           grey soil
456  -33.90975309 -20.697301860           grey soil
457  -29.46029691  -7.996680112           grey soil
458  -28.20054513  -7.353979964           grey soil
459  -29.80789621  -3.722279841           grey soil
460  -31.06764799  -4.364979989      damp grey soil
461  -31.07590220  -1.896947281      damp grey soil
462  -30.06352937   5.330797750         cotton crop
463  -22.44621220   8.586384922         cotton crop
464  -15.94697038  11.542072139         cotton crop
465    5.10523243   8.472744537         cotton crop
466   33.59204096  -1.637564194         cotton crop
467   46.48952688   0.025168013         cotton crop
468   89.93649744 -35.735331333         cotton crop
469  111.04526704 -56.281982043         cotton crop
470  115.05293318 -57.312332002         cotton crop
471  112.30694642 -51.396849372         cotton crop
472  104.06405255 -40.787790140         cotton crop
473  106.19722877 -37.289062889         cotton crop
474  101.82232725 -32.577359167         cotton crop
475   78.26631260 -18.644777517         cotton crop
476   24.34359115  -6.069879926         cotton crop
477  -32.34187597 -27.426849466           grey soil
478  -34.50432477 -28.404630880           grey soil
479  -37.19939732 -30.306683573           grey soil
480  -37.08255073 -34.587125027           grey soil
481  -35.88344904 -32.248063512           grey soil
482  -32.87697848 -28.333465019           grey soil
483  -35.32981888 -31.331754099           grey soil
484  -37.08568456 -34.582897063           grey soil
485  -35.41268152 -36.216658120           grey soil
486  -37.21726991 -30.302949671           grey soil
487  -38.14775109 -28.936837921           grey soil
488  -34.14820984 -38.043118990           grey soil
489  -35.82593278 -33.940196915           grey soil
490  -36.25705663 -31.660001808           grey soil
491  -34.95889966 -33.473138559           grey soil
492  -35.29158701 -27.554250233           grey soil
493  -33.36041118 -30.961534907           grey soil
494  -36.00317487 -27.955322605           grey soil
495  -35.02155469 -29.314980335           grey soil
496  -32.38319960 -34.771818351           grey soil
497  -35.98895763 -36.329126384           grey soil
498  -39.51721071 -42.949047774           grey soil
499  -36.91320498 -37.574622741           grey soil
500  -35.02155469 -29.314980335           grey soil
501  -35.39480893 -36.220392022           grey soil
502  -33.77932216 -36.162019676           grey soil
503  -30.82784196 -23.074113842           grey soil
504  -32.55956740 -26.337446636           grey soil
505  -25.69743926   9.415642485 very damp grey soil
506  -11.37128074  32.633004737 very damp grey soil
507   -9.80639632  31.301433981 very damp grey soil
508  -10.22470858  35.434864650 very damp grey soil
509  -16.79617229  16.078642094 very damp grey soil
510  -20.94398036  20.281807692 very damp grey soil
511  -16.66862986  28.062329670 very damp grey soil
512  -13.60345711  33.489939628 very damp grey soil
513  -40.47487227 -72.957430304           grey soil
514  -40.12269893 -62.689472272           grey soil
515  -37.19635737 -41.809212975           grey soil
516  -35.22996557 -33.491279296           grey soil
517  -33.37012174 -29.584224187           grey soil
518  -30.65810413  -9.724682549           grey soil
519  -31.35747592  -7.742042995           grey soil
520  -33.54775928  -4.264662744      damp grey soil
521   25.41978056   3.366676896         cotton crop
522   56.99378662 -10.196852172         cotton crop
523   85.95458568 -26.033590421         cotton crop
524   99.03376774 -32.702049758         cotton crop
525   83.09990278 -24.906349571         cotton crop
526  110.06300095 -52.911056300         cotton crop
527  119.07180033 -64.444205445         cotton crop
528  120.25035902 -66.946186645         cotton crop
529  119.46284223 -57.070820691         cotton crop
530  116.18653096 -50.705580901         cotton crop
531  110.62082882 -47.835892886         cotton crop
532   93.61527703 -32.915611229         cotton crop
533   94.04068184 -27.695815017         cotton crop
534   98.88096669 -35.332982083         cotton crop
535    7.83680384   0.348570159         cotton crop
536  -28.91204358 -16.273639803         cotton crop
537  -36.79272280 -31.210062021           grey soil
538  -37.13762188 -29.385905936           grey soil
539  -34.97517308 -28.408124522           grey soil
540  -38.37189342 -35.102186312           grey soil
541  -38.36741252 -32.013437206           grey soil
542  -34.29377311 -35.139900844           grey soil
543  -32.93337924 -24.513857695           grey soil
544  -33.68195141 -17.947066508           grey soil
545  -35.04471086 -25.485530076           grey soil
546  -38.93988664 -35.255270015           grey soil
547  -39.29770510 -33.451266931           grey soil
548  -34.28064845 -31.000731385           grey soil
549  -34.28064845 -31.000731385           grey soil
550  -32.35202594 -35.112191522           grey soil
551  -32.81390988 -24.960053782           grey soil
552  -37.69971520 -32.625440911           grey soil
553  -36.68359168 -37.064654695           grey soil
554  -31.62809041 -46.557396168           grey soil
555  -38.08105964 -52.032619913           grey soil
556  -40.25328836 -30.376581773           grey soil
557  -36.26331119 -24.125332691           grey soil
558  -34.64103776 -30.228165177           grey soil
559  -34.63027400 -30.232280608 very damp grey soil
560  -32.47858896 -29.250383763 very damp grey soil
561  -29.51164675  -0.955053751 very damp grey soil
562  -22.30274080  26.062258488 very damp grey soil
563  -18.58166637  34.143825506 very damp grey soil
564  -12.56182065  23.096460075 very damp grey soil
565  -12.91608808  27.373960000 very damp grey soil
566  -16.11151625  33.283343395 very damp grey soil
567  -19.71434765  25.243219118 very damp grey soil
568  -19.43500863  24.775632657 very damp grey soil
569  -14.38290468  20.293394266 very damp grey soil
570  -12.58548708  25.552791036 very damp grey soil
571  -41.64366829 -76.657591290           grey soil
572  -42.45932026 -62.136025350           grey soil
573  -40.18402979 -47.792962196           grey soil
574  -36.15093711 -38.547576511           grey soil
575  -36.91290189 -43.183360550           grey soil
576  -40.40071552 -29.792557723           grey soil
577  -35.31856273 -18.688510061           grey soil
578  -30.79471972 -12.192646081           grey soil
579  -28.98520875  -5.555752975      damp grey soil
580  -26.84224941  -4.590877610         cotton crop
581  -27.61328025  -0.835089611         cotton crop
582   40.01476400  -3.483995331         cotton crop
583   71.79937515 -19.405146113         cotton crop
584  105.84873426 -37.085766273         cotton crop
585   89.69735935 -23.957336471         cotton crop
586  116.73785512 -63.510290296         cotton crop
587  118.87103134 -60.011563045         cotton crop
588  107.08001802 -42.567123559         cotton crop
589   95.73169209 -26.033752841         cotton crop
590   96.48960959 -25.598156331         cotton crop
591   95.83539151 -28.364635327         cotton crop
592   -6.61111653  -3.376416575         cotton crop
593  -31.33433879 -18.943089016           grey soil
594  -34.06006807 -24.547297453           grey soil
595  -35.85785453 -25.768841883           grey soil
596  -39.47060796 -26.993161374           grey soil
597  -38.78573951 -33.091830263           grey soil
598  -38.78101960 -35.560991281           grey soil
599  -37.52440165 -34.914063169           grey soil
600  -42.16109775 -38.887528070           grey soil
601  -40.94700271 -36.539901004           grey soil
602  -37.86930073 -33.089907083           grey soil
603  -35.51737334 -27.594408355           grey soil
604  -32.79408176 -26.353713181           grey soil
605  -32.46348075 -28.174882145           grey soil
606  -31.52961007 -28.180174050           grey soil
607  -33.88777200 -31.226556903           grey soil
608  -31.33720593 -33.762077856           grey soil
609  -35.31629611 -35.641208673           grey soil
610  -32.11260465 -25.966711707           grey soil
611  -36.24583679 -27.658094677           grey soil
612  -38.18717294 -32.981685515           grey soil
613  -37.79388071 -48.440834139           grey soil
614  -38.96927447 -51.522221582           grey soil
615  -33.19220172 -21.757126069 very damp grey soil
616  -20.96564406  13.133300044 very damp grey soil
617  -12.58434224  37.968970997 very damp grey soil
618  -10.35321293  37.255859850 very damp grey soil
619   -8.78401638  37.777359484 very damp grey soil
620  -12.16139430  32.000578511 very damp grey soil
621  -14.30169129  28.546420994 very damp grey soil
622  -16.85955983  29.714982508 very damp grey soil
623  -12.02791490  43.960064299 very damp grey soil
624  -12.54035227  37.976918577 very damp grey soil
625  -15.42792824  22.116216465 very damp grey soil
626  -18.91741896  20.465336488 very damp grey soil
627  -18.31639778  25.105946943 very damp grey soil
628  -17.06622416  23.282473195 very damp grey soil
629  -42.84955266 -74.385055023           grey soil
630  -43.91064499 -62.944883477           grey soil
631  -44.16997321 -48.654406701           grey soil
632  -40.61805370 -44.490816272           grey soil
633  -39.33570943 -46.321011044           grey soil
634  -40.34523479 -51.629101865           grey soil
635  -39.73116937 -44.172793027           grey soil
636  -36.72584458 -29.146567995           grey soil
637  -33.60647039 -14.567350505           grey soil
638  -29.61335940  -8.320329387         cotton crop
639  -23.68341046  -7.540866224         cotton crop
640   -4.50693608  -5.198254481         cotton crop
641   25.93489982  -4.304390901         cotton crop
642   61.05989829 -17.290168143         cotton crop
643   87.90896263 -35.203534019         cotton crop
644   98.52781802 -42.293263632         cotton crop
645  107.80511231 -39.708711991         cotton crop
646  108.71989949 -44.738465344         cotton crop
647  104.95242193 -38.125607420         cotton crop
648   99.27484769 -33.436567480         cotton crop
649   80.68547409 -19.580415977         cotton crop
650   81.73157738 -23.841374321         cotton crop
651  110.35968982 -51.797329154         cotton crop
652  120.00685411 -60.124804164         cotton crop
653  116.60191025 -51.949342154         cotton crop
654  103.31526387 -34.158326245         cotton crop
655  100.40392484 -36.046445072         cotton crop
656   98.35702272 -37.016615335         cotton crop
657   95.74638412 -26.046702971         cotton crop
658   96.00556105 -33.183371940         cotton crop
659   94.17002950 -32.272685687         cotton crop
660   93.25751440 -27.247097387         cotton crop
661   91.20791628 -25.717611990         cotton crop
662   71.70819339 -12.874923741         cotton crop
663   21.35157705  -0.383050753         cotton crop
664  -31.84303345 -22.483956487           grey soil
665  -32.64741153 -27.109173067           grey soil
666  -33.07853538 -24.828977960           grey soil
667  -32.96356423 -36.066322840           grey soil
668  -40.08078836 -39.879475923           grey soil
669  -40.04508339 -39.885068638           grey soil
670  -37.93061794 -38.917624221           grey soil
671  -35.76372379 -26.054938629           grey soil
672  -38.59521677 -34.166377336           grey soil
673  -36.06052002 -28.675174421           grey soil
674  -31.54596469 -31.324563405           grey soil
675  -37.03010298 -28.677159262           grey soil
676  -34.45199992 -21.195464618           grey soil
677  -38.82011534 -30.105093466           grey soil
678  -42.28792291 -42.861283179           grey soil
679  -39.89861210 -46.563132881           grey soil
680  -36.90527988 -33.592475379  vegetation stubble
681  -35.36666110 -22.282023648  vegetation stubble
682  -25.70198740   1.744985131  vegetation stubble
683  -20.10624280  12.559057074  vegetation stubble
684  -17.85473105  17.449669002 very damp grey soil
685  -14.41622460  33.259996641 very damp grey soil
686   -4.94103367  51.448853801 very damp grey soil
687   -3.88842997  55.366982125 very damp grey soil
688  -11.31048168  48.896932002 very damp grey soil
689  -12.17384051  38.297403338 very damp grey soil
690  -12.76355651  41.483208183 very damp grey soil
691  -12.47005153  37.660001000 very damp grey soil
692  -14.34500545  23.131763471 very damp grey soil
693  -18.76096238  17.113459427 very damp grey soil
694  -14.76112368  35.084152726 very damp grey soil
695   -6.23184796  54.627074902 very damp grey soil
696  -44.30856216 -72.839397281           grey soil
697  -49.11844453 -62.452561722           grey soil
698  -42.82154097 -47.931066705           grey soil
699  -41.97710034 -44.991113429           grey soil
700  -41.89204368 -50.056544364           grey soil
701  -38.73754162 -43.761581954           grey soil
702  -39.51304891 -26.693380064           grey soil
703  -20.40231987  -5.094838284         cotton crop
704   31.84663105  -3.956318460         cotton crop
705   76.41189729 -19.893349535         cotton crop
706  107.25209302 -38.951915275         cotton crop
707  109.20203616 -46.528710946         cotton crop
708  102.29436086 -36.329835671         cotton crop
709  107.82255855 -42.878670187         cotton crop
710  105.70054979 -36.511764794         cotton crop
711   99.61353055 -30.895132861         cotton crop
712   83.36472032 -18.877739327         cotton crop
713   91.35566660 -30.349917576         cotton crop
714  116.85843173 -49.499750009         cotton crop
715  108.10928900 -46.338904036         cotton crop
716  105.02441622 -38.615792738         cotton crop
717  100.78615083 -29.653105969         cotton crop
718   98.14376844 -24.178718323         cotton crop
719   93.71804821 -22.740391802         cotton crop
720  -27.97924401 -12.571318017           grey soil
721  -32.55088813 -25.116063559           grey soil
722  -33.00251341 -34.038825206           grey soil
723  -40.13492907 -33.825192830           grey soil
724  -37.43968668 -43.104147301           grey soil
725  -40.18085085 -44.341108573           grey soil
726  -41.85857379 -40.238186499           grey soil
727  -37.10470292 -31.949335659           grey soil
728  -36.18513031 -31.951640443           grey soil
729  -35.21061895 -33.311679702           grey soil
730  -40.43095541 -33.026771984           grey soil
731  -37.01823848 -32.077026173           grey soil
732  -35.37364380 -35.700609170           grey soil
733  -38.42263146 -38.950863022           grey soil
734  -35.35444080 -39.534323934           grey soil
735  -42.78485658 -49.715533606           grey soil
736  -47.52815966 -49.533982664           grey soil
737  -38.42263146 -38.950863022  vegetation stubble
738  -34.82435019 -24.430367899  vegetation stubble
739  -24.38697174   7.450802426  vegetation stubble
740  -21.05925007  23.167312363  vegetation stubble
741  -17.14084644  37.160220882  vegetation stubble
742   -9.19266609  44.994803406 very damp grey soil
743   -9.57121023  46.803760284 very damp grey soil
744   -7.52901979  59.888249377 very damp grey soil
745   -7.61337043  45.470686348 very damp grey soil
746  -14.74625958  36.755067552 very damp grey soil
747   -5.58476737  53.053881057 very damp grey soil
748  -10.41535391  42.156688351 very damp grey soil
749  -17.07122718  26.760137542 very damp grey soil
750  -20.42847595  17.519836561 very damp grey soil
751  -18.10223467  25.490583084 very damp grey soil
752  -12.52834044  37.508831010 very damp grey soil
753  -12.00160501  43.488989610 very damp grey soil
754   -9.37507581  54.605087848 very damp grey soil
755   -2.26479254  62.333236253 very damp grey soil
756  -44.00572065 -49.499501941           grey soil
757  -40.38542872 -43.437903889           grey soil
758  -34.66772125 -34.612881250           grey soil
759  -34.27141794 -36.758942100           grey soil
760  -38.05667724 -36.223519877           grey soil
761   38.05931821  -8.918421139         cotton crop
762  104.54041605 -36.963605587         cotton crop
763  102.08484508 -41.157362003         cotton crop
764  103.68553494 -40.415528056         cotton crop
765  105.39891895 -39.028210368         cotton crop
766  106.02172456 -36.234528304         cotton crop
767  104.31031633 -32.144930347         cotton crop
768   89.68975309 -20.789900693         cotton crop
769   74.19493060 -14.460530846         cotton crop
770  114.28093043 -51.665984636         cotton crop
771  101.67238010 -26.684956136         cotton crop
772   91.86582339 -17.265902040         cotton crop
773   89.74610950 -20.744400298         cotton crop
774   91.08336079 -22.553569671         cotton crop
775   90.74180857 -25.096308581         cotton crop
776   89.97521418 -20.524685514         cotton crop
777   80.92504658 -11.325477746         cotton crop
778   43.14896102   2.141935015         cotton crop
779  -29.49604590 -13.996563308           grey soil
780  -33.03588124 -25.000155637           grey soil
781  -35.71776386 -30.719395676           grey soil
782  -33.08286759 -24.676840486           grey soil
783  -36.23902906 -30.945654700           grey soil
784  -41.65771536 -40.249988927           grey soil
785  -37.74188893 -38.061746861           grey soil
786  -43.21103925 -41.182354081           grey soil
787  -42.04315645 -35.632115831           grey soil
788  -40.45280367 -36.810584647           grey soil
789  -40.45280367 -36.810584647           grey soil
790  -41.70942162 -37.457512759           grey soil
791  -39.35439352 -34.406901942           grey soil
792  -35.69409743 -33.175726638           grey soil
793  -38.04753945 -38.691270508           grey soil
794  -40.78227774 -48.627566488           grey soil
795  -44.70296809 -52.198548631 very damp grey soil
796  -34.43618710 -19.032467745  vegetation stubble
797  -25.85680439   6.889841367  vegetation stubble
798   -3.90786917  65.878130307  vegetation stubble
799   -3.86858355  62.038046689  vegetation stubble
800   -6.10549741  62.754539568  vegetation stubble
801   -4.53290135  67.642764653  vegetation stubble
802   -2.38907005  71.098050479  vegetation stubble
803   -0.17963490  71.752516742  vegetation stubble
804   -1.11199552  61.209282150 very damp grey soil
805   -4.59307497  59.562201975 very damp grey soil
806   -4.53773040  59.587672279 very damp grey soil
807   -6.55932560  38.441539333 very damp grey soil
808  -12.04950797  21.247980489 very damp grey soil
809  -11.34611373  38.610413487 very damp grey soil
810   -8.77873940  35.315542901 very damp grey soil
811  -15.10314304  15.347011880 very damp grey soil
812  -14.44006702  33.029660374 very damp grey soil
813   -7.17221454  55.459073385 very damp grey soil
814   -7.11729843  60.745962697 very damp grey soil
815  -44.36154213 -49.646069227           grey soil
816  -35.82593278 -33.940196915           grey soil
817  -36.01262406 -33.872795422           grey soil
818  -39.78561173 -35.809351794           grey soil
819  -39.37991218 -38.082995422           grey soil
820  -29.35872562 -18.449148567      damp grey soil
821  -26.69237374  -6.583505097      damp grey soil
822  105.27016476 -39.613336221         cotton crop
823  108.26185736 -45.512337027         cotton crop
824  114.17255369 -49.985608069         cotton crop
825  107.88276679 -51.201595830         cotton crop
826  102.20683300 -41.822373549         cotton crop
827   92.29109055 -32.353546449         cotton crop
828   74.28222348 -13.405145099         cotton crop
829   76.65345544 -14.589023413         cotton crop
830  112.44570735 -51.393154749         cotton crop
831  108.46200310 -45.506998541         cotton crop
832  104.20585411 -37.796511160         cotton crop
833   99.44622660 -30.342384069         cotton crop
834   95.59705430 -27.893053354         cotton crop
835   92.28719175 -25.202695560         cotton crop
836   90.87511381 -23.850936315         cotton crop
837   91.60992451 -21.557934665         cotton crop
838   91.28968344 -19.245713556         cotton crop
839   93.04718350 -25.345979728         cotton crop
840   91.33581961 -26.013453756         cotton crop
841  -28.50735406 -24.247491975           grey soil
842  -31.96907405 -34.598782151           grey soil
843  -34.14992018 -25.158977821           grey soil
844  -36.21551761 -34.120066671           grey soil
845  -42.05930676 -41.761553150           grey soil
846  -40.77696248 -43.591747922           grey soil
847  -40.36371122 -45.868209127           grey soil
848  -38.94093460 -42.836579510           grey soil
849  -38.94437045 -40.361780142           grey soil
850  -39.08037369 -36.083243137           grey soil
851  -36.77428654 -32.570351263           grey soil
852  -34.92010193 -33.609343613           grey soil
853  -36.66245415 -31.856929585           grey soil
854  -42.04143417 -41.765287052           grey soil
855  -39.08342684 -47.677611976 very damp grey soil
856  -34.31096884 -33.422798426 very damp grey soil
857  -17.74676958  34.327427617  vegetation stubble
858    2.40055892  84.394125110  vegetation stubble
859    3.31443159  76.916749442  vegetation stubble
860   10.30631916  76.698858289  vegetation stubble
861    7.85385905  64.979289431  vegetation stubble
862  -14.26952867  37.602536552 very damp grey soil
863  -15.19852980  37.137569461 very damp grey soil
864  -13.17461495  27.987690708 very damp grey soil
865  -12.83693970  24.315779290 very damp grey soil
866  -11.38557318  30.782992787 very damp grey soil
867   -9.94109676  39.559227689 very damp grey soil
868  -14.31283108  39.925882034 very damp grey soil
869  -14.99908538  44.043508743 very damp grey soil
870   -7.90947551  51.754451817 very damp grey soil
871  -41.35370288 -48.751541431           grey soil
872  -37.60960862 -39.532751771           grey soil
873  -34.66211505 -40.523318618           grey soil
874  -38.55385284 -37.548897100           grey soil
875  -32.36168370 -22.362963738      damp grey soil
876  -30.07247163 -12.020606862      damp grey soil
877  -30.75622592  -5.907249104      damp grey soil
878   25.06864783  -2.140798702         cotton crop
879   80.37299664 -31.580109302         cotton crop
880  106.73579914 -52.056849419         cotton crop
881  111.64013205 -57.686778608         cotton crop
882  114.40966726 -56.956887682         cotton crop
883  114.43195773 -56.959211198         cotton crop
884  111.18747518 -55.428470181         cotton crop
885  109.02000792 -51.026406140         cotton crop
886  107.73186980 -46.743614309         cotton crop
887  103.59639445 -43.333796150         cotton crop
888  101.09185094 -42.155080266         cotton crop
889  100.64104714 -39.869840321         cotton crop
890   94.03537361 -30.185415787         cotton crop
891   69.25838612  -4.535844405         cotton crop
892  103.72692707 -35.376625929         cotton crop
893   81.88025830 -12.924671841         cotton crop
894   91.50643024 -26.532494048         cotton crop
895   90.22614586 -24.723091198         cotton crop
896  -37.69971520 -32.625440911           grey soil
897  -37.37811630 -34.472047831           grey soil
898  -36.64936171 -24.304074138           grey soil
899  -38.02699435 -36.926342397           grey soil
900  -35.79124989 -48.533931941           grey soil
901  -38.64622399 -47.527904277           grey soil
902  -39.91069568 -45.701443408           grey soil
903  -38.33992324 -44.892783268           grey soil
904  -38.18362958 -39.380943733           grey soil
905  -40.13444244 -35.265821013           grey soil
906  -37.13762188 -29.385905936           grey soil
907  -40.52594404 -32.996503575           grey soil
908  -39.32063020 -32.026331630 very damp grey soil
909  -22.71038547  -2.181174434 very damp grey soil
910  -17.24590050  15.467680688 very damp grey soil
911  -13.42325751  66.332581064  vegetation stubble
912   -5.39258914  99.548299965  vegetation stubble
913    1.24428542  94.372291098  vegetation stubble
914    4.59792709  87.552286680  vegetation stubble
915    9.80788922  81.091688152  vegetation stubble
916    8.45854894  84.089013189  vegetation stubble
917    8.49938325  84.100843746  vegetation stubble
918    9.71891659  74.932035862  vegetation stubble
919    4.31014016  60.211399940  vegetation stubble
920   -7.33884112  56.211161632 very damp grey soil
921  -11.98481548  38.756021626 very damp grey soil
922  -16.76931683   5.199255045 very damp grey soil
923  -17.76982457  10.517825980 very damp grey soil
924  -10.75835919  30.820902431 very damp grey soil
925  -11.14120402  39.077994951 very damp grey soil
926  -12.37767530  51.383108796 very damp grey soil
927   -3.56820716  56.008615417 very damp grey soil
928  -42.77564230 -37.643818864           grey soil
929  -44.92474814 -49.444901460           grey soil
930  -45.93663149 -54.775194590           grey soil
931  -48.49140641 -53.608985951           grey soil
932  -36.28083585 -39.122732950           grey soil
933  -29.81377564 -18.777669190      damp grey soil
934  -27.06974250 -10.690265378      damp grey soil
935  -25.74383926  -2.187194905      damp grey soil
936  -19.99978590   6.636363532      damp grey soil
937   14.28366714  -0.322458920         cotton crop
938   75.78262525 -29.093919292         cotton crop
939  110.12170343 -50.112364016         cotton crop
940  113.07653417 -54.152832597         cotton crop
941  112.54732197 -56.914489885         cotton crop
942  111.17138429 -55.116319889         cotton crop
943  105.66862090 -45.568131247         cotton crop
944  105.15127228 -42.831897118         cotton crop
945   99.45687702 -36.521435959         cotton crop
946  100.09058167 -33.765673038         cotton crop
947   91.32911835 -21.351900654         cotton crop
948   73.69602473  -5.000168466         cotton crop
949  100.54398155 -36.467570424         cotton crop
950  110.05991971 -43.628223592         cotton crop
951  103.00143505 -30.006726725         cotton crop
952   95.33465846 -17.083834641         cotton crop
953   89.58961876 -10.557678709         cotton crop
954   85.00165786  -6.054217714         cotton crop
955   83.11084063  -5.169568146         cotton crop
956   85.08845599 -12.716512282         cotton crop
957   88.21450672 -21.159692165         cotton crop
958   90.96869437 -21.563926933         cotton crop
959   76.67299810 -16.663141042         cotton crop
960  -16.52094128 -10.051443908           grey soil
961  -33.39414614 -30.658796399           grey soil
962  -39.57000386 -40.172286036           grey soil
963  -39.99864895 -37.909746656           grey soil
964  -40.64699742 -47.419299508           grey soil
965  -37.91770734 -50.960612389           grey soil
966  -40.10598092 -51.937198596           grey soil
967  -37.38062945 -50.717295344           grey soil
968  -39.10991026 -46.623963486           grey soil
969  -41.20088446 -40.244580206           grey soil
970  -42.16109775 -38.887528070 very damp grey soil
971  -38.95740629 -29.213031104 very damp grey soil
972  -30.22671432 -10.367695124 very damp grey soil
973  -22.28715451   1.567543309 very damp grey soil
974  -16.75497016  21.443117902  vegetation stubble
975  -15.66164374  34.524333349  vegetation stubble
976   -1.82811400  74.845743090  vegetation stubble
977    2.95540015  85.742828580  vegetation stubble
978    2.62214842  87.563151312  vegetation stubble
979    2.96969822  85.739841458  vegetation stubble
980   10.11115060  67.290299837  vegetation stubble
981    7.14488367  83.327801789  vegetation stubble
982    4.87434275  56.174444206 very damp grey soil
983   -5.40228849  49.057718623 very damp grey soil
984  -11.83230791  30.159364405 very damp grey soil
985    0.12666531  59.931166254 very damp grey soil
986   -4.90844033  61.960173338 very damp grey soil
987   -7.34226026  54.529504542 very damp grey soil
988  -44.31167459 -48.877338942           grey soil
989  -42.29105674 -42.857055215           grey soil
990  -40.75848605 -49.352640660           grey soil
991  -33.34710762 -13.952258770      damp grey soil
992  -23.44954538  -3.563559563      damp grey soil
993  -28.82676279   4.874722414      damp grey soil
994  -15.30222290   8.759192151         cotton crop
995   36.79605572  -4.518405534         cotton crop
996   94.67469676 -36.174221814         cotton crop
997  111.67874695 -49.313656354         cotton crop
998  109.15589016 -48.134687751         cotton crop
999  109.41025378 -50.568128145         cotton crop
1000 106.05731276 -40.093047674         cotton crop
1001 104.94593487 -35.657010557         cotton crop
1002 104.34118463 -33.534288700         cotton crop
1003 101.38789721 -30.091124794         cotton crop
1004  93.08065291 -22.455094614         cotton crop
1005 106.56680764 -40.355892821         cotton crop
1006 104.79760701 -33.826769205         cotton crop
1007  89.42072259  -8.590299907         cotton crop
1008  85.95403567  -7.891735270         cotton crop
1009  83.73228431 -10.931252527         cotton crop
1010  78.56898556 -11.523927705         cotton crop
1011  76.85390585  -6.050393240         cotton crop
1012  81.76289791  -9.841278733         cotton crop
1013  83.02056292  -9.338174365         cotton crop
1014  74.25149924  -7.263711895         cotton crop
1015  39.43993994  -1.030765237 very damp grey soil
1016 -38.29009201 -39.083423078           grey soil
1017 -44.39683522 -43.974775585           grey soil
1018 -40.56451721 -44.626527264           grey soil
1019 -40.55784908 -44.629626919           grey soil
1020 -42.70329958 -48.060639639           grey soil
1021 -44.57301275 -48.829132169           grey soil
1022 -41.57161513 -44.929371824           grey soil
1023 -38.88113455 -41.252503364           grey soil
1024 -40.14914054 -39.427170804           grey soil
1025 -33.90087573 -17.180128539 very damp grey soil
1026 -28.37255414  -7.690459295 very damp grey soil
1027 -25.06289762  10.280011510 very damp grey soil
1028 -10.89732522  52.021150869  vegetation stubble
1029  -6.27902590  77.303008874  vegetation stubble
1030  14.87483381  83.825978552  vegetation stubble
1031   9.40080488  82.220368866  vegetation stubble
1032   7.57115572  87.232481313  vegetation stubble
1033  16.11005458  74.795945946  vegetation stubble
1034  17.60160341  65.367600724  vegetation stubble
1035   3.71783887  82.988338916  vegetation stubble
1036   4.97486722  55.470926036  vegetation stubble
1037   1.37366023  51.978185094  vegetation stubble
1038  -1.09285333  52.836390323  vegetation stubble
1039   0.44021086  57.716203125         cotton crop
1040   3.45044356  60.562391716         cotton crop
1041   7.19702469  56.662800494         cotton crop
1042   4.58892165  57.266624696         cotton crop
1043  -0.75678979  64.819666727 very damp grey soil
1044   1.54439068  67.490088841 very damp grey soil
1045  -2.40329192  54.115600063 very damp grey soil
1046 -42.30176064 -47.778954850           grey soil
1047 -44.88312042 -53.957221033           grey soil
1048 -44.90099300 -53.953487131           grey soil
1049 -35.61436390 -31.177001980      damp grey soil
1050 -22.36088757   0.280908861      damp grey soil
1051 -20.52752515   3.099904381      damp grey soil
1052   3.41169032   6.268265151         cotton crop
1053  61.15749878 -13.954865875         cotton crop
1054 108.12716158 -46.342637939         cotton crop
1055 107.92918794 -39.691013295         cotton crop
1056 105.37421943 -39.059083837         cotton crop
1057 103.24271462 -37.699681324         cotton crop
1058 103.24271462 -37.699681324         cotton crop
1059  95.47615397 -22.957789484         cotton crop
1060  84.48659278 -15.187594855         cotton crop
1061  72.93658893  -5.313381428         cotton crop
1062  89.04141001 -22.343470553         cotton crop
1063 105.52882527 -34.875110834         cotton crop
1064  94.60962643 -17.421262325         cotton crop
1065  90.40267597 -19.387863809         cotton crop
1066  87.82455089 -12.525999212         cotton crop
1067  85.44972184  -4.322958100         cotton crop
1068  78.74986366  -2.626484699         cotton crop
1069  76.50051082  -6.133557133         cotton crop
1070  71.37162022  -8.588242372 very damp grey soil
1071  48.37499185  -2.657858219 very damp grey soil
1072  14.24420468   6.542772066 very damp grey soil
1073 -12.81623699   4.750752878 very damp grey soil
1074 -29.61259913  -4.629336965 very damp grey soil
1075 -33.89694862 -17.293495526           grey soil
1076 -37.00903471 -31.732763840           grey soil
1077 -43.52540305 -50.111182808           grey soil
1078 -45.21026560 -48.490215266           grey soil
1079 -47.43890375 -45.310966765           grey soil
1080 -46.24452196 -40.502744233           grey soil
1081 -39.80746189 -35.642133830           grey soil
1082 -36.20879674 -29.495309482           grey soil
1083 -28.80221868  -6.351427686 very damp grey soil
1084 -23.71147166   3.805477377 very damp grey soil
1085 -22.98321066  18.684170111 very damp grey soil
1086 -19.04975034  30.842539556 very damp grey soil
1087 -12.67611687  43.487783714 very damp grey soil
1088  -6.85664790  54.394153219  vegetation stubble
1089   1.22418024  79.513643431  vegetation stubble
1090  10.55117778  83.239379421  vegetation stubble
1091  17.44796390  68.675066171  vegetation stubble
1092  19.87390943  66.567973045  vegetation stubble
1093   9.14718116  81.126095740  vegetation stubble
1094  18.24319499  67.550535147  vegetation stubble
1095  12.29366604  61.008888934  vegetation stubble
1096   7.11446620  75.191063427  vegetation stubble
1097  11.02919436  62.835349803  vegetation stubble
1098   8.86058939  59.059602968         cotton crop
1099  23.53310075  47.400243018         cotton crop
1100  49.61329912  24.502230963         cotton crop
1101  70.61694396   9.829526070         cotton crop
1102  55.19991579  23.649598621         cotton crop
1103   2.86339791  60.996099402  vegetation stubble
1104  -4.27998248  51.239519740  vegetation stubble
1105 -40.26637823 -43.887236171           grey soil
1106 -41.99990708 -50.976321863      damp grey soil
1107 -32.27060447 -18.058914295      damp grey soil
1108 -23.28312316   5.738337874      damp grey soil
1109 -20.55662629   4.489826888      damp grey soil
1110 -19.60757725   3.131533909      damp grey soil
1111 -19.90467719   1.116000987      damp grey soil
1112 -24.49396843  -1.217270719      damp grey soil
1113 -24.00088968   7.237817057      damp grey soil
1114 -18.53359783  16.194563027      damp grey soil
1115 -17.25331345  14.385160178      damp grey soil
1116 -15.32000981   8.916473913      damp grey soil
1117  27.19671837  -3.905870420         cotton crop
1118  86.21489333 -34.517825544         cotton crop
1119 110.54348397 -48.547302497         cotton crop
1120 109.58562105 -47.193421333         cotton crop
1121 107.69245345 -46.305600792         cotton crop
1122 106.07061685 -47.038936852         cotton crop
1123 107.44155343 -48.834782107         cotton crop
1124 109.47563339 -44.878606673         cotton crop
1125 108.56648062 -39.870392023         cotton crop
1126 101.21192573 -34.284280721         cotton crop
1127  92.61454520 -21.833791205         cotton crop
1128  91.86347302 -17.262731067         cotton crop
1129  86.07739412 -15.096710442         cotton crop
1130  72.79781562  -6.001910247         cotton crop
1131  95.15252601 -30.253183749         cotton crop
1132 103.33466494 -36.285022848         cotton crop
1133  78.72082198  -3.762092378         cotton crop
1134  66.68938892   2.151266118         cotton crop
1135  24.75337192  12.829289438 very damp grey soil
1136 -13.52367491  41.797646110 very damp grey soil
1137 -12.42522689  32.183928575 very damp grey soil
1138 -33.51650576 -26.581162014           grey soil
1139 -41.98097252 -50.918540544           grey soil
1140 -49.29143744 -56.860681979           grey soil
1141 -48.28397197 -51.531799235           grey soil
1142 -38.71242569 -45.071664946 very damp grey soil
1143 -36.83017005 -35.590662664 very damp grey soil
1144 -35.26672328 -25.652016306 very damp grey soil
1145 -31.35939637 -18.945474983 very damp grey soil
1146 -27.01240232  -0.369206779 very damp grey soil
1147 -16.27411951  31.611193454 very damp grey soil
1148 -17.13392233  31.267150823 very damp grey soil
1149 -15.79722023  23.979487846 very damp grey soil
1150  -1.12382394  73.386641500  vegetation stubble
1151   4.25156622  90.424863792  vegetation stubble
1152   3.73324739  85.826353500  vegetation stubble
1153   3.76355211  75.067936929  vegetation stubble
1154   5.63627308  68.212366002  vegetation stubble
1155  20.11504578  54.695571893  vegetation stubble
1156  23.88163676  63.227661900  vegetation stubble
1157  15.34130940  69.340932766  vegetation stubble
1158  14.93331983  64.286504514  vegetation stubble
1159  13.50820239  79.608606703  vegetation stubble
1160   9.62729732  74.319791341  vegetation stubble
1161  69.68905619   5.244445975         cotton crop
1162  92.98727403 -12.375816446         cotton crop
1163  95.20230615  -7.064035857         cotton crop
1164  79.75047239  10.484474068         cotton crop
1165  19.49584891  65.059033682  vegetation stubble
1166  15.74130504  60.873527728  vegetation stubble
1167  11.59026975  51.121298946  vegetation stubble
1168 -28.13244724 -15.010474789      damp grey soil
1169 -20.57344883   4.482227284      damp grey soil
1170 -20.57463443   6.952516611      damp grey soil
1171 -23.57428755  -0.641713709      damp grey soil
1172 -26.61904478  -8.258580480      damp grey soil
1173 -31.29237577  -8.391115531      damp grey soil
1174 -28.88153276  -5.843529537      damp grey soil
1175 -24.84715179  -3.751716062      damp grey soil
1176 -18.48544647   6.201236879      damp grey soil
1177 -18.02677009  15.114485607      damp grey soil
1178 -18.30687736  12.498720451      damp grey soil
1179 -25.24913353   2.210589647      damp grey soil
1180  -6.44712345   4.804292024         cotton crop
1181  52.78210659 -13.309206943         cotton crop
1182 111.95157300 -48.660837149         cotton crop
1183 107.89035116 -43.231062211         cotton crop
1184 107.27845317 -36.800172182         cotton crop
1185  89.09060203 -20.377837752         cotton crop
1186  86.74785870 -21.509992762         cotton crop
1187  89.96026112 -26.317792549         cotton crop
1188  87.04546126 -25.263011744         cotton crop
1189  82.94261336 -22.711640741         cotton crop
1190 103.99316183 -33.658576202         cotton crop
1191  90.71976494 -17.355744494         cotton crop
1192  76.61451046  -1.754247113         cotton crop
1193  33.46741355  15.043651933 very damp grey soil
1194  11.11040824  22.319584981 very damp grey soil
1195  -5.14515871  30.056472696 very damp grey soil
1196  -9.40267106  52.867171134 very damp grey soil
1197  -6.92263921  55.859472889 very damp grey soil
1198 -11.00598001  52.143528934 very damp grey soil
1199 -12.67670447  36.779640115 very damp grey soil
1200 -23.44504774  -6.919634762 very damp grey soil
1201 -35.66517457 -36.455189108           grey soil
1202 -38.54656434 -37.629261184 very damp grey soil
1203 -31.58611082 -12.815391375 very damp grey soil
1204 -32.27944328  -9.168207513 very damp grey soil
1205 -25.68692551   4.493884408 very damp grey soil
1206 -13.53726385  31.654095014 very damp grey soil
1207  -9.78746256  29.463485043 very damp grey soil
1208  -5.99004864  52.021478800 very damp grey soil
1209   0.93417911  61.571109059  vegetation stubble
1210  28.05624903  66.102719749  vegetation stubble
1211  22.92501565  69.892702929  vegetation stubble
1212  17.45227239  71.133327849  vegetation stubble
1213  19.34107237  75.997185043  vegetation stubble
1214  17.07662906  67.194060042  vegetation stubble
1215  14.84235601  76.824245667  vegetation stubble
1216  38.03215193  40.601600698  vegetation stubble
1217  73.74893073  -3.251112268         cotton crop
1218 103.39297309 -30.697371511         cotton crop
1219 103.85508477 -25.837020375         cotton crop
1220  78.76555790   3.140653498         cotton crop
1221  38.02047773  53.376264296         cotton crop
1222  21.93014060  69.622637463  vegetation stubble
1223  16.82174878  54.001199684  vegetation stubble
1224 -31.70590930  -5.919015219      damp grey soil
1225 -29.30315109   1.506474715      damp grey soil
1226 -26.10366088  -1.317295770      damp grey soil
1227 -28.29975476  -2.310276392      damp grey soil
1228 -28.26572671  -2.301490448      damp grey soil
1229 -32.57377565  -8.709186603      damp grey soil
1230 -30.06642777  -9.555561275      damp grey soil
1231 -27.01947038  -4.119679241      damp grey soil
1232 -27.93783047  -2.472916506      damp grey soil
1233 -31.67458601  -4.260486369      damp grey soil
1234 -25.47349762   2.502590853      damp grey soil
1235  10.74432827   2.782235489           grey soil
1236 107.98309136 -43.102087604         cotton crop
1237  98.44375626 -30.578833840         cotton crop
1238  95.03409249 -19.934210812         cotton crop
1239  91.45054390 -21.696235913         cotton crop
1240  92.18448970 -20.787700148         cotton crop
1241  75.48058997  -8.984384878         cotton crop
1242  72.92322520  -7.790100344         cotton crop
1243  51.82003691  13.589194317         cotton crop
1244 -11.21608276  47.455892957 very damp grey soil
1245 -13.26469944  55.762997742 very damp grey soil
1246 -13.29459718  51.386259812 very damp grey soil
1247 -13.40065843  49.926660604 very damp grey soil
1248 -13.68997302  43.949443532 very damp grey soil
1249 -13.01015351  37.829601192 very damp grey soil
1250 -27.59646570  -4.298200901 very damp grey soil
1251 -26.32575494  -7.773276367 very damp grey soil
1252 -31.70590930  -5.919015219 very damp grey soil
1253 -24.40328636  14.199788841 very damp grey soil
1254 -15.08679110  28.864211295 very damp grey soil
1255 -10.75835919  30.820902431 very damp grey soil
1256  -8.59237608  31.799812154 very damp grey soil
1257 -11.09972396  32.646186826 very damp grey soil
1258 -14.50802695  31.017361869 very damp grey soil
1259 -18.13689187  22.964370995 very damp grey soil
1260 -16.50503526  18.995397356 very damp grey soil
1261  -9.32177889  17.947158807 very damp grey soil
1262   3.12172406  25.710761141 very damp grey soil
1263  16.00156855  51.275284364  vegetation stubble
1264  22.66765537  49.999771015  vegetation stubble
1265  27.70924794  55.336581901  vegetation stubble
1266  20.86546916  70.813206689  vegetation stubble
1267  18.83323729  64.873100181  vegetation stubble
1268  18.95728493  73.188647277  vegetation stubble
1269  23.02909672  65.846347918  vegetation stubble
1270  29.34306104  48.722004243  vegetation stubble
1271  50.51439872  18.138627046  vegetation stubble
1272  92.09053135 -26.577234725         cotton crop
1273 117.87474828 -47.440066150         cotton crop
1274 109.36283400 -27.843560718         cotton crop
1275 100.67832491 -19.127092116         cotton crop
1276  64.78099217  20.297587588         cotton crop
1277  35.16835563  58.374858906         cotton crop
1278  26.91385042  65.379010281  vegetation stubble
1279  19.22325041  57.280029337  vegetation stubble
1280 -28.08770311  -5.236564879           grey soil
1281 -26.32857799  -2.643082074      damp grey soil
1282 -30.25259046  -6.198565656      damp grey soil
1283 -29.90878714  -8.039630688      damp grey soil
1284 -26.77333784  -8.686285129      damp grey soil
1285 -24.14232223  -3.364422878      damp grey soil
1286 -22.38943164   1.678175803      damp grey soil
1287 -21.99452353  -3.954071475           grey soil
1288 -27.34845224 -13.023139207           grey soil
1289 -23.22628393  -3.367855972           grey soil
1290  10.46615797   3.683950523         cotton crop
1291  66.63342121 -13.215988991         cotton crop
1292  94.97314382 -23.804245113         cotton crop
1293  95.73677026 -21.027660348         cotton crop
1294  93.49597985 -17.839849285         cotton crop
1295  91.93138079 -21.085635724         cotton crop
1296  93.94073600 -21.959685794         cotton crop
1297  95.86456272 -24.175016482         cotton crop
1298  99.71503747 -26.620928923         cotton crop
1299  98.27879852 -29.672787532         cotton crop
1300  74.50870635 -16.422380157 very damp grey soil
1301  37.82747016  16.436573080 very damp grey soil
1302  15.95332988  34.189685569 very damp grey soil
1303   1.41809611  40.489636492 very damp grey soil
1304  -8.30898720  46.549994253 very damp grey soil
1305  -7.43596560  54.843031800 very damp grey soil
1306  -5.23904134  63.781342302 very damp grey soil
1307  -7.40149014  62.803560888 very damp grey soil
1308  -7.06012537  60.978276494 very damp grey soil
1309 -10.12245619  51.247400744 very damp grey soil
1310 -16.58707807  38.021838538 very damp grey soil
1311 -15.68084673  38.358048113 very damp grey soil
1312 -16.00355857  19.958837926 very damp grey soil
1313 -20.88000210   6.315240632 very damp grey soil
1314 -22.17653277   5.661569240 very damp grey soil
1315 -26.00239487  -4.465661424 very damp grey soil
1316 -20.22074830   0.206841341 very damp grey soil
1317 -16.86269365  29.719210472 very damp grey soil
1318 -14.30954503  31.019809975 very damp grey soil
1319 -15.25490897  28.533526570 very damp grey soil
1320 -10.07346005  37.123724634 very damp grey soil
1321 -15.43790688  19.644686296 very damp grey soil
1322 -16.71660518  18.989156092 very damp grey soil
1323 -15.44104071  19.648914260 very damp grey soil
1324  -6.45627109  23.859056705 very damp grey soil
1325   9.09762664  35.552826209  vegetation stubble
1326  18.74559452  43.992659669  vegetation stubble
1327  16.17803015  48.981411928  vegetation stubble
1328   8.59361779  49.800452420  vegetation stubble
1329  26.89424832  52.182552289  vegetation stubble
1330  19.31868285  76.947329816  vegetation stubble
1331  19.38556832  68.422558674  vegetation stubble
1332  23.43681600  59.035323030  vegetation stubble
1333  26.33970128  49.756240789  vegetation stubble
1334  46.54542924  26.961142425         cotton crop
1335  83.32746423 -10.195547852         cotton crop
1336 114.03914796 -38.072578704         cotton crop
1337 107.48883758 -25.313906499         cotton crop
1338  82.46614527  -0.004233976         cotton crop
1339  45.08763878  43.097795348  vegetation stubble
1340 -39.89168971 -26.307598302           grey soil
1341 -34.83626103 -17.194881776           grey soil
1342 -31.44520719 -11.119279765           grey soil
1343 -29.95825847  -6.496173301           grey soil
1344 -29.40316075  -1.886691765           grey soil
1345 -29.04244898  -3.693789831           grey soil
1346 -25.81198538 -11.309264994      damp grey soil
1347 -24.01143395  -6.054096188      damp grey soil
1348 -24.37944315  -1.443438177      damp grey soil
1349 -23.68459606  -5.070576897      damp grey soil
1350 -27.48220696  -4.886329545           grey soil
1351 -25.79887291  -8.841962789           grey soil
1352 -31.92377067 -19.893042843           grey soil
1353 -33.02678438 -26.822827940           grey soil
1354 -23.62670275  -6.028540933           grey soil
1355  26.17139489   4.016260412         cotton crop
1356  72.96100114  -9.258153777         cotton crop
1357  83.86931021 -10.723517376         cotton crop
1358  81.34445247 -10.077517019         cotton crop
1359 102.44537784 -36.929580797         cotton crop
1360  99.49500885 -23.685611107         cotton crop
1361  15.26018947  32.216624359 very damp grey soil
1362  -7.73869580  58.205424429 very damp grey soil
1363  -8.34528739  61.728615324 very damp grey soil
1364  -7.43905606  62.064824899 very damp grey soil
1365  -9.55805282  60.762600025 very damp grey soil
1366  -9.41253823  38.552072620 very damp grey soil
1367 -14.67303094  31.662238820 very damp grey soil
1368 -18.75683401  33.678738913 very damp grey soil
1369 -21.29352331  30.478546619 very damp grey soil
1370 -23.46622720  20.769116105 very damp grey soil
1371 -27.51218513   6.765198426 very damp grey soil
1372 -29.40788066   0.582469252 very damp grey soil
1373 -19.75515869  10.736875529 very damp grey soil
1374 -23.45338286  10.481295648 very damp grey soil
1375 -20.59637824  21.575584086 very damp grey soil
1376 -17.49549615  31.856506008 very damp grey soil
1377 -14.31615719  34.862162654 very damp grey soil
1378 -13.03742764  33.034589752 very damp grey soil
1379 -15.86383201  23.851824114 very damp grey soil
1380 -16.24258741   8.745172613 very damp grey soil
1381  18.89956157  42.008504925  vegetation stubble
1382  16.94240405  45.565498846  vegetation stubble
1383  15.31791672  44.831316554  vegetation stubble
1384  16.93975332  45.564652614  vegetation stubble
1385  21.46636163  45.222768117  vegetation stubble
1386  25.37731517  52.893436593  vegetation stubble
1387  22.33788005  67.954190722  vegetation stubble
1388  18.90206527  74.161946732  vegetation stubble
1389  22.65454554  63.420379069  vegetation stubble
1390  27.36355770  55.403183670  vegetation stubble
1391  25.29608517  63.051975221  vegetation stubble
1392  25.77221502  51.099677698         cotton crop
1393  34.05007172  33.806536668         cotton crop
1394  61.84253047   6.352613547         cotton crop
1395 111.67043951 -39.211977519         cotton crop
1396 103.34047954 -21.871935671         cotton crop
1397  63.23126627  26.227651502         cotton crop
1398  40.80591560  53.373372288         cotton crop
1399 -44.98790401 -39.855816121           grey soil
1400 -40.17289357 -31.365874747           grey soil
1401 -34.67459583 -18.186268138           grey soil
1402 -30.23358809  -9.873545292           grey soil
1403 -26.25746262  -9.987291405           grey soil
1404 -24.21605529  -4.651057327           grey soil
1405 -24.56880810  -0.353512260           grey soil
1406 -23.61599090  -0.345974109           grey soil
1407 -22.30615863  -5.996343349           grey soil
1408 -25.63294161  -9.537728680           grey soil
1409 -33.43332071 -23.744044666           grey soil
1410 -35.55551803 -31.487523616           grey soil
1411 -38.22194414 -36.550680233           grey soil
1412 -44.36592167 -39.391811827           grey soil
1413 -42.20976403 -27.921132649           grey soil
1414 -15.19421698   1.178172393           grey soil
1415  72.51304517   2.718675266         cotton crop
1416  53.97853667   4.342904574         cotton crop
1417  69.84714199  -5.361374450         cotton crop
1418  97.66259009 -36.015148516         cotton crop
1419  85.31545193 -26.674825979 very damp grey soil
1420  60.14750274  -7.735733182 very damp grey soil
1421   3.20145167  42.652414512 very damp grey soil
1422  -9.68192207  58.766809390 very damp grey soil
1423  -6.89987707  65.904844568 very damp grey soil
1424  -6.32991809  62.227310892 very damp grey soil
1425  -5.07016632  62.870011040 very damp grey soil
1426  -6.88771604  60.068073540 very damp grey soil
1427  -6.56064934  58.245776267 very damp grey soil
1428  -5.25200268  55.065696354 very damp grey soil
1429  -6.11536458  48.439441054 very damp grey soil
1430 -14.82427323  44.360014251 very damp grey soil
1431 -17.87076306  39.088001103 very damp grey soil
1432 -16.29068372  35.431805718 very damp grey soil
1433 -12.25662068  39.358652328 very damp grey soil
1434 -13.19552809  27.702972895 very damp grey soil
1435 -17.35715147  16.932147686 very damp grey soil
1436 -25.06247182  11.096127476 very damp grey soil
1437 -21.36618465  22.532150366 very damp grey soil
1438 -19.19419790  25.977980765 very damp grey soil
1439 -18.94624714  24.612104042 very damp grey soil
1440 -12.14033023  29.312353483 very damp grey soil
1441  -6.94957993  31.672404424  vegetation stubble
1442  -8.41751602  32.545695817  vegetation stubble
1443  -9.04219007  28.386095208  vegetation stubble
1444 -11.74446226  19.194265454 very damp grey soil
1445 -16.40621099  23.445401341 very damp grey soil
1446  15.22759634  37.223363341  vegetation stubble
1447  26.92620277  40.896159031  vegetation stubble
1448  15.89105418  48.696742112  vegetation stubble
1449  14.06054162  45.426404429  vegetation stubble
1450  27.11654158  67.916715500  vegetation stubble
1451  23.28276873  68.526968966  vegetation stubble
1452  21.12031993  67.549187552  vegetation stubble
1453  21.19483449  63.403822843  vegetation stubble
1454  24.68794432  58.398113472  vegetation stubble
1455  27.54642581  53.278466839         cotton crop
1456  39.87303532  40.383011847         cotton crop
1457  63.92404967  12.920305301         cotton crop
1458  92.69320695 -11.403880559         cotton crop
1459 109.06893912 -34.954299680         cotton crop
1460  67.40977984  16.869566038         cotton crop
1461  56.53579386  35.690042082         cotton crop
1462 -41.66131243 -46.075009740           grey soil
1463 -42.96642480 -42.893801517           grey soil
1464 -39.54417198 -30.148189663           grey soil
1465 -32.96091339 -17.768247010           grey soil
1466 -32.41366941 -10.685376492           grey soil
1467 -33.31636643 -11.020457758           grey soil
1468 -30.43024560 -16.481605871           grey soil
1469 -27.90999505 -19.780196074           grey soil
1470 -32.23017275 -24.204919919           grey soil
1471 -37.81875691 -26.809667476           grey soil
1472 -44.15763857 -43.522518179           grey soil
1473 -47.76359221 -49.588978443           grey soil
1474 -35.14742835 -17.047081932           grey soil
1475  -1.22851511  11.693628772           grey soil
1476  27.36149650  13.607773954         cotton crop
1477  25.16225564   8.228586894         cotton crop
1478   8.39119194  11.629700239         cotton crop
1479   4.99847785  12.491434817         cotton crop
1480  27.08105388   7.391125764         cotton crop
1481  46.17551868  -1.666193612 very damp grey soil
1482  34.42632002  -2.429272769 very damp grey soil
1483   6.62830096  23.234391066 very damp grey soil
1484  -7.99372550  61.662756449 very damp grey soil
1485  -7.94912718  63.396886624 very damp grey soil
1486  -7.38243494  60.197047422 very damp grey soil
1487  -7.05385118  64.124385220 very damp grey soil
1488  -9.30839338  55.733166990 very damp grey soil
1489 -11.10104018  56.572585611 very damp grey soil
1490 -11.50378028  53.506610213 very damp grey soil
1491 -11.15574737  51.678226163 very damp grey soil
1492 -14.21347307  45.445958281 very damp grey soil
1493 -12.03672619  46.420752573 very damp grey soil
1494 -14.23949321  45.763186656 very damp grey soil
1495 -15.51063303  47.592747180 very damp grey soil
1496 -11.14951284  49.229110288 very damp grey soil
1497  -9.52584401  45.575506211 very damp grey soil
1498 -24.62561482  13.361697633 very damp grey soil
1499 -13.27914898  20.619351239  vegetation stubble
1500  -9.52634739  20.418663837  vegetation stubble
1501  -6.10374633  22.044501672  vegetation stubble
1502   2.25167046  27.457596571  vegetation stubble
1503   4.40184087  28.419448274  vegetation stubble
1504   0.97492038  29.268127729  vegetation stubble
1505  -6.77257828  25.686727067  vegetation stubble
1506  -9.85694840  22.239832801  vegetation stubble
1507 -13.42210362  31.345177655 very damp grey soil
1508   8.31983357  28.378769622 very damp grey soil
1509  25.34312074  36.279648128  vegetation stubble
1510  22.03765160  49.497259663  vegetation stubble
1511  16.38514509  47.301276348  vegetation stubble
1512  20.13918011  44.653797811  vegetation stubble
1513  34.80308931  52.888166335  vegetation stubble
1514  29.08709201  54.873557359  vegetation stubble
1515  20.70768670  51.113009221         cotton crop
1516  33.59963381  40.335358042         cotton crop
1517  57.97468411  27.735218540         cotton crop
1518  81.99119829  10.535720975         cotton crop
1519  67.90027693   8.616529358         cotton crop
1520  84.33850718  -9.636153344         cotton crop
1521  79.15673125  -1.014838915         cotton crop
1522  92.97886455 -10.053686687         cotton crop
1523  71.80050122  19.530631336         cotton crop
1524 -44.03858499 -54.564973782           grey soil
1525 -44.08008380 -52.106784008           grey soil
1526 -40.94674817 -41.359759588           grey soil
1527 -38.87139195 -36.152968145           grey soil
1528 -39.86905779 -41.448265451           grey soil
1529 -41.64399561 -44.058806277           grey soil
1530 -41.59674342 -37.372871397           grey soil
1531 -34.55470142 -24.230542945           grey soil
1532 -34.07320093 -30.684825987           grey soil
1533 -39.70390753 -31.583518318           grey soil
1534 -36.63089428 -39.319423131           grey soil
1535 -40.16239008 -45.467985350           grey soil
1536   2.63120065  17.495043541 very damp grey soil
1537  -9.99515338  42.354874830 very damp grey soil
1538  -7.58691326  53.768238460 very damp grey soil
1539 -11.07813857  54.432723598 very damp grey soil
1540 -12.01951069  60.193921202 very damp grey soil
1541  -7.60599303  61.978186920 very damp grey soil
1542  -7.96287485  59.413315794 very damp grey soil
1543  -7.62110960  57.593387672 very damp grey soil
1544  -7.28737477  55.767990744 very damp grey soil
1545  -8.18190789  55.211698545 very damp grey soil
1546  -8.24729677  61.798362757 very damp grey soil
1547  -8.55637945  55.393802623 very damp grey soil
1548 -11.02097335  52.134963383 very damp grey soil
1549 -12.64482720  57.150134084 very damp grey soil
1550 -10.42839645  56.434653786 very damp grey soil
1551 -11.33069071  52.109656162 very damp grey soil
1552 -11.75329442  57.483974508 very damp grey soil
1553 -12.95309139  55.133360320 very damp grey soil
1554 -12.26573178  51.500828786 very damp grey soil
1555 -14.96544030  44.058707951 very damp grey soil
1556 -17.56398927  29.864760533 very damp grey soil
1557 -19.11807339   9.568610111 very damp grey soil
1558 -12.05924048  13.312784487  vegetation stubble
1559   1.84051167  23.914890882  vegetation stubble
1560   6.21106039  26.018525864  vegetation stubble
1561   0.25195748  25.560519039  vegetation stubble
1562  -4.49942237  29.572220388  vegetation stubble
1563   2.19541666  22.390042816  vegetation stubble
1564  -1.00083548  20.855334013  vegetation stubble
1565  -7.03930890  32.737825111 very damp grey soil
1566  -7.56236435  28.136107304 very damp grey soil
1567  -3.80483723  23.613259812 very damp grey soil
1568   9.38895036  29.794585100  vegetation stubble
1569  21.68729227  35.633994340  vegetation stubble
1570  25.10968029  41.622499206  vegetation stubble
1571  13.78821759  40.647773435  vegetation stubble
1572  26.40356662  44.177850463      damp grey soil
1573  35.72055222  33.135502649         cotton crop
1574  66.43190608  12.425785457         cotton crop
1575  95.63251158  -4.893419102         cotton crop
1576  95.27591733  -3.088927855         cotton crop
1577  57.39156176  16.861734428         cotton crop
1578  66.09713165  10.349472190         cotton crop
1579  87.19382584   7.805025250         cotton crop
1580  88.12678015   8.274256846         cotton crop
1581  91.60171953  -1.301340690         cotton crop
1582  85.07298265   4.739731384         cotton crop
1583 -43.61984619 -54.706560364           grey soil
1584 -41.33347230 -48.733073024           grey soil
1585 -41.33003645 -51.207872392           grey soil
1586 -39.88230934 -50.626935386           grey soil
1587 -41.12955290 -36.250217308           grey soil
1588 -39.30360499 -30.364815659           grey soil
1589 -38.60161691 -38.188261336           grey soil
1590 -41.58369871 -44.067682351           grey soil
1591 -41.60157130 -44.063948449           grey soil
1592 -45.86813390 -33.601560509           grey soil
1593 -46.78298660 -36.068416743           grey soil
1594 -41.43296336 -38.526629743           grey soil
1595 -36.58719139 -41.637412340           grey soil
1596  -0.90998073  24.723518397 very damp grey soil
1597 -13.63326495  60.043484789 very damp grey soil
1598 -12.45113981  53.664165952 very damp grey soil
1599  -8.04508126  62.642876073 very damp grey soil
1600  -9.30483304  62.000175925 very damp grey soil
1601 -12.95776487  56.398159739 very damp grey soil
1602 -12.70981411  55.032283016 very damp grey soil
1603 -10.79531607  57.375941153 very damp grey soil
1604 -11.12591707  59.197110117 very damp grey soil
1605  -9.51149738  55.567666613 very damp grey soil
1606 -10.75790788  54.586452106 very damp grey soil
1607 -12.36879326  58.217023919 very damp grey soil
1608 -10.74360981  54.583464984 very damp grey soil
1609 -11.66962675  52.115367908 very damp grey soil
1610 -11.52868577  43.842699358 very damp grey soil
1611 -18.48532525  24.787398771 very damp grey soil
1612 -22.73606108  12.554833464 very damp grey soil
1613 -26.15768893   3.118510041 very damp grey soil
1614   5.43379564  15.959616484 very damp grey soil
1615  10.13911878  20.139564733 very damp grey soil
1616  10.72023665  24.431817895  vegetation stubble
1617   8.52823339  23.770136546  vegetation stubble
1618   3.47612944  28.252374937  vegetation stubble
1619  -5.10669953  39.379511790  vegetation stubble
1620  -2.93308648  40.358534046  vegetation stubble
1621  -4.79641810  35.647778792  vegetation stubble
1622  -8.20049066  29.652340917 very damp grey soil
1623  -0.88631430  22.267187436      damp grey soil
1624  17.93605278  43.668623822  vegetation stubble
1625   2.33779368  45.884829875      damp grey soil
1626  15.83333664  18.251206802      damp grey soil
1627  55.34605950   9.410922843      damp grey soil
1628  79.34312873   6.516960411         cotton crop
1629  79.19399979   2.145622787         cotton crop
1630  87.72726340  -4.163880954         cotton crop
1631  92.51072677  -1.864285708         cotton crop
1632  75.69045075   9.292247481         cotton crop
1633  77.73335257  17.470341099         cotton crop
1634  80.43769764  18.698206216         cotton crop
1635  80.59015723  10.103308536         cotton crop
1636  86.01878896   2.901933317         cotton crop
1637 -45.75337607 -52.367796715           grey soil
1638 -47.23478846 -52.962057839           grey soil
1639 -45.74552234 -54.841185697           grey soil
1640 -44.92916602 -49.446311846           grey soil
1641 -48.20511777 -56.107885335           grey soil
1642 -47.03807833 -50.559804252           grey soil
1643 -44.48005739 -45.052485804           grey soil
1644 -46.25491367 -39.129717742           grey soil
1645 -35.23358350 -38.895420826           grey soil
1646 -37.23106190 -37.422475472           grey soil
1647 -45.70694323 -45.690354303           grey soil
1648 -44.30693302 -51.792498060           grey soil
1649 -41.88176483 -48.824060515           grey soil
1650 -41.08210666 -41.729682918           grey soil
1651 -40.34354802 -36.085590570 very damp grey soil
1652 -36.77712511 -28.237108503 very damp grey soil
1653  -9.82442575  47.414554744 very damp grey soil
1654  -8.89197317  58.179326116 very damp grey soil
1655  -7.33309775  62.349380680 very damp grey soil
1656  -8.96389987  58.632378016 very damp grey soil
1657  -7.10506372  53.635929480 very damp grey soil
1658 -10.76658834  47.543425304 very damp grey soil
1659  -8.89197317  58.179326116 very damp grey soil
1660 -12.05630124  48.885556278 very damp grey soil
1661 -13.87385097  46.083618779 very damp grey soil
1662 -13.26819323  50.240778919 very damp grey soil
1663 -10.52057615  55.843987857 very damp grey soil
1664 -10.53129971  55.846228198 very damp grey soil
1665 -11.12414954  59.036261007 very damp grey soil
1666 -11.10985147  59.033273885 very damp grey soil
1667 -10.75871786  54.760001924 very damp grey soil
1668 -11.04998776  48.759258526 very damp grey soil
1669 -13.12932387  36.158054397 very damp grey soil
1670 -13.67789747  27.693572113 very damp grey soil
1671 -14.58254272  24.892429484 very damp grey soil
1672 -17.44186330  27.893018673 very damp grey soil
1673 -20.48786843  21.992162597 very damp grey soil
1674 -19.09923127   9.106206887 very damp grey soil
1675 -10.04717151  13.346747748 very damp grey soil
1676   0.38443491  27.106391878  vegetation stubble
1677  -1.54477309  32.574062366  vegetation stubble
1678  -1.00397344  37.186531024  vegetation stubble
1679  -2.59904613  40.834160857  vegetation stubble
1680  -2.23278406  44.503231655  vegetation stubble
1681  -3.48121055  38.046976594 very damp grey soil
1682  -3.69292382  31.593293831 very damp grey soil
1683  -5.17050418  24.516843528      damp grey soil
1684   4.80092793  24.303748098      damp grey soil
1685   5.14209075  43.785549068      damp grey soil
1686  -1.74171532  46.846149566      damp grey soil
1687  -9.16311179  43.426664783      damp grey soil
1688 -11.14590006  30.361825018      damp grey soil
1689 -11.87707108  13.013858733      damp grey soil
1690  63.99959233  -1.354595107         cotton crop
1691  87.91896074  -0.958542629         cotton crop
1692  85.87534266  -1.947080622         cotton crop
1693  98.76258223  -8.990173998         cotton crop
1694  80.82096409   3.658280638         cotton crop
1695  63.06783158  21.436257247         cotton crop
1696  72.25387539  17.578574004         cotton crop
1697  82.25325665  13.642436418         cotton crop
1698  83.21153280  14.144690522         cotton crop
1699 -43.46768445 -41.510906473           grey soil
1700 -46.84936779 -52.332964429           grey soil
1701 -44.14630678 -51.110737662           grey soil
1702 -41.89833808 -42.681413423           grey soil
1703 -38.86885616 -41.236573653           grey soil
1704 -44.55514016 -48.832866071           grey soil
1705 -47.30415806 -47.596438361           grey soil
1706 -36.57171972 -22.244695543 very damp grey soil
1707 -29.62293756 -10.786503283 very damp grey soil
1708 -23.78726169   8.454791483 very damp grey soil
1709 -19.79344829  30.977294076 very damp grey soil
1710 -10.98942948  61.459245142 very damp grey soil
1711  -6.82646083  61.008554681 very damp grey soil
1712  -4.03375401  56.006814239 very damp grey soil
1713  -6.19973711  55.027904516 very damp grey soil
1714  -8.73329259  51.823484258 very damp grey soil
1715  -9.70896465  47.719704029 very damp grey soil
1716 -13.86126013  46.092256693 very damp grey soil
1717 -16.24831802  37.441756155 very damp grey soil
1718 -11.28265424  43.220590533 very damp grey soil
1719 -15.93469037  39.045991455 very damp grey soil
1720 -13.43908191  37.630048555 very damp grey soil
1721  -9.59060128  56.385015863 very damp grey soil
1722  -7.05126125  59.586054389 very damp grey soil
1723  -7.03696318  59.583067267 very damp grey soil
1724 -10.78705225  54.046800580 very damp grey soil
1725 -14.86525427  47.864831804 very damp grey soil
1726 -15.87503260  30.692108090 very damp grey soil
1727 -16.16381768  32.046154256 very damp grey soil
1728 -13.70560995  41.471554601 very damp grey soil
1729 -12.19385701  41.081552389 very damp grey soil
1730 -20.35813801  30.493299856 very damp grey soil
1731 -20.96856985  16.214498913 very damp grey soil
1732 -24.01206324  -3.253635897 very damp grey soil
1733  -3.93730678  11.644315607 very damp grey soil
1734   0.39112513  13.601006744  vegetation stubble
1735   2.27476750  18.404364492  vegetation stubble
1736   2.02209684  22.239402233  vegetation stubble
1737   5.80417805  31.823082117  vegetation stubble
1738   5.40738770  37.801280997  vegetation stubble
1739   4.14645032  39.628870175  vegetation stubble
1740   0.72719612  33.636137345 very damp grey soil
1741  -3.63613797  25.162759460      damp grey soil
1742  -7.93350737  19.385147075      damp grey soil
1743 -10.51429901  14.934938575      damp grey soil
1744 -15.30990234  11.210170034      damp grey soil
1745 -15.63297407  18.636187187      damp grey soil
1746 -12.21297312  36.147329508      damp grey soil
1747  -7.19872909  48.791108476      damp grey soil
1748  -8.87060019  14.597783405      damp grey soil
1749  26.72515137  -0.914018127         cotton crop
1750  72.20987310  -3.594963269         cotton crop
1751  91.15896664   1.100203714         cotton crop
1752  89.49662437  -3.680940155         cotton crop
1753  93.91331259  -6.202771813         cotton crop
1754  94.90128816 -12.770908997         cotton crop
1755  91.94857190   1.766282175         cotton crop
1756 -49.69189438 -48.800558583           grey soil
1757 -42.20344170 -52.069090165           grey soil
1758 -43.57938500 -48.417921096           grey soil
1759 -41.31677599 -42.464030472           grey soil
1760 -39.15109491 -39.014549345           grey soil
1761 -40.29769744 -40.060667119      damp grey soil
1762 -43.13752857 -37.047171882      damp grey soil
1763 -40.15236097 -33.817977745      damp grey soil
1764 -26.68041056  -4.018898919 very damp grey soil
1765 -22.28717797  12.586742064 very damp grey soil
1766 -16.07782569  37.807487929 very damp grey soil
1767  -9.82302793  67.233020263 very damp grey soil
1768  -7.27002331  64.681718673 very damp grey soil
1769  -4.37177538  59.712186858 very damp grey soil
1770  -5.26386220  55.052902839 very damp grey soil
1771  -8.34400273  51.618689555 very damp grey soil
1772  -9.56123159  49.275290453 very damp grey soil
1773  -9.88869877  51.092231453 very damp grey soil
1774 -13.52109800  43.038112270 very damp grey soil
1775 -11.38875996  44.001822785 very damp grey soil
1776 -12.35682698  47.832263903 very damp grey soil
1777 -11.41581669  50.308926530 very damp grey soil
1778 -13.87826984  42.993339572 very damp grey soil
1779 -13.33226603  49.472480395 very damp grey soil
1780  -9.86816617  48.640128456 very damp grey soil
1781 -12.85308931  37.066209104 very damp grey soil
1782 -13.81204435  33.349336665 very damp grey soil
1783 -17.28862736  33.416760542 very damp grey soil
1784 -16.60344680  17.480163903 very damp grey soil
1785 -25.26351117   7.125527554 very damp grey soil
1786 -24.31515741   5.755681902 very damp grey soil
1787 -28.52750167  -0.246981233 very damp grey soil
1788 -19.70343330   7.249051082 very damp grey soil
1789 -11.53907722  11.163076228 very damp grey soil
1790 -11.12914805  19.661369402      damp grey soil
1791 -13.12762579  10.955705313      damp grey soil
1792 -14.62887258   6.335585972      damp grey soil
1793 -11.07815417  38.477787837      damp grey soil
1794  -9.47886330  42.656536762      damp grey soil
1795 -10.06296536  40.367413586      damp grey soil
1796  -6.33186346  34.446788127      damp grey soil
1797  -9.29067653  25.422154087      damp grey soil
1798  -3.40353330   4.678319407      damp grey soil
1799  37.86609303  -7.553427247         cotton crop
1800  77.08128946  -5.915117192         cotton crop
1801  93.09481216  -3.000331354         cotton crop
1802  97.04538844 -11.637996063         cotton crop
1803 103.22673660 -13.628867732         cotton crop
1804  87.50484128 -12.562196725         cotton crop
1805  97.58609355  -9.780039303         cotton crop
1806  85.53021571   6.724561139         cotton crop
1807 -37.71693844 -40.512439472           grey soil
1808 -51.80780717 -58.150310239           grey soil
1809 -50.36921785 -55.101622602           grey soil
1810 -45.97399717 -55.511252444           grey soil
1811 -41.98694575 -42.260675915           grey soil
1812 -36.80963745 -38.042765661           grey soil
1813 -34.43747948 -32.528798526      damp grey soil
1814 -34.47695860 -30.089525585      damp grey soil
1815 -32.19727552 -19.733989677      damp grey soil
1816 -32.15803625 -19.738454083      damp grey soil
1817 -36.20094048 -21.057377629      damp grey soil
1818 -36.96381072 -14.487599321      damp grey soil
1819 -34.27462648  -7.529659307      damp grey soil
1820 -25.04967518  17.632790171 very damp grey soil
1821  -6.70630137  62.301075366 very damp grey soil
1822  -8.07211439  60.198776010 very damp grey soil
1823  -8.07804539  55.128220084 very damp grey soil
1824 -13.66309525  52.524600835 very damp grey soil
1825 -13.66976338  52.527700490 very damp grey soil
1826  -8.96374412  52.339907512 very damp grey soil
1827  -6.00337319  41.398640457 very damp grey soil
1828  -8.28824404  48.694582462 very damp grey soil
1829  -9.56067468  48.030596330 very damp grey soil
1830 -11.71633264  44.933870004 very damp grey soil
1831 -18.34858191  50.260290816 very damp grey soil
1832 -11.69968085  47.069985469 very damp grey soil
1833  -7.75097869  53.305922811 very damp grey soil
1834  -9.33466334  54.481291972 very damp grey soil
1835 -11.50378028  53.506610213 very damp grey soil
1836 -11.35769180  42.776555833 very damp grey soil
1837 -17.49311948  33.094294031 very damp grey soil
1838 -18.74973743  32.447365919 very damp grey soil
1839 -19.07086318  11.583222678 very damp grey soil
1840 -17.47932479   7.934464536 very damp grey soil
1841 -29.96186326  -1.738125097 very damp grey soil
1842 -29.05916623  -1.403043831 very damp grey soil
1843 -26.89318313  -0.424134109 very damp grey soil
1844 -14.35950038   9.678403229      damp grey soil
1845 -12.93520669  18.459667917      damp grey soil
1846 -14.52674508  22.108426059      damp grey soil
1847 -13.99301404  26.718638099      damp grey soil
1848 -10.42245051  38.939407976      damp grey soil
1849  -8.71745498  34.989240629      damp grey soil
1850 -12.50816813  12.822574704      damp grey soil
1851   6.82674213  -3.763506346         cotton crop
1852  52.09080991  -5.107324770         cotton crop
1853  80.10071741   3.366993167         cotton crop
1854  84.64355285  -2.713775549         cotton crop
1855 102.31083057 -15.649587470         cotton crop
1856  99.52054831 -12.052051193         cotton crop
1857  82.41027510  -0.020750532         cotton crop
1858  66.24194710   4.145151879      damp grey soil
1859  33.70311950  17.253966765      damp grey soil
1860 -38.35997165 -44.986173757           grey soil
1861 -44.03858499 -54.564973782           grey soil
1862 -47.13371887 -58.007752617           grey soil
1863 -47.13371887 -58.007752617           grey soil
1864 -44.97127007 -57.029971203           grey soil
1865 -34.96898403 -43.439403226           grey soil
1866 -39.35182787 -40.537915996      damp grey soil
1867 -39.35418586 -40.560118305      damp grey soil
1868 -32.78716073 -17.620514253      damp grey soil
1869 -30.62589753 -14.172443512      damp grey soil
1870 -35.21813010 -29.923670866      damp grey soil
1871 -34.74342310 -27.312622457      damp grey soil
1872 -33.41677301 -18.084631080      damp grey soil
1873 -18.79734425  21.242531085 very damp grey soil
1874 -14.36878535  44.475368091 very damp grey soil
1875  -8.51482422  61.424881842 very damp grey soil
1876 -11.37147348  62.157588338 very damp grey soil
1877 -15.72724909  56.169301181 very damp grey soil
1878 -13.79041115  50.701743226 very damp grey soil
1879 -11.23984508  48.166222273 very damp grey soil
1880 -10.29149132  46.796376621 very damp grey soil
1881  -9.35610601  46.811129858 very damp grey soil
1882 -11.57445188  47.501208740 very damp grey soil
1883 -14.10111389  48.700750099 very damp grey soil
1884 -13.48336113  49.152073411 very damp grey soil
1885 -11.55124309  46.153676473 very damp grey soil
1886 -14.46724084  52.965456509 very damp grey soil
1887  -5.64570168  58.416965035 very damp grey soil
1888  -9.51903129  56.766635397 very damp grey soil
1889 -10.06076007  50.777911246 very damp grey soil
1890 -10.59842590  46.161214624 very damp grey soil
1891 -13.70583816  42.702506078 very damp grey soil
1892 -13.34866070  40.894279703 very damp grey soil
1893 -12.34761809  34.938426009 very damp grey soil
1894 -17.63516190  32.502696883 very damp grey soil
1895 -18.60468434  33.528830635 very damp grey soil
1896 -18.26168287  31.691042671 very damp grey soil
1897 -17.56064734  28.357332174 very damp grey soil
1898 -19.64653332  20.460955582 very damp grey soil
1899 -22.24763747   8.586277668 very damp grey soil
1900 -22.74061754   5.973606888 very damp grey soil
1901 -21.93530953   6.763486333 very damp grey soil
1902 -19.21941508  12.003669373      damp grey soil
1903 -18.23351427  29.393900426      damp grey soil
1904  60.82377226  -2.145540659         cotton crop
1905  80.76100255   6.696452189         cotton crop
1906  81.92868358   4.893161111         cotton crop
1907  87.05809000  -5.118660574         cotton crop
1908 105.48695856 -18.494278688         cotton crop
1909  99.52717750 -12.195254516         cotton crop
1910  77.37428093   1.351701936         cotton crop
1911  35.64321879  16.205889988         cotton crop
1912 -47.56950629 -54.106060164           grey soil
1913 -43.18400244 -59.455916489           grey soil
1914 -42.58537034 -51.849162154           grey soil
1915 -39.66199497 -30.201047236      damp grey soil
1916 -35.38114677 -21.338148428      damp grey soil
1917 -28.09670215 -11.020375218      damp grey soil
1918 -30.21952870 -12.009034302      damp grey soil
1919 -38.40209356 -27.559445066      damp grey soil
1920 -35.20550385 -32.384302873      damp grey soil
1921 -35.54726910 -30.564374752      damp grey soil
1922 -34.89269801 -19.060258105 very damp grey soil
1923 -21.61294265  22.413946317 very damp grey soil
1924 -16.19507440  49.014790121 very damp grey soil
1925  -9.86263099  59.840938574 very damp grey soil
1926 -12.69909056  55.030042675 very damp grey soil
1927 -10.26846857  49.937666321 very damp grey soil
1928 -13.15270767  48.560783881 very damp grey soil
1929 -11.53087107  49.294119941 very damp grey soil
1930 -11.78689465  50.663083237 very damp grey soil
1931 -17.72555603  47.971097776 very damp grey soil
1932 -18.74129184  45.956036323 very damp grey soil
1933 -17.48662712  44.469218121 very damp grey soil
1934 -11.45894437  48.841068041 very damp grey soil
1935 -10.77509363  52.671660108 very damp grey soil
1936 -15.93756076  51.089135341 very damp grey soil
1937 -14.92450055  57.488979764 very damp grey soil
1938 -15.25440543  54.942407501 very damp grey soil
1939 -10.78087818  52.675041840 very damp grey soil
1940 -10.41300880  52.762296020 very damp grey soil
1941  -9.44086991  45.289535823 very damp grey soil
1942 -11.05582624  35.663445205 very damp grey soil
1943 -14.85176448  33.926043543 very damp grey soil
1944 -16.10175308  34.387950666 very damp grey soil
1945 -16.10175308  34.387950666 very damp grey soil
1946 -15.08325680  28.865339604 very damp grey soil
1947 -18.16095878  25.415345683 very damp grey soil
1948 -15.32238060  19.947341757      damp grey soil
1949  -8.59002237  33.938914741      damp grey soil
1950  -7.30930439  34.575528112      damp grey soil
1951 -14.03447130  18.470366490      damp grey soil
1952  -9.26297807   8.027587519      damp grey soil
1953  28.66371629  -1.980408431         cotton crop
1954  86.11079321   0.551385992         cotton crop
1955  95.14281697  -8.467794407         cotton crop
1956 103.28712000 -18.384386897         cotton crop
1957  90.97468291 -11.954784753         cotton crop
1958  47.14728569  10.035919048         cotton crop
1959  -1.25117120  26.526391694      damp grey soil
1960 -13.83017315  29.511139407      damp grey soil
1961 -47.19324945 -55.422122702           grey soil
1962 -46.78313201 -57.694355943           grey soil
1963 -46.79315087 -60.164011023           grey soil
1964 -46.63585434 -47.825874908           grey soil
1965 -37.70314206 -30.705205579      damp grey soil
1966 -39.66236237 -22.775678312      damp grey soil
1967 -38.03201864 -23.944473737      damp grey soil
1968 -34.08866421 -24.541323210      damp grey soil
1969 -36.03015060 -19.089582433      damp grey soil
1970 -30.62809865 -25.374803458      damp grey soil
1971 -33.88777200 -31.226556903      damp grey soil
1972 -37.86125565 -41.813514898      damp grey soil
1973 -39.17214643 -42.462669066      damp grey soil
1974 -34.99753989 -22.975852920 very damp grey soil
1975 -28.86887410  -0.724526903 very damp grey soil
1976 -22.93212545  17.024862437 very damp grey soil
1977 -19.26608115  25.094180828 very damp grey soil
1978 -16.98342693  38.791925972 very damp grey soil
1979 -12.09971843  57.176670645 very damp grey soil
1980 -12.97587385  48.887861062 very damp grey soil
1981 -17.27591942  42.005677947 very damp grey soil
1982 -14.79868231  41.145232376 very damp grey soil
1983 -12.98545201  46.421687166 very damp grey soil
1984 -10.08621871  43.427841258 very damp grey soil
1985 -11.94817727  40.614819981 very damp grey soil
1986 -13.54678427  44.261321506 very damp grey soil
1987 -11.72570024  47.064387314 very damp grey soil
1988  -8.95138898  50.348533776 very damp grey soil
1989 -10.43598733  45.722256340 very damp grey soil
1990 -13.88814904  46.086605901 very damp grey soil
1991 -14.75954970  43.295306207 very damp grey soil
1992 -12.62721166  44.259016722 very damp grey soil
1993  -9.23372972  54.172981802 very damp grey soil
1994  -8.50966590  53.565680983 very damp grey soil
1995 -12.62390985  52.559918982 very damp grey soil
1996 -10.43111779  45.251997343 very damp grey soil
1997 -10.99849390  40.626586096 very damp grey soil
1998 -13.50937608  41.471832459 very damp grey soil
1999 -14.75169596  40.821917225 very damp grey soil
2000 -15.68084673  38.358048113 very damp grey soil
```

Plot
=======================================================
Plot the components on graph and color by label


```r
qplot(Comp.1, Comp.2, color = y, data = data, size = I(.5))
```

![plot of chunk unnamed-chunk-58](StirTrek2018-figure/unnamed-chunk-58-1.png)

Pipes
=======================================================


```r
# Normal Syntax
a <- 1:5

sample(a, size = 2)
```

can be written as...


```r
# Pipe Sytax

a %>% sample(size = 2)
```

What's the Benefit?
=======================================================
Using dplyr for data manipulation:

```r
flights %>%
  group_by(year, month, day) %>%
  select(arr_delay, dep_delay) %>%
  summarise(
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ) %>%
  filter(arr > 30 | dep > 30)
```

Deep Learning
=======================================================
Demo (nn.R)

Building Great Models
=======================================================
* Feature Selection
* Imputing (deal with missing data)
* Model Tuning
* Algorithm Selection
* Statistical Learning

Suggested Resources
=======================================================
* Coursera Machine Learning Course by Andrew Ng
* Kaggle.com forums and tutorials
* My Machine Learning in R Videos on PacktPub.com

========================================================
![Questions? Feedback?](images/StirTrek2018-SessionSlack.png)

## We are in \#2018--purple

### Slides are at https://github.com/thoolihan/R-ML-Overview
