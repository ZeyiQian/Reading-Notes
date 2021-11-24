## Reading Notes on HeblichReddingSturm2020   
## Instructor
Prof. Junfu Zhang
## Student
Li Shen  
Zeyi Qian  

## Reading Paper 
### Paper Title
THE MAKING OF THE MODERN METROPOLIS: EVIDENCE FROM LONDON

### Authors Name
STEPHAN HEBLICH  
STEPHEN J. REDDING  
DANIEL M. STURM  


### Publishing Time
The Quarterly Journal of Economics (2020), 2059–2133.

### Description
Using newly constructed spatially disaggregated data for London from 1801 to 1921, 
we show that the invention of the steam railway led to the first large-scale separation of workplace and residence. 
We show that a class of quantitative urban models is remarkably successful in explaining this reorganization of economic activity. 
We structurally estimate one of the models in this class and find substantial agglomeration forces in both production and residence. 
In counterfactuals, we find that removing the whole railway network reduces the population and the value of land and buildings 
in London by up to 51.5% and 53.3% respectively, and decreases net commuting into the historical center of London by more than 300,000 workers.


## Reading Notes

### Ⅰ. INTROUCTION

#### 1. Motivation：Huge commuting flows   vs.   Little knowledge about it's role in sustaining dense concentrations of economic activity
*  Impose substantial real resource costs in terms of time spent commuting and the construction of large networks of complex transportation infrastructure
*  Create commercial and residential areas, with their distinctive characteristics for production and consumption


#### 2. Historical events：Steam railways created in the mid-19th century


#### 3. Evidence for the positive effect of residential separation on agglomeration
*  Data set for Greater London during 1801-1921
*  Quantitative urban model


#### 4.Contribution：
*  Empirical estimation
    + Agglomeration effect：change of the relationship between travel time and distance as IV
*  Theoretical models
    + First, it proves that the urban models established by this paper all have the same land and commuter market clearing conditions, so reliable results can be obtained in such models, and a series of factors that have not been observed to determine the spatial distribution of the economy can be controlled. 
    + Second, a new structural estimation method is developed for such urban models that uses bilateral commuter flows from the base year (1921) and performs a comparative static analysis from that base year. This paper shows that the estimation procedure can be used to recover unobserved historical employment and commuting data from bilateral commuting data in the base year as well as historical data on population and land rents. 
    + Thirdly, paper shows that the urban model can quantitatively explain the spatial restructuring of economic activities in Greater London with the invention of steam railways.


### Ⅱ. BACKGROUND

#### Three geographical definitions of boundaries: F.1(A)
*  Greater London as defined by the Modern boundaries of the Greater London Authority (GLA) ：99 boroughs and 283 parishes
*  Historic County of London：29 boroughs and 183 parishes
*  The city of London： 111 parishes

![image](https://user-images.githubusercontent.com/91390400/134824649-e984df97-9ec3-4353-8a74-6391cdf7f100.png)

#### BC 43:London has a long history of settlement
#### In the early 19th century
*  Walking: about 3 miles per hour
*  Equestrian: about 6 miles per hour
*  Steam passenger rail: 21 miles per hour (rail development in London was carried out competitively by private companies)
#### In the first half of the 19th century
*  Public goods were largely provided by local parishes and gatekeepers
#### 1841: F.1(B)
*  First census year, there are only a few railway lines and the line density in central London county is relatively low.
#### 1881: F.1(C)
*  London county is crisscrossed by a dense railway network that extends further into the heart of the county.
#### 1921: F.1(D)
*  Density of overground and underground railway lines is further increased.


### Ⅲ. DATA

#### Bilateral Commuting：complete matrix of bilateral commuting flows between boroughs in Greater London
*  Closed commuting market：commuting flows between other parts of England and Wales and Greater London were small in 1921
*  Workplace employment-employment by workplace for each borough: summing across rows in the matrix of bilateral commuting flows for Greater London (come to this place)
*  Residence employment-employment by residence for each borough: summing across columns in the matrix of bilateral commuting flows for Greater London (leave this place) 
*  Employment participation rate for each borough in 1921: dividing residence employment by population 


#### Population by Residence
*  Population censuses of England and Wales from 1801-1891 was provided by the Cambridge Group for the History of Population and Social Structure (Cambridge Group)
1801，1811，1821，1831，1841，1851，1861，1871，1891（no 1881）
*  Population data from 1901-1921 stem from the Integrated Census Microdata Project (I-CeM).
*  Assuming that the ratio of residence employment to population is stable for a given borough over time
*  Use the 1921 value of this ratio and the historical population data to construct residence employment for earlier census years

#### Rateable Values
*  Measure the value of floor space using rateable values, which correspond to the annual flow of rent for the use of land and buildings
*  Equal the price times the quantity of floor space in the model
*  These rateable values cover all categories of property (except Crown property occupied by the Crown,Places for divine worship,Concerns listed under No. III Schedule A)
*  Rateable values data: 1815,1843,1847,1852,1860,1881,1896,1905,1911,1921
*  To create consistent spatial units over time, match parishes with the spatial units provided by the CGKO (Cambridge Group Kain Oliver) map
*  use area weights to create the same mappable units as for the population data-parish-level panel for the years 1815, 1843, 1848, 1852, 1860, 1881 and 1896
*  aggregate these parish data to the 1921 boroughs using area weights

![image](https://user-images.githubusercontent.com/91390400/134824621-bd529c53-0021-400c-bbd5-fa4cbc3b4ae9.png)



#### Transport Network
*  GIS dataset on the transport network in Greater London over time using historical maps of the overground railway network, the underground railway network, and the omnibus and tram network, provided by the Cambridge Group for the History of Population and Social Structure, which based its digitization on Cobb (2003)
*  Measure bilateral travel times by distinguishing four transport networks based on the historical average travel speeds by transport mode in London reported in _London County Council (1907)_: 
    + (i) overgroundrailways (21 mph)
    + (ii) underground railways (15 mph)
    + (iii)omnibuses and trams (6 mph)
    + (iv) walking (3 mph)
*  Assumption 
    + workers follow the least-cost path in terms of travel time 
    + workers incur a travel time cost of 3 minutes when changing between modes of transport and can only connect to the railway network at railway stations
    + sets of points connected to each transport network at time $t$ ： 
    
    $$\tilde{s}_t^{OR}, \tilde{s}_t^{UR}, \tilde{s}_t^{OT}$$ 
    
    (OR, UR, and OT indicate overground railways, underground railways, and omnibuses and trams,)
     
    +  vector of assumed travel time weights for each transport network by
    
    $$\mathbf{δ} = [1 \\ δ^{UR} \\ δ^{OT}\\ δ^{WA}]$$
    
    ( normalize the weight for overground railways to 1, and the superscript WA indicates walking)
    
    +  the bilateral travel times between boroughs n and i at time t as 
     
      $$d^W_{nit} = d^W_{nit}(\tilde{s}_t^{OR}, \tilde{s}_t^{UR}, \tilde{s}_t^{OT}, \mathbf{δ})$$, 
      where the superscript W indicates the weighting by transport mode

    +  use an instrumental variable based on bilateral travel times in which walking is assumed to be the only mode of transport, so that bilateral travel times depend solely on straight-line distance.
    +  bilateral travel times in the absence of other modes of transport by $d^S_{ni}$, where the superscript S is a mnemonic for straight-line distance


#### Historical Employment by Workplace and Commuting Data
*  Compare model’s historical predictions for workplace employment in Greater London with data on the “day population” of the City of London that are available from the day censuses of 1866, 1881, 1891, and 1911
*  Compare model’s predictions for commuting distances with historical commuting data based on the residence addresses of the employees of Henry Poole bespoke tailors, which has been located at the same workplace address in Savile Row in the City of Westminster since 1822

#### Data for Other Cities
*  historical data on population, employment,and commuting distances for Berlin, Paris, Boston, Chicago, New York, and Philadelphia

![image](https://user-images.githubusercontent.com/91390400/134824606-3e5d912f-66f3-4c59-b51a-69d7367eec0c.png)


### IV. REDUCED-FORM EVIDENCE

#### IV.A. City Size and Structure over Time
![image](https://user-images.githubusercontent.com/91390400/134824579-e9e30484-5e46-4d04-a3d0-5c903f2b75d9.png)
 *  Population is expressed as an index relative to its value in 1801 (such that 1801 = 1). 
 *  City of London: sharp drop in 1851 (FⅡ.Left)
 *  Greater London: grew substantially (FⅡ.Right)
 
![image](https://user-images.githubusercontent.com/91390400/134824582-e669cadc-0390-44a1-979f-0fd5b550e703.png)
 *  City of London’s residential (or “night”) population: day population > night population (FⅢ.Left)
 *  Steep decline in its night population from 1851 onward coincides with a sharp rise in its day population (FⅢ.Left)
 *  As this expansion occurs, and undeveloped land becomes developed, the share of already-developed land in overall land values tends to fall (FⅢ.Right)
 *  In the years after 1851 when the City of London experiences the largest declines in its residential population, its rateable value share increases from 9% to 11%. (FⅢ.Right)
 

![image](https://user-images.githubusercontent.com/91390400/134828359-ba11f54e-72dd-4dd5-9c1d-4e464fdc7285.png)
 *  A sharp rise in public transport journeys per head of population from around 7 in 1834 under 400 in 1921


![image](https://user-images.githubusercontent.com/91390400/134824586-1ef8c36d-e0a9-493c-b6f7-f78be91358a3.png)
*   Following the construction of the first railway in 1836, a sharp reduction in the City of London’s population-weighted average travel times to other boroughs (FⅣ.Left)
*   Employment by Residence < Workplace (FⅣ.Right)



#### IV.B. Difference-in-Differences Event-Study Specification

##### baseline specification
DID：  

$$log R_{jt} = α_j+\sum_{τ=−60 }^{τ=60}β_τ(S_j × I_{jτ})  +  (μ_j × Year_t)+ d_t + u_{jt} \qquad(1)$$

DDD：

$$log R_{jt} = α_j+\sum_{τ=−60 }^{τ=60}β_τ(S_j × I_{jτ}) +\sum_{τ=−30 }^{τ=30}β_τ(S_j × I_{jτ}× I_j^{Center}) +  (μ_j × Year_t)+ d_t + u_{jt} \qquad(2)$$

![image](https://user-images.githubusercontent.com/91390400/134829147-16533f95-7509-433b-ac7b-120cedf2cda5.png)

##### Results
*   DID：For central London and outer areas, the absolute value of the coefficient increases for 60 years after the railway is built. One of the reasons may be that the value of the connection to the railway network increases over time as the railway network expands
*   DDD：Reduced travel times increase the population of the suburbs of Greater London and decrease the population of the central areas.
 
### V. Theoretical Framework
The authors develop a dynamic model, in which adjustment costs for investments in durable building capital introduce gradual adjustment in response to changes in the transport network. The authors introduce these investments in durable building capital following the standard approach to *intertemporal saving and investment decisions* in Obstfeld and Rogoff (1996). Time is discrete and is indexed by $t$.

>##### Locations
The authors consider a city (Greater London) that is embedded within a wider economy (Great Britain). The economy as a whole consists of a discrete set of locations ($M$). Greater London comprises a subset of these locations $N \in M$. 

Locations are allowed to differ from one another in terms of their attractiveness for production and residence, as determined by productivity, amenities, the supply of floor space, and transport connections, where each of these location characteristics can evolve over time.

>##### Workers
The economy consists of two types of infinitely-lived agents: workers and landlords. Workers are assumed not to have access to a saving or borrowing technology and are modeled as “hand to mouth,” as in Kaplan and Violante (2014). Workers simultaneously choose their preferred residence $n$ and workplace $i$ given their idiosyncratic draws. And each worker chooses a residence-workplace pair either in Greater London or in the rest of the economy. 

Denote an exogenous continuous measure of workers in Great Britain by $L_{Mt}$. 

Denote the endogenous measure of workers who choose a residence-workplace pair in Greater London by $L_{Nt}$.



#### **V.A. Preferences(worker)**
>##### The intertemporal preferences of worker $ω$ living in residence $n$ and working in workplace $i$ at time $t$ are additive separable and isoelastic:

$$U_{nit}(\omega)=\sum_{s=t}^{\infty } \rho ^{s-t}\frac{U_{nit}(\omega)^{1-\frac{1}{\zeta} }}{1-\frac{1}{\zeta} } \qquad(F1)$$
where, $\zeta >0$ is the intertemporal elasticity of substitution;<br>
$ \rho$ is the subjective rate of time discount;<br>
$U_{nit}(\omega)$ is the worker’s instantaneous utility function.

>##### The instantaneous utility for worker $ω$ residing in location n and working in location i is :(in Cobb-Douglas functional form)

$$ U_{ni}(\omega)= \frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}} \left (\frac{C_{ni}(\omega ) }{\alpha}  \right )^{\alpha }  \left ( \frac{H_{ni} (\omega )}{1-\alpha }  \right )^{1-\alpha }  \qquad(F2)$$

where,the authors suppress the time subscript from now on, except where important;   
$0<\alpha<1$;   
$B_{ni}$ captures amenities from the bilateral commute from residence n to workplace i that are common across all workers;   
$b_{ni}(\omega)$ is an idiosyncratic amenity draw that captures all the idiosyncratic factors that can cause an individual to live and work in particular locations in the city;   
$\kappa_{ni}$ is an iceberg commuting cost;  
$C_{ni}(\omega )$ is consumption of a single tradeable homogeneous final good;  
$H_{ni} (\omega )$ is consumption of residential floor space.



##### The utility maximization problem of workers is:
$$\max_{ C_{ni},H_{ni} }  U_{ni}(\omega)$$
$$subject \ to$$
$$P_nC_{ni}+Q_nH_{ni}= w_i $$ 
where,   
$P_n$ is the price index for consumption goods, which may include both tradeable and nontradeable consumption goods;   
$Q_n$ is the price of residential floor space;   
$w_i$ is the wage.   
*Note that without access to a savings or borrowing technology, workers choose their residence, workplace, consumption of the final and residential floor space use each period to maximize their instantaneous utility.*

Now, the Lagrange function is :
$$
\mathcal{L} = \frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}} \left (\frac{C_{ni}(\omega ) }{\alpha}  \right )^{\alpha }  \left ( \frac{H_{ni} (\omega )}{1-\alpha }  \right )^{1-\alpha } + \lambda (w_i - P_nC_{ni}-Q_nH_{ni})$$

First Order Conditions:
$$\frac{\partial L}{\partial C_{ni}}=\frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}} \alpha \left ( \frac{C_{ni}}{\alpha}  \right )^{\alpha -1} \frac{1}{\alpha }  \left ( \frac{H_{ni} (\omega )}{1-\alpha }  \right )^{1-\alpha }-\lambda P_n=0 $$

$$\frac{\partial L}{\partial H_{ni}}=\frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}}  \left ( \frac{C_{ni}}{\alpha}  \right )^{\alpha }(1-\alpha)  \left ( \frac{H_{ni} (\omega )}{1-\alpha }  \right )^{-\alpha } \frac{1}{1-\alpha }-\lambda Q_n=0 $$

