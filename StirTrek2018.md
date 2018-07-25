Machine Learning in R
========================================================
author: Tim Hoolihan (@thoolihan)
date: 2018.07.25
autosize: true


Tim Hoolihan
========================================================
- Organizer of the Cleveland R User Group
- Sr. Director of Data Science at DialogTech
- Advisory Board Member at DriveIT in Akron
- Creator of a Packt Pub Video Series on Machine Learning in R
- @thoolihan on github & twitter

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
[1] 64.07963 69.14761 67.01121 71.72971 65.37049
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
[1] 62.47870 66.72944 67.62574 73.07948 63.42967
```

Data Frames
=======================================================

```r
people <- data.frame(height = heights, armspan = armspans)
head(people)
```

```
    height  armspan
1 64.07963 62.47870
2 69.14761 66.72944
3 67.01121 67.62574
4 71.72971 73.07948
5 65.37049 63.42967
6 65.33788 63.90810
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
  [1] 64.07963 69.14761 67.01121 71.72971 65.37049 65.33788 70.11804
  [8] 70.50716 67.99423 67.89356 65.75123 69.94223 69.73835 69.33393
 [15] 64.27897 66.56954 70.26563 66.70218 64.59470 68.25707 72.86246
 [22] 66.70151 65.05956 62.31809 62.73757 70.43933 66.59580 60.07356
 [29] 76.26839 70.01075 69.88968 68.22488 69.02033 68.70200 68.62977
 [36] 67.09547 65.97755 64.41011 66.91689 62.72444 67.93198 62.99353
 [43] 64.41368 64.96021 59.51989 69.02916 67.69819 64.35531 65.39565
 [50] 68.17969 62.92916 56.62283 67.74675 62.46911 66.95411 71.45049
 [57] 71.19938 67.85235 58.87279 63.57941 67.21665 63.23076 68.50918
 [64] 62.75288 68.62496 65.42190 65.12038 64.29326 61.64090 61.56047
 [71] 68.82931 65.09954 69.59010 67.51613 65.52285 70.00504 70.88231
 [78] 60.58447 67.36234 67.94359 69.79465 68.43701 66.03662 67.43753
 [85] 70.14115 65.27873 67.02716 68.49297 62.64669 73.41877 70.38717
 [92] 68.25662 69.11939 65.50951 68.04043 61.74472 63.66840 67.01685
 [99] 58.01146 67.78606 66.79729 65.82173 66.23050 67.94493 69.45552
[106] 70.00629 61.91161 72.35727 64.37502 64.69305 61.88963 63.10790
[113] 62.40695 68.90456 70.20570 76.57163 65.56612 67.03880 65.82250
[120] 70.89299 69.12086 60.92520 64.75431 62.82014 61.80207 63.21233
[127] 65.13031 66.90143 67.03710 67.37601 65.61648 70.37717 70.02594
[134] 69.58645 65.37603 64.08499 65.73414 63.37354 63.56963 68.20838
[141] 62.85278 64.23375 66.49661 69.03671 71.19598 66.78677 58.29864
[148] 66.13125 70.13972 62.23170 66.08320 65.43302 66.30660 61.95850
[155] 64.17205 69.84861 69.71716 64.12370 63.83548 66.95323 62.38487
[162] 70.33897 67.00526 64.13633 62.75306 69.72146 59.73272 68.38489
[169] 63.49353 62.22283 65.14680 71.59248 73.35681 67.39397 63.95477
[176] 70.49611 70.67765 71.40689 65.30889 63.76302 69.92597 68.33114
[183] 65.26801 63.02862 59.25483 68.47775 72.26461 64.75405 62.61553
[190] 67.16800 68.90928 53.66987 64.79871 66.17463 62.79187 65.03785
[197] 70.64452 67.20526 66.49380 66.73633 64.14515 64.97722 65.88729
[204] 72.62446 67.17449 67.18442 65.92029 63.15262 64.55095 67.78383
[211] 64.80490 55.90256 69.43708 67.87481 62.02933 68.64025 58.64464
[218] 62.99652 67.98005 61.95581 67.22554 61.71872 65.13485 68.18129
[225] 66.34108 65.77866 66.45919 65.92899 63.88759 70.22956 63.68607
[232] 64.01069 65.07993 63.07374 69.96979 65.84062 66.96603 61.26815
[239] 71.94173 65.29553 73.81460 66.33187 64.53779 69.22943 67.63023
[246] 64.12013 66.43434 66.19544 63.77764 67.18200 62.27386 62.84367
[253] 61.37410 66.43362 64.45301 65.33429 67.67407 66.87756 64.25637
[260] 67.90109 64.07160 70.21754 60.29429 67.89601 69.29284 60.30158
[267] 66.27153 68.23854 63.20169 61.32116 60.52763 63.81480 64.80154
[274] 63.91448 63.38183 64.69214 63.81138 68.52585 56.17062 69.23320
[281] 65.76937 58.66888 66.58222 66.49586 64.77492 68.25048 57.51545
[288] 63.79325 68.64013 62.43897 66.64964 68.41651 71.10091 63.92529
[295] 70.85043 65.83245 67.70967 74.12675 63.69574 70.47625 65.81395
[302] 72.09957 65.93158 71.51585 67.65143 61.79327 63.64515 67.66596
[309] 66.58747 64.78826 63.55591 68.74111 65.28320 61.49719 58.51609
[316] 62.30244 75.08691 61.23174 66.50898 64.94698 65.41166 62.53504
[323] 65.74167 70.05658 71.09079 63.64317 63.66955 61.47083 68.19974
[330] 63.57827 61.58939 64.89718 66.28084 64.64519 62.60650 64.69178
[337] 60.51079 63.48777 64.26367 64.87024 60.09791 64.46597 64.51246
[344] 64.81177 65.45268 66.06674 68.76533 68.77195 66.76394 65.85818
[351] 67.90205 64.54548 60.31535 64.17112 67.69686 61.63405 55.37788
[358] 68.82630 67.40654 67.95440 64.94191 61.80850 65.79605 66.67414
[365] 69.90203 67.21337 66.02780 62.21428 63.91237 60.96302 59.90952
[372] 63.72341 66.07964 71.23142 70.35757 61.31921 71.48243 62.62744
[379] 67.58289 59.51415 64.97317 62.29556 61.86069 65.42733 64.89883
[386] 71.70317 63.86262 69.66745 65.54569 63.83971 62.05192 70.84540
[393] 65.45603 67.75846 65.90075 68.68703 66.57444 64.24443 60.89973
[400] 67.44477 64.80163 66.33822 70.09515 66.51771 69.60669 66.33503
[407] 60.19377 63.17650 62.93377 63.37190 66.53311 62.78117 64.19526
[414] 66.59731 66.26047 63.30817 66.65372 69.52537 61.52351 66.68686
[421] 72.06474 61.82210 65.24596 72.36425 64.88075 71.21463 68.40579
[428] 67.27535 65.95043 66.17024 67.46765 61.37585 68.15551 62.34492
[435] 66.75001 65.21255 64.39312 72.84456 69.24179 71.55511 66.62381
[442] 58.29003 59.09796 62.66119 67.02737 66.27866 62.06788 71.38175
[449] 65.84759 59.07838 64.31282 69.47001 61.79386 68.44768 69.63705
[456] 63.88193 67.74488 66.16398 60.16162 67.28506 67.47616 68.36926
[463] 67.58220 65.94828 67.40315 60.71700 66.11151 62.17913 69.91169
[470] 66.45075 70.47311 59.24121 69.77577 68.45746 68.39689 68.89765
[477] 65.96328 63.15860 67.03341 62.69201 64.71446 64.48104 59.22603
[484] 64.18770 67.95483 65.69610 66.89714 61.97396 57.91416 67.01091
[491] 66.14379 63.76489 67.97022 71.44421 69.02424 65.13262 72.72899
[498] 61.62146 72.01984 61.57524
```

Indexing Data Frame
=======================================================
Here's how we examine a row

```r
people[2,]
```

```
    height  armspan
2 69.14761 66.72944
```

Indexing Data Frame
=======================================================
Here's how we index both a row and column

```r
people[2, 'height']
```

```
[1] 69.14761
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
    Min      1Q  Median      3Q     Max 
-2.9456 -1.4490 -0.1092  1.5515  3.0284 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.25608    1.47483   0.174    0.862    
height       0.99558    0.02235  44.552   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.738 on 498 degrees of freedom
Multiple R-squared:  0.7994,	Adjusted R-squared:  0.799 
F-statistic:  1985 on 1 and 498 DF,  p-value: < 2.2e-16
```

Regression
=======================================================
- lm is a function to fit a linear model

```r
reg_form$coefficients
```

```
(Intercept)      height 
  0.2560814   0.9955773 
```
- Remember y = mx + b
  - armspan = 0.9956 * height + 0.2561

Apply Formula
=======================================================

```r
people$rline <- predict(reg_form, newdata = people)
people$rline
```

```
  [1] 64.05230 69.09787 66.97092 71.66855 65.33746 65.30499 70.06401
  [8] 70.45141 67.94959 67.84936 65.71651 69.88898 69.68600 69.28336
 [15] 64.25076 66.53120 70.21094 66.66326 64.56509 68.21127 72.79629
 [22] 66.66259 65.02790 62.29856 62.71618 70.38388 66.55734 60.06396
 [29] 76.18716 69.95719 69.83665 68.17922 68.97115 68.65423 68.58232
 [36] 67.05481 65.94183 64.38132 66.87702 62.70311 67.88762 62.97101
 [43] 64.38488 64.92899 59.51273 68.97994 67.65486 64.32677 65.36251
 [50] 68.13423 62.90692 56.62849 67.70320 62.44891 66.91407 71.39057
 [57] 71.14057 67.80834 58.86849 63.55430 67.17545 63.20719 68.46226
 [64] 62.73142 68.57753 65.38863 65.08845 64.26499 61.62436 61.54429
 [71] 68.78098 65.06770 69.53840 67.47361 65.48914 69.95151 70.82490
 [78] 60.57260 67.32049 67.89918 69.74204 68.39042 66.00063 67.39535
 [85] 70.08701 65.24610 66.98680 68.44612 62.62570 73.35014 70.33195
 [92] 68.21082 69.06977 65.47586 67.99559 61.72773 63.64290 66.97653
 [99] 58.01097 67.74234 66.75795 65.78670 66.19366 67.90051 69.40442
[106] 69.95275 61.89387 72.29334 64.34638 64.66301 61.87199 63.08487
[113] 62.38703 68.85589 70.15128 76.48905 65.53222 66.99839 65.78746
[120] 70.83553 69.07123 60.91183 64.72400 62.79839 61.78482 63.18884
[127] 65.09834 66.86162 66.99670 67.33411 65.58236 70.32199 69.97231
[134] 69.53477 65.34297 64.05764 65.69949 63.34934 63.54456 68.16279
[141] 62.83088 64.20574 66.45860 68.98745 71.13718 66.74747 58.29688
[148] 66.09485 70.08559 62.21255 66.04701 65.39971 66.26943 61.94056
[155] 64.14432 69.79577 69.66490 64.09618 63.80924 66.91319 62.36504
[162] 70.28396 66.96500 64.10875 62.73160 69.66918 59.72462 68.33852
[169] 63.46880 62.20371 65.11475 71.53193 73.28845 67.35199 63.92800
[176] 70.44040 70.62114 71.34715 65.27613 63.73709 69.87279 68.28501
[183] 65.23543 63.00594 59.24884 68.43097 72.20108 64.72374 62.59467
[190] 67.12701 68.86059 53.68859 64.76820 66.13804 62.77024 65.00629
[197] 70.58816 67.16411 66.45579 66.69725 64.11753 64.94593 65.85197
[204] 72.55934 67.13348 67.14336 65.88483 63.12940 64.52154 67.74013
[211] 64.77436 55.91140 69.38606 67.83070 62.01107 68.59276 58.64135
[218] 62.97399 67.93547 61.93788 67.18430 61.70184 65.10286 68.13582
[225] 66.30375 65.74382 66.42134 65.89349 63.86111 70.17503 63.66048
[232] 63.98367 65.04818 63.05086 69.91641 65.80551 66.92594 61.25326
[239] 71.87963 65.26282 73.74422 66.29458 64.50843 69.17932 67.58720
[246] 64.09263 66.39660 66.15876 63.75165 67.14096 62.25452 62.82181
[253] 61.35874 66.39588 64.42403 65.30141 67.63084 66.83786 64.22826
[260] 67.85686 64.04431 70.16306 60.28371 67.85181 69.24245 60.29096
[267] 66.23451 68.19282 63.17824 61.30603 60.51601 63.78865 64.77102
[274] 63.88789 63.35759 64.66211 63.78524 68.47886 56.17828 69.18308
[281] 65.73457 58.66548 66.54382 66.45785 64.74452 68.20470 57.51716
[288] 63.76719 68.59263 62.41890 66.61094 68.37001 71.04253 63.89864
[295] 70.79316 65.79737 67.66629 74.05499 63.67011 70.42063 65.77895
[302] 72.03677 65.89606 71.45563 67.60830 61.77606 63.61974 67.62278
[309] 66.54905 64.75780 63.53090 68.69317 65.25055 61.48129 58.51337
[316] 62.28298 75.01090 61.21701 66.47091 64.91582 65.37844 62.51455
[323] 65.70700 70.00282 71.03246 63.61777 63.64404 61.45504 68.15420
[330] 63.55316 61.57308 64.86624 66.24378 64.61537 62.58569 64.66175
[337] 60.49924 63.46306 64.23553 64.83941 60.08819 64.43694 64.48322
[344] 64.78121 65.41928 66.03063 68.71728 68.72387 66.72474 65.82299
[351] 67.85782 64.51609 60.30467 64.14339 67.65353 61.61754 55.38904
[358] 68.77798 67.36450 67.90994 64.91077 61.79122 65.76113 66.63534
[365] 69.84895 67.17219 65.99185 62.19520 63.88578 60.94948 59.90064
[372] 63.69765 66.04347 71.17246 70.30248 61.30409 71.42237 62.60654
[379] 67.54007 59.50702 64.94189 62.27612 61.84318 65.39404 64.86788
[386] 71.64213 63.83626 69.61541 65.51188 63.81344 62.03356 70.78815
[393] 65.42261 67.71486 65.86537 68.63933 66.53608 64.21637 60.88647
[400] 67.40256 64.77111 66.30091 70.04122 66.47960 69.55492 66.29773
[407] 60.18363 63.15317 62.91152 63.34770 66.49494 62.75958 64.16742
[414] 66.55885 66.22350 63.28426 66.61501 69.47396 61.50749 66.64800
[421] 72.00210 61.80476 65.21348 72.30028 64.84988 71.15575 68.35933
[428] 67.23389 65.91483 66.13367 67.42534 61.36048 68.11016 62.32527
[435] 66.71087 65.18021 64.36441 72.77847 69.19163 71.49472 66.58523
[442] 58.28831 59.09267 62.64013 66.98701 66.24160 62.04945 71.32212
[449] 65.81244 59.07317 64.28446 69.41885 61.77665 68.40104 69.58514
[456] 63.85548 67.70134 66.12744 60.15162 67.24356 67.43381 68.32297
[463] 67.53939 65.91269 67.36113 60.70454 66.07520 62.16021 69.85857
[470] 66.41293 70.41751 59.23528 69.72325 68.41077 68.35047 68.84901
[477] 65.92762 63.13534 66.99302 62.67082 64.68432 64.45194 59.22017
[484] 64.15990 67.91037 65.66163 66.85736 61.95595 57.91410 66.97062
[491] 66.10734 63.73896 67.92569 71.38431 68.97505 65.10064 72.66341
[498] 61.60500 71.95739 61.55899
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
69.94649 
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
    Min      1Q  Median      3Q     Max 