$$\frac{\partial L}{\partial \lambda}=w_i - P_nC_{ni}-Q_nH_{ni}=0 \qquad(F2.1) $$

rearrange them to get:
$$\frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}}  \left ( \frac{C_{ni}}{\alpha}  \right )^{\alpha -1}  \left ( \frac{H_{ni} (\omega )}{1-\alpha }  \right )^{1-\alpha }=\lambda P_n \qquad(F2.2)$$

$$\frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}}  \left ( \frac{C_{ni}}{\alpha}  \right )^{\alpha } \left ( \frac{H_{ni} (\omega )}{1-\alpha }  \right )^{-\alpha } =\lambda Q_n \qquad(F2.3)$$

divided $(F2.2)$ by $(F2.3)$ to get:
$$\frac{C_{ni}^{\alpha -1}}{C_{ni}^\alpha } \frac{\alpha ^{1-\alpha }}{\alpha ^{-\alpha }} \frac{H_{ni}^{1-\alpha }}{H_{ni}^{-\alpha }}\frac{(1-\alpha) ^{\alpha-1 }}{(1-\alpha) ^{\alpha }} =\frac{P_n}{Q_n} $$
which can be simplified as:
$$\frac{\alpha }{(1-\alpha) }\frac{H_{ni}}{C_{ni}} =\frac{P_n}{Q_n} \qquad(F2.4)$$
$(F2.4)$ can be rewritten as:
$$H_{ni}=\frac{P_n}{Q_n}\frac{1-\alpha }{\alpha }C_{ni} \qquad(F2.5)$$

substituting $(F2.5)$ to $(F2.1)$ can get:

$$w_i - P_nC_{ni}-Q_n \left [ \frac{P_n}{Q_n}\frac{1-\alpha }{\alpha }C_{ni} \right ] =0 $$
rearrange them to get:
$$ C_{ni}= \frac{\alpha w_i }{P_n}\qquad(F2.6)$$

substituting $(F2.6)$ to $(F2.5)$ can get:
$$ H_{ni}= \frac{(1-\alpha) w_i }{Q_n} \qquad(F2.7)$$

Substituting $(F2.6)$ and $(F2.7)$ to $(F2)$ 
$$U_{ni}(\omega)= \frac{B_{ni}b_{ni}(\omega)}{k_{ni}} \left (\frac{\frac{\alpha w_i }{P_n} }{\alpha}  \right )^{\alpha }  \left ( \frac{\frac{(1-\alpha) w_i }{Q_n}}{1-\alpha }  \right )^{1-\alpha }$$

$$=\frac{B_{ni}b_{ni}(\omega)}{\kappa_{ni}}\frac{w_i^\alpha}{P_n^\alpha} \frac{w_i^{1-\alpha}}{Q_n^{1-\alpha}}$$
$$=\frac{B_{ni}b_{ni}(\omega)w_i}{\kappa_{ni}P_n^\alpha Q_n^{1-\alpha}} \qquad(3) $$
which is indirect utility for a worker $\omega$ residing in $n$ and working in $i$, and $0<\alpha<1$. 


>#### Distribution of Utility

##### Assume that idiosyncratic amenities $b_{ni}(\omega)$ are drawn from an independent extreme value (Fréchet) distribution for each residence-workplace pair and each worker:

$$ G(b)= e^{-b^{-\epsilon}} \qquad(4)$$
where, $\epsilon > 1$ is shape parameter, which controls the sensitivity of worker location decisions to economic variables;and the scale parameter is normalized to 1.

##### From the indirect utility function in equation (3), the utility($u$) also has Fréchet distribution. The *distribution of utility* for residence $n$ and workplace $i$ is:

$$ G_{ni}(u)=Pr[u_{ni}\le u ]$$
$$=Pr[\frac{B_{ni}b_{ni}(\omega)w_i}{\kappa_{ni}P_n^\alpha Q_n^{1-\alpha}}\le u]$$
$$=Pr[\frac{B_{ni}w_i}{\kappa_{ni}P_n^\alpha Q_n^{1-\alpha}} \frac{1}{u}  \le \frac{1}{b_{ni}(\omega)} ]$$
$$=Pr[\frac{\kappa_{ni}P_n^\alpha Q_n^{1-\alpha}}{B_{ni}w_i} u  \ge b_{ni}(\omega) ]$$
$$= e^{-\Psi_{ni}u^{-\epsilon }},$$
where $\Psi_{ni} = (B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}$ is the location paremeter; $n \in N, i \in N$.

##### Since the maximum of a sequence of Fréchet distributed random variables is itself Fréchet distributed, the distribution of utility across all residences $k$ and all workplaces $l$ is:

$$G(u)=Pr[max(u_{ni})\le u ]$$
$$= \prod_{k}\prod_{l}e^{-\Psi_{kl}u^{-\epsilon }}$$
$$= e^{\sum_{k}\sum_{l} -\Psi_{kl}u^{-\epsilon }}$$
$$=e^{-\Psi_{M}u^{-\epsilon }}$$
where, $\Psi_{M} =\sum_{k}\sum_{l}\Psi_{kl}, k\in M \ and \ l\in M  $

<!--
#####From the indirect utility function in equation (3), the authors have the following monotonic relationship between idiosyncratic amenities $(b_{ni}(\omega))$ and utility $(U_{ni}(\omega))$:
$$ b_{ni}(\omega)= \frac{U_{ni}(\omega)k_{ni} P_n^\alpha Q_n^{1-\alpha}}{B_{ni}w_i} \qquad(3.1)$$

#####Together equations (4) and (3.1) imply that the *distribution of utility* for residence $n$ and workplace $i$ is:

$$G_{ni}(u)= e^{-\Psi_{ni}u^{-\epsilon }}, where \  \Psi_{ni} = (B_{ni}w_i)^{\epsilon}(k_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}  \ is\ the \ location \ paremeter.$$

Since the maximum of a sequence of Fréchet distributed random variables is itself Fréchet distributed, the distribution of utility across all residences $k$ and all workplaces $l$ is:

$$ G(u)= e^{-\Psi_{M}u^{-\epsilon }}, where \  \Psi_{M} =\sum_{k\in M}\sum_{l\in M}\Psi_{kl}   $$
-->


##### Given this Fréchet distribution for utility,the expected utility is:
$$ E(u)= \int_{0}^{\infty } uG'(u)du$$
$$=\int_{0}^{\infty }u(- \Psi_M )(-\epsilon u^{-\epsilon -1})e^{-\Psi_{M}u^{-\epsilon }}du$$
$$=\int_{0}^{\infty } \epsilon  \Psi_M u^{-\epsilon }e^{-\Psi_{M}u^{-\epsilon }}du$$

define $y=\Psi_M u^{-\epsilon }$, so $dy=-\epsilon \Psi_M u^{-\epsilon -1}du=-\epsilon \Psi_M u^{-\epsilon}u^{-1}du $, and $u =y^{-1/\epsilon}\Psi_M^{1/\epsilon} $
then (notice that when $u$ runs from $0$ to $\infty$, $y$ runs from $\infty$ to $0$):
$$E(u)= \int_{0}^{\infty }u e^{-y} dy$$
$$=\int_{0}^{\infty } y^{-1/\epsilon}\Psi_M^{1/\epsilon} e^{-y}dy $$
which can be written as:
$$E(u)= \nu \Psi_M^{1/\epsilon}$$
$$E(u)= \nu [{\textstyle \sum_{k \in M}\sum_{l \in M}} (B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}]^{1/\epsilon}\qquad(C9)$$
where $ \nu = \Gamma(\frac{\epsilon-1}{\epsilon})$ is the Gamma function. In general, $\Gamma (a)=\int_{0}^{\infty } x^{a-1}e^{-x}dx$.

##### Expected utility conditional on choosing a residence-workplace pair is the same across all residence-workplace pairs in the economy:

$$\bar{U} = \nu [{\textstyle \sum_{k \in N}\sum_{l \in N}} (B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}]^{1/\epsilon} \qquad(9)$$
which is based on equation (C9).



>#### Bilateral common amenities

$$ B_{ni} = B_n^R B_i^L B_{ni}^I \qquad(5)$$
where, $B_n^R, B_i^L, B_{ni}^I > 0$;<br>
$B_n^R$ is residence component common across all workplaces;<br>
$B_i^L$ is workplace component common across all residences;<br>
$ B_{ni}^I$ is idiosyncratic component specific to an individual residence-workplace pair.

>#### Residence and Workplace Choices


##### Using the distribution of utility for pairs of residence and employment locations, the probability that a worker chooses the bilateral commute from $n$ to $i$ out of all possible bilateral commutes is:

$$\lambda_{ni} = Pr[u_{ni} \ge max{ (u_{kl}) };\forall k \ne n,l \ne i]$$

<!-- 
$$  = \int_{0}^{\infty } \prod_{l\ne i} G_{ni}(u)[\prod_{k\ne n}\prod_{l\in M} G_{kl}(u) ]d G_{ni}(u)$$
-->

$$= \int_{0}^{\infty }[\prod_{k \ne n}\prod_{l\ne i} G_{kl}(u)]d G_{ni}(u)  $$
$$=\int_{0}^{\infty } [\prod_{k\in M}\prod_{l\in M} e^{-\Psi_{kl}u^{-\epsilon }}]\epsilon \Psi_{ni}u^{-\epsilon-1}du $$
$$=\int_{0}^{\infty } [e^{-\Psi_{M}u^{-\epsilon }}] \epsilon \Psi_{ni}u^{-\epsilon-1}du$$
$$=\Psi_{ni}\int_{0}^{\infty }  \epsilon u^{-\epsilon-1}e^{-\Psi_{M}u^{-\epsilon }}du  $$
$$= \Psi_{ni}\int_{0}^{\infty } d(\frac{1}{\Psi_{M}} e^{-\Psi_{M}u^{-\epsilon }})  $$
$$= \frac{\Psi_{ni}}{\Psi_{M}}  e^{-\Psi_{M}u^{-\epsilon }}\mid _{0}^{\infty }$$

$$=\frac{\Psi_{ni}}{\Psi_{M}} $$

Note that:
$$\frac{d}{du} [\frac{1}{\Psi_{M}} e^{-\Psi_{M}u^{-\epsilon }}]= \epsilon u^{-\epsilon-1}e^{-\Psi_{M}u^{-\epsilon }}$$

##### The probability that the worker chooses to live in location $n$ and work in location $i$ is:
$$\frac{L_{ni}}{L_M} =\frac{\Psi_{ni}}{\Psi_{M}} = \frac{(B_{ni}w_i)^{\epsilon}(k_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{ \sum_{k \in M}\sum_{l \in M} (B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}} $$
where $L_{ni}$ is the measure of commuters from residence $n$ to workplace $i$; $L_M$ is the measure of workers in the economy as a whole.

##### Summing across workplaces and residences in Greater London, the probability that a worker chooses a residence-workplace pair in Greater London is given by:

$$\frac{L_{N}}{L_M} =\frac{ \sum_{n \in N}\sum_{i \in N}(B_{ni}w_i)^{\epsilon}(k_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{  \sum_{k \in M}\sum_{l \in M} (B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}} $$

##### The probability that a worker chooses to live in location $n$ and work in location $i$ conditional on choosing a residence-workplace pair in Greater London is:

 $$ λ_{ni}=\frac{L_{ni}/L_M}{L_N/L_M} = \frac{L_{ni}}{L_N}= \frac{(B_{ni}w_i)^{\epsilon}(k_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{ {\textstyle \sum_{k \in N}\sum_{l \in N}} (B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}}       \qquad(6)  \ \ i,n \in N$$ 

Summing across workplaces $i \in N$ to obtain the probability that a worker lives in residence $n \in N$, conditional on choosing a residence-workplace pair in Greater London:
$$\lambda_n^R = \frac{R_n}{L_N}=\frac{ \sum_{i \in N}(B_{ni}w_i)^{\epsilon}(k_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{ \sum_{k \in N}\sum_{l \in N} (B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}} \qquad(7-1)$$

Summing across residences $n \in N$ to obtain the probability that a worker is employed in workplace $i \in N$, conditional on choosing a residence-workplace pair in Greater London:
$$ \lambda_n^L = \frac{L_i}{L_N}=\frac{ \sum_{n \in N}(B_{ni}w_i)^{\epsilon}(k_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{  \sum_{k \in N}\sum_{l \in N}(B_{kl}w_l)^{\epsilon}(k_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}} \qquad(7-2)$$

>##### **Conditional on working in location $i$, the conditional probability that a worker commutes from location $n$ is :**

$$ \lambda_{ni\mid i}^L = Pr[u_{ni} \ge max(u_{ri}); \forall r \ne n]$$
$$= \int_{0}^{\infty }[\prod_{r \ne n} G_{ri}(u)]d G_{ni}(u)  $$
$$=\int_{0}^{\infty } [e^{-\Psi_{i}^Lu^{-\epsilon }} ]\epsilon \Psi_{ni}u^{-\epsilon-1}du$$
$$=\Psi_{ni}\int_{0}^{\infty }  \epsilon u^{-\epsilon-1}e^{-\Psi_{i}^L u^{-\epsilon }}du$$
$$= \frac{\Psi_{ni}}{\Psi_{i}^L}  e^{-\Psi_{i}^Lu^{-\epsilon }}\mid _{0}^{\infty }$$

$$= \frac{\Psi_{ni}}{\Psi_{i}^L}$$
Note that:
$$\frac{d}{du} [\frac{1}{\Psi_{i}^L} e^{-\Psi_{i}^L u^{-\epsilon }}]=\epsilon u^{-\epsilon-1}e^{-\Psi_{i}^L u^{-\epsilon }}$$
where, $\Psi_{i}^L= \sum_{k \in M}(B_{ki}w_i)^{\epsilon}(\kappa_{ki} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}$ 

Under the assumption of prohibitive commuting costs between Greater London and the wider economy, we have:

$$\sum_{k \in M}(B_{ki}w_i)^{\epsilon}(\kappa_{ki} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon} = \sum_{k \in N}(B_{ki}w_i)^{\epsilon}(\kappa_{ki} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}, \forall i \in N$$ 

So, the conditional probability that a worker commutes from location $n$ is (conditional on working in location $i$):
$$ \lambda_{ni\mid i}^L = \frac{(B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{\sum_{k \in M}(B_{ki}w_i)^{\epsilon}(\kappa_{ki} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}}$$
$$= \frac{(B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{\sum_{k \in N}(B_{ki}w_i)^{\epsilon}(\kappa_{ki} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}}$$
$$= \frac{(B_{ni})^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{\sum_{k \in N}(B_{ki})^{\epsilon}(\kappa_{ki} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}}$$


>##### **Conditional on living in location $n$, the conditional probability that a worker commutes to location $i$ is :**

$$ \lambda_{ni\mid n}^R = Pr[u_{ni} \ge max(u_{nl}); \forall l \ne i]$$
$$= \int_{0}^{\infty }[\prod_{l \ne i} G_{nl}(u)]d G_{ni}(u)  $$
$$=\int_{0}^{\infty } [e^{-\Psi_{n}^R u^{-\epsilon }}] \epsilon \Psi_{ni}u^{-\epsilon-1}du $$
$$=\Psi_{ni}\int_{0}^{\infty }  \epsilon u^{-\epsilon-1}e^{-\Psi_{n}^R u^{-\epsilon }}du $$
$$= \frac{\Psi_{ni}}{\Psi_{n}^R}  e^{-\Psi_{n}^R u^{-\epsilon }}\mid _{0}^{\infty } $$

$$= \frac{\Psi_{ni}}{\Psi_{n}^R}$$

Note that:
$$\frac{d}{du} [\frac{1}{\Psi_{n}^R} e^{-\Psi_{n}^R u^{-\epsilon }}]=\epsilon u^{-\epsilon-1}e^{-\Psi_{i}^L u^{-\epsilon }}$$
where, $\Psi_{n}^R= \sum_{l \in M}(B_{nl}w_l)^{\epsilon}(\kappa_{nl} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}$ 

Under the assumption of prohibitive commuting costs between Greater London and the wider economy, we have:
$$ \sum_{l \in M}(B_{nl}w_l)^{\epsilon}(\kappa_{nl} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}= \sum_{l \in N}(B_{nl}w_l)^{\epsilon}(\kappa_{nl} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}, \forall n \in N$$ 

So, the conditional probability that a worker commutes to location $i$ is (Conditional on living in location $n$):

$$ \lambda_{ni\mid n}^R = \frac{(B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{\sum_{l \in M}(B_{nl}w_l)^{\epsilon}(\kappa_{nl} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}$$
$$= \frac{(B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{\sum_{l \in N}(B_{nl}w_l)^{\epsilon}(\kappa_{nl} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}$$
$$= \frac{(B_{ni}w_i/\kappa_{ni})^{\epsilon}( P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{\sum_{l \in N}(B_{nl}w_l/\kappa_{nl})^{\epsilon}( P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}$$
$$=\frac{(B_{ni}w_i/\kappa_{ni})^{\epsilon}}{\sum_{l \in N}(B_{nl}w_l/\kappa_{nl})^{\epsilon}} \qquad(14)$$


>#### **V.B. Production**

The authors assume that consumption goods are produced according to a Cobb-Douglas technology using labor, machinery capital, and commercial floor space.

The homogeneous final good is produced under conditions of perfect competition and constant returns to scale. For simplicity, the authors abstract from the use of machinery capital as a factor of production in this section.

$$ Y_i = A_i(\frac{L_i}{\beta^L} )^{\beta^L}(\frac{H_i^L}{\beta^H} )^{\beta^H}$$

where, $0< \beta^L, \beta^H <1 $, $\beta^L+\beta^H=1 $;   
$A_i$ is final goods productivity and assumed to be exogenous;  
$Y_i$ is output of the final good;   
$L_i$ is inputs of labor;   
$H_i^L$ is commercial floor space.

The authors assume that the final good can be costlessly traded throughout the economy and choose it as our numeraire, such that:$P_{nt}=P_t = 1$. So the profits in workplace $i$ is:
$$\pi_i = Y_i - w_i L_i - q_i H_i^L = A_i(\frac{L_i}{\beta^L} )^{\beta^L}(\frac{H_i^L}{\beta^H} )^{\beta^H} - w_i L_i - q_i H_i^L$$
where,  
$w_i$ is the wage;  
$q_i$ is the price of commercial floor space, and $q_i = \xi_i Q_i$ ($Q_i$ the price of residential floor space, $ \xi_i $ is a location-specific wedge.)

From the first-order conditions for profit maximization, we obtain:
$$\frac{\partial \pi_i}{\partial L_i} = A_i \beta^L (\frac{L_i}{\beta^L} )^{\beta^L -1}\frac{1}{\beta^L} (\frac{H_i^L}{\beta^H} )^{\beta^H}-w
_i=0 \qquad(12-1)$$
$$\frac{\partial \pi_i}{\partial H_i^L} = A_i  (\frac{L_i}{\beta^L} )^{\beta^L } \beta^H \frac{1}{\beta^H} (\frac{H_i^L}{\beta^H} )^{\beta^H -1}-q
_i=0 \qquad(12-2)$$

using (12-1) divided by (12-2) to obtain:
$$ (\frac{L_i}{\beta^L} )^{-1 } (\frac{H_i^L}{\beta^H} )=\frac{w_i}{q_i} \qquad(12-3)$$

rearrange (12-3) to get:
$$ q_i H_i^L = \frac{\beta^H}{\beta^L} w_i L_i \qquad(12) $$
which means payments for commercial floor space are proportional to workplace income ($w_i L_i$).

>#### **V.C. Commuter market clearing**

Commuter market clearing requires that the measure of workers employed in each location $i$ ($L_i$) equals the sum across all locations $n$ of their measures of residents ($R_n$) times their conditional probabilities of commuting to $i$ ($\lambda_{ni\mid n}^R $):

$$L_i=\sum_{n \in N} \lambda_{ni\mid n}^R R_n$$

$$ =\sum_{n \in N}\frac{(B_{ni}w_i/\kappa_{ni})^{\epsilon}}{\sum_{l \in N}(B_{nl}w_l/\kappa_{nl})^{\epsilon}}R_n    \qquad(13) $$

Per capita income by residence ($v_n$) is a weighted average of the wages in all locations:$$v_n = \sum_{i \in N} \lambda_{ni\mid n}^R w_i$$ $$ =\sum_{i \in N}\frac{(B_{ni}w_i/\kappa_{ni})^{\epsilon}}{\sum_{l \in N}(B_{nl}w_l/\kappa_{nl})^{\epsilon}}w_i   \qquad(15) $$

>#### **V.D. Land Market Clearing**

The authors assume that floor space is owned by landlords, who receive payments from the residential and commercial use of floor space and consume only consumption goods.

**Land market clearing** implies that total income from the ownership of floor space equals the sum of payments for residential and commercial floor space use:

$$\tilde{Q} = Q_nH_n^R+q_n H_n^L=（1-\alpha)v_n R_n + \frac{\beta^H}{\beta^L} w_n L_n \qquad(16)$$
where,$\alpha$ is the overall share of expenditure on consumption goods;    
$H_n^R$ is supplies of residential floor space;   
$H_n^L$ is supplies of commercial floor space;   
$R_n$ is the measure of residents.  




### VI. Quantitative Analysis

#### VI.A Combined Land and Commuter Market Clearing
*  “Exact Hat Algebra” approach:Dekle, Eaton, and Kortum (2007), using rates of change rather than horizontal values to estimate the impact of changes in transport networks.
*  In particular, we rewrite our combined land and commuter market-clearing condition (16) for another year τ in terms of the values of variables in a
baseline year of t and the relative changes of variables between years τ and t.

$$ \tau \neq t$$

because 
 $$\hat{x} _ {n  \tau} = {\frac{x_{n \tau}}{x_{n t}}}$$

and α，β are constant.
So we have (17):
$$
\tilde{Q}_ {n  \tau}=\frac{\tilde{Q}_ {n  \tau} }{\tilde{Q}_ {n t}}  {\tilde{Q}_ {n t}} 
$$
$$
=\hat{Q}_ {n t} \tilde{Q}_ {n t}=(1-\alpha) \hat{v}\_{n t}  v_{n t} \hat{R}\_{n t} R_{n t}+\frac{\beta^{H}}{\beta^{L}} \hat{w}\_{n t} w_{n t} \hat{L}\_{n t} L_{n t} \qquad(17)
$$

 
According  to (13) and (14),we can simplify $\hat{L}_ {i t} {L}_ {i t}$:

$$
\hat{L}_ {i t} L_ {i t}=\frac{{L}_ {i  \tau}}{{L}_ {i t}}{L}_ {i t}={L}_ {i  \tau}
=\sum_ {n \in N} \lambda_ {n i  \tau \mid n}^{R} R_ {n  \tau}= {\sum_ { n \in N}}  \frac{{B}_ {ni \tau}^{\epsilon} {w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau }^{-\epsilon} }{{\sum_ {\ell \in N}}{B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau}^{-\epsilon}}R_ {n \tau}
$$
$$
={\sum_ { n \in N}}  \frac{{B}_ {ni \tau}^{\epsilon} {w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau }^{-\epsilon} }{{\sum_ {\ell \in N}}{B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau}^{-\epsilon}}R_ {n \tau} \left(\frac{ {\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}{{B}_ {nit}^{\epsilon} {w}_ {it}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon} R_ {n t}}\right) \left(\frac{{B}_ {nit}^{\epsilon} {w}_ {it}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon} }{{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}} R_ {n t}\right) 
$$
$$
= {\sum_ { n \in N}}   {\frac{{B}_ {ni \tau}^{\epsilon}{w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau}^{-\epsilon}}{{B}_ {nit}^{\epsilon}{w}_ {it}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon}}}{\frac{{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}{{\sum_ {\ell \in N}}{B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau}^{-\epsilon}}}\frac{R_ {n \tau}}{R_ {n t}}\lambda_ {n i t \mid n}^{R}{R_ {n t}}
$$
$$
= {\sum_ { n \in N}}   {\frac{{B}_ {ni \tau}^{\epsilon}{w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau}^{-\epsilon}}{{B}_ {nit}^{\epsilon}{w}_ {it}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon}}}\left({{\sum_ {\ell \in N}} \frac  { {B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau}^{-\epsilon} }{ {\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}} }\right)^{-1}  \frac{R_ {n \tau}}{R_ {n t}}\lambda_ {n i t \mid n}^{R}{R_ {n t}}
$$
$$
=\sum_ {n \in N}  \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon} 
\left({{\sum_ {\ell \in N}} \frac  { {B}_ {n \ell t}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau}^{-\epsilon} }{ {\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}} }\right)^{-1} \hat{R} _ {n t} \lambda_ {n i t \mid n}^{R}R_{n t}
$$
$$
=\sum_ {n \in N}  \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon} 
\left({\sum_ {\ell \in N}\frac {{B}_ {n \ell t}^{\epsilon} {\hat w}_ {\ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon}{\hat \kappa}_ {n \ell t}^{-\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}{{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}} \right)^{-1}
\hat{R} _ {n t} \lambda_ {n i t \mid n}^{R}R_{n t}
$$
$$
=\sum_ {n \in N}  \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon} 
{\sum_ {\ell \in N}  \frac {{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}{{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}} \frac{1}{{\hat \kappa}_ {n \ell t}^{-\epsilon}{\hat w}_ {\ell t}^{\epsilon}} \hat{R} _ {n t} \lambda_ {n i t \mid n}^{R}R_{n t}
$$
$$
=\sum_ {n \in N} \frac{ \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{{\sum_ {\ell \in N}}  \lambda_ {n \ell \tau \mid n}^{R} \hat{w} _ {\ell t}^{\epsilon} \hat{\kappa} _ {n \ell t}^{-\epsilon}} \hat{R} _ {n t} \lambda_ {n i t \mid n}^{R}R_{n t}
$$
$$
=\sum_ {n \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{{\sum_ {\ell \in N}} \lambda_ {n \ell \tau \mid n}^{R}\hat{w} _ {\ell t}^{\epsilon} \hat{\kappa} _ {n \ell t}^{-\epsilon}} \hat{R} _ {n t} R_{n t} \qquad(18)
$$

where these equations include terms in changes in wages  and commuting costs but not in amenities, because we assume that the workplace and bilateral components of amenities are
constant 

$$
\hat{\mathcal{B}} _ {i t}^{L}=\hat{\mathcal{B}} _ {n i t}^{I}=1
$$

and changes in the residential component of amenities

$$
\hat{\mathcal{B}}_ {n t}^{R}\neq1
$$

cancel from the numerator and denominator of the fractions

According  to (14) and (15),we can simplify $\hat{v}_ {i t} {v}_ {i t}$:

$$
\hat{v}_ {n t}{v}_ {n t}=\frac{{v}_ {n \tau}}{{v}_ {n t}}{v}_ {n t}=\sum_ {n \in N} \lambda_ {n i \tau \mid n}^{R}w_ {i \tau}={\sum_ { n \in N}} {\frac{{B}_ {ni \tau}^{\epsilon} {w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau}^{-\epsilon} }{{\sum_ {\ell \in N}}{B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau }^{-\epsilon}}}w_ {i \tau}
$$
$$
={\sum_ { n \in N}} {\frac{{B}_ {ni \tau}^{\epsilon} {w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau}^{-\epsilon} }{{\sum_ {\ell \in N}}{B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau }^{-\epsilon}}}w_ {i \tau} \left({\frac{{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t }^{-\epsilon} }{{B}_ {ni t}^{\epsilon} {w}_ {i t}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon}w_ {i t}}} \right) \left({\frac{{B}_ {ni t}^{\epsilon} {w}_ {i t}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon} }{{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t }^{-\epsilon}}}w_ {i t} \right)
$$
$$
={\sum_ { n \in N}} \frac{{B}_ {ni \tau}^{\epsilon} {w}_ {i \tau}^{\epsilon} {\kappa}_ {n i \tau}^{-\epsilon}}{{B}_ {nit}^{\epsilon} {w}_ {it}^{\epsilon} {\kappa}_ {n i t}^{-\epsilon}}\frac{{\sum_ {\ell \in N}}{B}_ {n \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {n \ell t}^{-\epsilon}}{{\sum_ {\ell \in N}}{B}_ {n \ell \tau}^{\epsilon} {w}_ {\ell \tau}^{\epsilon} {\kappa}_ {n \ell \tau }^{-\epsilon}}\frac{w_ {i \tau}}{w_ {it}}\lambda_ {n i t \mid n}^{R}w_{it}
$$
$$
={\sum_ { i \in N}} \frac{\lambda_ {n i t \mid n}^{R} \hat{w} _ {i t}^{\epsilon} \hat{\kappa} _ {n i t}^{-\epsilon}}{\sum_{\ell \in N} \lambda_ {n \ell t \mid n}^{R} \hat{w} _ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \hat{w}_ {i t} w_{i t} \qquad(19)
$$

Put (18) and (19) into (17), we have (20):
$$
\hat{Q}_ {n t} \tilde{Q}_ {n t}=(1-\alpha)\left[\sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {n \ell t \mid n}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \hat{w}_ {i t} w_ {i t}\right] \hat{R}_ {n t} R_{n t} 
$$
$$
+\frac{\beta^{H}}{\beta^{L}} \hat{w}_ {n t} w_ {n t}\left[\sum_ {i \in N} \frac{\lambda_ {i n t i}^{R} \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {i n t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {i \ell t \mid i}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {i \ell t}^{-\epsilon}} \hat{R}_ {i t} R_{i t}\right] \qquad(20)
$$


*  Suppose that we observe the values of all variables in the initial equilibrium in our baseline year of t: 
the commuting probabilities conditional on residence ($\lambda_ {n i t \mid n}^{R}$),
employment ($L_{nt}$),
residents ($R_{nt}$),
wages ($w_{nt}$),
average per capita income by residence ($v_{nt}$)
*  Suppose also that we observe relative changes in residents and rateable values between years τ and t:
relative changes in residents ( $\hat R_{nt}$) ,
rateable values ( $\hat Q_{nt}$) ,
*  Given these observed variables and known values for changes in commuting costs( $\hat{\kappa}_ {n i t}^{-\epsilon}$), this combined land and commuter market-clearing condition (20) provides a system of N equations that determines unique values for the N unknown relative changes in wages in each location($\hat {w}_ {nt}$).

>#### LEMMA 1. Suppose that

$$
\left(\hat{Q}_ {n t}, \hat{R}_ {n t}, L_{n i t}, \lambda_{n i t \mid n}^{R}, Q_{n t}, v_{n t}, R_{n t}, w_{n t}, L_{n t}\right)
$$
are known. Given known values for model parameters 

$$ \left(  \alpha, \beta^{L}, \beta^{H}, \epsilon  \right)$$

and the change in bilateral commuting costs
$$
\left(\hat{\kappa}_ {n i t}^{-\epsilon}\right)
$$

the combined land and commuter market-clearing condition (20) determines a unique vector of relative changes in wages
$$
\left(\hat{w}_ {n t}\right)
$$
in each location.

>#### Proof of LEMMA 1
* We first determine the unique vector of relative changes in wages ($ \mathbf{\hat w}_ \mathbf{t}$) and then recover the unique vector of relative changes in employment ($ \mathbf{\hat L}_ \mathbf{t}$).
* The combined land and commuter market clearing condition for an earlier year τ < t can be written as:
$$
\hat{Q}_ {t} \tilde{Q}_ {t}=T\left(\mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right) \qquad(B.1)
$$
where $\hat{Q}_ {t}$ is the observed vector of relative changes in rateable values; $\tilde{Q}_ {t}$ is the observed vector of rateable values in our baseline year t = 1921;$\mathbf{Z}_ {\mathbf{t}}$ is a known matrix of relative changes in variables between years τ and t and values for variables in our baseline year t, including $R_ {nt}, w_ {nt}, \hat R_ {nt},\lambda_ {n i t \mid n}^{R} $; $ \mathbf{\hat{\kappa}}_ {\boldsymbol{t}}$ is the matrix of changes in commuting costs;
$\hat{\mathbf{w}}_ {\mathbf{t}}$ is the vector of relative changes in wages to be determined;

So we have 
$$
T\left(\mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)
$$
$$
=(1-\alpha)\left[\sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {n \ell t \mid n}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \hat{w}_ {i t} w_ {i t}\right] \hat{R}_ {n t} R_{n t} 
$$
$$
+\frac{\beta^{H}}{\beta^{L}} \hat{w}_ {n t} w_ {n t}\left[\sum_ {i \in N} \frac{\lambda_ {i n t i}^{R} \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {i n t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {i \ell t \mid i}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {i \ell t}^{-\epsilon}} \hat{R}_ {i t} R_{i t}\right] \qquad(B.2)
$$

*  Property (i):
$$ 
\hat{Q}_ {t} \tilde{Q}_ {t} > 0 
$$

such that 

$$ 
\hat{Q}_ {nt} \tilde{Q}_ {nt} > 0 
$$

for all 

$${n \in N}$$

*  Property (ii): 
$$
\lim_{\mathbf{\hat{w}}_ {\mathbf{t}}\to 0} T\left(\mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)= 0
$$

*  Property (iii): $  T\left(\mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)$ is monotonic in the vector of relative changes in wages , since:

$$
\begin{aligned}
&\frac{d T(\cdot)}{d \mathbf{\hat{w}}_ {\mathbf{t}}} d \mathbf{\hat{w}}_ {\mathbf{t}}=(1-\alpha)\left[\sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {n \ell t \mid n}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \frac{d \hat{w}_ {i t}}{\hat{w}_ {i t}} \hat{w}_ {i t} w_ {i t}\right] \hat{R}_ {n t} R_{n t}\\
\end{aligned}
$$
$$
\begin{aligned}
&+\epsilon(1-\alpha)\left[\sum_ {i \in N}\left(1-\frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {n \ell t \mid n}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}}\right) \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {n \ell t \mid n}^{R} \hat{w}_ {\ell t}^{\varepsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \frac{d \hat{w}_ {i t}}{\hat{w}_ {i t}} \hat{w}_ {i t} w_ {i t}\right] \hat{R}_ {n t} R_{n t}\\
\end{aligned}
$$
$$
\begin{aligned}
&+\left(\frac{\beta^{H}}{\beta^{L}}\right) \frac{d \hat{w}_ {n t}}{\hat{w}_ {n t}} \hat{w}_ {n t} w_ {n t}\left[\sum_ {i \in N} \frac{\lambda_ {i n t \mid i}^{R} \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {i n t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {i \ell t \mid i}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {i \ell t}^{-\epsilon \epsilon}} \hat{R}_ {i t} R_{i t}\right] \\
\end{aligned}
$$
$$
\begin{aligned}
&+\epsilon\left(\frac{\beta^{H}}{\beta^{L}}\right)  \hat{w}_ {n t} w_ {n t}\left[\sum_ {i \in N}\left(1-\frac{\lambda_ {int \mid i}^{R} \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {in  t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {i \ell t \mid i}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {i \ell t}^{-\epsilon}}\right) \frac{\lambda_ { in t \mid i}^{R} \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {in t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {i \ell t \mid i}^{R} \hat{w}_ {\ell t}^{\varepsilon} \hat{\kappa}_ {i \ell t}^{-\epsilon}} \frac{d \hat{w}_ {n t}}{\hat{w}_ {n t}} \hat{R}_ {i t} R_{i t}\right]  \qquad(B.3)\\
\end{aligned}
$$

where $\frac{d T(\cdot)}{d \mathbf{\hat{w}}_ {\mathbf{t}}}>0$
for $\mathbf{\hat{w}}_ {\mathbf{t}} > 0$

*   Property (iv): $  T\left(\mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)$ is homogeneous of degree one in the vector of relative changes in wages ($\mathbf{\hat{w}}_ {\mathbf{t}}$) such that
$$
T\left(\xi \mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)
$$

$$
=(1-\alpha)\left[\sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \xi \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {n \ell t \mid n}^{R} \xi \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \xi \hat{w}_ {i t} w_ {i t}\right] \hat{R}_ {n t} R_{n t} 
$$

$$
+\frac{\beta^{H}}{\beta^{L}} \xi \hat{w}_ {n t} w_ {n t}\left[\sum_ {i \in N} \frac{\lambda_ {i n t i}^{R} \xi \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {i n t}^{-\epsilon}}{\sum_ {\ell \in N} \lambda_ {i \ell t \mid i}^{R} \xi \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {i \ell t}^{-\epsilon}} \hat{R}_ {i t} R_{i t}\right] 
$$

$$
=\xi T\left( \mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)
$$

*   From properties (i)-(iv), starting from $\hat w_ {nt} = 0$ for all locations n, and increasing $\hat w_{nt}$ for each location n, there exists a unique value for $\hat w_{nt}$ for which $\hat{Q}_ {t} \tilde{Q}_ {t}=T\left( \mathbf{\hat{w}}_ {\mathbf{t}} ; \mathbf{\hat{\kappa}}_ {\boldsymbol{t}} ; \mathbf{Z}_ {\mathbf{t}}\right)$  and equation (B.1)&(17) is satisfied.
*   Using these unique solutions for the relative changes in wages $\hat w_ {nt}$, the unique vector of relative changes in employment ($\mathbf{\hat L}_ {t}$) can be recovered from the commuter market clearing condition in equation (B18) $\hat{L}_ {i t} L_ {i t}$

where we have solved for $\hat{w}_ {i t}^\epsilon $ and we observe $(\hat{R}_ {n t}, L_{nt}, R_{nt},\lambda_ {n i t \mid n}^{R})$


*   Similarly,We can solve for the unique relative change inaverage per capita income by residence $\hat{v}_ {n t}

*   Finally, we can obtain the unique relative change in commuting flows$\hat{L}_ {n i t}$
*   Using the conditional commuting probabilities (14),we have (21):
$$
 \hat{L}_ {n i t} L_{n i t}=\frac{\lambda_{n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{\sum_{\ell \in N} \lambda_{n \ell t \mid n}^{R} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {n \ell t}^{-\epsilon}} \hat{R}_ {n t} R_ {n t}  \qquad(21)
$$
where we have solved for $\hat{w}_ {i t}^\epsilon $ and we observe $(\hat{R}_ {n t}, L_{nt}, R_{nt},\lambda_ {n i t \mid n}^{R})$


>##### Adventages

*   Not required to make assumptions about other determinants of economic activity
*   Observed probabilities control for unobserved differences in the level of bilateral commuting costs across residence-workplace pairs
*   use ($w_{it},L_{it},L_{nit}$) in base line year t and ($\hat w_{it},\hat L_{it},\hat L_{nit}$),we can get ($w_{i \tau},L_{i \tau},L_{ni \tau}$) and $t \ne \tau$

#### VI.B. Commuting Probabilities (Step 1)
>##### we use the observed data on bilateral commuting flows ($L_{nit}$) from the population census in our baseline year t = 1921 to directly compute the following variables in that baseline year:

*  (i) total city employment, $L_t = \sum_ {n \in N} \sum_ {i \in N} L_{nit}$; 
*  (ii) the commuting probability conditional on choosing a workplace-residence pair in Greater London,$ \lambda_ {nit} = L_ {nit}/L_{Nt} $;
*  (iii) workplace employment, $ L_{it} = \sum_ {n \in N} L_{nit}$;
*  (iv) residence employment, $ R_{nt} = \sum_ {i \in N} L_{nit}$;
*  (v) the commuting probabilities conditional on residence,$ \lambda_ {n i t \mid n}^{R} = L_{nit}/ R_{nt} $

#### VI.C. Wages in the Initial Equilibrium (Step 2)
>##### We solve for wages ($w_{nt}$) and average per capita income by residence ($v_{nt}$) in the initial equilibrium in year t = 1921 using the observed workplace employment ($L_{nt}$), residence employment ($R_{nt}$), and rateable values ($\tilde Q_{nt}$)
*  First, we assume a value for the share of housing in consumer expenditure of $1−\alpha = 0.25$, which equals the average share of rent in income across occupations in the Registrar General's survey of 30,000 workers in Greater London in 1887, as reported to the House of Commons (Parliamentary Papers 1887)
*  Second, we assume a value for the share of labor in production costs of $\beta ^L = 0.55$, which lies in the middle of the range of 0.43–0.63 considered for the period 1770–1860 in Antras and Voth (2003)
*  Third, we assume a share of machinery and equipment in production costs of $\beta ^K = 0.20$ and a share of land and building structures in production costs of $\beta ^H = 0.25$, which are in line with the data on factor shares for 1856–1913 reported in Matthews, Feinstein, and Odling-Smee (1982)
*  $$\beta ^L+\beta ^K+\beta ^H=1$$
>##### Given values for these parameters, our combined land and commuter market-clearing condition (16) for our baseline year of t = 1921 provides a system of N equations in the N unknown wages ($w_{nt}$). As this system of equations is linear in the unknown wages ($w_{nt}$), it determines a unique equilibrium value for the wage in each location in our baseline year ($w_{nt}$), as long as the rows of the observed matrix of bilateral commuting flows ($L_{int}$) are linearly independent.

#### VI.D. Estimating Commuting Costs (Step 3)
>##### We use the model’s gravity equation predictions to estimate the relationship between commuting flows and travel times, taking into account the endogeneity of the transport network using instrumental variables estimation.

*    Assume that bilateral commuting costs are a constant elasticity function of bilateral travel times and a stochastic error for all pairs of boroughs with positive commuting flows:
$$
 -\epsilon log \left(\kappa_ {n i t}\right) =- \epsilon \phi log \left(d_ {n i t}^W\right)+ u_ {n  t}^R+ u_ { i t}^L+ u_ {n i t}^I \qquad(21)
$$
where 
$d_ {n i t}^W$ is our measure of travel time based on our assumed travel speeds ($\delta$) and the observed transport network ($\tilde{s}_ t^{OR}, \tilde{s}_ t^{UR}, \tilde{s}_ t^{OT}$ ),
the composite elasticity $-\epsilon \phi$ captures both the elasticity of commuting flows to commuting costs ($-\epsilon$ ) and the elasticity of commuting costs to travel times ($\phi$),
$u_ {n i t}^R$ is an unobserved residence component of commuting costs,
$u_ {n i t}^L$ is an unobserved workplace component of commuting costs,
$u_ {n i t}^I$ is an unobserved idiosyncratic component of commuting costs that is specific to individual residence-workplace pairs.


*    From equation (5),we can get
$$ l
ogB_ {nit} = logB_ {nt}^R +logB_ {it}^L +logB_{nit}^I \qquad(5-1)
$$

*    From equation (9),we can get
$$
\frac {\bar{U}}{ \nu}\left(\frac{L_ {\tilde N}}{L_ {\tilde M}}  \right)^{1/\epsilon} =[{\textstyle \sum_ {k \in \tilde N}\sum_ {\ell \in \tilde N}} (B_ {k \ell}w_ {\ell})^{\epsilon}(k_ {k \ell} P_ k^\alpha Q_k^{1-\alpha})^{-\epsilon}]^{1/\epsilon} \qquad(9-1)
$$
$$
\left(\frac {\bar{U}}{ \nu}\right)^\epsilon \left(\frac{L_ {\tilde N}}{L_ {\tilde M}}  \right) ={\textstyle \sum_ {k \in \tilde N}\sum_ {\ell \in \tilde N}} (B_ {k \ell}w_ {\ell})^{\epsilon}(k_ {k \ell} P_ k^\alpha Q_k^{1-\alpha})^{-\epsilon} \qquad(9-2)
$$
$$
\epsilon log\left(\frac {\bar{U}_ t}{ \nu_ t}\right)+  log\left(\frac{L_ {\tilde N t}}{L_ {\tilde M t}}  \right) =log \left( {\textstyle \sum_ {k \in \tilde N}\sum_ {\ell \in \tilde N}} (B_ {k \ell t}w_ {\ell t})^{\epsilon}(k_ {k \ell t} P_ {kt}^\alpha Q_{kt}^{1-\alpha})^{-\epsilon} \right) \qquad(9-3)
$$
*    From equations (6) and (22), we obtain the following gravity equation for the log commuting probability in our baseline year t:

$$ log\lambda_ {nit}= log\left(\frac{\left(B_ {nit}w_ {it}\right)^{\epsilon}\left(\kappa_ {nit} P_ {nt}^\alpha Q_ {nt}^{1-\alpha}\right)^{-\epsilon}}{ \sum_{k \in \tilde N}\sum_{\ell \in \tilde N}\left(B_{k \ell t}\right)^{\epsilon}\left(\kappa_{k \ell t} P_ {kt}^\alpha Q_{kt}^{1-\alpha}\right)^{-\epsilon}}\right)$$
$$
={\epsilon}log\left(B_ {nit}w_ {it}\right){-\epsilon}log\left(\kappa_ {nit} P_ {nt}^\alpha Q_ {nt}^{1-\alpha}\right)-log \left( \sum_{k \in \tilde N}\sum_{\ell \in \tilde N}\left(B_{k \ell t}\right)^{\epsilon}\left(\kappa_{k \ell t} P_ {kt}^\alpha Q_{kt}^{1-\alpha}\right)^{-\epsilon}\right)
$$
$$
={\epsilon}logB_ {nt}^R +{\epsilon}logB_ {it}^L +{\epsilon}logB_ {nit}^I+{\epsilon}log\left(w_ {it}\right)
$$
$${-\epsilon}log\left(\kappa_ {nit} P_ {nt}^\alpha Q_ {nt}^{1-\alpha}\right)- \epsilon log\left(\frac {\bar{U}_ t}{ \nu_ t}\right)- log\left(\frac{L_ {\tilde N t}}{L_ {\tilde M t}}  \right) 
$$
$$= {\epsilon}logB_ {nt}^R +{\epsilon}logB_ {it}^L +{\epsilon}logB_ {nit}^I+{\epsilon}log\left(w_ {it}\right)
$$
$$ - \epsilon \phi log \left(d_ {n i t}^W\right)+ u_ {n  t}^R+ u_ { i t}^L+ u_ {n i t}^I{-\epsilon}log\left( P_ {nt}^\alpha\right){-\epsilon}log\left(  Q_ {nt}^{1-\alpha}\right)- \epsilon log\left(\frac {\bar{U}_ t}{ \nu_ t}\right)- log \left(\frac{L_ {\tilde N t}}{L_ {\tilde M t}}  \right) 
$$
$$
={\epsilon}log\left(w_ {it}\right)+{\epsilon}logB_ {it}^L- log \left(\frac{L_ {\tilde N t}}{L_ {\tilde M t}}  \right) - \epsilon log\left(\frac {\bar{U}_ t}{ \nu_ t}\right)+ u_ {i t}^L
$$
$$
+{-\epsilon}\alpha log\left( P_ {nt}\right){-\epsilon}\left({1-\alpha}\right)log\left(  Q_ {nt}\right)+{\epsilon}logB_ {nt}^R+ u_ {n  t}^R
$$
$$
+{\epsilon}logB_ {nit}^I+u_ {n i t}^I
$$
$$
-\epsilon \phi log \left(d_ {n i t}^W\right)
$$
$$
=\tilde W_ {it}+\tilde B_ {nt}-\epsilon \phi log \left(d_ {n i t}^W\right)+e_{nit}  \qquad(23)
$$

where the workplace fixed effect includes the wage and any workplace component of amenities or commuting costs, as well as the common expected utility in Greater London ($\tilde W_ {it}={\epsilon}log\left(w_ {it}\right)+{\epsilon}logB_ {it}^L- log \left(\frac{L_ {\tilde N t}}{L_ {\tilde M t}}  \right) - \epsilon log\left(\frac {\bar{U}_ t}{ \nu_ t}\right)+ u_ {i t}^L$),
the residence fixed effect includes the prices for goods consumption and residential floor space and any residence component of amenities or commuting costs ($\tilde B_ {nt}={-\epsilon}\alpha log\left( P_ {nt}\right){-\epsilon}\left({1-\alpha}\right)log\left(  Q_ {nt}\right)+{\epsilon}logB_ {nt}^R+ u_ {n  t}^R$),
the error term captures idiosyncratic shocks to bilateral amenities and commuting costs ($e_{nit}={\epsilon}logB_ {nit}^I+u_ {n i t}^I  $).

>##### A challenge in estimating equation (23) is that the transport network is endogenous, because overground and underground railways, omnibuses, and trams were operated by private-sector companies.
>##### Therefore, the sets of points connected to the railway and hence the bilateral travel times ($d_{ni t}^W$) are nonrandom. In particular, bilateral pairs that have more commuters for unobserved reasons in the error term ($u_{nit}$) could have more bilateral transport connections, and hence lower bilateral travel times ($d_{ni t}^W$).

>##### To address this concern, we instrument our bilateral travel times based on the transport network ($d_{ni t}^W$) with our bilateral travel times from a world where walking is assumed to be the only mode of transport ($d_{n i}^S$), in which case bilateral travel times depend solely on straight-line distance. Conditional on the workplace and residence fixed effects, our identifying assumption is that the unobserved factors that affect commuting in the error term ($u_{nit}$) are orthogonal to the straight-line distance ($d_{n i}^S$) between locations. 
*    In our empirical setting, Greater London is relatively homogeneous in terms of other economic and geographic features that could be correlated with straight-line distance, and we provide empirical checks on this identifying assumption below:
![table1](https://user-images.githubusercontent.com/91390400/138610894-1aab89f3-c51a-47d1-af3a-5a86ff0cee4a.png)

*    Using our baseline instrumental variables estimates of the elasticity of commuting flows with respect to travel times ($- \epsilon \phi$) from column (2), we construct measures of the change in commuting costs from the removal of the railway network between our baseline year of $t = 1921$ and an earlier year $\tau \lt t$ :
$$
\hat{\mathcal{K}}_ {n i t}=\hat{\kappa}_ {n i t}^{-\epsilon}=\left(\frac{\kappa_ {n i \tau}}{\kappa_ {n i t}}\right)^{-\epsilon}=\left(\frac{d_ {n i \tau}^{W}\left(\tilde S_ {\tau}^{\mathrm{OR}}, \tilde S_ {\tau}^{\mathrm{UR}}, \tilde S_ {\tau}^{\mathrm{OT}}, \boldsymbol{\delta}\right)}{d_ {n i t}^{W}\left(\tilde S_ {t}^{\mathrm{OR}}, \tilde S_ {t}^{\mathrm{UR}}, \tilde S_ {t}^{\mathrm{OT}}, \boldsymbol{\delta}\right)}\right)^{-\epsilon \phi} \qquad(24)
$$

#### VI.E. Historical Workplace Employment (Step 4)
>##### Given these estimates of changes in commuting costs ($\hat{\kappa}_ {n i t}^{-\epsilon}$)and a value for the Fr´echet shape parameter ($\epsilon$ ), we can use ourcombined land and commuter market-clearing condition (20) to solve for unobserved workplace employment back to the early nineteenth century. 
>##### We calibrate the Fr´echet shape parameter($\epsilon$ ) by minimizing the sum of squared deviations between the model’s predictions for workplace employment and the data on the day population in the City of London for the census years for which these data are available (1881, 1891, and 1911). We obtain a calibrated Fr´echet shape parameter of $\epsilon = 5.25$, which lies in between the estimate of around 6 in Ahlfeldt et al. (2015) and the estimate using migration flows of around 3 in Bryan and Morten (2019).
*    In Figure VI, we display the log of residence employment density and workplace employment density against distance from the Guildhall in the center of the City of London, for 1921 at the end of our sample period (when both variables are observed) and for 1831 before the first railway in Greater London (when residence employment is observed, but workplace employment is a model prediction).

![FIGUREVI](https://user-images.githubusercontent.com/91390400/138611696-cb3d127e-9fde-497f-b4d0-6d72623d3315.png)

#### VI.F. Specification Check (Step 5)
>##### As a specification check, we now compare our model’s predictions for commuting patterns during the nineteenth century to historical data that were not used in its calibration. In particular, we use data on commuting distances from the personnel ledgers of Henry Poole bespoke tailors.
>##### In the left panel of Figure VII, we compare the model’s predictions for 1861 with the commuting distances of workers who joined Henry Poole between 1857 and 1877.In the right panel, we compare the model’s predictions for 1901 with commuting distances of workers who joined Henry Poole between 1891 and 1911.
>##### In these comparisons, there are several potential sources ofdiscrepancies between the model and data, including the fact thatthis company is located in a specific site in Westminster, whereas the model covers all of that borough.
![FIGUREVII](https://user-images.githubusercontent.com/91390400/138611841-dd3c0dff-709d-451d-b97e-607d948edc6b.png)




### VII. Profuctivity, Amenities, and the Supply of Floor Space
In this section, the authors consider one theoretical model to explicitly recover productivity, amenities, and the supply of floor space and to examine the implications of the findings for the strength of agglomeration forces. In particular, the authors choose an extension of **the canonical urban model** to incorporate non-traded goods. This framework permits a particularly tractable and transparent approach to recovering productivity and amenities and estimating the strength of agglomeration forces. 

>#### **VII.A. Supply of Floor Space**
In this section, the authors separate rateable values into the price and supply of floor space.

##### Two assumptions:
**1) the authors assume no arbitrage between commercial and residential floor space: $q_{nt}=Q_{nt}$.**

**2) the authors model the supply of floor space ($H_{nt}$) as depending on geographical land area ($K_n$) and a constant elasticity function of the price of floor space ($Q_{nt}$)：**
$$H_{nt}=h Q_{nt}^{\mu} K_n  \qquad(G.2)$$
where, $h$ is a constant;   
$\mu \ge 0$ is the floor space supply elasticity; and $\mu = 0$ corresponds to the special case of a perfectly inelastic supply of floor space.
Note that the authors set the floor space supply elasticity in the model to the **median value** of these floor space supply elasticities across this subset of boroughs in the data ($\mu = 1.83$).


Re-arranging (G.3), we obtain the closed-form expression for the price of floor space:
$$ Q_{nt} = (\frac{\tilde{Q}_{nt}}{h K_n} )^{\frac{1}{1+\mu} } \qquad(26-1)$$

Substituting (26-1) into (G.2), we obtain the closed-form expression for the supply of floor space:
$$ H_{nt}=h K_n (\frac{\tilde{Q}_{nt}}{h K_n} )^{\frac{\mu}{1+\mu} } \qquad(26-2)$$

Taking relative changes over time in equations (26-1) and (26-2)can obtain the relative changes in the price of floor space ($Q_{nt}$) and the supply of floor space ($H_{nt}$):


>#### **VII.B. Productivity and Amenities**
In this section, the authors recover productivity and amenities for each location.

To recover productivity and amenities, the authors choose an extension of the canonical urban model to incorporate nontraded goods. This framework permits a particularly tractable and transparent approach to estimating the strength of agglomeration forces. It also allows us to undertake counterfactuals for removing the railway network under a range of alternative assumptions about the floor space supply elasticity and the strength of agglomeration forces.

#####  Starting with preferences in equation (3) in the paper, the authors assume that the consumption goods price index ($P_{nt}$) is a Cobb-Douglas function of the price of a homogeneous traded good ($P_{nt}^T$) and of a homogeneous non-traded good ($P_{nt}^N$), as in equation (27):
$$ P_{nt} = (P_{nt}^T)^{\nu} (P_{nt}^N)^{1-\nu}  \qquad(27)$$
where, $\nu$ is the traded goods expenditure share, and $0< \nu < 1$.

<!--
Note that the marginal utility of consuming the non-traded good converges to infinity as consumption of that good approaches zero, given (27). 
-->
 
Within Greater London, we assume that the homogeneous traded good is costlessly traded, such that
$$ P_{nt}^T = P_{t}^T,  \forall n \in N $$

Between Greater London and the rest of Great Britain, the authors allow for changes in trade costs for the traded good, which are reflected in changes in the common price of this good within Greater London ($P_{t}^T$).

The authors assume that both traded and non-traded goods are produced with labor, machinery capital and commercial floor space under *conditions of perfect competition*; and assume for simplicity the same production technology in both sectors. 

For traded production:
$$ Y_{nt}^T = A_{nt}^T(\frac{L_{nt}^T}{\beta^L} )^{\beta^L}(\frac{H_{nt}^T}{\beta^H} )^{\beta^H}(\frac{M_{nt}^T}{\beta^M} )^{\beta^M } \qquad(28-1)$$

For non-traded production:
$$ Y_{nt}^N = A_{nt}^N(\frac{L_{nt}^N}{\beta^L} )^{\beta^L}(\frac{H_{nt}^N}{\beta^H} )^{\beta^H}(\frac{M_{nt}^N}{\beta^M} )^{\beta^M } \qquad(28-2)$$

Cost minimization and zero profits imply that payments for labor, commercial floor space, and machinery are constant shares of revenue ($X_{nt}^T=P_{nt}^TY_{nt}^T$, and $X_{nt}^N=P_{nt}^N Y_{nt}^N$):

$$w_{nt} L_{nt}^T= \beta^L X_{nt}^T,  Q_{nt}H_{nt}^T = \beta^H X_{nt}^T,   r_{nt}M_{nt}^T=\beta^M X_{nt}^T \qquad(28-3)$$
$$ w_{nt} L_{nt}^N= \beta^L X_{nt}^N,  Q_{nt}H_{nt}^N = \beta^H X_{nt}^N,   r_{nt}M_{nt}^N=\beta^M X_{nt}^N \qquad(28-4)$$
where, $\beta^L+\beta^H+\beta^M=1$;     
$L_{nt}^T$ and $L_{nt}^N$ denote employment in the traded and non-traded sectors respectively;  
$X_{nt}^T$ and $X_{nt}^N$ correspond to revenue in the two sectors;   
$H_{nt}^T$ and $H_{nt}^N$ represent commercial floor space use in the two sectors;   
$M_{nt}^T$ and $M_{nt}^N$ are machinery inputs in the two sectors;   
$w_{nt}$ is wages;
$Q_{nt}$ is the price of floor space;
$r_{nt}$ is the common price of machinery, and $r_{nt}=r_t$.

Using equations in (28-3) to substitute for employment ($L_{nt}^T$), commercial floor space ($H_{nt}^T$), and machinery inputs($M_{nt}^T$) in traded sector production (28-1):
$$X_{nt}^T=P_{nt}^TY_{nt}^T$$
$$=P_{nt}^T A_{nt}^T (\frac{L_{nt}^T}{\beta^L} )^{\beta^L} (\frac{H_{nt}^T}{\beta^H} )^{\beta^H} (\frac{M_{nt}^T}{\beta^M} )^{\beta^M }$$
$$=P_{nt}^T A_{nt}^T(\frac{w_{nt}^{-1}\beta^L X_{nt}^T}{\beta^L} )^{\beta^L}(\frac{Q_{nt}^{-1}\beta^H X_{nt}^T}{\beta^H} )^{\beta^H}(\frac{r_{nt}^{-1}\beta^M X_{nt}^T}{\beta^M} )^{\beta^M }$$
$$=P_{nt}^T A_{nt}^T w_{nt}^{-\beta^L}Q_{nt}^{-\beta^H} r_{nt}^{-\beta^M}(X_{nt}^T)^{\beta^L+\beta^H+\beta^M}$$

cancle out $X_{nt}^T$ in both sides, and multiply both sides by $\frac{1}{A_{nt}^T} w_{nt}^{\beta^L}Q_{nt}^{\beta^H} r_{nt}^{\beta^M}$, can get 
$$P_{nt}^T=\frac{1}{A_{nt}^T} w_{nt}^{\beta^L}Q_{nt}^{\beta^H} r_{nt}^{\beta^M}$$
also, because $ P_{nt}^T = P_{t}^T$,and $r_{nt}=r_t$,
$$P_{t}^T=\frac{1}{A_{nt}^T} w_{nt}^{\beta^L}Q_{nt}^{\beta^H} r_{t}^{\beta^M} \qquad(G.12)$$

Doing the same process using (28-2) and (28-4), we can get the zero-profit condition for Non-traded sector for each location is:
$$P_{nt}^N=\frac{1}{A_{nt}^N} w_{nt}^{\beta^L}Q_{nt}^{\beta^H} r_{t}^{\beta^M} \qquad(G.13)$$
where, $0< \beta^L, \beta^H, \beta^M <1 $.

Re-arranging the traded zero-profit condition (G.12) to get expression for composite traded productivity:

$$P_{t}^T A_{nt}^T r_{t}^{-\beta^M}= w_{nt}^{\beta^L}Q_{nt}^{\beta^H} $$


##### Next, the authors use these additional assumptions on preferences, production technology and market structure in the residence choice probabilities in equation (7),to recover a composite measure of changes in amenities.

>Recall equation (7)
>the probability that a worker lives in residence $n \in N$, conditional on choosing a residence-workplace pair in Greater London:
$$\lambda_n^R = \frac{R_n}{L_N}=\frac{ \sum_{i \in N}(B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{ \sum_{k \in N}\sum_{l \in N} (B_{kl}w_l)^{\epsilon}(\kappa_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}} \qquad(7-1)$$

>the probability that a worker is employed in workplace $i \in N$, conditional on choosing a residence-workplace pair in Greater London:
$$ \lambda_n^L = \frac{L_i}{L_N}=\frac{ \sum_{n \in N}(B_{ni}w_i)^{\epsilon}(\kappa_{ni} P_n^\alpha Q_n^{1-\alpha})^{-\epsilon}}{  \sum_{k \in N}\sum_{l \in N}(B_{kl}w_l)^{\epsilon}(\kappa_{kl} P_k^\alpha Q_k^{1-\alpha})^{-\epsilon}} \qquad(7-2)$$


Substituting the price index for consumption goods ($P_{nt}$) from equation (27) into these residence choice probabilities:
$$\lambda_{nt}^R =\frac{ \sum_{l \in N}(B_{nlt}w_{lt})^{\epsilon}(k_{nlt} {(P_{nt}^T)}^{\alpha \nu} {(P_{nt}^N)}^{\alpha (1-\nu)}  Q_n^{1-\alpha})^{-\epsilon}}{ \sum_{k \in N}\sum_{l \in N} (B_{klt}w_{lt})^{\epsilon}(k_{klt} {(P_{kt}^T)}^{\alpha \nu} {(P_{kt}^N)}^{\alpha (1-\nu)} Q_{kt}^{1-\alpha})^{-\epsilon}} \qquad(G.16)$$

Using the assumption that the homogeneous traded good is costlessly traded ($P_{nt}^T = P_{t}^T$), (G.16) can be simplified to:

$$\lambda_{nt}^R =\frac{ \sum_{l \in N}(B_{nlt}w_{lt})^{\epsilon}(k_{nlt}  {(P_{nt}^N)}^{\alpha (1-\nu)}  Q_n^{1-\alpha})^{-\epsilon}}{ \sum_{k \in N}\sum_{l \in N} (B_{klt}w_{lt})^{\epsilon}(k_{klt} {(P_{kt}^N)}^{\alpha (1-\nu)} Q_{kt}^{1-\alpha})^{-\epsilon}} \qquad(G.17)$$

Using (G.13) to substitute for the price of the non-traded good ($P_{nt}^N$) into (G.17):

$$\lambda_{nt}^R =\frac{ \sum_{l \in N}(B_{nlt}w_{lt})^{\epsilon}(\kappa_{nlt}  {(\frac{1}{A_{nt}^N} w_{nt}^{\beta^L}Q_{nt}^{\beta^H} r_{t}^{\beta^M})}^{\alpha (1-\nu)}  Q_n^{1-\alpha})^{-\epsilon}}{ \sum_{k \in N}\sum_{l \in N} (B_{klt}w_{lt})^{\epsilon}(\kappa_{klt} {(\frac{1}{A_{kt}^N} w_{kt}^{\beta^L}Q_{kt}^{\beta^H} r_{t}^{\beta^M})}^{\alpha (1-\nu)} Q_{kt}^{1-\alpha})^{-\epsilon}}$$

$$=\frac{ \sum_{l \in N}B_{nlt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{nlt}^{-\epsilon}  {(A_{nt}^N)^{\epsilon \alpha (1-\nu)} w_{nt}^{-\epsilon \alpha (1-\nu) \beta^L}Q_{nt}^{-\epsilon [\alpha (1-\nu)\beta^H + (1-\alpha)]} r_{t}^{-\epsilon \alpha (1-\nu)\beta^M}} }{ \sum_{k \in N}\sum_{l \in N} B_{klt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{klt}^{-\epsilon} {(A_{kt}^N)^{\epsilon\alpha (1-\nu)} w_{kt}^{-\epsilon\alpha (1-\nu)\beta^L} Q_{kt}^{-\epsilon[\alpha (1-\nu)\beta^H)+(1-\alpha)]} r_{t}^{-\epsilon\alpha (1-\nu)\beta^M}} } $$


$$=\frac{ \sum_{l \in N}B_{nlt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{nlt}^{-\epsilon}  {(A_{nt}^N)^{\epsilon \alpha (1-\nu)} w_{nt}^{-\epsilon \alpha (1-\nu) \beta^L}Q_{nt}^{-\epsilon [\alpha (1-\nu)\beta^H + (1-\alpha)]} } }{ \sum_{k \in N}\sum_{l \in N} B_{klt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{klt}^{-\epsilon} {(A_{kt}^N)^{\epsilon\alpha (1-\nu)} w_{kt}^{-\epsilon\alpha (1-\nu)\beta^L} Q_{kt}^{-\epsilon[\alpha (1-\nu)\beta^H)+(1-\alpha)]} } }  \qquad(G.18)$$


re-arranging the zero-profit condition for the traded sector (G.12):
$$w_{nt}=[P_{t}^T A_{nt}^T Q_{nt}^{-\beta^H} r_{t}^{-\beta^M}]^{\frac{1}{\beta^L} } \qquad(G.12-1)$$

Using (G.12-1) to substitute for the wage by residence ($w_{nt}$ in the numerator and $w_{kt}$ in the denominator) in (G.18):

$$\lambda_{nt}^R=\frac{ \sum_{l \in N}B_{nlt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{nlt}^{-\epsilon}  {(A_{nt}^N)^{\epsilon \alpha (1-\nu)} {[P_{t}^T A_{nt}^T Q_{nt}^{-\beta^H} r_{t}^{-\beta^M}]^{\frac{-\epsilon \alpha (1-\nu) \beta^L}{\beta^L} }}Q_{nt}^{-\epsilon [\alpha (1-\nu)\beta^H + (1-\alpha)]} } }{ \sum_{k \in N}\sum_{l \in N} B_{klt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{klt}^{-\epsilon} {(A_{kt}^N)^{\epsilon\alpha (1-\nu)} {[P_{t}^T A_{kt}^T Q_{kt}^{-\beta^H} r_{t}^{-\beta^M}]^{\frac{-\epsilon\alpha (1-\nu)\beta^L}{\beta^L} }} Q_{kt}^{-\epsilon[\alpha (1-\nu)\beta^H)+(1-\alpha)]} } }$$

$$=\frac{ \sum_{l \in N}B_{nlt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{nlt}^{-\epsilon}  {(A_{nt}^N)^{\epsilon \alpha (1-\nu)} {(P_{t}^T)}^{-\epsilon \alpha (1-\nu)  } (A_{nt}^T)^{-\epsilon \alpha (1-\nu)  } Q_{nt}^{\epsilon \alpha (1-\nu)\beta^H} r_{t}^{\epsilon \alpha (1-\nu)\beta^M}Q_{nt}^{-\epsilon [\alpha (1-\nu)\beta^H + (1-\alpha)]} } }{\sum_{k \in N}\sum_{l \in N} B_{klt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{klt}^{-\epsilon} {(A_{kt}^N)^{\epsilon\alpha (1-\nu)} (P_{t}^T)^{-\epsilon \alpha (1-\nu) } (A_{kt}^T)^{-\epsilon \alpha (1-\nu) } Q_{kt}^{\epsilon \alpha (1-\nu) \beta^H} r_{t}^{\epsilon \alpha (1-\nu) \beta^M}}Q_{kt}^{-\epsilon[\alpha (1-\nu)\beta^H)+(1-\alpha)]}}$$

$$=\frac{ \sum_{l \in N}B_{nlt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{nlt}^{-\epsilon}  (A_{nt}^N)^{\epsilon \alpha (1-\nu)}  (A_{nt}^T)^{-\epsilon \alpha (1-\nu)  } Q_{nt}^{-\epsilon (1-\alpha)} }{\sum_{k \in N}\sum_{l \in N} B_{klt}^{\epsilon}w_{lt}^{\epsilon}\kappa_{klt}^{-\epsilon} (A_{kt}^N)^{\epsilon\alpha (1-\nu)}  (A_{kt}^T)^{-\epsilon \alpha (1-\nu) }  Q_{kt}^{-\epsilon(1-\alpha)}} \qquad(G.19)$$


Using equation (5): $ B_{nit} = B_{nt}^R B_{it}^L B_{nit}^I $ to decompose bilateral amenities ($B_{nit}$)in (G.19)

Defining a measure of residents’ commuting market access ($RMA_n$) as:

$$RMA_{nt} \equiv  [\sum_{l \in N} (B_{lt}^L B_{nlt}^I)^{\epsilon }w_{lt}^{\epsilon } \kappa_{nlt}^{-\epsilon } ]^{\frac{1}{\epsilon } } \qquad(G.21)$$


Notes: The baseline year of $t=1921$, and $\tau = 1831 <t$;   
The authors use equation (29) to solve for a unique vector of changes in composite amenities $\hat{\tilde{B}}_{nt}$ up to a normalization or choice of units.




<!--

>#### **Model-Based Decompositions**
In this section, the authors use these solutions for the supply of the floor space, productivity and amenities to decompose the observed reorganization of economic activity in Greater London into the contributions of changes in commuting costs and changes in each of these other determinants of economic activity.

-->

>#### **VII.C. Agglomeration Forces**
In this section, the authors separate changes in productivity and amenities into the contributions of agglomeration forces and changes in locational fundamentals.

##### The authors assume that composite traded productivity $\tilde{A}_{nt}^T$ depends on production fundamentals and production externalities.


Production externalities are assumed to be a constant elasticity function of workplace employment density ($\frac{L_{nt}}{K_n}$);  
$K_n$ is geographical land area;     
$\eta^L$ is production elasticity; 
The authors focus on a borough’s own workplace employment density.

##### The authors assume that composite residential amenities $\tilde{B}_{nt}$ depend on residential fundamentals and residential externalities.


Residential externalities are assumed to be a constant elasticity function of residence employment density ($\frac{R_{nt}}{K_n}$);    
$\eta^R$ is residential elasticity;    
The authors focus on a borough’s own residence employment density.

differencing between an earlier year $\tau < t$ and the baseline year of $t = 1921$:

$$\eta^L  ln L_{n \tau}- \eta^L  ln L_{n t} + ln a_{n \tau}- ln a_{nt}$$


>##### A key challenge in estimating the strength of agglomeration forces ($\varsigma^L,\varsigma^R $) in equations (30) and (31) is that workplace and residence employment are endogenous to productivity and amenities. 

To address this challenge, the authors use the quasi-experimental variation from the invention of the steam railway. In particular, the authors estimate equations (30) and (31) using 2SLS, instrumenting the log changes in workplace and residence employment with indicator variables for 5 km distance grid cells from the Guildhall, where the excluded category is locations more than 20 km away.

Table II reports the estimation results: columns (1) and (2) report the results using OLS; columns (3) and (4) show the results using 2SLS. IV estimates are smaller than OLS estimates

There is an upward bias in the estimated residential elasticity ($\eta^R$) and an upward bias in the estimated production elasticity ($\eta^L$) using OLS.

![](https://raw.githubusercontent.com/Li-Shen-Clark/image/main/table2.png)





### VIII. Counterfactuals
*****

##### We undertake these counterfactuals under a range of alternative assumptions about the floor space supply elasticity ($\mu$) and the strength of agglomeration forces ($\eta ^{L},\eta ^{R}$).

>##### Given a change in commuting costs ($\hat {\kappa}_ {n i t}^{-\epsilon}$) from the removal of parts of the railway network and the observed values of variables ($\tilde Q_{nt}, \lambda_ {nt}^L, \lambda_ {nt}^R, \overline L_ t, \lambda_ {n i t \mid n}^{R}, \lambda_ {nit}, w_ {it}$) in our initial equilibrium in year $t = 1921$, we solve for counterfactual changes in the following five endogenous variables: 
>
> (i) the workplace choice probability ($\hat \lambda_ {nt}^L$); 
> 
> (ii) the residence choice probability ($\hat \lambda_ {nt}^R)$;
> 
> (iii) the price of floor space ($\hat Q_ {nt}$);
> 
> (iv) the wage ( $\hat w_ {nt}$);
> 
> (v) total city employment ($\hat L_{\tilde N t}$).

##### These five endogenous variables solve the following system of five equations for the general equilibrium of the model: 

>(i) the land market clearing condition (H.1): 


$$
\hat {\tilde Q}_ {nt} \tilde Q_ {nt}=\hat Q_ {nt}^{1+\mu} \tilde Q_ {nt}=  \left(1- \alpha \right)\left[ \sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{{\sum_ {\ell \in N}} \lambda_ {n \ell \tau \mid n}^{R}\hat{w} _ {\ell t}^{\epsilon} \hat{\kappa} _ {n \ell t}^{-\epsilon}} \hat{w} _ {i t} w_ {i t}\right]   \hat R_ {n t} R_ {n t} +\frac{\beta^H}{\beta^L}{\hat w}_ {n t} {w}_ {n t} \hat L_ {n t} L_{n t}
$$
$$
= \left(1- \alpha \right)\left[ \sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{{\sum_ {\ell \in N}} \lambda_ {n \ell \tau \mid n}^{R}\hat{w} _ {\ell t}^{\epsilon} \hat{\kappa} _ {n \ell t}^{-\epsilon}} \hat{w} _ {i t} w_ {i t}\right]   \hat \lambda_ {n t}^{R}  \hat {\bar {L}}\lambda_ {n t}^{R}{\bar {L}} +\frac{\beta^H}{\beta^L}{\hat w}_ {n t} {w}_ {n t} \hat \lambda_ {n t}^{L}  \hat {\bar {L}} \lambda_ {n t}^{L} {\bar {L}}
$$
$$
=\left(  \left(1- \alpha \right)\left[ \sum_ {i \in N} \frac{\lambda_ {n i t \mid n}^{R} \hat{w}_ {i t}^{\epsilon} \hat{\kappa}_ {n i t}^{-\epsilon}}{{\sum_ {\ell \in N}} \lambda_ {n \ell \tau \mid n}^{R}\hat{w} _ {\ell t}^{\epsilon} \hat{\kappa} _ {n \ell t}^{-\epsilon}} \hat{w} _ {i t} w_ {i t}\right]   \hat \lambda_ {n t}^{R} \lambda_ {n t}^{R} +\frac{\beta^H}{\beta^L}{\hat w}_ {n t} {w}_ {n t} \hat \lambda_ {n t}^{L} \lambda_ {n t}^{L} \right) \hat {\bar {L}}{\bar {L}}\qquad(H.1)
$$
where recall that $ \hat x_t = \frac{x_{\tau}}{x_t} $; 
we have used $ \hat {\tilde Q}_ {nt} = \hat Q_{nt} \hat H_{nt} = \hat Q_{nt}^{1+\mu} $ ; 
Note that we assume that the homogeneous traded good is costlessly traded:
$$
P_{n t}^{T}=P_{t}^{T}, \forall n \in N
$$

>(ii) the zero-profit condition (H.2):

$$
\hat Q_ {nt}=\frac {Q_ {n \tau}}{Q_{n t}}
=\left( \frac{{\tilde A} _ {n \tau} ^T}{{\tilde A} _ {nt} ^T}\right)^{\frac {1}{\beta^H}}\frac{{w} _ {n \tau}}{{w} _ {n t}}^{\frac {-\beta ^L}{\beta^H}}
=\left( \hat {\tilde A} _ {nt} ^T\right)^{\frac {1}{\beta^H}}\hat{w} _ {n t}^{\frac {-\beta ^L}{\beta^H}} \qquad(H.2)
$$



> (iii) the workplace choice probability (H.3): 

$$ \hat{\lambda}_ {n t}^{L}\lambda_ {nt}^L 
=\frac{\sum_ {i \in N} \lambda_ {i n t} \hat{B}_ {i n t}^{\epsilon} \hat{w}_ {n t}^{\epsilon} \hat{\kappa}_ {i n t}^{-\epsilon} \hat{Q}_ {i t}^{-\epsilon \left(1-\alpha \right)}}{\sum_ {k \in N} \sum_ {\ell \in N} \lambda_ {k \ell t} \hat{B}_ {k \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {k \ell t}^{-\epsilon} \hat{Q}_ {k t}^{-\epsilon \left(1-\alpha \right)}}\qquad(H.3)
$$


> (iv)the residence choice probability (H.4): 



$$
\hat{\lambda}_ {n t}^{R} \lambda_ {n t}^{R}=\frac{\lambda_ { n \ell t} \hat{B}_ {n \ell t}^{\epsilon} \hat{Q}_ {n t}^{-\epsilon \left(1-\alpha \right)}\widehat{RMA}^{\epsilon}}{\sum_ {k \in N}  \lambda_ {k \ell t} \hat{B}_ {k \ell t}^{\epsilon} \hat{Q}_ {k t}^{-\epsilon \left(1-\alpha \right)}\widehat{RMA}^{\epsilon}}
$$

$$
=\frac{\sum_ {\ell \in N} \lambda_ { n \ell t} \hat{B}_ {n \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ { n \ell t}^{-\epsilon} \hat{Q}_ {n t}^{-\epsilon \left(1-\alpha \right)}}{\sum_ {k \in N} \sum_ {\ell \in N} \lambda_ {k \ell t} \hat{B}_ {k \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {k \ell t}^{-\epsilon} \hat{Q}_ {k t}^{-\epsilon \left(1-\alpha \right)}}\qquad(H.4)
$$

> (v) the population mobility condition (H.5):

$$
\frac{\hat{L}_ {N t} L_ {N t}}{L_ {Mt}}=\frac{L_ {N \tau}}{L_ {Mt}}
$$
$$
=\frac{\sum_{k \in N} \sum_{\ell \in N}\left(B_{k \ell \tau} w_{\ell \tau}\right)^{\epsilon}\left(\kappa_{k \ell \tau} P_{k \tau}^{\alpha} Q_{k \tau}^{1-\alpha}\right)^{-\epsilon}}{\sum_{n \in M} \sum_{i \in M}\left(B_{nit} w_{it}\right)^{\epsilon}\left(\kappa_{nit} P_{nt}^{\alpha} Q_{nt}^{1-\alpha}\right)^{-\epsilon}}
$$
$$
=\frac{ \sum_ {k \in N} \sum_ {\ell \in N}  \hat{B}_ {k \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {k \ell t}^{-\epsilon}  \hat{P}_ {k t}^{-\epsilon \alpha  } \hat{Q}_ {k t}^{-\epsilon \left(1-\alpha \right)} {B}_ {k \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {k \ell t}^{-\epsilon} {P}_ {k t}^{-\epsilon \alpha  }{Q}_ {k t}^{-\epsilon(1-\alpha)}}{ \sum_{n \in M} \sum_{i \in M}\left(B_{nit} w_{it}\right)^{\epsilon}\left(\kappa_{nit} {P}_ {n t}Q_{nt}^{1-\alpha}\right)^{-\epsilon}} 
$$
$$
=\sum_ {k \in N} \sum_ {\ell \in N} \hat{B}_ {k \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {k \ell t}^{-\epsilon}   \hat{P}_ {k t}^{-\epsilon \alpha  } \hat{Q}_ {k t}^{-\epsilon \left(1-\alpha \right)} \frac{{B}_ {k \ell t}^{\epsilon} {w}_ {\ell t}^{\epsilon} {\kappa}_ {k \ell t}^{-\epsilon} {P}_ {k t}^{-\epsilon \alpha  } {Q}_ {k t}^{-\epsilon(1-\alpha)} }{\sum_{n \in M} \sum_{i \in M}\left(B_{nit} w_{it}\right)^{\epsilon}\left(\kappa_{nit} {P}_ {n t} Q_{nt}^{1-\alpha}\right)^{-\epsilon}} 
$$
$$
=\sum_ {k \in N} \sum_ {\ell \in N} \lambda_ {k \ell t} \hat{B}_ {k \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {k \ell t}^{-\epsilon} \hat{P}_ {k t}^{-\epsilon \alpha  } \hat{Q}_ {k t}^{-\epsilon(1-\alpha)}
$$


So we have
$$
\left(\frac{\hat{L}_ {N t} L_ {N t}}{L_ {Mt}}\right)^{\frac{1}{\epsilon}}=\left[\sum_ {k \in N} \sum_ {\ell \in N} \lambda_ {k \ell t} \hat{B}_ {k \ell t}^{\epsilon} \hat{w}_ {\ell t}^{\epsilon} \hat{\kappa}_ {k \ell t}^{-\epsilon} \hat{Q}_ {k t}^{-\epsilon(1-\alpha)}\right]^{\frac{1}{\epsilon}}\qquad(H.5)
$$







and we hold total employment and expected utility in the economy as a whole constant ($\hat L_{Mt} = 1$) and ($\hat {\tilde{ U}}_ t = 1$). 
> According to 

$$
ln \hat{B}_ {n t}=\varsigma^{R}+\eta^{R} ln \hat{R}_ {n t}+ln \hat{b}_ {n t}
$$

$$
ln \hat{A}_ {n t}^{T}=\varsigma^{L}+\eta^{L} ln \hat{L}_ {n t}+ln \hat{a}_ {n t}
$$

the relative changes in composite traded productivity($\hat A_ {nt}^T $) and composite amenities ($\hat B_ {nt}^T$) satisfy:
$$
\hat A_ {nt}^T = \hat L_ {t}^{{\eta}^L} \qquad(H.6)
$$

$$
\hat B_ {nt}^T = \hat R_ {t}^{{\eta}^R} \qquad(H.7)
$$

where we hold production and residential fundamentals constant ($\hat a_ {nt} = 1$ and $\hat b_ {nt} = 1$).




<!---
Proposition $H.1$ 
Assume exogenous, finite and strictly positive location characteristics ($P_ t \in \left(0,\infty \right), A_ {nt}\in (0,\infty ),B_ {nit} \in (0,\infty ) \times (0,\infty ) , \kappa_ {nit} \in (0,\infty ) \times (0,\infty ), H_ {nt} = H_n \in (0,\infty )$), which corresponds to $\eta ^L = \eta ^R = \mu = 0$.
Under these assumptions, there exists a unique general equilibrium vector of four variables in each location ( $\lambda_ {nt}^L, \lambda_ {nt}^R, Q_ {nt}, w_ {nt}$) and the scalar ($L_ {Nt}$), given expected utility ($ \bar U_ t$) and total employment ($L_{Mt}$) in the wider economy.



Proof. Assume exogenous, finite and strictly positive location characteristics ($P_ t \in \left(0,\infty \right), A_ {nt}\in (0,\infty ),B_ {nit} \in (0,\infty ) \times (0,\infty ) , \kappa_ {nit} \in (0,\infty ) \times (0,\infty ), H_ {nt} = H_ n = h_{Kn}\in (0,\infty )$), which corresponds to $\eta ^L = \eta ^R = \mu = 0$.
Under these assumptions, all locations are incompletely specialized as both workplaces and residences, because the support of the Fr´echet distribution for idiosyncratic amenities is unbounded from above. Using the probability of residing in a location (equation (7) for $\lambda_ {nt}^R$), the probability of working in a location (equation (7) for $\lambda_{nt}^L$), the zero-profit condition in equation (28) in the paper, and the population mobility condition between the city and the larger economy in equation (9) in the paper, the fraction of workers residing in location n can be written as:


$$
\lambda_ {n t}^{R}=\frac{R_ {n t}}{L_ {N t}}=\left(\frac{\vartheta}{\bar{U}_ {t}}\right)^{\epsilon}\left(\frac{L_ {M t}}{L_ {N t}}\right) \sum_ {\ell \in N} B_ {n \ell t}^{\epsilon} P_ {t}^{\frac{\epsilon} {\beta^{L}}-\epsilon \alpha} A_ {\ell t}^{\frac{\epsilon} {\beta^{L}}} \kappa_ {n \ell t}^{-\epsilon} Q_ {\ell t}^{\frac{-\epsilon \beta^{H}}{  \beta^{L}}} Q_{n t}^{-\epsilon \left(1-\alpha \right)}
$$
while the fraction of workers employed in location n can be written as:
$$
\lambda_ {n t}^{L}=\frac{L_ {n t}}{L_ {N t}}=\left(\frac{\vartheta}{\bar{U}_ {t}}\right)^{\epsilon}\left(\frac{L_ {M t}}{L_ {N t}}\right) \sum_ {k \in N} B_ {k n  t}^{\epsilon} P_ {t}^{\frac{\epsilon} {\beta^{L}}-\epsilon \alpha} A_ {n t}^{\frac{\epsilon} {\beta^{L}}-\epsilon} \kappa_ {k n  t}^{-\epsilon} Q_ {n t}^{\frac{-\epsilon \beta^{H}}{  \beta^{L}}} Q_{k t}^{-\epsilon \left(1-\alpha \right)}
$$


and expected worker income conditional on residing in block $i$ from equation (15) in the paper can be written as:

$$
v_{n t}=\sum_{i \in N} \frac{B_ {n i t}^{\epsilon} A_ {i t}^{\frac{\epsilon} { \beta^{L}}} \kappa_ {n i t}^{-\epsilon} Q_ {i t}^{\frac{-\epsilon \beta^{H}} { \beta^{L}}}}{\sum_ {\ell \in N} B_ {n \ell t}^{\epsilon} A_ {\ell t}^{\frac{\epsilon} { \beta^{L}}} \kappa_ {n \ell t}^{-\epsilon} Q_ {\ell t}^{\frac{-\epsilon \beta^{H}} { \beta^{L}}}}\left[P_ {t}^{\frac{1}{ \beta^{L}}} A_ {i t}^{\frac{1}{ \beta^{L}}} Q_{i t}^{\frac{-\beta^{H}} { \beta^{L}}}\right]
$$

and the land market clearing condition from equation (16) in the paper can be written as:
$$
\left(\frac{\beta^{H}}{\beta^{L}}\right) \frac{w_ {n t} \lambda_ {n t}^{L}}{Q_ {n t}}+(1-\alpha) \frac{v_ {n t} \lambda_ {n t}^{R}}{Q_ {n t}}=\frac{h K_ {n}}{L_{\mathrm{N} t}}
$$
Combining the above relationships, this land market clearing condition can be re-expressed as:
$$
D_ {n t}\left(\boldsymbol{Q}_ {t}\right)=\frac{\beta^{H}}{\beta^{L}}\left[\frac{P_ {t}^{\frac{1}{  \beta^{L}}} A_ {n t}^{\frac{1}{  \beta^{L}}}}{Q_ {n t}^{\frac{1+\beta^{H}}{  \beta^{L}}}}\right]\left[\sum_ {k \in N} \frac{B_ {k n t}^{\epsilon} P_ {t}^{\frac{\epsilon} { \beta^{L}}}-\epsilon \alpha_ {t} A_ {n t}^{\frac{\epsilon} { \beta^{L}}} \kappa_ {k n t}^{-\epsilon}}{Q_ {n t}^{\frac{\epsilon \beta^{H}} {\beta^{L}}} Q_{k t}^{\epsilon(1-\alpha)}}\right]
$$
$$
+\frac{1-\alpha}{Q_ {n t}}\left[\sum_ {i \in N}\left(\frac{B_ {n i t}^{\epsilon} A_ {i t}^{\frac{\epsilon} { \beta^{L}}} \kappa_ {n i t}^{-\epsilon} Q_ {i t}^{\frac{-\epsilon \beta^{H}} { \beta^{L}}}}{\sum_ {\ell \in N} B_ {n \ell t}^{\epsilon} A_ {\ell t}^{\frac{\epsilon} { \beta^{L}}} \kappa_ {n \ell t}^{-\epsilon} Q_ {\ell t}^{\frac{-\epsilon \beta^{H}} { \beta^{L}}}}\right) \frac{P_ {t}^{\frac{1}{  \beta^{L}}} A_ {i t}^{\frac{1}{  \beta^{L}}}}{Q_ {i t}^{\frac{{\beta^{H}} }{ \beta^{L}}}}\right]\left[\sum_ {\ell \in N} \frac{B_ {n \ell t}^{\epsilon} P_ {t}^{\epsilon / \beta^{L}}-\epsilon \alpha_{\ell t} A_{\ell t}^{\epsilon / \beta^{L}} \kappa_{n \ell t}^{-\epsilon}}{Q_{\ell t}^{\epsilon \beta^{H} / \beta^{L}} Q_{n t}^{\epsilon(1-\alpha)}}\right]=h K_{n}
$$

for all $n \in N$, where we have chosen units in which to measure utility such that $\frac{{\frac{\vartheta}{\bar{U}_ {t}}}^{\epsilon}}{L_ {Mt}} = 1$ for a given year $t$. The above land market clearing condition provides a system of equations for the N boroughs in terms of the $N$ unknown floor space prices $Q_{nt}$, which has the following properties:

$$\lim_ {Q_ {nt} \rightarrow 0}D_ {nt} \left( \boldsymbol{Q_ t}\right) = \infty >hK_ n,\lim_ {Q_ {nt} \rightarrow \infty}D_ {nt} \left( \boldsymbol{Q_ t}\right) =0 < hK_n$$
$$
 \frac {dD_ {nt}\left( \boldsymbol{Q_ t}\right)}{  dQ_ {nt}} < 0, \frac {dD_ {nt}\left( \boldsymbol{Q_ t}\right)}{  dQ_ {it}} < 0 , \vert \frac {dD_ {nt}\left( \boldsymbol{Q_ t}\right)}{  dQ_ {nt}}\vert > \vert \frac {dD_ {nt}\left( \boldsymbol{Q_ t}\right)}{  dQ_{it}} \vert$$
 
 
It follows that there exists a unique vector of floor space prices $ \boldsymbol{Q_ t}$ that solves this system of land market clearing conditions. Having solved for the vector of floor space prices ($ \boldsymbol{Q_ t}$), the vector of wages $\boldsymbol{w_ t}$ follows immediately from the zero-profit condition for production in equation (28) in the paper. Given floor space prices ($ \boldsymbol{Q_ t}$) and wages ($\boldsymbol{w_ t}$), the probability of residing in a location ($\boldsymbol{\lambda_ t^R}$) follows immediately from equation (7) in the paper, and the probability of working in a location ($\boldsymbol{\lambda_t^L}$) follows immediately from equation (7) in the paper. Having solved for ($\boldsymbol{\lambda_t^L}, \boldsymbol{\lambda_ t^R}, \boldsymbol{Q_ t} , \boldsymbol{w_ t}$),the total measure of workers residing in the city can be recovered from our choice of units in which to measure utility($ \frac{{\frac{\vartheta}{\bar{U}_ {t}}}^{\epsilon}}{L_ {Mt}} = 1$ ) for our given year $t$, which together with the population mobility condition in equation (9) in the paper implies:

$$
L_ {N t}=\left[\sum_ {k \in N} \sum_ {\ell \in N} B_ {k \ell t}^{\epsilon} P_ {t}^{\frac{\epsilon}{  \beta^{L}}-\epsilon \alpha} A_ {\ell t}^{\frac{\epsilon} { \beta^{L}}} \kappa_ {k \ell t}^{-\epsilon} Q_ {\ell t}^{\frac{-\epsilon \beta^{H}}{  \beta^{L}}} Q_{k t}^{-\epsilon(1-\alpha)}\right]
$$

We therefore obtain $ \boldsymbol{L_ t}=\boldsymbol{\lambda ^L_ t }L_ {Nt}$ and $ \boldsymbol{R_ t}=\boldsymbol{\lambda ^R_ t }L_ {Nt}$. This completes the determination of the equilibrium vector ($\boldsymbol{\lambda_t^L}, \boldsymbol{\lambda_ t^R},L_ {Nt}, \boldsymbol{Q_ t} , \boldsymbol{w_ t}$)
--->

>#### Ccounterfactual Predictions for Removing Entire Railway Network and Underground Railway Network

##### In Figure IX, they display the model’s counterfactual predictions for removing the entire railway network (left panels) and the underground railway network (right panels). Because the first underground line was built in 1863, the counterfactuals in the right panels are flat before 1861. We report results for net commuting into the City of London in the top two panels, the total population of Greater London in the middle two panels, and total rateable values in Greater London in the bottom two panels. 

* ##### “Baseline” shows the values of variables from our baseline quantitative analysis from Section VI; 
* #####  “Inelastic No Agglom” shows the values of variables from our counterfactual with a perfectly inelastic supply of floor space and exogenous productivity and amenities ($\mu = \eta ^L = \eta ^R = 0$); 
* #####  “Elastic No Agglom” shows the values of variables from our counterfactual using our calibrated floor space supply elasticity and exogenous productivity and amenities ($\mu =1.83 , \eta ^L = \eta ^R = 0$); 
* ##### “Elastic Prod Agglom” shows the values of variables from our counterfactual using our calibrated floor space supply elasticity, estimated production agglomeration forces, and exogenous amenities ($\mu =1.83 , \eta ^L = 0.086, and  \eta ^R = 0$); 
* #####  “Elastic Prod + Amen Agglom” shows the values of variables from our counterfactual using our calibrated floor space supply elasticity and estimated production and residential agglomeration forces ($\mu =1.83 , \eta ^L = 0.086, and  \eta ^R = 0.172$).

![1](https://user-images.githubusercontent.com/91390400/142923188-4cf83fb0-dbc8-4a21-b7cb-cc773665a4ff.png)
![2](https://user-images.githubusercontent.com/91390400/142923199-4e6316e1-3325-4ac8-82ac-2ae48322457b.png)
![3](https://user-images.githubusercontent.com/91390400/142923202-6aca0586-bb72-47e8-b1ad-7c934e37c933.png)





>#### Results of Comparisons of Economic Impact of Removal of Railway Network with Its Construction Costs

##### In Table III, we report the results of these comparisons of the economic impact of the removal of the railway network with its construction costs. In the top panel, we remove the entire railway network. In the middle panel, we eliminate only the underground railway network. In the bottom panel, we examine the extent to which there were diminishing returns to the construction of the railway network by only removing overground and underground railway lines constructed in the final decade of our sample, from 1911–1921.

![4](https://user-images.githubusercontent.com/91390400/142923875-c022f34a-bece-4186-a607-185ba2c03971.png)
![5](https://user-images.githubusercontent.com/91390400/142923237-2eef42fd-56f4-4af2-b5a1-6f4888441239.png)
![6](https://user-images.githubusercontent.com/91390400/142923246-f73eda29-3fb5-45ef-9082-0533e690479b.png)
![7](https://user-images.githubusercontent.com/91390400/142923255-75e9cad1-c634-478f-ab0c-aeec4d6724d9.png)
![8](https://user-images.githubusercontent.com/91390400/142923262-2bea26c4-6c97-4b78-a455-447fbc123e30.png)
![9](https://user-images.githubusercontent.com/91390400/142923267-ef293898-5c1e-4c44-a872-3b7ae30afcd2.png)

##### As shown in Table III, regardless of whether we assume a 3% or 5% discount rate, and irrespective of whether we consider the entire railway network (top panel) or only the underground railway network (middle panel), we find ratios of reductions in the net present value of rateable values to construction costs that are substantially greater than 1. 


### IX. Conclusions
*****
##### The authors use the natural experiment of the invention of the steam railway to provide evidence on the role of modern transport technologies in underpinning the concentration of economic activity in large metropolitan areas. The key idea underlying our approach is that a reduction in commuting costs facilitates an increased separation of workplace and residence. In particular, the hub-and spoke structure of the railway disproportionately reduced commuting costs into central locations. If these central locations have high productivity relative to amenities compared with the suburbs, this transport improvement leads them to specialize as a workplace while the suburbs specialize as a residence. In the presence of agglomeration forces, this increased concentration of workers in the center and residents in the suburbs further reinforces these differences in productivity and amenities across locations.

##### This paper first provides evidence for simplified analysis of the mechanism: 1. With the construction of the railway network, the population of London decreased while that of the suburbs increased; 2. The decline in the population of The City of London combined with the increase in employment; 3. The professional shift from residential to workplace has made the City of London a relatively valuable area. Other metropolitan areas showed the same pattern of results as transportation improved in the 19th century. Using parochial level data for London, this paper found no deviation between population growth and parochial time trends prior to railway arrival, nor evidence of significant deviation from trends after railway arrival.

##### To further explain the results, the authors established a set of urban spatial structure model which satisfies the gravity equation of commuting flow and has a fixed ratio between labor income and ground space payment. Although only observed in the sample of 1921 bilateral commuting data, the author still show that the framework can be used to estimate all the way back to the early 19th century, the influence of the rail network it has successfully captured since the middle of the 19th century London city population sharply divided between day and night, and copy the early commuting in the data the characteristics of most people living near their workplace. In addition, this paper combines the traditional city model with this model, and uses a series of identification conditions to estimate the agglomeration effect of production and residence. In a counterfactual analysis of the removal of the rail network, the authors also found that changes in commuting costs alone explained most of the observed segregation. Behind, based on the supply and productivity for the ground space and amenities of different assumptions, further investigates the net for London commuter railway construction to the total population, population changes in the rateable value, finally has carried on the cost-benefit analysis, emphasizes the railway network construction for the important role of London's economic development cannot be ignored.