-38.598 -11.736   4.284  14.964  28.329 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 461.4093    74.3355   6.207  5.8e-06 ***
mpg          -2.1942     1.7781  -1.234 0.232259    
disp          0.1645     0.1054   1.561 0.135012    
wt           10.8343    14.0831   0.769 0.451169    
qsec        -19.5289     4.0367  -4.838 0.000114 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 21.73 on 19 degrees of freedom
Multiple R-squared:  0.9023,	Adjusted R-squared:  0.8817 
F-statistic: 43.85 on 4 and 19 DF,  p-value: 2.436e-09
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
Mazda RX4 Wag       110 140.42452   30.424517
Merc 230             95  21.46512  -73.534879
Merc 280            123 126.74885    3.748854
Merc 450SL          180 165.53337  -14.466634
Lincoln Continental 215 225.03855   10.038551
Toyota Corolla       65  29.98108  -35.018923
Pontiac Firebird    175 193.78738   18.787382
Maserati Bora       335 231.57971 -103.420289
```

Measuring Error
=======================================================

```r
library(ModelMetrics)
mse(test_data$hp, test_data$predicted)
```

```
[1] 2366.523
```


```r
mae(test_data$hp, test_data$predicted)
```

```
[1] 36.18
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
[1] 69358
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
 [1] 1756044 1796480 4558807 1681060 2487439  727545 3102700 3332238
 [9] 3183110  103943
```


```r
center(scale(data))
```

```
 [1] -0.11603 -0.10695  0.51312 -0.13286  0.04815 -0.34690  0.18626
 [8]  0.23779  0.20431 -0.48688
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
  setosa        147          3         0
  versicolor      0        140        10
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
Petal.Width   100.0      100.0     100.0
Petal.Length  100.0      100.0     100.0
Sepal.Length   90.7       59.3      90.7
Sepal.Width    54.6       54.6       0.0
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
   27.0    71.0    85.0    82.9   102.0   130.0 
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
         Comp.1     Comp.2                   y
1      38.46693  33.334869           grey soil
2      33.87146  15.629939           grey soil
3      32.96126  13.178900           grey soil
4      29.89770   9.401105           grey soil
5      26.87398   4.257849           grey soil
6      29.91297   5.560905           grey soil
7      25.94907  18.510703           grey soil
8      26.33934  16.387504           grey soil
9      21.66933  -2.089131      damp grey soil
10     27.47465   0.127040      damp grey soil
11     28.16647  -3.540189      damp grey soil
12     21.42796 -10.670304      damp grey soil
13     16.78050  -6.422155      damp grey soil
14     20.22477  -9.170145      damp grey soil
15     17.60328 -23.267824      damp grey soil
16     14.71716 -17.806676      damp grey soil
17     14.51650  -9.756739      damp grey soil
18     19.15842   4.683342      damp grey soil
19     24.03295  18.301538           grey soil
20     36.80994  35.572194           grey soil
21     19.34198  22.667144           grey soil
22     21.93091  23.836822           grey soil
23     38.80688  32.120364           grey soil
24     41.21092  46.365027           grey soil
25     28.87650  27.474205           grey soil
26     25.85576  26.044166           grey soil
27     31.03541  28.450858           grey soil
28     35.53589  34.932481           grey soil
29     38.75721  40.917241           grey soil
30     39.78238  32.130935           grey soil
31     37.82189  26.805440           grey soil
32     29.19341  17.966565           grey soil
33     33.86008  18.102200           grey soil
34     32.94662  17.771234           grey soil
35     31.35586  18.944347           grey soil
36     36.67281  26.217090           grey soil
37     38.83849  29.666572           grey soil
38     32.33436  28.962709           grey soil
39     34.12741  31.897864           grey soil
40     36.14889  28.439201           grey soil
41     35.30552  25.515811           grey soil
42     30.37619  16.930924           grey soil
43     27.68314  11.210443           grey soil
44     19.42986   4.929507  vegetation stubble
45      8.40202  -6.635817  vegetation stubble
46    -10.76997 -31.095866  vegetation stubble
47      8.21367  -4.113513 very damp grey soil
48     26.93115  -2.035184 very damp grey soil
49     11.30815 -36.151095 very damp grey soil
50      3.57632 -43.567339 very damp grey soil
51      1.80925 -34.674063  vegetation stubble
52    -15.09161 -42.298852  vegetation stubble
53    -25.51212 -56.403784  vegetation stubble
54    -27.43655 -60.164455  vegetation stubble
55     48.30254  59.426165           grey soil
56     39.92572  27.817634           grey soil
57     33.75209  13.794301           grey soil
58     31.57425  12.802598           grey soil
59     28.11266  12.878587           grey soil
60     22.71289  25.769600           grey soil
61     26.52308  34.295987           grey soil
62     32.65188  37.139823           grey soil
63     34.04763  33.503987           grey soil
64     23.31702   0.787807      damp grey soil
65     24.81535   2.938653      damp grey soil
66     22.61668   2.280071      damp grey soil
67     22.96663   0.477089      damp grey soil
68     19.90267  -3.306063      damp grey soil
69     15.02421 -27.030989      damp grey soil
70     14.14205 -29.818173      damp grey soil
71     15.96903 -26.548963      damp grey soil
72     15.02421 -27.030989      damp grey soil
73     22.38602  -0.457520      damp grey soil
74     26.82258  14.695318           grey soil
75     32.06467  21.589154           grey soil
76     32.43680  42.132717           grey soil
77     36.37096  34.186053           grey soil
78     29.00716  20.276404           grey soil
79     31.02372  25.537120           grey soil
80     34.65160  38.273112           grey soil
81     38.78273  44.593334           grey soil
82     39.17558  49.780607           grey soil
83     38.25692  52.230534           grey soil
84     40.81065  43.605072           grey soil
85     38.59093  33.471701           grey soil
86     37.43569  33.047030           grey soil
87     40.90865  41.345025           grey soil
88     40.36371  45.868209           grey soil
89     36.64671  39.336481           grey soil
90     36.24131  39.139553           grey soil
91     34.98156  38.496853           grey soil
92     34.64157  31.601629           grey soil
93     31.57882  30.146602           grey soil
94     34.55470  24.230543           grey soil
95     31.17898  18.800842           grey soil
96     32.43761  19.428853           grey soil
97     31.15844  21.252945           grey soil
98     30.39358  25.358537           grey soil
99     35.56852  30.234389           grey soil
100    36.00317  27.955323           grey soil
101    33.81932  26.980147           grey soil
102    32.01964  24.174475           grey soil
103    27.02499   4.743419           grey soil
104    11.10956 -13.324551           grey soil
105    11.67794   3.728488           grey soil
106    21.08838   3.967056 very damp grey soil
107    18.51152  -5.919035 very damp grey soil
108    12.32450 -30.298925 very damp grey soil
109    14.88374 -35.299342 very damp grey soil
110    12.09362 -38.600547  vegetation stubble
111     1.42083 -41.239995  vegetation stubble
112   -15.27211 -49.259950  vegetation stubble
113   -23.08998 -59.252794  vegetation stubble
114   -19.60409 -63.785073  vegetation stubble
115   -19.93621 -65.860540  vegetation stubble
116    54.62442  84.672958           grey soil
117    55.74661  88.224514           grey soil
118    46.16429  73.397478           grey soil
119    32.95745  22.062883           grey soil
120    31.89828  12.354512           grey soil
121    34.06072  13.332293           grey soil
122    33.82669  20.379325           grey soil
123    31.47579  26.484242           grey soil
124    31.81677  14.525628           grey soil
125    29.10125   8.919449      damp grey soil
126    26.72507   1.506901      damp grey soil
127    25.10774   2.667071      damp grey soil
128    22.04625  -0.760508      damp grey soil
129    23.99494 -14.233371      damp grey soil
130    21.85411 -10.001821      damp grey soil
131    21.83132 -19.820545      damp grey soil
132    18.86743 -30.150042      damp grey soil
133    10.86823 -37.706891         cotton crop
134     7.96666 -34.741582         cotton crop
135     0.02221 -20.818342         cotton crop
136    25.72252  21.100754         cotton crop
137    25.63379  26.004064           grey soil
138    29.40712  23.351274           grey soil
139    34.63146  27.761991           grey soil
140    37.23814  28.926880           grey soil
141    34.10086  23.147551           grey soil
142    30.64793  23.981144           grey soil
143    32.80919  27.429215           grey soil
144    31.20767  28.606443           grey soil
145    33.59848  34.649156           grey soil
146    37.36283  37.539474           grey soil
147    38.91969  38.344708           grey soil
148    43.02701  44.647209           grey soil
149    41.04740  46.116420           grey soil
150    38.20504  39.378338           grey soil
151    39.60758  34.643266           grey soil
152    37.11196  32.451035           grey soil
153    35.55703  31.668982           grey soil
154    37.13762  29.385906           grey soil
155    37.13762  29.385906           grey soil
156    34.97517  28.408125           grey soil
157    36.54633  29.210371           grey soil
158    37.35482  34.449597           grey soil
159    37.04752  36.293217           grey soil
160    36.46212  33.031231           grey soil
161    38.08731  29.397672           grey soil
162    33.25170  22.676759           grey soil
163    28.14346  13.374617           grey soil
164    30.09326   7.574958           grey soil
165    29.48143   9.851527           grey soil
166    32.54186  13.633550           grey soil
167    34.19785  22.687397           grey soil
168    31.08838  19.249480           grey soil
169    31.10272  19.244618           grey soil
170    33.48863  11.176043           grey soil
171    25.98205   7.927644           grey soil
172    24.72111   9.755234           grey soil
173    21.32806   7.813296           grey soil
174     8.10773  -6.643476           grey soil
175    29.35352  15.990375           grey soil
176    28.52577   8.760972           grey soil
177    23.94698  -6.099571           grey soil
178    18.72563 -18.339690 very damp grey soil
179    12.91962 -27.372832 very damp grey soil
180     6.38942 -36.825401 very damp grey soil
181    -0.81972 -40.157847  vegetation stubble
182   -10.22214 -44.157612  vegetation stubble
183   -19.75042 -46.691039  vegetation stubble
184   -24.87073 -52.980719  vegetation stubble
185   -25.26265 -63.542362  vegetation stubble
186   -27.83292 -66.765964  vegetation stubble
187    38.78102  35.560991           grey soil
188    38.64510  48.890834           grey soil
189    43.97571  62.915747           grey soil
190    37.46604  44.515278           grey soil
191    28.50985  19.488588           grey soil
192    31.07943  14.480919           grey soil
193    30.14156  12.000028           grey soil
194    27.06699  -5.912254      damp grey soil
195    25.96244 -13.256910      damp grey soil
196    24.33412  -9.619123      damp grey soil
197    22.20492 -10.587061      damp grey soil
198    20.71916 -17.680457      damp grey soil
199    23.92039 -22.489498      damp grey soil
200    23.25606 -18.842932      damp grey soil
201    25.76598 -20.023705      damp grey soil
202    22.01632 -19.827246      damp grey soil
203    15.13883 -22.753237      damp grey soil
204    14.96636 -33.010896         cotton crop
205     5.55948 -29.133588         cotton crop
206   -13.65311 -25.104500         cotton crop
207   -39.61297 -11.187241         cotton crop
208   -86.15111  18.897908         cotton crop
209   -86.51066  21.219023         cotton crop
210     4.12993   2.379599         cotton crop
211    32.82010  26.036485           grey soil
212    35.00352  27.008179           grey soil
213    34.07437  24.544310           grey soil
214    34.07437  24.544310           grey soil
215    39.61437  36.014726           grey soil
216    38.78102  35.560991           grey soil
217    34.68662  37.976012           grey soil
218    34.71194  37.983661           grey soil
219    38.78102  35.560991           grey soil
220    37.35824  32.529362           grey soil
221    32.45876  30.644043           grey soil
222    31.82601  30.184154           grey soil
223    32.96972  15.307559           grey soil
224    31.33747  18.938861           grey soil
225    35.44865  31.404076           grey soil
226    36.56105  36.275343           grey soil
227    34.21789  33.237526           grey soil
228    31.67570  17.450120           grey soil
229    32.37077  11.017164           grey soil
230    29.89202  11.857565           grey soil
231    28.26954  13.040880           grey soil
232    28.91698  13.503138           grey soil
233    27.70861  10.885870           grey soil
234    29.57465   9.859671           grey soil
235    29.23573  11.669175           grey soil
236    24.84110  13.869514           grey soil
237    29.07043  26.232944           grey soil
238    27.96635  17.326364           grey soil
239    23.41269  -7.682414 very damp grey soil
240    15.26706 -26.401752 very damp grey soil
241    11.51505 -28.676710 very damp grey soil
242    11.29353 -34.790750 very damp grey soil
243    -1.38095 -44.613880 very damp grey soil
244    -7.98435 -52.983498 very damp grey soil
245   -13.99843 -55.830740  vegetation stubble
246   -20.26284 -52.997860 very damp grey soil
247   -25.99804 -54.736676  vegetation stubble
248    37.75178  36.511637           grey soil
249    36.58026  30.958931           grey soil
250    33.39911  33.787538           grey soil
251    33.37749  58.014967           grey soil
252    43.16979  79.484546           grey soil
253    44.74744  56.065284           grey soil
254    27.79191  18.545042           grey soil
255    25.50192  10.678331           grey soil
256    28.15771   1.241004           grey soil
257    28.24777  -4.623358      damp grey soil
258    27.33605  -7.094442      damp grey soil
259    27.94586 -12.735831      damp grey soil
260    27.57777 -15.293388      damp grey soil
261    26.43056 -12.014642      damp grey soil
262    26.07007 -14.570211      damp grey soil
263    22.54494 -17.654520      damp grey soil
264    17.82819 -17.464487      damp grey soil
265    20.01718 -16.471888      damp grey soil
266    22.47335 -11.593251      damp grey soil
267    20.98974  -8.390261         cotton crop
268    17.51083 -22.131510         cotton crop
269    -4.25767 -18.930057         cotton crop
270   -56.92012  14.917600         cotton crop
271   -83.41405  24.491741         cotton crop
272   -96.15147  27.661840         cotton crop
273   -99.04220  28.753555         cotton crop
274   -28.60461  -3.146430         cotton crop
275    16.05354   1.971936           grey soil
276    30.12710  19.239902           grey soil
277    27.21820  18.523285           grey soil
278    28.43871  20.859741           grey soil
279    31.32580  21.573607           grey soil
280    35.41882  27.879095           grey soil
281    37.67294  35.818425           grey soil
282    39.23978  39.095189           grey soil
283    37.08789  33.994276           grey soil
284    38.36425  32.190158           grey soil
285    31.03804  30.759790           grey soil
286    36.24574  32.785385           grey soil
287    41.20341  31.167072           grey soil
288    36.02669  21.998840           grey soil
289    36.74123  27.351363           grey soil
290    33.45099  23.297520           grey soil
291    32.27416  20.203761           grey soil
292    38.65866  34.802936           grey soil
293    38.36817  32.184873           grey soil
294    36.00164  35.468791           grey soil
295    31.82192  24.182050           grey soil
296    31.93347  16.201112           grey soil
297    28.35674   7.673401           grey soil
298    24.58611   7.875947           grey soil
299    26.39429  13.131229           grey soil
300    29.81217  17.226228           grey soil
301    29.93571   8.967193           grey soil
302    28.69811   5.848117           grey soil
303    27.96486   9.820873           grey soil
304    25.85230  10.989049           grey soil
305    29.81217  17.226228           grey soil
306    31.01754  19.556833           grey soil
307    33.21591  18.096434           grey soil
308    34.14846  16.709530           grey soil
309    34.14060  19.182919           grey soil
310    14.05395 -33.495174 very damp grey soil
311    10.04150 -39.261114 very damp grey soil
312     0.12648 -60.916042 very damp grey soil
313    -2.43541 -55.916471 very damp grey soil
314    -8.45619 -54.834647 very damp grey soil
315    44.84868  57.454022           grey soil
316    43.16438  56.612489           grey soil
317    40.99761  70.124750           grey soil
318    48.73569  76.079026           grey soil
319    47.50497  68.300279           grey soil
320    27.81204  20.991439           grey soil
321    29.49978  19.358172           grey soil
322    32.47790  14.543203           grey soil
323    32.15533  12.529416           grey soil
324    28.20682  10.661502      damp grey soil
325    26.35358   1.583682      damp grey soil
326    26.24739 -10.938911      damp grey soil
327    24.64199  -5.173464      damp grey soil
328    25.31436  -8.814561      damp grey soil
329    25.32103  -8.817661      damp grey soil
330    17.84780 -14.998387         cotton crop
331     6.96303 -11.502512         cotton crop
332   -73.17918  16.996114         cotton crop
333   -90.54487  25.944219         cotton crop
334   -99.62203  32.639746         cotton crop
335  -104.53265  35.285829         cotton crop
336   -99.82815  32.506515         cotton crop
337  -101.20498  36.157402         cotton crop
338  -101.85138  34.062434         cotton crop
339   -12.62883  -0.528935         cotton crop
340    25.35062  11.254456           grey soil
341    31.27087  22.766263           grey soil
342    29.94375  19.745866           grey soil
343    26.70706  15.760572           grey soil
344    41.31354  39.992331           grey soil
345    46.18701  42.194878           grey soil
346    43.59343  43.497291           grey soil
347    41.14892  40.510667           grey soil
348    38.54771  34.999434           grey soil
349    36.18513  31.951640           grey soil
350    34.30125  32.979698           grey soil
351    38.21571  38.999796           grey soil
352    39.18186  37.664200           grey soil
353    37.96659  30.707181           grey soil
354    33.95087  32.668980           grey soil
355    33.93166  36.502694           grey soil
356    42.84584  32.574031           grey soil
357    35.21062  33.311680           grey soil
358    31.76922  35.524913           grey soil
359    32.72589  34.166732           grey soil
360    34.88002  35.132849           grey soil
361    31.81771  31.696777           grey soil
362    31.77128  25.019334           grey soil
363    30.33205  19.920098           grey soil
364    33.10070  17.336885           grey soil
365    30.25206  17.927021           grey soil
366    35.45601  29.081855           grey soil
367    36.61625  29.671445           grey soil
368    34.79020  24.419898           grey soil
369    32.64681  20.968093           grey soil
370    32.44820  16.385267           grey soil
371    29.11648  23.638165           grey soil
372    31.46968  31.672162           grey soil
373    37.12052  31.966394           grey soil
374    34.79948  23.925676           grey soil
375    29.91617  17.077483           grey soil
376    28.09095  21.116958           grey soil
377    18.35619 -24.389539 very damp grey soil
378    17.05237 -27.515770 very damp grey soil
379    19.52188 -22.454726 very damp grey soil
380    12.87558 -31.367612 very damp grey soil
381    14.08612 -36.556531 very damp grey soil
382    13.56417 -42.555641 very damp grey soil
383    48.43048  73.314604           grey soil
384    42.76470  60.967778           grey soil
385    40.68586  77.321443           grey soil
386    39.34007  80.984808           grey soil
387    33.30531  22.485071           grey soil
388    29.54378   9.089258           grey soil
389    29.92836   5.574827           grey soil
390    27.41038  -8.079281      damp grey soil
391    24.35800  -7.478762      damp grey soil
392    30.11344  -6.857055      damp grey soil
393    29.03556 -11.712840      damp grey soil
394    26.64287 -14.774704         cotton crop
395    19.45630 -16.201096         cotton crop
396    13.17928 -14.816648         cotton crop
397    -2.19787 -11.398588         cotton crop
398   -37.46302   2.888826         cotton crop
399   -73.81350  24.486256         cotton crop
400   -94.48151  37.423351         cotton crop
401  -101.40547  41.405502         cotton crop
402  -104.83315  34.221457         cotton crop
403  -105.76846  39.254098         cotton crop
404  -104.89314  39.700464         cotton crop
405  -106.87689  41.265361         cotton crop
406  -108.29710  43.525806         cotton crop
407   -98.62921  33.445270         cotton crop
408   -48.72247  10.625753         cotton crop
409    10.25996   8.969960         cotton crop
410    35.39253  28.026493           grey soil
411    34.65342  34.615868           grey soil
412    40.93719  33.231251           grey soil
413    41.39640  28.496135           grey soil
414    35.68783  20.902166           grey soil
415    34.40088  22.714669           grey soil
416    39.76946  29.679914           grey soil
417    41.69361  37.440455           grey soil
418    40.79298  37.455590           grey soil
419    39.68186  32.589961           grey soil
420    36.97752  31.362096           grey soil
421    31.95380  30.918842           grey soil
422    35.22110  36.770708           grey soil
423    38.09464  33.764202           grey soil
424    40.75974  37.445747           grey soil
425    40.42442  41.736077           grey soil
426    36.46474  39.866922           grey soil
427    42.10176  46.687315           grey soil
428    34.11311  31.900852           grey soil
429    36.64378  33.187493           grey soil
430    38.23413  32.009024           grey soil
431    36.52648  26.294716           grey soil
432    36.94091  21.547966           grey soil
433    37.05059  28.440630           grey soil
434    36.48871  34.940019           grey soil
435    30.38350  41.238449           grey soil
436    36.11532  46.372950           grey soil
437    34.88442  30.265661           grey soil
438    38.42082  31.941622           grey soil
439    37.54308  29.155849           grey soil
440    33.10859  22.199718           grey soil
441    31.85842  24.023191           grey soil
442    31.14371  10.376963 very damp grey soil
443    28.59958  11.212366 very damp grey soil
444    27.02194  14.852781 very damp grey soil
445    27.71798   8.755353 very damp grey soil
446    27.19909   0.301805 very damp grey soil
447    24.31934 -11.190761 very damp grey soil
448    17.97615 -22.943147 very damp grey soil
449    15.67690 -34.514620 very damp grey soil
450    42.44768  83.032743           grey soil
451    40.26669  76.605121           grey soil
452    39.74285  71.016463           grey soil
453    41.43952  66.926371           grey soil
454    39.26692  55.829007           grey soil
455    37.13019  41.889315           grey soil
456    33.90975  20.697302           grey soil
457    29.46030   7.996680           grey soil
458    28.20055   7.353980           grey soil
459    29.80790   3.722280           grey soil
460    31.06765   4.364980      damp grey soil
461    31.07590   1.896947      damp grey soil
462    30.06353  -5.330798         cotton crop
463    22.44621  -8.586385         cotton crop
464    15.94697 -11.542072         cotton crop
465    -5.10523  -8.472745         cotton crop
466   -33.59204   1.637564         cotton crop
467   -46.48953  -0.025168         cotton crop
468   -89.93650  35.735331         cotton crop
469  -111.04527  56.281982         cotton crop
470  -115.05293  57.312332         cotton crop
471  -112.30695  51.396849         cotton crop
472  -104.06405  40.787790         cotton crop
473  -106.19723  37.289063         cotton crop
474  -101.82233  32.577359         cotton crop
475   -78.26631  18.644778         cotton crop
476   -24.34359   6.069880         cotton crop
477    32.34188  27.426849           grey soil
478    34.50432  28.404631           grey soil
479    37.19940  30.306684           grey soil
480    37.08255  34.587125           grey soil
481    35.88345  32.248064           grey soil
482    32.87698  28.333465           grey soil
483    35.32982  31.331754           grey soil
484    37.08568  34.582897           grey soil
485    35.41268  36.216658           grey soil
486    37.21727  30.302950           grey soil
487    38.14775  28.936838           grey soil
488    34.14821  38.043119           grey soil
489    35.82593  33.940197           grey soil
490    36.25706  31.660002           grey soil
491    34.95890  33.473139           grey soil
492    35.29159  27.554250           grey soil
493    33.36041  30.961535           grey soil
494    36.00317  27.955323           grey soil
495    35.02155  29.314980           grey soil
496    32.38320  34.771818           grey soil
497    35.98896  36.329126           grey soil
498    39.51721  42.949048           grey soil
499    36.91320  37.574623           grey soil
500    35.02155  29.314980           grey soil
501    35.39481  36.220392           grey soil
502    33.77932  36.162020           grey soil
503    30.82784  23.074114           grey soil
504    32.55957  26.337447           grey soil
505    25.69744  -9.415642 very damp grey soil
506    11.37128 -32.633005 very damp grey soil
507     9.80640 -31.301434 very damp grey soil
508    10.22471 -35.434865 very damp grey soil
509    16.79617 -16.078642 very damp grey soil
510    20.94398 -20.281808 very damp grey soil
511    16.66863 -28.062330 very damp grey soil
512    13.60346 -33.489940 very damp grey soil
513    40.47487  72.957430           grey soil
514    40.12270  62.689472           grey soil
515    37.19636  41.809213           grey soil
516    35.22997  33.491279           grey soil
517    33.37012  29.584224           grey soil
518    30.65810   9.724683           grey soil
519    31.35748   7.742043           grey soil
520    33.54776   4.264663      damp grey soil
521   -25.41978  -3.366677         cotton crop
522   -56.99379  10.196852         cotton crop
523   -85.95459  26.033590         cotton crop
524   -99.03377  32.702050         cotton crop
525   -83.09990  24.906350         cotton crop
526  -110.06300  52.911056         cotton crop
527  -119.07180  64.444205         cotton crop
528  -120.25036  66.946187         cotton crop
529  -119.46284  57.070821         cotton crop
530  -116.18653  50.705581         cotton crop
531  -110.62083  47.835893         cotton crop
532   -93.61528  32.915611         cotton crop
533   -94.04068  27.695815         cotton crop
534   -98.88097  35.332982         cotton crop
535    -7.83680  -0.348570         cotton crop
536    28.91204  16.273640         cotton crop
537    36.79272  31.210062           grey soil
538    37.13762  29.385906           grey soil
539    34.97517  28.408125           grey soil
540    38.37189  35.102186           grey soil
541    38.36741  32.013437           grey soil
542    34.29377  35.139901           grey soil
543    32.93338  24.513858           grey soil
544    33.68195  17.947067           grey soil
545    35.04471  25.485530           grey soil
546    38.93989  35.255270           grey soil
547    39.29771  33.451267           grey soil
548    34.28065  31.000731           grey soil
549    34.28065  31.000731           grey soil
550    32.35203  35.112192           grey soil
551    32.81391  24.960054           grey soil
552    37.69972  32.625441           grey soil
553    36.68359  37.064655           grey soil
554    31.62809  46.557396           grey soil
555    38.08106  52.032620           grey soil
556    40.25329  30.376582           grey soil
557    36.26331  24.125333           grey soil
558    34.64104  30.228165           grey soil
559    34.63027  30.232281 very damp grey soil
560    32.47859  29.250384 very damp grey soil
561    29.51165   0.955054 very damp grey soil
562    22.30274 -26.062258 very damp grey soil
563    18.58167 -34.143826 very damp grey soil
564    12.56182 -23.096460 very damp grey soil
565    12.91609 -27.373960 very damp grey soil
566    16.11152 -33.283343 very damp grey soil
567    19.71435 -25.243219 very damp grey soil
568    19.43501 -24.775633 very damp grey soil
569    14.38290 -20.293394 very damp grey soil
570    12.58549 -25.552791 very damp grey soil
571    41.64367  76.657591           grey soil
572    42.45932  62.136025           grey soil
573    40.18403  47.792962           grey soil
574    36.15094  38.547577           grey soil
575    36.91290  43.183361           grey soil
576    40.40072  29.792558           grey soil
577    35.31856  18.688510           grey soil
578    30.79472  12.192646           grey soil
579    28.98521   5.555753      damp grey soil
580    26.84225   4.590878         cotton crop
581    27.61328   0.835090         cotton crop
582   -40.01476   3.483995         cotton crop
583   -71.79938  19.405146         cotton crop
584  -105.84873  37.085766         cotton crop
585   -89.69736  23.957336         cotton crop
586  -116.73786  63.510290         cotton crop
587  -118.87103  60.011563         cotton crop
588  -107.08002  42.567124         cotton crop
589   -95.73169  26.033753         cotton crop
590   -96.48961  25.598156         cotton crop
591   -95.83539  28.364635         cotton crop
592     6.61112   3.376417         cotton crop
593    31.33434  18.943089           grey soil
594    34.06007  24.547297           grey soil
595    35.85785  25.768842           grey soil
596    39.47061  26.993161           grey soil
597    38.78574  33.091830           grey soil
598    38.78102  35.560991           grey soil
599    37.52440  34.914063           grey soil
600    42.16110  38.887528           grey soil
601    40.94700  36.539901           grey soil
602    37.86930  33.089907           grey soil
603    35.51737  27.594408           grey soil
604    32.79408  26.353713           grey soil
605    32.46348  28.174882           grey soil
606    31.52961  28.180174           grey soil
607    33.88777  31.226557           grey soil
608    31.33721  33.762078           grey soil
609    35.31630  35.641209           grey soil
610    32.11260  25.966712           grey soil
611    36.24584  27.658095           grey soil
612    38.18717  32.981686           grey soil
613    37.79388  48.440834           grey soil
614    38.96927  51.522222           grey soil
615    33.19220  21.757126 very damp grey soil
616    20.96564 -13.133300 very damp grey soil
617    12.58434 -37.968971 very damp grey soil
618    10.35321 -37.255860 very damp grey soil
619     8.78402 -37.777359 very damp grey soil
620    12.16139 -32.000579 very damp grey soil
621    14.30169 -28.546421 very damp grey soil
622    16.85956 -29.714983 very damp grey soil
623    12.02791 -43.960064 very damp grey soil
624    12.54035 -37.976919 very damp grey soil
625    15.42793 -22.116216 very damp grey soil
626    18.91742 -20.465336 very damp grey soil
627    18.31640 -25.105947 very damp grey soil
628    17.06622 -23.282473 very damp grey soil
629    42.84955  74.385055           grey soil
630    43.91064  62.944883           grey soil
631    44.16997  48.654407           grey soil
632    40.61805  44.490816           grey soil
633    39.33571  46.321011           grey soil
634    40.34523  51.629102           grey soil
635    39.73117  44.172793           grey soil
636    36.72584  29.146568           grey soil
637    33.60647  14.567351           grey soil
638    29.61336   8.320329         cotton crop
639    23.68341   7.540866         cotton crop
640     4.50694   5.198254         cotton crop
641   -25.93490   4.304391         cotton crop
642   -61.05990  17.290168         cotton crop
643   -87.90896  35.203534         cotton crop
644   -98.52782  42.293264         cotton crop
645  -107.80511  39.708712         cotton crop
646  -108.71990  44.738465         cotton crop
647  -104.95242  38.125607         cotton crop
648   -99.27485  33.436567         cotton crop
649   -80.68547  19.580416         cotton crop
650   -81.73158  23.841374         cotton crop
651  -110.35969  51.797329         cotton crop
652  -120.00685  60.124804         cotton crop
653  -116.60191  51.949342         cotton crop
654  -103.31526  34.158326         cotton crop
655  -100.40392  36.046445         cotton crop
656   -98.35702  37.016615         cotton crop
657   -95.74638  26.046703         cotton crop
658   -96.00556  33.183372         cotton crop
659   -94.17003  32.272686         cotton crop
660   -93.25751  27.247097         cotton crop
661   -91.20792  25.717612         cotton crop
662   -71.70819  12.874924         cotton crop
663   -21.35158   0.383051         cotton crop
664    31.84303  22.483956           grey soil
665    32.64741  27.109173           grey soil
666    33.07854  24.828978           grey soil
667    32.96356  36.066323           grey soil
668    40.08079  39.879476           grey soil
669    40.04508  39.885069           grey soil
670    37.93062  38.917624           grey soil
671    35.76372  26.054939           grey soil
672    38.59522  34.166377           grey soil
673    36.06052  28.675174           grey soil
674    31.54596  31.324563           grey soil
675    37.03010  28.677159           grey soil
676    34.45200  21.195465           grey soil
677    38.82012  30.105093           grey soil
678    42.28792  42.861283           grey soil
679    39.89861  46.563133           grey soil
680    36.90528  33.592475  vegetation stubble
681    35.36666  22.282024  vegetation stubble
682    25.70199  -1.744985  vegetation stubble
683    20.10624 -12.559057  vegetation stubble
684    17.85473 -17.449669 very damp grey soil
685    14.41622 -33.259997 very damp grey soil
686     4.94103 -51.448854 very damp grey soil
687     3.88843 -55.366982 very damp grey soil
688    11.31048 -48.896932 very damp grey soil
689    12.17384 -38.297403 very damp grey soil
690    12.76356 -41.483208 very damp grey soil
691    12.47005 -37.660001 very damp grey soil
692    14.34501 -23.131763 very damp grey soil
693    18.76096 -17.113459 very damp grey soil
694    14.76112 -35.084153 very damp grey soil
695     6.23185 -54.627075 very damp grey soil
696    44.30856  72.839397           grey soil
697    49.11844  62.452562           grey soil
698    42.82154  47.931067           grey soil
699    41.97710  44.991113           grey soil
700    41.89204  50.056544           grey soil
701    38.73754  43.761582           grey soil
702    39.51305  26.693380           grey soil
703    20.40232   5.094838         cotton crop
704   -31.84663   3.956318         cotton crop
705   -76.41190  19.893350         cotton crop
706  -107.25209  38.951915         cotton crop
707  -109.20204  46.528711         cotton crop
708  -102.29436  36.329836         cotton crop
709  -107.82256  42.878670         cotton crop
710  -105.70055  36.511765         cotton crop
711   -99.61353  30.895133         cotton crop
712   -83.36472  18.877739         cotton crop
713   -91.35567  30.349918         cotton crop
714  -116.85843  49.499750         cotton crop
715  -108.10929  46.338904         cotton crop
716  -105.02442  38.615793         cotton crop
717  -100.78615  29.653106         cotton crop
718   -98.14377  24.178718         cotton crop
719   -93.71805  22.740392         cotton crop
720    27.97924  12.571318           grey soil
721    32.55089  25.116064           grey soil
722    33.00251  34.038825           grey soil
723    40.13493  33.825193           grey soil
724    37.43969  43.104147           grey soil
725    40.18085  44.341109           grey soil
726    41.85857  40.238186           grey soil
727    37.10470  31.949336           grey soil
728    36.18513  31.951640           grey soil
729    35.21062  33.311680           grey soil
730    40.43096  33.026772           grey soil
731    37.01824  32.077026           grey soil
732    35.37364  35.700609           grey soil
733    38.42263  38.950863           grey soil
734    35.35444  39.534324           grey soil
735    42.78486  49.715534           grey soil
736    47.52816  49.533983           grey soil
737    38.42263  38.950863  vegetation stubble
738    34.82435  24.430368  vegetation stubble
739    24.38697  -7.450802  vegetation stubble
740    21.05925 -23.167312  vegetation stubble
741    17.14085 -37.160221  vegetation stubble
742     9.19267 -44.994803 very damp grey soil
743     9.57121 -46.803760 very damp grey soil
744     7.52902 -59.888249 very damp grey soil
745     7.61337 -45.470686 very damp grey soil
746    14.74626 -36.755068 very damp grey soil
747     5.58477 -53.053881 very damp grey soil
748    10.41535 -42.156688 very damp grey soil
749    17.07123 -26.760138 very damp grey soil
750    20.42848 -17.519837 very damp grey soil
751    18.10223 -25.490583 very damp grey soil
752    12.52834 -37.508831 very damp grey soil
753    12.00161 -43.488990 very damp grey soil
754     9.37508 -54.605088 very damp grey soil
755     2.26479 -62.333236 very damp grey soil
756    44.00572  49.499502           grey soil
757    40.38543  43.437904           grey soil
758    34.66772  34.612881           grey soil
759    34.27142  36.758942           grey soil
760    38.05668  36.223520           grey soil
761   -38.05932   8.918421         cotton crop
762  -104.54042  36.963606         cotton crop
763  -102.08485  41.157362         cotton crop
764  -103.68553  40.415528         cotton crop
765  -105.39892  39.028210         cotton crop
766  -106.02172  36.234528         cotton crop
767  -104.31032  32.144930         cotton crop
768   -89.68975  20.789901         cotton crop
769   -74.19493  14.460531         cotton crop
770  -114.28093  51.665985         cotton crop
771  -101.67238  26.684956         cotton crop
772   -91.86582  17.265902         cotton crop
773   -89.74611  20.744400         cotton crop
774   -91.08336  22.553570         cotton crop
775   -90.74181  25.096309         cotton crop
776   -89.97521  20.524686         cotton crop
777   -80.92505  11.325478         cotton crop
778   -43.14896  -2.141935         cotton crop
779    29.49605  13.996563           grey soil
780    33.03588  25.000156           grey soil
781    35.71776  30.719396           grey soil
782    33.08287  24.676840           grey soil
783    36.23903  30.945655           grey soil
784    41.65772  40.249989           grey soil
785    37.74189  38.061747           grey soil
786    43.21104  41.182354           grey soil
787    42.04316  35.632116           grey soil
788    40.45280  36.810585           grey soil
789    40.45280  36.810585           grey soil
790    41.70942  37.457513           grey soil
791    39.35439  34.406902           grey soil
792    35.69410  33.175727           grey soil
793    38.04754  38.691271           grey soil
794    40.78228  48.627566           grey soil
795    44.70297  52.198549 very damp grey soil
796    34.43619  19.032468  vegetation stubble
797    25.85680  -6.889841  vegetation stubble
798     3.90787 -65.878130  vegetation stubble
799     3.86858 -62.038047  vegetation stubble
800     6.10550 -62.754540  vegetation stubble
801     4.53290 -67.642765  vegetation stubble
802     2.38907 -71.098050  vegetation stubble
803     0.17963 -71.752517  vegetation stubble
804     1.11200 -61.209282 very damp grey soil
805     4.59307 -59.562202 very damp grey soil
806     4.53773 -59.587672 very damp grey soil
807     6.55933 -38.441539 very damp grey soil
808    12.04951 -21.247980 very damp grey soil
809    11.34611 -38.610413 very damp grey soil
810     8.77874 -35.315543 very damp grey soil
811    15.10314 -15.347012 very damp grey soil
812    14.44007 -33.029660 very damp grey soil
813     7.17221 -55.459073 very damp grey soil
814     7.11730 -60.745963 very damp grey soil
815    44.36154  49.646069           grey soil
816    35.82593  33.940197           grey soil
817    36.01262  33.872795           grey soil
818    39.78561  35.809352           grey soil
819    39.37991  38.082995           grey soil
820    29.35873  18.449149      damp grey soil
821    26.69237   6.583505      damp grey soil
822  -105.27016  39.613336         cotton crop
823  -108.26186  45.512337         cotton crop
824  -114.17255  49.985608         cotton crop
825  -107.88277  51.201596         cotton crop
826  -102.20683  41.822374         cotton crop
827   -92.29109  32.353546         cotton crop
828   -74.28222  13.405145         cotton crop
829   -76.65346  14.589023         cotton crop
830  -112.44571  51.393155         cotton crop
831  -108.46200  45.506999         cotton crop
832  -104.20585  37.796511         cotton crop
833   -99.44623  30.342384         cotton crop
834   -95.59705  27.893053         cotton crop
835   -92.28719  25.202696         cotton crop
836   -90.87511  23.850936         cotton crop
837   -91.60992  21.557935         cotton crop
838   -91.28968  19.245714         cotton crop
839   -93.04718  25.345980         cotton crop
840   -91.33582  26.013454         cotton crop
841    28.50735  24.247492           grey soil
842    31.96907  34.598782           grey soil
843    34.14992  25.158978           grey soil
844    36.21552  34.120067           grey soil
845    42.05931  41.761553           grey soil
846    40.77696  43.591748           grey soil
847    40.36371  45.868209           grey soil
848    38.94093  42.836580           grey soil
849    38.94437  40.361780           grey soil
850    39.08037  36.083243           grey soil
851    36.77429  32.570351           grey soil
852    34.92010  33.609344           grey soil
853    36.66245  31.856930           grey soil
854    42.04143  41.765287           grey soil
855    39.08343  47.677612 very damp grey soil
856    34.31097  33.422798 very damp grey soil
857    17.74677 -34.327428  vegetation stubble
858    -2.40056 -84.394125  vegetation stubble
859    -3.31443 -76.916749  vegetation stubble
860   -10.30632 -76.698858  vegetation stubble
861    -7.85386 -64.979289  vegetation stubble
862    14.26953 -37.602537 very damp grey soil
863    15.19853 -37.137569 very damp grey soil
864    13.17461 -27.987691 very damp grey soil
865    12.83694 -24.315779 very damp grey soil
866    11.38557 -30.782993 very damp grey soil
867     9.94110 -39.559228 very damp grey soil
868    14.31283 -39.925882 very damp grey soil
869    14.99909 -44.043509 very damp grey soil
870     7.90948 -51.754452 very damp grey soil
871    41.35370  48.751541           grey soil
872    37.60961  39.532752           grey soil
873    34.66212  40.523319           grey soil
874    38.55385  37.548897           grey soil
875    32.36168  22.362964      damp grey soil
876    30.07247  12.020607      damp grey soil
877    30.75623   5.907249      damp grey soil
878   -25.06865   2.140799         cotton crop
879   -80.37300  31.580109         cotton crop
880  -106.73580  52.056849         cotton crop
881  -111.64013  57.686779         cotton crop
882  -114.40967  56.956888         cotton crop
883  -114.43196  56.959211         cotton crop
884  -111.18748  55.428470         cotton crop
885  -109.02001  51.026406         cotton crop
886  -107.73187  46.743614         cotton crop
887  -103.59639  43.333796         cotton crop
888  -101.09185  42.155080         cotton crop
889  -100.64105  39.869840         cotton crop
890   -94.03537  30.185416         cotton crop
891   -69.25839   4.535844         cotton crop
892  -103.72693  35.376626         cotton crop
893   -81.88026  12.924672         cotton crop
894   -91.50643  26.532494         cotton crop
895   -90.22615  24.723091         cotton crop
896    37.69972  32.625441           grey soil
897    37.37812  34.472048           grey soil
898    36.64936  24.304074           grey soil
899    38.02699  36.926342           grey soil
900    35.79125  48.533932           grey soil
901    38.64622  47.527904           grey soil
902    39.91070  45.701443           grey soil
903    38.33992  44.892783           grey soil
904    38.18363  39.380944           grey soil
905    40.13444  35.265821           grey soil
906    37.13762  29.385906           grey soil
907    40.52594  32.996504           grey soil
908    39.32063  32.026332 very damp grey soil
909    22.71039   2.181174 very damp grey soil
910    17.24590 -15.467681 very damp grey soil
911    13.42326 -66.332581  vegetation stubble
912     5.39259 -99.548300  vegetation stubble
913    -1.24429 -94.372291  vegetation stubble
914    -4.59793 -87.552287  vegetation stubble
915    -9.80789 -81.091688  vegetation stubble
916    -8.45855 -84.089013  vegetation stubble
917    -8.49938 -84.100844  vegetation stubble
918    -9.71892 -74.932036  vegetation stubble
919    -4.31014 -60.211400  vegetation stubble
920     7.33884 -56.211162 very damp grey soil
921    11.98482 -38.756022 very damp grey soil
922    16.76932  -5.199255 very damp grey soil
923    17.76982 -10.517826 very damp grey soil
924    10.75836 -30.820902 very damp grey soil
925    11.14120 -39.077995 very damp grey soil
926    12.37768 -51.383109 very damp grey soil
927     3.56821 -56.008615 very damp grey soil
928    42.77564  37.643819           grey soil
929    44.92475  49.444901           grey soil
930    45.93663  54.775195           grey soil
931    48.49141  53.608986           grey soil
932    36.28084  39.122733           grey soil
933    29.81378  18.777669      damp grey soil
934    27.06974  10.690265      damp grey soil
935    25.74384   2.187195      damp grey soil
936    19.99979  -6.636364      damp grey soil
937   -14.28367   0.322459         cotton crop
938   -75.78263  29.093919         cotton crop
939  -110.12170  50.112364         cotton crop
940  -113.07653  54.152833         cotton crop
941  -112.54732  56.914490         cotton crop
942  -111.17138  55.116320         cotton crop
943  -105.66862  45.568131         cotton crop
944  -105.15127  42.831897         cotton crop
945   -99.45688  36.521436         cotton crop
946  -100.09058  33.765673         cotton crop
947   -91.32912  21.351901         cotton crop
948   -73.69602   5.000168         cotton crop
949  -100.54398  36.467570         cotton crop
950  -110.05992  43.628224         cotton crop
951  -103.00144  30.006727         cotton crop
952   -95.33466  17.083835         cotton crop
953   -89.58962  10.557679         cotton crop
954   -85.00166   6.054218         cotton crop
955   -83.11084   5.169568         cotton crop
956   -85.08846  12.716512         cotton crop
957   -88.21451  21.159692         cotton crop
958   -90.96869  21.563927         cotton crop
959   -76.67300  16.663141         cotton crop
960    16.52094  10.051444           grey soil
961    33.39415  30.658796           grey soil
962    39.57000  40.172286           grey soil
963    39.99865  37.909747           grey soil
964    40.64700  47.419300           grey soil
965    37.91771  50.960612           grey soil
966    40.10598  51.937199           grey soil
967    37.38063  50.717295           grey soil
968    39.10991  46.623963           grey soil
969    41.20088  40.244580           grey soil
970    42.16110  38.887528 very damp grey soil
971    38.95741  29.213031 very damp grey soil
972    30.22671  10.367695 very damp grey soil
973    22.28715  -1.567543 very damp grey soil
974    16.75497 -21.443118  vegetation stubble
975    15.66164 -34.524333  vegetation stubble
976     1.82811 -74.845743  vegetation stubble
977    -2.95540 -85.742829  vegetation stubble
978    -2.62215 -87.563151  vegetation stubble
979    -2.96970 -85.739841  vegetation stubble
980   -10.11115 -67.290300  vegetation stubble
981    -7.14488 -83.327802  vegetation stubble
982    -4.87434 -56.174444 very damp grey soil
983     5.40229 -49.057719 very damp grey soil
984    11.83231 -30.159364 very damp grey soil
985    -0.12667 -59.931166 very damp grey soil
986     4.90844 -61.960173 very damp grey soil
987     7.34226 -54.529505 very damp grey soil
988    44.31167  48.877339           grey soil
989    42.29106  42.857055           grey soil
990    40.75849  49.352641           grey soil
991    33.34711  13.952259      damp grey soil
992    23.44955   3.563560      damp grey soil
993    28.82676  -4.874722      damp grey soil
994    15.30222  -8.759192         cotton crop
995   -36.79606   4.518406         cotton crop
996   -94.67470  36.174222         cotton crop
997  -111.67875  49.313656         cotton crop
998  -109.15589  48.134688         cotton crop
999  -109.41025  50.568128         cotton crop
1000 -106.05731  40.093048         cotton crop
1001 -104.94593  35.657011         cotton crop
1002 -104.34118  33.534289         cotton crop
1003 -101.38790  30.091125         cotton crop
1004  -93.08065  22.455095         cotton crop
1005 -106.56681  40.355893         cotton crop
1006 -104.79761  33.826769         cotton crop
1007  -89.42072   8.590300         cotton crop
1008  -85.95404   7.891735         cotton crop
1009  -83.73228  10.931253         cotton crop
1010  -78.56899  11.523928         cotton crop
1011  -76.85391   6.050393         cotton crop
1012  -81.76290   9.841279         cotton crop
1013  -83.02056   9.338174         cotton crop
1014  -74.25150   7.263712         cotton crop
1015  -39.43994   1.030765 very damp grey soil
1016   38.29009  39.083423           grey soil
1017   44.39684  43.974776           grey soil
1018   40.56452  44.626527           grey soil
1019   40.55785  44.629627           grey soil
1020   42.70330  48.060640           grey soil
1021   44.57301  48.829132           grey soil
1022   41.57162  44.929372           grey soil
1023   38.88113  41.252503           grey soil
1024   40.14914  39.427171           grey soil
1025   33.90088  17.180129 very damp grey soil
1026   28.37255   7.690459 very damp grey soil
1027   25.06290 -10.280012 very damp grey soil
1028   10.89733 -52.021151  vegetation stubble
1029    6.27903 -77.303009  vegetation stubble
1030  -14.87483 -83.825979  vegetation stubble
1031   -9.40080 -82.220369  vegetation stubble
1032   -7.57116 -87.232481  vegetation stubble
1033  -16.11005 -74.795946  vegetation stubble
1034  -17.60160 -65.367601  vegetation stubble
1035   -3.71784 -82.988339  vegetation stubble
1036   -4.97487 -55.470926  vegetation stubble
1037   -1.37366 -51.978185  vegetation stubble
1038    1.09285 -52.836390  vegetation stubble
1039   -0.44021 -57.716203         cotton crop
1040   -3.45044 -60.562392         cotton crop
1041   -7.19702 -56.662800         cotton crop
1042   -4.58892 -57.266625         cotton crop
1043    0.75679 -64.819667 very damp grey soil
1044   -1.54439 -67.490089 very damp grey soil
1045    2.40329 -54.115600 very damp grey soil
1046   42.30176  47.778955           grey soil
1047   44.88312  53.957221           grey soil
1048   44.90099  53.953487           grey soil
1049   35.61436  31.177002      damp grey soil
1050   22.36089  -0.280909      damp grey soil
1051   20.52753  -3.099904      damp grey soil
1052   -3.41169  -6.268265         cotton crop
1053  -61.15750  13.954866         cotton crop
1054 -108.12716  46.342638         cotton crop
1055 -107.92919  39.691013         cotton crop
1056 -105.37422  39.059084         cotton crop
1057 -103.24271  37.699681         cotton crop
1058 -103.24271  37.699681         cotton crop
1059  -95.47615  22.957789         cotton crop
1060  -84.48659  15.187595         cotton crop
1061  -72.93659   5.313381         cotton crop
1062  -89.04141  22.343471         cotton crop
1063 -105.52883  34.875111         cotton crop
1064  -94.60963  17.421262         cotton crop
1065  -90.40268  19.387864         cotton crop
1066  -87.82455  12.525999         cotton crop
1067  -85.44972   4.322958         cotton crop
1068  -78.74986   2.626485         cotton crop
1069  -76.50051   6.133557         cotton crop
1070  -71.37162   8.588242 very damp grey soil
1071  -48.37499   2.657858 very damp grey soil
1072  -14.24420  -6.542772 very damp grey soil
1073   12.81624  -4.750753 very damp grey soil
1074   29.61260   4.629337 very damp grey soil
1075   33.89695  17.293496           grey soil
1076   37.00903  31.732764           grey soil
1077   43.52540  50.111183           grey soil
1078   45.21027  48.490215           grey soil
1079   47.43890  45.310967           grey soil
1080   46.24452  40.502744           grey soil
1081   39.80746  35.642134           grey soil
1082   36.20880  29.495309           grey soil
1083   28.80222   6.351428 very damp grey soil
1084   23.71147  -3.805477 very damp grey soil
1085   22.98321 -18.684170 very damp grey soil
1086   19.04975 -30.842540 very damp grey soil
1087   12.67612 -43.487784 very damp grey soil
1088    6.85665 -54.394153  vegetation stubble
1089   -1.22418 -79.513643  vegetation stubble
1090  -10.55118 -83.239379  vegetation stubble
1091  -17.44796 -68.675066  vegetation stubble
1092  -19.87391 -66.567973  vegetation stubble
1093   -9.14718 -81.126096  vegetation stubble
1094  -18.24319 -67.550535  vegetation stubble
1095  -12.29367 -61.008889  vegetation stubble
1096   -7.11447 -75.191063  vegetation stubble
1097  -11.02919 -62.835350  vegetation stubble
1098   -8.86059 -59.059603         cotton crop
1099  -23.53310 -47.400243         cotton crop
1100  -49.61330 -24.502231         cotton crop
1101  -70.61694  -9.829526         cotton crop
1102  -55.19992 -23.649599         cotton crop
1103   -2.86340 -60.996099  vegetation stubble
1104    4.27998 -51.239520  vegetation stubble
1105   40.26638  43.887236           grey soil
1106   41.99991  50.976322      damp grey soil
1107   32.27060  18.058914      damp grey soil
1108   23.28312  -5.738338      damp grey soil
1109   20.55663  -4.489827      damp grey soil
1110   19.60758  -3.131534      damp grey soil
1111   19.90468  -1.116001      damp grey soil
1112   24.49397   1.217271      damp grey soil
1113   24.00089  -7.237817      damp grey soil
1114   18.53360 -16.194563      damp grey soil
1115   17.25331 -14.385160      damp grey soil
1116   15.32001  -8.916474      damp grey soil
1117  -27.19672   3.905870         cotton crop
1118  -86.21489  34.517826         cotton crop
1119 -110.54348  48.547302         cotton crop
1120 -109.58562  47.193421         cotton crop
1121 -107.69245  46.305601         cotton crop
1122 -106.07062  47.038937         cotton crop
1123 -107.44155  48.834782         cotton crop
1124 -109.47563  44.878607         cotton crop
1125 -108.56648  39.870392         cotton crop
1126 -101.21193  34.284281         cotton crop
1127  -92.61455  21.833791         cotton crop
1128  -91.86347  17.262731         cotton crop
1129  -86.07739  15.096710         cotton crop
1130  -72.79782   6.001910         cotton crop
1131  -95.15253  30.253184         cotton crop
1132 -103.33466  36.285023         cotton crop
1133  -78.72082   3.762092         cotton crop
1134  -66.68939  -2.151266         cotton crop
1135  -24.75337 -12.829289 very damp grey soil
1136   13.52367 -41.797646 very damp grey soil
1137   12.42523 -32.183929 very damp grey soil
1138   33.51651  26.581162           grey soil
1139   41.98097  50.918541           grey soil
1140   49.29144  56.860682           grey soil
1141   48.28397  51.531799           grey soil
1142   38.71243  45.071665 very damp grey soil
1143   36.83017  35.590663 very damp grey soil
1144   35.26672  25.652016 very damp grey soil
1145   31.35940  18.945475 very damp grey soil
1146   27.01240   0.369207 very damp grey soil
1147   16.27412 -31.611193 very damp grey soil
1148   17.13392 -31.267151 very damp grey soil
1149   15.79722 -23.979488 very damp grey soil
1150    1.12382 -73.386641  vegetation stubble
1151   -4.25157 -90.424864  vegetation stubble
1152   -3.73325 -85.826354  vegetation stubble
1153   -3.76355 -75.067937  vegetation stubble
1154   -5.63627 -68.212366  vegetation stubble
1155  -20.11505 -54.695572  vegetation stubble
1156  -23.88164 -63.227662  vegetation stubble
1157  -15.34131 -69.340933  vegetation stubble
1158  -14.93332 -64.286505  vegetation stubble
1159  -13.50820 -79.608607  vegetation stubble
1160   -9.62730 -74.319791  vegetation stubble
1161  -69.68906  -5.244446         cotton crop
1162  -92.98727  12.375816         cotton crop
1163  -95.20231   7.064036         cotton crop
1164  -79.75047 -10.484474         cotton crop
1165  -19.49585 -65.059034  vegetation stubble
1166  -15.74131 -60.873528  vegetation stubble
1167  -11.59027 -51.121299  vegetation stubble
1168   28.13245  15.010475      damp grey soil
1169   20.57345  -4.482227      damp grey soil
1170   20.57463  -6.952517      damp grey soil
1171   23.57429   0.641714      damp grey soil
1172   26.61904   8.258580      damp grey soil
1173   31.29238   8.391116      damp grey soil
1174   28.88153   5.843530      damp grey soil
1175   24.84715   3.751716      damp grey soil
1176   18.48545  -6.201237      damp grey soil
1177   18.02677 -15.114486      damp grey soil
1178   18.30688 -12.498720      damp grey soil
1179   25.24913  -2.210590      damp grey soil
1180    6.44712  -4.804292         cotton crop
1181  -52.78211  13.309207         cotton crop
1182 -111.95157  48.660837         cotton crop
1183 -107.89035  43.231062         cotton crop
1184 -107.27845  36.800172         cotton crop
1185  -89.09060  20.377838         cotton crop
1186  -86.74786  21.509993         cotton crop
1187  -89.96026  26.317793         cotton crop
1188  -87.04546  25.263012         cotton crop
1189  -82.94261  22.711641         cotton crop
1190 -103.99316  33.658576         cotton crop
1191  -90.71976  17.355744         cotton crop
1192  -76.61451   1.754247         cotton crop
1193  -33.46741 -15.043652 very damp grey soil
1194  -11.11041 -22.319585 very damp grey soil
1195    5.14516 -30.056473 very damp grey soil
1196    9.40267 -52.867171 very damp grey soil
1197    6.92264 -55.859473 very damp grey soil
1198   11.00598 -52.143529 very damp grey soil
1199   12.67670 -36.779640 very damp grey soil
1200   23.44505   6.919635 very damp grey soil
1201   35.66517  36.455189           grey soil
1202   38.54656  37.629261 very damp grey soil
1203   31.58611  12.815391 very damp grey soil
1204   32.27944   9.168208 very damp grey soil
1205   25.68693  -4.493884 very damp grey soil
1206   13.53726 -31.654095 very damp grey soil
1207    9.78746 -29.463485 very damp grey soil
1208    5.99005 -52.021479 very damp grey soil
1209   -0.93418 -61.571109  vegetation stubble
1210  -28.05625 -66.102720  vegetation stubble
1211  -22.92502 -69.892703  vegetation stubble
1212  -17.45227 -71.133328  vegetation stubble
1213  -19.34107 -75.997185  vegetation stubble
1214  -17.07663 -67.194060  vegetation stubble
1215  -14.84236 -76.824246  vegetation stubble
1216  -38.03215 -40.601601  vegetation stubble
1217  -73.74893   3.251112         cotton crop
1218 -103.39297  30.697372         cotton crop
1219 -103.85508  25.837020         cotton crop
1220  -78.76556  -3.140653         cotton crop
1221  -38.02048 -53.376264         cotton crop
1222  -21.93014 -69.622637  vegetation stubble
1223  -16.82175 -54.001200  vegetation stubble
1224   31.70591   5.919015      damp grey soil
1225   29.30315  -1.506475      damp grey soil
1226   26.10366   1.317296      damp grey soil
1227   28.29975   2.310276      damp grey soil
1228   28.26573   2.301490      damp grey soil
1229   32.57378   8.709187      damp grey soil
1230   30.06643   9.555561      damp grey soil
1231   27.01947   4.119679      damp grey soil
1232   27.93783   2.472917      damp grey soil
1233   31.67459   4.260486      damp grey soil
1234   25.47350  -2.502591      damp grey soil
1235  -10.74433  -2.782235           grey soil
1236 -107.98309  43.102088         cotton crop
1237  -98.44376  30.578834         cotton crop
1238  -95.03409  19.934211         cotton crop
1239  -91.45054  21.696236         cotton crop
1240  -92.18449  20.787700         cotton crop
1241  -75.48059   8.984385         cotton crop
1242  -72.92323   7.790100         cotton crop
1243  -51.82004 -13.589194         cotton crop
1244   11.21608 -47.455893 very damp grey soil
1245   13.26470 -55.762998 very damp grey soil
1246   13.29460 -51.386260 very damp grey soil
1247   13.40066 -49.926661 very damp grey soil
1248   13.68997 -43.949444 very damp grey soil
1249   13.01015 -37.829601 very damp grey soil
1250   27.59647   4.298201 very damp grey soil
1251   26.32575   7.773276 very damp grey soil
1252   31.70591   5.919015 very damp grey soil
1253   24.40329 -14.199789 very damp grey soil
1254   15.08679 -28.864211 very damp grey soil
1255   10.75836 -30.820902 very damp grey soil
1256    8.59238 -31.799812 very damp grey soil
1257   11.09972 -32.646187 very damp grey soil
1258   14.50803 -31.017362 very damp grey soil
1259   18.13689 -22.964371 very damp grey soil
1260   16.50504 -18.995397 very damp grey soil
1261    9.32178 -17.947159 very damp grey soil
1262   -3.12172 -25.710761 very damp grey soil
1263  -16.00157 -51.275284  vegetation stubble
1264  -22.66766 -49.999771  vegetation stubble
1265  -27.70925 -55.336582  vegetation stubble
1266  -20.86547 -70.813207  vegetation stubble
1267  -18.83324 -64.873100  vegetation stubble
1268  -18.95728 -73.188647  vegetation stubble
1269  -23.02910 -65.846348  vegetation stubble
1270  -29.34306 -48.722004  vegetation stubble
1271  -50.51440 -18.138627  vegetation stubble
1272  -92.09053  26.577235         cotton crop
1273 -117.87475  47.440066         cotton crop
1274 -109.36283  27.843561         cotton crop
1275 -100.67832  19.127092         cotton crop
1276  -64.78099 -20.297588         cotton crop
1277  -35.16836 -58.374859         cotton crop
1278  -26.91385 -65.379010  vegetation stubble
1279  -19.22325 -57.280029  vegetation stubble
1280   28.08770   5.236565           grey soil
1281   26.32858   2.643082      damp grey soil
1282   30.25259   6.198566      damp grey soil
1283   29.90879   8.039631      damp grey soil
1284   26.77334   8.686285      damp grey soil
1285   24.14232   3.364423      damp grey soil
1286   22.38943  -1.678176      damp grey soil
1287   21.99452   3.954071           grey soil
1288   27.34845  13.023139           grey soil
1289   23.22628   3.367856           grey soil
1290  -10.46616  -3.683951         cotton crop
1291  -66.63342  13.215989         cotton crop
1292  -94.97314  23.804245         cotton crop
1293  -95.73677  21.027660         cotton crop
1294  -93.49598  17.839849         cotton crop
1295  -91.93138  21.085636         cotton crop
1296  -93.94074  21.959686         cotton crop
1297  -95.86456  24.175016         cotton crop
1298  -99.71504  26.620929         cotton crop
1299  -98.27880  29.672788         cotton crop
1300  -74.50871  16.422380 very damp grey soil
1301  -37.82747 -16.436573 very damp grey soil
1302  -15.95333 -34.189686 very damp grey soil
1303   -1.41810 -40.489636 very damp grey soil
1304    8.30899 -46.549994 very damp grey soil
1305    7.43597 -54.843032 very damp grey soil
1306    5.23904 -63.781342 very damp grey soil
1307    7.40149 -62.803561 very damp grey soil
1308    7.06013 -60.978276 very damp grey soil
1309   10.12246 -51.247401 very damp grey soil
1310   16.58708 -38.021839 very damp grey soil
1311   15.68085 -38.358048 very damp grey soil
1312   16.00356 -19.958838 very damp grey soil
1313   20.88000  -6.315241 very damp grey soil
1314   22.17653  -5.661569 very damp grey soil
1315   26.00239   4.465661 very damp grey soil
1316   20.22075  -0.206841 very damp grey soil
1317   16.86269 -29.719210 very damp grey soil
1318   14.30955 -31.019810 very damp grey soil
1319   15.25491 -28.533527 very damp grey soil
1320   10.07346 -37.123725 very damp grey soil
1321   15.43791 -19.644686 very damp grey soil
1322   16.71661 -18.989156 very damp grey soil
1323   15.44104 -19.648914 very damp grey soil
1324    6.45627 -23.859057 very damp grey soil
1325   -9.09763 -35.552826  vegetation stubble
1326  -18.74559 -43.992660  vegetation stubble
1327  -16.17803 -48.981412  vegetation stubble
1328   -8.59362 -49.800452  vegetation stubble
1329  -26.89425 -52.182552  vegetation stubble
1330  -19.31868 -76.947330  vegetation stubble
1331  -19.38557 -68.422559  vegetation stubble
1332  -23.43682 -59.035323  vegetation stubble
1333  -26.33970 -49.756241  vegetation stubble
1334  -46.54543 -26.961142         cotton crop
1335  -83.32746  10.195548         cotton crop
1336 -114.03915  38.072579         cotton crop
1337 -107.48884  25.313906         cotton crop
1338  -82.46615   0.004234         cotton crop
1339  -45.08764 -43.097795  vegetation stubble
1340   39.89169  26.307598           grey soil
1341   34.83626  17.194882           grey soil
1342   31.44521  11.119280           grey soil
1343   29.95826   6.496173           grey soil
1344   29.40316   1.886692           grey soil
1345   29.04245   3.693790           grey soil
1346   25.81199  11.309265      damp grey soil
1347   24.01143   6.054096      damp grey soil
1348   24.37944   1.443438      damp grey soil
1349   23.68460   5.070577      damp grey soil
1350   27.48221   4.886330           grey soil
1351   25.79887   8.841963           grey soil
1352   31.92377  19.893043           grey soil
1353   33.02678  26.822828           grey soil
1354   23.62670   6.028541           grey soil
1355  -26.17139  -4.016260         cotton crop
1356  -72.96100   9.258154         cotton crop
1357  -83.86931  10.723517         cotton crop
1358  -81.34445  10.077517         cotton crop
1359 -102.44538  36.929581         cotton crop
1360  -99.49501  23.685611         cotton crop
1361  -15.26019 -32.216624 very damp grey soil
1362    7.73870 -58.205424 very damp grey soil
1363    8.34529 -61.728615 very damp grey soil
1364    7.43906 -62.064825 very damp grey soil
1365    9.55805 -60.762600 very damp grey soil
1366    9.41254 -38.552073 very damp grey soil
1367   14.67303 -31.662239 very damp grey soil
1368   18.75683 -33.678739 very damp grey soil
1369   21.29352 -30.478547 very damp grey soil
1370   23.46623 -20.769116 very damp grey soil
1371   27.51219  -6.765198 very damp grey soil
1372   29.40788  -0.582469 very damp grey soil
1373   19.75516 -10.736876 very damp grey soil
1374   23.45338 -10.481296 very damp grey soil
1375   20.59638 -21.575584 very damp grey soil
1376   17.49550 -31.856506 very damp grey soil
1377   14.31616 -34.862163 very damp grey soil
1378   13.03743 -33.034590 very damp grey soil
1379   15.86383 -23.851824 very damp grey soil
1380   16.24259  -8.745173 very damp grey soil
1381  -18.89956 -42.008505  vegetation stubble
1382  -16.94240 -45.565499  vegetation stubble
1383  -15.31792 -44.831317  vegetation stubble
1384  -16.93975 -45.564653  vegetation stubble
1385  -21.46636 -45.222768  vegetation stubble
1386  -25.37732 -52.893437  vegetation stubble
1387  -22.33788 -67.954191  vegetation stubble
1388  -18.90207 -74.161947  vegetation stubble
1389  -22.65455 -63.420379  vegetation stubble
1390  -27.36356 -55.403184  vegetation stubble
1391  -25.29609 -63.051975  vegetation stubble
1392  -25.77222 -51.099678         cotton crop
1393  -34.05007 -33.806537         cotton crop
1394  -61.84253  -6.352614         cotton crop
1395 -111.67044  39.211978         cotton crop
1396 -103.34048  21.871936         cotton crop
1397  -63.23127 -26.227652         cotton crop
1398  -40.80592 -53.373372         cotton crop
1399   44.98790  39.855816           grey soil
1400   40.17289  31.365875           grey soil
1401   34.67460  18.186268           grey soil
1402   30.23359   9.873545           grey soil
1403   26.25746   9.987291           grey soil
1404   24.21606   4.651057           grey soil
1405   24.56881   0.353512           grey soil
1406   23.61599   0.345974           grey soil
1407   22.30616   5.996343           grey soil
1408   25.63294   9.537729           grey soil
1409   33.43332  23.744045           grey soil
1410   35.55552  31.487524           grey soil
1411   38.22194  36.550680           grey soil
1412   44.36592  39.391812           grey soil
1413   42.20976  27.921133           grey soil
1414   15.19422  -1.178172           grey soil
1415  -72.51305  -2.718675         cotton crop
1416  -53.97854  -4.342905         cotton crop
1417  -69.84714   5.361374         cotton crop
1418  -97.66259  36.015149         cotton crop
1419  -85.31545  26.674826 very damp grey soil
1420  -60.14750   7.735733 very damp grey soil
1421   -3.20145 -42.652415 very damp grey soil
1422    9.68192 -58.766809 very damp grey soil
1423    6.89988 -65.904845 very damp grey soil
1424    6.32992 -62.227311 very damp grey soil
1425    5.07017 -62.870011 very damp grey soil
1426    6.88772 -60.068074 very damp grey soil
1427    6.56065 -58.245776 very damp grey soil
1428    5.25200 -55.065696 very damp grey soil
1429    6.11536 -48.439441 very damp grey soil
1430   14.82427 -44.360014 very damp grey soil
1431   17.87076 -39.088001 very damp grey soil
1432   16.29068 -35.431806 very damp grey soil
1433   12.25662 -39.358652 very damp grey soil
1434   13.19553 -27.702973 very damp grey soil
1435   17.35715 -16.932148 very damp grey soil
1436   25.06247 -11.096127 very damp grey soil
1437   21.36618 -22.532150 very damp grey soil
1438   19.19420 -25.977981 very damp grey soil
1439   18.94625 -24.612104 very damp grey soil
1440   12.14033 -29.312353 very damp grey soil
1441    6.94958 -31.672404  vegetation stubble
1442    8.41752 -32.545696  vegetation stubble
1443    9.04219 -28.386095  vegetation stubble
1444   11.74446 -19.194265 very damp grey soil
1445   16.40621 -23.445401 very damp grey soil
1446  -15.22760 -37.223363  vegetation stubble
1447  -26.92620 -40.896159  vegetation stubble
1448  -15.89105 -48.696742  vegetation stubble
1449  -14.06054 -45.426404  vegetation stubble
1450  -27.11654 -67.916715  vegetation stubble
1451  -23.28277 -68.526969  vegetation stubble
1452  -21.12032 -67.549188  vegetation stubble
1453  -21.19483 -63.403823  vegetation stubble
1454  -24.68794 -58.398113  vegetation stubble
1455  -27.54643 -53.278467         cotton crop
1456  -39.87304 -40.383012         cotton crop
1457  -63.92405 -12.920305         cotton crop
1458  -92.69321  11.403881         cotton crop
1459 -109.06894  34.954300         cotton crop
1460  -67.40978 -16.869566         cotton crop
1461  -56.53579 -35.690042         cotton crop
1462   41.66131  46.075010           grey soil
1463   42.96642  42.893802           grey soil
1464   39.54417  30.148190           grey soil
1465   32.96091  17.768247           grey soil
1466   32.41367  10.685376           grey soil
1467   33.31637  11.020458           grey soil
1468   30.43025  16.481606           grey soil
1469   27.91000  19.780196           grey soil
1470   32.23017  24.204920           grey soil
1471   37.81876  26.809667           grey soil
1472   44.15764  43.522518           grey soil
1473   47.76359  49.588978           grey soil
1474   35.14743  17.047082           grey soil
1475    1.22852 -11.693629           grey soil
1476  -27.36150 -13.607774         cotton crop
1477  -25.16226  -8.228587         cotton crop
1478   -8.39119 -11.629700         cotton crop
1479   -4.99848 -12.491435         cotton crop
1480  -27.08105  -7.391126         cotton crop
1481  -46.17552   1.666194 very damp grey soil
1482  -34.42632   2.429273 very damp grey soil
1483   -6.62830 -23.234391 very damp grey soil
1484    7.99373 -61.662756 very damp grey soil
1485    7.94913 -63.396887 very damp grey soil
1486    7.38243 -60.197047 very damp grey soil
1487    7.05385 -64.124385 very damp grey soil
1488    9.30839 -55.733167 very damp grey soil
1489   11.10104 -56.572586 very damp grey soil
1490   11.50378 -53.506610 very damp grey soil
1491   11.15575 -51.678226 very damp grey soil
1492   14.21347 -45.445958 very damp grey soil
1493   12.03673 -46.420753 very damp grey soil
1494   14.23949 -45.763187 very damp grey soil
1495   15.51063 -47.592747 very damp grey soil
1496   11.14951 -49.229110 very damp grey soil
1497    9.52584 -45.575506 very damp grey soil
1498   24.62561 -13.361698 very damp grey soil
1499   13.27915 -20.619351  vegetation stubble
1500    9.52635 -20.418664  vegetation stubble
1501    6.10375 -22.044502  vegetation stubble
1502   -2.25167 -27.457597  vegetation stubble
1503   -4.40184 -28.419448  vegetation stubble
1504   -0.97492 -29.268128  vegetation stubble
1505    6.77258 -25.686727  vegetation stubble
1506    9.85695 -22.239833  vegetation stubble
1507   13.42210 -31.345178 very damp grey soil
1508   -8.31983 -28.378770 very damp grey soil
1509  -25.34312 -36.279648  vegetation stubble
1510  -22.03765 -49.497260  vegetation stubble
1511  -16.38515 -47.301276  vegetation stubble
1512  -20.13918 -44.653798  vegetation stubble
1513  -34.80309 -52.888166  vegetation stubble
1514  -29.08709 -54.873557  vegetation stubble
1515  -20.70769 -51.113009         cotton crop
1516  -33.59963 -40.335358         cotton crop
1517  -57.97468 -27.735219         cotton crop
1518  -81.99120 -10.535721         cotton crop
1519  -67.90028  -8.616529         cotton crop
1520  -84.33851   9.636153         cotton crop
1521  -79.15673   1.014839         cotton crop
1522  -92.97886  10.053687         cotton crop
1523  -71.80050 -19.530631         cotton crop
1524   44.03858  54.564974           grey soil
1525   44.08008  52.106784           grey soil
1526   40.94675  41.359760           grey soil
1527   38.87139  36.152968           grey soil
1528   39.86906  41.448265           grey soil
1529   41.64400  44.058806           grey soil
1530   41.59674  37.372871           grey soil
1531   34.55470  24.230543           grey soil
1532   34.07320  30.684826           grey soil
1533   39.70391  31.583518           grey soil
1534   36.63089  39.319423           grey soil
1535   40.16239  45.467985           grey soil
1536   -2.63120 -17.495044 very damp grey soil
1537    9.99515 -42.354875 very damp grey soil
1538    7.58691 -53.768238 very damp grey soil
1539   11.07814 -54.432724 very damp grey soil
1540   12.01951 -60.193921 very damp grey soil
1541    7.60599 -61.978187 very damp grey soil
1542    7.96287 -59.413316 very damp grey soil
1543    7.62111 -57.593388 very damp grey soil
1544    7.28737 -55.767991 very damp grey soil
1545    8.18191 -55.211699 very damp grey soil
1546    8.24730 -61.798363 very damp grey soil
1547    8.55638 -55.393803 very damp grey soil
1548   11.02097 -52.134963 very damp grey soil
1549   12.64483 -57.150134 very damp grey soil
1550   10.42840 -56.434654 very damp grey soil
1551   11.33069 -52.109656 very damp grey soil
1552   11.75329 -57.483975 very damp grey soil
1553   12.95309 -55.133360 very damp grey soil
1554   12.26573 -51.500829 very damp grey soil
1555   14.96544 -44.058708 very damp grey soil
1556   17.56399 -29.864761 very damp grey soil
1557   19.11807  -9.568610 very damp grey soil
1558   12.05924 -13.312784  vegetation stubble
1559   -1.84051 -23.914891  vegetation stubble
1560   -6.21106 -26.018526  vegetation stubble
1561   -0.25196 -25.560519  vegetation stubble
1562    4.49942 -29.572220  vegetation stubble
1563   -2.19542 -22.390043  vegetation stubble
1564    1.00084 -20.855334  vegetation stubble
1565    7.03931 -32.737825 very damp grey soil
1566    7.56236 -28.136107 very damp grey soil
1567    3.80484 -23.613260 very damp grey soil
1568   -9.38895 -29.794585  vegetation stubble
1569  -21.68729 -35.633994  vegetation stubble
1570  -25.10968 -41.622499  vegetation stubble
1571  -13.78822 -40.647773  vegetation stubble
1572  -26.40357 -44.177850      damp grey soil
1573  -35.72055 -33.135503         cotton crop
1574  -66.43191 -12.425785         cotton crop
1575  -95.63251   4.893419         cotton crop
1576  -95.27592   3.088928         cotton crop
1577  -57.39156 -16.861734         cotton crop
1578  -66.09713 -10.349472         cotton crop
1579  -87.19383  -7.805025         cotton crop
1580  -88.12678  -8.274257         cotton crop
1581  -91.60172   1.301341         cotton crop
1582  -85.07298  -4.739731         cotton crop
1583   43.61985  54.706560           grey soil
1584   41.33347  48.733073           grey soil
1585   41.33004  51.207872           grey soil
1586   39.88231  50.626935           grey soil
1587   41.12955  36.250217           grey soil
1588   39.30360  30.364816           grey soil
1589   38.60162  38.188261           grey soil
1590   41.58370  44.067682           grey soil
1591   41.60157  44.063948           grey soil
1592   45.86813  33.601561           grey soil
1593   46.78299  36.068417           grey soil
1594   41.43296  38.526630           grey soil
1595   36.58719  41.637412           grey soil
1596    0.90998 -24.723518 very damp grey soil
1597   13.63326 -60.043485 very damp grey soil
1598   12.45114 -53.664166 very damp grey soil
1599    8.04508 -62.642876 very damp grey soil
1600    9.30483 -62.000176 very damp grey soil
1601   12.95776 -56.398160 very damp grey soil
1602   12.70981 -55.032283 very damp grey soil
1603   10.79532 -57.375941 very damp grey soil
1604   11.12592 -59.197110 very damp grey soil
1605    9.51150 -55.567667 very damp grey soil
1606   10.75791 -54.586452 very damp grey soil
1607   12.36879 -58.217024 very damp grey soil
1608   10.74361 -54.583465 very damp grey soil
1609   11.66963 -52.115368 very damp grey soil
1610   11.52869 -43.842699 very damp grey soil
1611   18.48533 -24.787399 very damp grey soil
1612   22.73606 -12.554833 very damp grey soil
1613   26.15769  -3.118510 very damp grey soil
1614   -5.43380 -15.959616 very damp grey soil
1615  -10.13912 -20.139565 very damp grey soil
1616  -10.72024 -24.431818  vegetation stubble
1617   -8.52823 -23.770137  vegetation stubble
1618   -3.47613 -28.252375  vegetation stubble
1619    5.10670 -39.379512  vegetation stubble
1620    2.93309 -40.358534  vegetation stubble
1621    4.79642 -35.647779  vegetation stubble
1622    8.20049 -29.652341 very damp grey soil
1623    0.88631 -22.267187      damp grey soil
1624  -17.93605 -43.668624  vegetation stubble
1625   -2.33779 -45.884830      damp grey soil
1626  -15.83334 -18.251207      damp grey soil
1627  -55.34606  -9.410923      damp grey soil
1628  -79.34313  -6.516960         cotton crop
1629  -79.19400  -2.145623         cotton crop
1630  -87.72726   4.163881         cotton crop
1631  -92.51073   1.864286         cotton crop
1632  -75.69045  -9.292247         cotton crop
1633  -77.73335 -17.470341         cotton crop
1634  -80.43770 -18.698206         cotton crop
1635  -80.59016 -10.103309         cotton crop
1636  -86.01879  -2.901933         cotton crop
1637   45.75338  52.367797           grey soil
1638   47.23479  52.962058           grey soil
1639   45.74552  54.841186           grey soil
1640   44.92917  49.446312           grey soil
1641   48.20512  56.107885           grey soil
1642   47.03808  50.559804           grey soil
1643   44.48006  45.052486           grey soil
1644   46.25491  39.129718           grey soil
1645   35.23358  38.895421           grey soil
1646   37.23106  37.422475           grey soil
1647   45.70694  45.690354           grey soil
1648   44.30693  51.792498           grey soil
1649   41.88176  48.824061           grey soil
1650   41.08211  41.729683           grey soil
1651   40.34355  36.085591 very damp grey soil
1652   36.77713  28.237109 very damp grey soil
1653    9.82443 -47.414555 very damp grey soil
1654    8.89197 -58.179326 very damp grey soil
1655    7.33310 -62.349381 very damp grey soil
1656    8.96390 -58.632378 very damp grey soil
1657    7.10506 -53.635929 very damp grey soil
1658   10.76659 -47.543425 very damp grey soil
1659    8.89197 -58.179326 very damp grey soil
1660   12.05630 -48.885556 very damp grey soil
1661   13.87385 -46.083619 very damp grey soil
1662   13.26819 -50.240779 very damp grey soil
1663   10.52058 -55.843988 very damp grey soil
1664   10.53130 -55.846228 very damp grey soil
1665   11.12415 -59.036261 very damp grey soil
1666   11.10985 -59.033274 very damp grey soil
1667   10.75872 -54.760002 very damp grey soil
1668   11.04999 -48.759259 very damp grey soil
1669   13.12932 -36.158054 very damp grey soil
1670   13.67790 -27.693572 very damp grey soil
1671   14.58254 -24.892429 very damp grey soil
1672   17.44186 -27.893019 very damp grey soil
1673   20.48787 -21.992163 very damp grey soil
1674   19.09923  -9.106207 very damp grey soil
1675   10.04717 -13.346748 very damp grey soil
1676   -0.38443 -27.106392  vegetation stubble
1677    1.54477 -32.574062  vegetation stubble
1678    1.00397 -37.186531  vegetation stubble
1679    2.59905 -40.834161  vegetation stubble
1680    2.23278 -44.503232  vegetation stubble
1681    3.48121 -38.046977 very damp grey soil
1682    3.69292 -31.593294 very damp grey soil
1683    5.17050 -24.516844      damp grey soil
1684   -4.80093 -24.303748      damp grey soil
1685   -5.14209 -43.785549      damp grey soil
1686    1.74172 -46.846150      damp grey soil
1687    9.16311 -43.426665      damp grey soil
1688   11.14590 -30.361825      damp grey soil
1689   11.87707 -13.013859      damp grey soil
1690  -63.99959   1.354595         cotton crop
1691  -87.91896   0.958543         cotton crop
1692  -85.87534   1.947081         cotton crop
1693  -98.76258   8.990174         cotton crop
1694  -80.82096  -3.658281         cotton crop
1695  -63.06783 -21.436257         cotton crop
1696  -72.25388 -17.578574         cotton crop
1697  -82.25326 -13.642436         cotton crop
1698  -83.21153 -14.144691         cotton crop
1699   43.46768  41.510906           grey soil
1700   46.84937  52.332964           grey soil
1701   44.14631  51.110738           grey soil
1702   41.89834  42.681413           grey soil
1703   38.86886  41.236574           grey soil
1704   44.55514  48.832866           grey soil
1705   47.30416  47.596438           grey soil
1706   36.57172  22.244696 very damp grey soil
1707   29.62294  10.786503 very damp grey soil
1708   23.78726  -8.454791 very damp grey soil
1709   19.79345 -30.977294 very damp grey soil
1710   10.98943 -61.459245 very damp grey soil
1711    6.82646 -61.008555 very damp grey soil
1712    4.03375 -56.006814 very damp grey soil
1713    6.19974 -55.027905 very damp grey soil
1714    8.73329 -51.823484 very damp grey soil
1715    9.70896 -47.719704 very damp grey soil
1716   13.86126 -46.092257 very damp grey soil
1717   16.24832 -37.441756 very damp grey soil
1718   11.28265 -43.220591 very damp grey soil
1719   15.93469 -39.045991 very damp grey soil
1720   13.43908 -37.630049 very damp grey soil
1721    9.59060 -56.385016 very damp grey soil
1722    7.05126 -59.586054 very damp grey soil
1723    7.03696 -59.583067 very damp grey soil
1724   10.78705 -54.046801 very damp grey soil
1725   14.86525 -47.864832 very damp grey soil
1726   15.87503 -30.692108 very damp grey soil
1727   16.16382 -32.046154 very damp grey soil
1728   13.70561 -41.471555 very damp grey soil
1729   12.19386 -41.081552 very damp grey soil
1730   20.35814 -30.493300 very damp grey soil
1731   20.96857 -16.214499 very damp grey soil
1732   24.01206   3.253636 very damp grey soil
1733    3.93731 -11.644316 very damp grey soil
1734   -0.39113 -13.601007  vegetation stubble
1735   -2.27477 -18.404364  vegetation stubble
1736   -2.02210 -22.239402  vegetation stubble
1737   -5.80418 -31.823082  vegetation stubble
1738   -5.40739 -37.801281  vegetation stubble
1739   -4.14645 -39.628870  vegetation stubble
1740   -0.72720 -33.636137 very damp grey soil
1741    3.63614 -25.162759      damp grey soil
1742    7.93351 -19.385147      damp grey soil
1743   10.51430 -14.934939      damp grey soil
1744   15.30990 -11.210170      damp grey soil
1745   15.63297 -18.636187      damp grey soil
1746   12.21297 -36.147330      damp grey soil
1747    7.19873 -48.791108      damp grey soil
1748    8.87060 -14.597783      damp grey soil
1749  -26.72515   0.914018         cotton crop
1750  -72.20987   3.594963         cotton crop
1751  -91.15897  -1.100204         cotton crop
1752  -89.49662   3.680940         cotton crop
1753  -93.91331   6.202772         cotton crop
1754  -94.90129  12.770909         cotton crop
1755  -91.94857  -1.766282         cotton crop
1756   49.69189  48.800559           grey soil
1757   42.20344  52.069090           grey soil
1758   43.57938  48.417921           grey soil
1759   41.31678  42.464030           grey soil
1760   39.15109  39.014549           grey soil
1761   40.29770  40.060667      damp grey soil
1762   43.13753  37.047172      damp grey soil
1763   40.15236  33.817978      damp grey soil
1764   26.68041   4.018899 very damp grey soil
1765   22.28718 -12.586742 very damp grey soil
1766   16.07783 -37.807488 very damp grey soil
1767    9.82303 -67.233020 very damp grey soil
1768    7.27002 -64.681719 very damp grey soil
1769    4.37178 -59.712187 very damp grey soil
1770    5.26386 -55.052903 very damp grey soil
1771    8.34400 -51.618690 very damp grey soil
1772    9.56123 -49.275290 very damp grey soil
1773    9.88870 -51.092231 very damp grey soil
1774   13.52110 -43.038112 very damp grey soil
1775   11.38876 -44.001823 very damp grey soil
1776   12.35683 -47.832264 very damp grey soil
1777   11.41582 -50.308927 very damp grey soil
1778   13.87827 -42.993340 very damp grey soil
1779   13.33227 -49.472480 very damp grey soil
1780    9.86817 -48.640128 very damp grey soil
1781   12.85309 -37.066209 very damp grey soil
1782   13.81204 -33.349337 very damp grey soil
1783   17.28863 -33.416761 very damp grey soil
1784   16.60345 -17.480164 very damp grey soil
1785   25.26351  -7.125528 very damp grey soil
1786   24.31516  -5.755682 very damp grey soil
1787   28.52750   0.246981 very damp grey soil
1788   19.70343  -7.249051 very damp grey soil
1789   11.53908 -11.163076 very damp grey soil
1790   11.12915 -19.661369      damp grey soil
1791   13.12763 -10.955705      damp grey soil
1792   14.62887  -6.335586      damp grey soil
1793   11.07815 -38.477788      damp grey soil
1794    9.47886 -42.656537      damp grey soil
1795   10.06297 -40.367414      damp grey soil
1796    6.33186 -34.446788      damp grey soil
1797    9.29068 -25.422154      damp grey soil
1798    3.40353  -4.678319      damp grey soil
1799  -37.86609   7.553427         cotton crop
1800  -77.08129   5.915117         cotton crop
1801  -93.09481   3.000331         cotton crop
1802  -97.04539  11.637996         cotton crop
1803 -103.22674  13.628868         cotton crop
1804  -87.50484  12.562197         cotton crop
1805  -97.58609   9.780039         cotton crop
1806  -85.53022  -6.724561         cotton crop
1807   37.71694  40.512439           grey soil
1808   51.80781  58.150310           grey soil
1809   50.36922  55.101623           grey soil
1810   45.97400  55.511252           grey soil
1811   41.98695  42.260676           grey soil
1812   36.80964  38.042766           grey soil
1813   34.43748  32.528799      damp grey soil
1814   34.47696  30.089526      damp grey soil
1815   32.19728  19.733990      damp grey soil
1816   32.15804  19.738454      damp grey soil
1817   36.20094  21.057378      damp grey soil
1818   36.96381  14.487599      damp grey soil
1819   34.27463   7.529659      damp grey soil
1820   25.04968 -17.632790 very damp grey soil
1821    6.70630 -62.301075 very damp grey soil
1822    8.07211 -60.198776 very damp grey soil
1823    8.07805 -55.128220 very damp grey soil
1824   13.66310 -52.524601 very damp grey soil
1825   13.66976 -52.527700 very damp grey soil
1826    8.96374 -52.339908 very damp grey soil
1827    6.00337 -41.398640 very damp grey soil
1828    8.28824 -48.694582 very damp grey soil
1829    9.56067 -48.030596 very damp grey soil
1830   11.71633 -44.933870 very damp grey soil
1831   18.34858 -50.260291 very damp grey soil
1832   11.69968 -47.069985 very damp grey soil
1833    7.75098 -53.305923 very damp grey soil
1834    9.33466 -54.481292 very damp grey soil
1835   11.50378 -53.506610 very damp grey soil
1836   11.35769 -42.776556 very damp grey soil
1837   17.49312 -33.094294 very damp grey soil
1838   18.74974 -32.447366 very damp grey soil
1839   19.07086 -11.583223 very damp grey soil
1840   17.47932  -7.934465 very damp grey soil
1841   29.96186   1.738125 very damp grey soil
1842   29.05917   1.403044 very damp grey soil
1843   26.89318   0.424134 very damp grey soil
1844   14.35950  -9.678403      damp grey soil
1845   12.93521 -18.459668      damp grey soil
1846   14.52675 -22.108426      damp grey soil
1847   13.99301 -26.718638      damp grey soil
1848   10.42245 -38.939408      damp grey soil
1849    8.71745 -34.989241      damp grey soil
1850   12.50817 -12.822575      damp grey soil
1851   -6.82674   3.763506         cotton crop
1852  -52.09081   5.107325         cotton crop
1853  -80.10072  -3.366993         cotton crop
1854  -84.64355   2.713776         cotton crop
1855 -102.31083  15.649587         cotton crop
1856  -99.52055  12.052051         cotton crop
1857  -82.41028   0.020751         cotton crop
1858  -66.24195  -4.145152      damp grey soil
1859  -33.70312 -17.253967      damp grey soil
1860   38.35997  44.986174           grey soil
1861   44.03858  54.564974           grey soil
1862   47.13372  58.007753           grey soil
1863   47.13372  58.007753           grey soil
1864   44.97127  57.029971           grey soil
1865   34.96898  43.439403           grey soil
1866   39.35183  40.537916      damp grey soil
1867   39.35419  40.560118      damp grey soil
1868   32.78716  17.620514      damp grey soil
1869   30.62590  14.172444      damp grey soil
1870   35.21813  29.923671      damp grey soil
1871   34.74342  27.312622      damp grey soil
1872   33.41677  18.084631      damp grey soil
1873   18.79734 -21.242531 very damp grey soil
1874   14.36879 -44.475368 very damp grey soil
1875    8.51482 -61.424882 very damp grey soil
1876   11.37147 -62.157588 very damp grey soil
1877   15.72725 -56.169301 very damp grey soil
1878   13.79041 -50.701743 very damp grey soil
1879   11.23985 -48.166222 very damp grey soil
1880   10.29149 -46.796377 very damp grey soil
1881    9.35611 -46.811130 very damp grey soil
1882   11.57445 -47.501209 very damp grey soil
1883   14.10111 -48.700750 very damp grey soil
1884   13.48336 -49.152073 very damp grey soil
1885   11.55124 -46.153676 very damp grey soil
1886   14.46724 -52.965457 very damp grey soil
1887    5.64570 -58.416965 very damp grey soil
1888    9.51903 -56.766635 very damp grey soil
1889   10.06076 -50.777911 very damp grey soil
1890   10.59843 -46.161215 very damp grey soil
1891   13.70584 -42.702506 very damp grey soil
1892   13.34866 -40.894280 very damp grey soil
1893   12.34762 -34.938426 very damp grey soil
1894   17.63516 -32.502697 very damp grey soil
1895   18.60468 -33.528831 very damp grey soil
1896   18.26168 -31.691043 very damp grey soil
1897   17.56065 -28.357332 very damp grey soil
1898   19.64653 -20.460956 very damp grey soil
1899   22.24764  -8.586278 very damp grey soil
1900   22.74062  -5.973607 very damp grey soil
1901   21.93531  -6.763486 very damp grey soil
1902   19.21942 -12.003669      damp grey soil
1903   18.23351 -29.393900      damp grey soil
1904  -60.82377   2.145541         cotton crop
1905  -80.76100  -6.696452         cotton crop
1906  -81.92868  -4.893161         cotton crop
1907  -87.05809   5.118661         cotton crop
1908 -105.48696  18.494279         cotton crop
1909  -99.52718  12.195255         cotton crop
1910  -77.37428  -1.351702         cotton crop
1911  -35.64322 -16.205890         cotton crop
1912   47.56951  54.106060           grey soil
1913   43.18400  59.455916           grey soil
1914   42.58537  51.849162           grey soil
1915   39.66199  30.201047      damp grey soil
1916   35.38115  21.338148      damp grey soil
1917   28.09670  11.020375      damp grey soil
1918   30.21953  12.009034      damp grey soil
1919   38.40209  27.559445      damp grey soil
1920   35.20550  32.384303      damp grey soil
1921   35.54727  30.564375      damp grey soil
1922   34.89270  19.060258 very damp grey soil
1923   21.61294 -22.413946 very damp grey soil
1924   16.19507 -49.014790 very damp grey soil
1925    9.86263 -59.840939 very damp grey soil
1926   12.69909 -55.030043 very damp grey soil
1927   10.26847 -49.937666 very damp grey soil
1928   13.15271 -48.560784 very damp grey soil
1929   11.53087 -49.294120 very damp grey soil
1930   11.78689 -50.663083 very damp grey soil
1931   17.72556 -47.971098 very damp grey soil
1932   18.74129 -45.956036 very damp grey soil
1933   17.48663 -44.469218 very damp grey soil
1934   11.45894 -48.841068 very damp grey soil
1935   10.77509 -52.671660 very damp grey soil
1936   15.93756 -51.089135 very damp grey soil
1937   14.92450 -57.488980 very damp grey soil
1938   15.25441 -54.942408 very damp grey soil
1939   10.78088 -52.675042 very damp grey soil
1940   10.41301 -52.762296 very damp grey soil
1941    9.44087 -45.289536 very damp grey soil
1942   11.05583 -35.663445 very damp grey soil
1943   14.85176 -33.926044 very damp grey soil
1944   16.10175 -34.387951 very damp grey soil
1945   16.10175 -34.387951 very damp grey soil
1946   15.08326 -28.865340 very damp grey soil
1947   18.16096 -25.415346 very damp grey soil
1948   15.32238 -19.947342      damp grey soil
1949    8.59002 -33.938915      damp grey soil
1950    7.30930 -34.575528      damp grey soil
1951   14.03447 -18.470366      damp grey soil
1952    9.26298  -8.027588      damp grey soil
1953  -28.66372   1.980408         cotton crop
1954  -86.11079  -0.551386         cotton crop
1955  -95.14282   8.467794         cotton crop
1956 -103.28712  18.384387         cotton crop
1957  -90.97468  11.954785         cotton crop
1958  -47.14729 -10.035919         cotton crop
1959    1.25117 -26.526392      damp grey soil
1960   13.83017 -29.511139      damp grey soil
1961   47.19325  55.422123           grey soil
1962   46.78313  57.694356           grey soil
1963   46.79315  60.164011           grey soil
1964   46.63585  47.825875           grey soil
1965   37.70314  30.705206      damp grey soil
1966   39.66236  22.775678      damp grey soil
1967   38.03202  23.944474      damp grey soil
1968   34.08866  24.541323      damp grey soil
1969   36.03015  19.089582      damp grey soil
1970   30.62810  25.374803      damp grey soil
1971   33.88777  31.226557      damp grey soil
1972   37.86126  41.813515      damp grey soil
1973   39.17215  42.462669      damp grey soil
1974   34.99754  22.975853 very damp grey soil
1975   28.86887   0.724527 very damp grey soil
1976   22.93213 -17.024862 very damp grey soil
1977   19.26608 -25.094181 very damp grey soil
1978   16.98343 -38.791926 very damp grey soil
1979   12.09972 -57.176671 very damp grey soil
1980   12.97587 -48.887861 very damp grey soil
1981   17.27592 -42.005678 very damp grey soil
1982   14.79868 -41.145232 very damp grey soil
1983   12.98545 -46.421687 very damp grey soil
1984   10.08622 -43.427841 very damp grey soil
1985   11.94818 -40.614820 very damp grey soil
1986   13.54678 -44.261322 very damp grey soil
1987   11.72570 -47.064387 very damp grey soil
1988    8.95139 -50.348534 very damp grey soil
1989   10.43599 -45.722256 very damp grey soil
1990   13.88815 -46.086606 very damp grey soil
1991   14.75955 -43.295306 very damp grey soil
1992   12.62721 -44.259017 very damp grey soil
1993    9.23373 -54.172982 very damp grey soil
1994    8.50967 -53.565681 very damp grey soil
1995   12.62391 -52.559919 very damp grey soil
1996   10.43112 -45.251997 very damp grey soil
1997   10.99849 -40.626586 very damp grey soil
1998   13.50938 -41.471832 very damp grey soil
1999   14.75170 -40.821917 very damp grey soil
2000   15.68085 -38.358048 very damp grey soil
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
* Machine Learning in R Videos on PacktPub.com
  * [packtpub.com/all?search=Hoolihan](https://www.packtpub.com/all?search=Hoolihan)

========================================================
![Questions? Feedback?]

### Slides are at https://github.com/thoolihan/R-ML-Overview
