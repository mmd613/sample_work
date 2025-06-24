*****Research: Racialized Incorporation in Old and New Destinations******
*****Researchers: Mario Mercado-Diaz*****

//////Do File. Author: MMD\\\\\\
***This do file has been created to write out the codes that will be used to clean data. This builds on the past findings of the Puerto Rican
***paper to include Mexican migrants. This analysis compares the integration of Puerto Rican and Mexican migrants by destination type**

clear all

set maxvar 32000
set more off


use "/Users/mariomercadodiaz/Documents/PRMig/PRMEX/Data/usa_00027.dta"

***Limiting sample to people 18 or older***SAMPLE LIMITED TO THIS. SAVED!!!!***
drop if age<=17
tab age

***Limiting sample to people who are not active in the armed forces***
drop if empstatd==14 | empstatd==15
tab empstatd

save "/Users/mariomercadodiaz/Documents/PRMig/PRMEX/Data/prmx.dta"

///Recoding vaiables\\\

//Puerto Rico destination variables: The focus of this paper is on Puerto Ricans. It asks the question: Are Puerto Ricans doing better in old v. new destination
//when compared to Mexican migrants moving there.\\
{
//Puerto Rican-born: New v. Other Destination: Metro areas that have had a positive percent increase between 2000 and 2015 in the Puerto Rican 
//population that are not established destinations and are not prominent military bases. This includes places that had 0 pop. in 2000 and some pop. 
///in 2015. 


tab met2013

gen prnewdest=. 
	replace prnewdest=1 if met2013==11700 | met2013==14020 | met2013==16620 | met2013==17860 | met2013==19780 | met2013==22500 ///
	| met2013==25500 | met2013==26140 | met2013==27060 | met2013==27140 | met2013==29100 | met2013==30620 | met2013==33780 ///
	| met2013==34820 | met2013==36220 | met2013==40220 | met2013==42680 | met2013==43100 | met2013==45820 | met2013==48900 ///
	| met2013==26380 | met2013==14010 | met2013==19460 | met2013==25860 | met2013==30700 | met2013==20940 | met2013==11500 ///
	| met2013==49180 | met2013==16700 | met2013==31340 | met2013==25060 | met2013==39900 | met2013==29460 | met2013==19300 ///
	| met2013==38860 | met2013==28020 | met2013==27900 | met2013==39580 | met2013==34060 | met2013==42540 | met2013==24140 ///
	| met2013==45780 | met2013==15500 | met2013==36500 | met2013==40980 | met2013==23460 | met2013==17140 | met2013==33740 ///
	| met2013==39140 | met2013==27780 | met2013==24660 | met2013==16740 | met2013==42020 | met2013==32580 | met2013==38340 ///
	| met2013==14260 | met2013==15940 | met2013==11460 | met2013==41660 | met2013==35840 | met2013==22220 | met2013==45060 ///
	| met2013==19100 | met2013==12220 | met2013==41700 | met2013==19660 | met2013==49700 | met2013==49660 | met2013==49620 ///
	| met2013==44220 | met2013==47380 | met2013==40060 | met2013==20700 | met2013==21140 | met2013==35980 | met2013==25420 ///
	| met2013==31460 | met2013==12940 | met2013==37340 | met2013==27260 | met2013==41540 | met2013==33140 | met2013==47260 ///
	| met2013==39380 | met2013==28940 | met2013==36100 | met2013==26900 | met2013==19740 | met2013==38900 | met2013==31140 ///
	| met2013==24340 | met2013==13140 | met2013==43900 | met2013==42660 | met2013==46540 | met2013==12420 | met2013==37100 ///
	| met2013==33460 | met2013==42220 | met2013==12060 | met2013==11100 | met2013==18140 | met2013==33660 | met2013==34940 ///
	| met2013==24780 | met2013==16580 | met2013==29820 | met2013==14740 | met2013==12580 | met2013==34740 | met2013==41620 ///
	| met2013==32820 | met2013==15180 | met2013==21500 | met2013==47900 | met2013==34980 | met2013==38300 | met2013==40420 ///
	| met2013==22180 | met2013==20100 | met2013==38940 | met2013==38060 | met2013==41500 | met2013==33260 | met2013==24020 ///
	| met2013==23540 | met2013==10420 | met2013==10580 | met2013==31700 | met2013==15380 | met2013==39460 | met2013==29420 ///
	| met2013==46700 | met2013==26420 | met2013==13780 | met2013==23420 | met2013==30780 & (met2013!=0 | met2013!=.)
	
	replace prnewdest=0 if met2013!=11700 & met2013!=14020 & met2013!=16620 & met2013!=17860 & met2013!=19780 & met2013!=22500 ///
	& met2013!=25500 & met2013!=26140 & met2013!=27060 & met2013!=27140 & met2013!=29100 & met2013!=30620 & met2013!=33780 ///
	& met2013!=34820 & met2013!=36220 & met2013!=40220 & met2013!=42680 & met2013!=43100 & met2013!=45820 & met2013!=48900 ///
	& met2013!=26380 & met2013!=14010 & met2013!=19460 & met2013!=25860 & met2013!=30700 & met2013!=20940 & met2013!=11500 ///
	& met2013!=49180 & met2013!=16700 & met2013!=31340 & met2013!=25060 & met2013!=39900 & met2013!=29460 & met2013!=19300 ///
	& met2013!=38860 & met2013!=28020 & met2013!=27900 & met2013!=39580 & met2013!=34060 & met2013!=42540 & met2013!=24140 ///
	& met2013!=45780 & met2013!=15500 & met2013!=36500 & met2013!=40980 & met2013!=23460 & met2013!=17140 & met2013!=33740 ///
	& met2013!=39140 & met2013!=27780 & met2013!=24660 & met2013!=16740 & met2013!=42020 & met2013!=32580 & met2013!=38340 ///
	& met2013!=14260 & met2013!=15940 & met2013!=11460 & met2013!=41660 & met2013!=35840 & met2013!=22220 & met2013!=45060 ///
	& met2013!=19100 & met2013!=12220 & met2013!=41700 & met2013!=19660 & met2013!=49700 & met2013!=49660 & met2013!=49620 ///
	& met2013!=44220 & met2013!=47380 & met2013!=40060 & met2013!=20700 & met2013!=21140 & met2013!=35980 & met2013!=25420 ///
	& met2013!=31460 & met2013!=12940 & met2013!=37340 & met2013!=27260 & met2013!=41540 & met2013!=33140 & met2013!=47260 ///
	& met2013!=39380 & met2013!=28940 & met2013!=36100 & met2013!=26900 & met2013!=19740 & met2013!=38900 & met2013!=31140 ///
	& met2013!=24340 & met2013!=13140 & met2013!=43900 & met2013!=42660 & met2013!=46540 & met2013!=12420 & met2013!=37100 ///
	& met2013!=33460 & met2013!=42220 & met2013!=12060 & met2013!=11100 & met2013!=18140 & met2013!=33660 & met2013!=34940 ///
	& met2013!=24780 & met2013!=16580 & met2013!=29820 & met2013!=14740 & met2013!=12580 & met2013!=34740 & met2013!=41620 ///
	& met2013!=32820 & met2013!=15180 & met2013!=21500 & met2013!=47900 & met2013!=34980 & met2013!=38300 & met2013!=40420 ///
	& met2013!=22180 & met2013!=20100 & met2013!=38940 & met2013!=38060 & met2013!=41500 & met2013!=33260 & met2013!=24020 ///
	& met2013!=23540 & met2013!=10420 & met2013!=10580 & met2013!=31700 & met2013!=15380 & met2013!=39460 & met2013!=29420 ///
	& met2013!=46700 & met2013!=26420 & met2013!=13780 & met2013!=23420 & met2013!=30780 & met2013!=0 & met2013!=.


label variable prnewdest "Dummy Variable: New v. Other Destination"
label define prnewdestlabel 0"Other destination" 1"New destination"
label values prnewdest prnewdestlabel
		
tab prnewdest
tab met2013 if prnewdest==1
tab prnewdest if bpl==110 [fweight=perwt]
tab prnewdest if bpl==110 [fweight=perwt], m


//Puerto Rican-born: Established v. Other Destination: Established destinations\\

*****For established destinations, we created the dummy variable (prestdest). This variable included destinations that 
*****have had an above average (by each year) Island-born population for each decade since 1980. We used Iceland’s (2009) 
*****on shifting migrant gateways, where they classified established destinations in the same manner. Once we had a list 
*****of places, we cross-referenced this with literature on Puerto Rican migration, mainly Duany’s extensive research on 
*****Puerto Ricans in traditional and non-traditional destinations (2002, 2011). Since 2000 ACS dataset did not include met2013
*****variable, we classified as established location: allentown-bethlehem-easton, pa-nj; atlantic city-hammonton, nj
*****boston-cambridge-newton, ma-nh; bridgeport-stamford-norwalk, ct; chicago-naperville-elgin, il-in-wi cleveland-elyria, oh;
*****cape coral-fort myers, fl; hartford-west hartford-east hartford, ct; lancaster, pa; miami-fort lauderdale-west palm beach, fl
*****new haven-milford, ct; new york-newark-jersey city, ny-nj-pa; orlando-kissimmee-sanford, fl; providence-warwick, ri-ma
*****philadelphia-camden-wilmington, pa-nj-d; reading, pa; rochester, ny; springfield, ma; tampa-st. petersburg-clearwater, fl
*****trenton, nj; vineland-bridgeton, nj; worcester, ma-ct

gen prestdest=.
	replace prestdest=1 if met2013==10900 | met2013==12100 | met2013==14460 | met2013==14860 | met2013==16980 ///
		| met2013==17460 | met2013==15980 | met2013==25540 | met2013==29540 | met2013==33100 | met2013==35300 ///
		| met2013==35620 | met2013==36740 | met2013==39300 | met2013==37980 | met2013==39740 | met2013==40380 ///
		| met2013==44140 | met2013==45300 | met2013==45940 | met2013==47220 | met2013==49340 & (met2013!=0 | met2013!=.)

		
	replace prestdest=0 if met2013!=10900 & met2013!=12100 & met2013!=14460 & met2013!=14860 & met2013!=16980 ///
		& met2013!=17460 & met2013!=15980 & met2013!=25540 & met2013!=29540 & met2013!=33100 & met2013!=35300 ///
		& met2013!=35620 & met2013!=36740 & met2013!=39300 & met2013!=37980 & met2013!=39740 & met2013!=40380 ///
		& met2013!=44140 & met2013!=45300 & met2013!=45940 & met2013!=47220 & met2013!=49340 & met2013!=0 & met2013!=.

label variable prestdest "Dummy Variable: Established v. Other Destination"
label define prestdestlabel 0"Other destination" 1"Established destination"
label values prestdest prestdestlabel
		
tab prestdest
tab met2013 if prestdest==1
tab prestdest if bpl==110 [fweight=perwt]
tab prestdest if bpl==110 [fweight=perwt], m


//Puerto Rican-Born: Other destinations

******For other destinations, we assigned prothdest=1 for all other destinations that did not match the criteria of 
******new or established destinations. Meaning that these are places that are not established or new. This variable 
******also includes military bases. 

gen prothdest=.
	replace prothdest=1 if met2013==33340 | met2013==18580 | met2013==19820 | met2013==12540 | met2013==46520 ///
	| met2013==10740 | met2013==15540 | met2013==21340 | met2013==23580 | met2013==24860 | met2013==42100 ///
	| met2013==12260 | met2013==41940 | met2013==44700 | met2013==36420 | met2013==40140 | met2013==36540 ///
	| met2013==48620 | met2013==35380 | met2013==41740 | met2013==28140 | met2013==44060 | met2013==31080 ///
	| met2013==41860 | met2013==12700 | met2013==37860 | met2013==29620 | met2013==19380 | met2013==40900 ///
	| met2013==39540 | met2013==25260 | met2013==13380 | met2013==29180 | met2013==12620 | met2013==34900 ///
	| met2013==33860 | met2013==16860 | met2013==46060 | met2013==44180 | met2013==13820 | met2013==39820 ///
	| met2013==28100 | met2013==46340 | met2013==25940 | met2013==36140 | met2013==36260 | met2013==48660 ///
	| met2013==47300 | met2013==35660 | met2013==29700 | met2013==42200 | met2013==22660 | met2013==23060 ///
	| met2013==43340 | met2013==17020 | met2013==21660 | met2013==33700 | met2013==10780 | met2013==11020 ///
	| met2013==12020 | met2013==12980 | met2013==13460 | met2013==13980 | met2013==19340 | met2013==19500 ///
	| met2013==20500 | met2013==20740 | met2013==21060 | met2013==22380 | met2013==22420 | met2013==22520 ///
	| met2013==24300 | met2013==24540 | met2013==27100 | met2013==27180 | met2013==27340 | met2013==27500 ///
	| met2013==28420 | met2013==28700 | met2013==29340 | met2013==31180 | met2013==31900 | met2013==32780 ///
	| met2013==32900 | met2013==34620 | met2013==37460 | met2013==37900 | met2013==39340 | met2013==40580 ///
	| met2013==41060 | met2013==42140 | met2013==44100 | met2013==44300 | met2013==44940 | met2013==45220 ///
	| met2013==45460 | met2013==46660 | met2013==48140 | met2013==48700 | met2013==49420 | met2013==26620 ///
	| met2013==11260 | met2013==49740 | met2013==17820 | met2013==41180 | met2013==29200 | met2013==29740 ///
	| met2013==30140 | met2013==17900 | met2013==17300 | met2013==28660 & (met2013!=0 | met2013!=.)
			
	replace prothdest=0 if  met2013!=33340 & met2013!=18580 & met2013!=19820 & met2013!=12540 & met2013!=46520 ///
	& met2013!=10740 & met2013!=15540 & met2013!=21340 & met2013!=23580 & met2013!=24860 & met2013!=42100 ///
	& met2013!=12260 & met2013!=41940 & met2013!=44700 & met2013!=36420 & met2013!=40140 & met2013!=36540 ///
	& met2013!=48620 & met2013!=35380 & met2013!=41740 & met2013!=28140 & met2013!=44060 & met2013!=31080 ///
	& met2013!=41860 & met2013!=12700 & met2013!=37860 & met2013!=29620 & met2013!=19380 & met2013!=40900 ///
	& met2013!=39540 & met2013!=25260 & met2013!=13380 & met2013!=29180 & met2013!=12620 & met2013!=34900 ///
	& met2013!=33860 & met2013!=16860 & met2013!=46060 & met2013!=44180 & met2013!=13820 & met2013!=39820 ///
	& met2013!=28100 & met2013!=46340 & met2013!=25940 & met2013!=36140 & met2013!=36260 & met2013!=48660 ///
	& met2013!=47300 & met2013!=35660 & met2013!=29700 & met2013!=42200 & met2013!=22660 & met2013!=23060 ///
	& met2013!=43340 & met2013!=17020 & met2013!=21660 & met2013!=33700 & met2013!=10780 & met2013!=11020 ///
	& met2013!=12020 & met2013!=12980 & met2013!=13460 & met2013!=13980 & met2013!=19340 & met2013!=19500 ///
	& met2013!=20500 & met2013!=20740 & met2013!=21060 & met2013!=22380 & met2013!=22420 & met2013!=22520 ///
	& met2013!=24300 & met2013!=24540 & met2013!=27100 & met2013!=27180 & met2013!=27340 & met2013!=27500 ///
	& met2013!=28420 & met2013!=28700 & met2013!=29340 & met2013!=31180 & met2013!=31900 & met2013!=32780 ///
	& met2013!=32900 & met2013!=34620 & met2013!=37460 & met2013!=37900 & met2013!=39340 & met2013!=40580 ///
	& met2013!=41060 & met2013!=42140 & met2013!=44100 & met2013!=44300 & met2013!=44940 & met2013!=45220 ///
	& met2013!=45460 & met2013!=46660 & met2013!=48140 & met2013!=48700 & met2013!=49420 & met2013!=26620 ///
	& met2013!=11260 & met2013!=49740 & met2013!=17820 & met2013!=41180 & met2013!=29200 & met2013!=29740 ///
	& met2013!=30140 & met2013!=17900 & met2013!=17300 & met2013!=28660 & met2013!=0 & met2013!=.
	

label variable prothdest "Dummy Variable: Other v. Established & New Destination"
label define prothdestlabel 0"New or Est. destination" 1"Other destination"
label values prothdest prothdestlabel
		
tab prothdest
tab met2013 if prothdest==1
tab prothdest if bpl==110 [fweight=perwt]
tab prothdest if bpl==110 [fweight=perwt], m


tab1 prnewdest prestdest prothdest if bpl==110 [fweight=perwt], m 

//Three category variable for all Puerto Rican destinations\\

gen prdestinations=.
	replace prdestinations=0 if prestdest==1
	replace prdestinations=1 if prnewdest==1
	replace prdestinations=2 if prothdest==1
	
label variable prdestinations "Puerto Rican Destinations"
label define prdestinationslabel 0"Established Destinations" 1"New Destinations" 2"Other Destinations"
label values prdestinations prdestinationslabel 
	
tab prdestinations if bpl==110 [fweight=perwt]
tab prdestinations if bpl==110 [fweight=perwt], m

//Interactions: All PR destinations by region\\\
***First, I have to recode the region variable into dummy variables***
*Northeast=New England & Mid Atlantic*
gen northeast=1 if region==11 | region==12
	replace northeast=0 if region>=13 & region!=.

tab northeast

*Midwest=East & West Midwest*
gen midwest=1 if region==21 | region==22
	replace midwest=0 if region<=12 | region>=31 & region!=.

tab midwest

*South Atlantic=S. Atlantic
gen satlantic=1 if region==31
	replace satlantic=0 if region<=23 | region>=32 & region!=.
	
tab satlantic
	
*South Central=East and West South*
gen southcent=1 if region==32 | region==33
	replace southcent=0 if region<=31 | region>=41 & region!=.

tab southcent

*West Division=Mountain and Pacific*
gen westcoast=1 if region==41 | region==42
	replace westcoast=0 if region<=34 & region!=.
	
tab westcoast

tab region if northeast==1
tab region if midwest==1
tab region if satlantic==1
tab region if southcent==1
tab region if westcoast==1

***Now I can create interactions between Puerto Rican destinations and collapsed regions (15 total). This was done to
***test the effects of particular geographic areas on migrant integration

gen newnortheast=prnewdest*northeast
gen newmidwest=prnewdest*midwest
gen newsatlantic=prnewdest*satlantic
gen newsouthcent=prnewdest*southcent
gen newwestcoast=prnewdest*westcoast

tab1 newnortheast newmidwest newsatlantic newsouthcent newwestcoast

gen estnortheast=prestdest*northeast
gen estmidwest=prestdest*midwest
gen estsatlantic=prestdest*satlantic
gen estsouthcent=prestdest*southcent
gen estwestcoast=prestdest*westcoast

tab1 estnortheast estmidwest estsatlantic estsouthcent estwestcoast

gen othnortheast=prothdest*northeast
gen othmidwest=prothdest*midwest
gen othsatlantic=prothdest*satlantic
gen othsouthcent=prothdest*southcent
gen othwestcoast=prothdest*westcoast

tab1 othnortheast othmidwest othsatlantic othsouthcent othwestcoast


}
///Control variables\\\
{
//Education\\

gen educ_r=educ
recode educ_r (0/5=1) (6=2) (7/8=3) (10/max=4)
tab educ_r, m 

label var educ_r
label define educ_rlabels  1"Less than high school preparation" 2 "High School degree" 3 "Some college education or Associates degree" ///
	4 "College degree or more"
label values educ_r educ_rlabels
tab educ_r 

***Education dummies***

tab educ_r, gen (educgrp)
rename educgrp1 lesshs
rename educgrp2 highsch
rename educgrp3 somecolled
rename educgrp4 colled

tab1 lesshs highsch somecolled colled

//Age\\
gen agecat=1 if age>=18 & age<=30
replace agecat=2 if age>=31 & age<=54
replace agecat=3 if age>=55 & age!=.
tab age agecat, m

label var agecat
label define agecatlabels 1 "18-30"  2 "31-54" 3 "55 or more"
label values agecat agecatlabels

**Creating dummy variables for different age categories***
gen young=.
	replace young=1 if agecat==1
	replace young=0 if agecat==2 | agecat==3 & agecat!=.
	
gen middleage=.
	replace middleage=1 if agecat==2
	replace middleage=0 if agecat==1 | agecat==3 & agecat!=.

gen older=.
	replace older=1 if agecat==3
	replace older=0 if agecat==1 | agecat==2 & agecat!=.
	
tab1 young middleage older if bpl==110

**Age quadratic**
gen age2=age^2
	
//Income\\

//CONVERTING CONTINUOUS MEASURE OF INCOME TO REAL 2010 DOLLARS, AND THEN ADJUSTING FOR HOUSEHOLD SIZE\\

***The first step is calculating the conversion factor for each of your years (2010-2015) to convert to 2013 dollars. 
*The values for each year are based on the annual average consumer prince index (CPI-U), which the Bureau of Labor Statistics publishes online. 
*https://www.bls.gov/regions/mid-atlantic/data/consumerpriceindexannualandsemiannual_table.htm

gen inc2013doll=.
	replace inc2013doll=232.957/218.056 if year==2010
	replace inc2013doll=232.957/224.939 if year==2011
	replace inc2013doll=232.957/229.594 if year==2012
	replace inc2013doll=232.957/232.957 if year==2013
	replace inc2013doll=232.957/236.736 if year==2014
	replace inc2013doll=232.957/237.017 if year==2015
	
gen inf2013adj=inctot*inc2013doll

**Logged income**

gen inf2013adj2=inf2013adj+(.001)


gen loginc=ln(inf2013adj2)	
	
//Sex\\

tab sex, gen (sexgrp)
rename sexgrp1 male
rename sexgrp2 female

tab1 male female

//Race\\

***Race and Hispanic categories

*White Non-Hispanic*
gen whitenonh=.
	replace whitenonh=1 if race==1 & hispan==0
	replace whitenonh=0 if (race>=2 & race!=.) | (hispan>=1  & hispan!=.)
*White Hispanic*
gen whitehisp=.
	replace whitehisp=1 if race==1 & hispan>=1 & hispan!=.
	replace whitehisp=0 if (race>=2 & race!=.) | (hispan==0 & hispan!=.)

tab whitenonh whitehisp 

*Black Non-Hispanic*
gen blacknonh=.
	replace blacknonh=1 if race==2 & hispan==0
	replace blacknonh=0 if (race==1 | race>=3 & race!=.) | (hispan>=1 & hispan!=.)
*Black Hispanic*
gen blackhisp=.
	replace blackhisp=1 if race==2 & hispan>=1 & hispan!=. 
	replace blackhisp=0 if (race==1 | race>=3 & race!=.) | (hispan==0 & hispan!=.)
	
tab blacknonh blackhisp

*Other Race Non-Hispanc*
gen othracenonh=.
	replace othracenonh=1 if (race>=3 & race!=.) & hispan==0
	replace othracenonh=0 if (race<=2 & race!=.) | (hispan>=1 & hispan!=.)
*Other Race	 Hispanic*
gen othracehisp=.
	replace othracehisp=1 if (race>=3 & race!=.) & (hispan>=1 & hispan!=.)
	replace othracehisp=0 if (race<=2 & race!=.) | hispan==0
	
tab othracenonh, m
tab othracehisp, m

tab othracenonh othracehisp

	
*Race categories in one variable*
gen raza=.
	replace raza=1 if whitenonh==1
	replace raza=2 if whitehisp==1
	replace raza=3 if blacknonh==1
	replace raza=4 if blackhisp==1
	replace raza=5 if othracenonh==1 
	replace raza=6 if othracehisp==1

	
label variable raza "Race: Hispanic and Nonhispanic"
label define razalabel 1"White Non-Hispanic" 2"White Hispanic" 3"Black Non-Hispanic" 4"Black Hispanic" ///
	5"Other Race Non-Hispanic" 6"Other Race Hispanic" 
label values raza razalabel

tab raza if bpl==110, m
tab raza

*Race/Gender interactions*
*WHITES Male and Female Non-Hispanic*
gen mwhitenonh=whitenonh*male
gen fwhitenonh=whitenonh*female

*WHITES Male and Female Hispanic*
gen mwhitehisp=whitehisp*male
gen fwhitehisp=whitehisp*female

tab mwhitenonh fwhitenonh 
tab mwhitehisp fwhitehisp

*BLACKS Male and Female Non Hispanic*
gen mblacknonh=blacknonh*male
gen fblacknonh=blacknonh*female

*BLACKS Male and Female Non-Hispanic*
gen mblackhisp=blackhisp*male
gen fblackhisp=blackhisp*female

tab mblacknonh fblacknonh 
tab mblackhisp fblackhisp

*OTHER RACE Male and Female Non-Hispanic*
gen mothracenonh=othracenonh*male
gen fothracenonh=othracenonh*female

*OTHER RACE Male and Female Hispanic*
gen mothracehisp=othracehisp*male
gen fothracehisp=othracehisp*female

tab mothracenonh fothracenonh 
tab mothracehisp fothracehisp

tab1 mwhitenonh fwhitenonh mwhitehisp fwhitehisp mblacknonh fblacknonh ///
	mblackhisp fblackhisp mothracenonh fothracenonh mothracehisp fothracehisp if bpl==110

//Employment\\

*tab empstat, gen (empgrp)
*rename empgrp1 employed
*rename empgrp2 unemployed
*rename empgrp3 notinlabor

*tab1 employed unemployed notinlabor

*Models only include the dummy variable for Employed or not employed to obtain more cohesive results*
tab empstat
	gen employed=.
		replace employed=1 if empstat==1
		replace employed=0 if empstat>=2 & empstat!=.
tab employed empstat

//Marital: Married or not married\\

gen married=1 if marst==1
	replace married=0 if marst>=2 & marst!=.
	
gen notmarried=1 if marst>=2 & marst!=.
	replace notmarried=0 if marst==1

tab1 married notmarried

//Moved: Dummy Variables for migration\\
*Moved within or between state or abroad one year ago*
gen moved=1 if migrate1>=2 & migrate1!=.
	replace moved=0 if migrate1==1
*Did nont move in the last year*
gen notmoved=1 if migrate1==1
	replace notmoved=0 if migrate1>=2 & migrate1!=.
	
tab1 moved notmoved

//Class worker\\

tab classwkr, gen (classwkrgrp)
rename classwkrgrp2 selfemp
rename classwkrgrp3 wagewkr

tab selfemp wagewkr

//Homwownership\\

tab ownershp, gen (ownershpgrp)
rename ownershpgrp2 homeown
rename ownershpgrp3 homerent

//Mainland and Island born dummy\\

gen prmainborn=.
	replace prmainborn=1 if (bpl>=001 & bpl<=056) & ancestr1==261
	replace prmainborn=0 if bpl==110 
	
tab prmainborn, m

gen prislandborn=.
	replace prislandborn=1 if bpl==110
	replace prislandborn=0 if (bpl>=001 & bpl<=056) & ancestr1==261

tab prislandborn, m

tab prmainborn prislandborn
	

}
//// Calculating missing variables for the variables that will be used in models\\\\

mdesc prnewdest prothdest prestdest prdestinations lesshs highsch somecolled colled whitenonh ///
	whitehisp blacknonh blackhisp othracenonh othracehisp raza employed empstat married notmarried  moved  notmoved  ///
	selfemp  wagewkr  homeown  homerent  male  female  hhincome  famsize  age  young  middleage  age2 inf2013adj2 ///
	loginc mwhitenonh fwhitenonh mwhitehisp fwhitehisp mblacknonh fblacknonh mblackhisp fblackhisp mothracenonh ///
	othracenonh mothracehisp fothracehisp

//// Generate sample for models \\\\\

gen subsample=missing(prnewdest, prothdest, prestdest, prdestinations, lesshs, highsch, somecolled, colled, whitenonh, ///
	whitehisp, blacknonh, blackhisp, othracenonh, othracehisp, raza, employed, empstat, married, notmarried, moved, notmoved, ///
	selfemp, wagewkr, homeown, homerent, male, female, hhincome, famsize, age, young, middleage, old, age2, inf2013adj2, ///
	loginc, mwhitenonh, fwhitenonh, mwhitehisp, fwhitehisp, mblacknonh, fblacknonh, mblackhisp, fblackhisp, mothracenonh, ///
	othracenonh, mothracehisp, fothracehisp)

tab subsample 
tab subsample if bpl==110 [fweight=perwt]

///Test for power correlation of the sample and variables used in models \\\

pwcorr prnewdest prothdest prestdest prdestinations lesshs highsch somecolled colled whitenonh ///
	whitehisp blacknonh blackhisp othracenonh othracehisp raza employed empstat married notmarried  moved  notmoved  ///
	selfemp  wagewkr  homeown  homerent  male  female  hhincome  famsize  age  young  middleage  age2 inf2013adj2 ///
	loginc mwhitenonh fwhitenonh mwhitehisp fwhitehisp mblacknonh fblacknonh mblackhisp fblackhisp mothracenonh ///
	othracenonh mothracehisp fothracehisp if subsample==0 & bpl==110, star(0.05)
	
///Descriptive statistics: Used for descriptive statistics table \\\

//Desriptives for PRicans in New, Established and Other desiantions\\
{

tab prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table sex prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table married prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table raza prdestinations if bpl==110 & subsample==0 [fweight=perwt]

sum age nchild inctot hwsei sei occscore rent poverty if bpl==110 & prnewdest==1 & subsample==0
sum age nchild inctot hwsei sei occscore rent poverty if bpl==110 & prestdest==1 & subsample==0
sum age nchild inctot hwsei sei occscore rent poverty if bpl==110 & prothdest==1 & subsample==0

table educ_r prdestinations if bpl==110 & subsample==0  [fweight=perwt]

table moved prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table vetstat prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table empstat prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table labforce prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table homeown prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table selfemp prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table hcovany prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table hinscaid prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table hinscare prdestinations if bpl==110 & subsample==0 [fweight=perwt]

table foodstmp prdestinations if bpl==110 & subsample==0 [fweight=perwt]

}

//Descriptives of Non-Puerto Rican born\\
{
tab prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table sex prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table married prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table raza prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

sum age nchild inctot hwsei sei occscore rent poverty if bpl!=110 & prnewdest==1 & subsample==0
sum age nchild inctot hwsei sei occscore rent poverty if bpl!=110 & prestdest==1 & subsample==0
sum age nchild inctot hwsei sei occscore rent poverty if bpl!=110 & prothdest==1 & subsample==0

table educ_r prdestinations if bpl!=110 & subsample==0  [fweight=perwt]

table moved prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table vetstat prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table empstat prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table labforce prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table homeown prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table selfemp prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table hcovany prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table hinscaid prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table hinscare prdestinations if bpl!=110 & subsample==0 [fweight=perwt]

table foodstmp prdestinations if bpl!=110 & subsample==0 [fweight=perwt]


}
///Models\\\
*The following variables are the reference groups: females, lesshs, notmarried, homerent, 
*wagewkr, whitehisp, fmwhitehisp*

**Mlogits**
mlogit prdestinations male age highsch somecolled colled vetstat married nchild ///
		if bpl==110 & subsample==0, base (0) rrr
		
mlogit prdestinations male age highsch somecolled colled vetstat married nchild moved homeown ///
		employed selfemp if bpl==110 & subsample==0, base (0) rrr		

mlogit prdestinations male age highsch somecolled colled vetstat married nchild moved homeown ///
		employed selfemp whitenonh blacknonh blackhisp othracenonh othracehisp ///		
		if bpl==110 & subsample==0, base (0) rrr

**Nested regresion for INCTOT**
nestreg: regress loginc (prnewdest prothdest) (age2 age male sei married famsize highsch somecolled colled nchild) (vetstat employed ///
	selfemp homeown) (whitenonh blacknonh blackhisp othracenonh othracehisp) if bpl==110 & subsample==0 [pweight=perwt]
	
**Nested Regression for SEI**
	
nestreg: regress sei (prnewdest prothdest) (age2 age male loginc married famsize highsch somecolled colled nchild) (vetstat employed ///
	selfemp homeown) (whitenonh blacknonh blackhisp othracenonh othracehisp) if bpl==110 & subsample==0 [pweight=perwt]

*Nested Reg with interactions race/gender. White Hispanic Females are reference group
nestreg: regress sei (prnewdest prothdest) (age2 age loginc married famsize highsch somecolled colled nchild) (vetstat employed ///
	selfemp homeown) (mwhitenonh fwhitenonh mwhitehisp mblacknonh fblacknonh mblackhisp fblackhisp mothracenonh fothracenonh ///
	mothracehisp fothracehisp) if bpl==110 & subsample==0 [pweight=perwt]

*Nested regressions with interactions for each specific destination type*
*PR ESTABLISHED Destinations*
nestreg: regress sei (prnewdest prothdest) (age2 age loginc married famsize highsch somecolled colled nchild) (vetstat employed ///
	selfemp homeown) (mwhitenonh fwhitenonh mwhitehisp mblacknonh fblacknonh mblackhisp fblackhisp mothracenonh fothracenonh ///
	mothracehisp fothracehisp) if bpl==110 & prdestinations==0 & subsample==0 [pweight=perwt]

*PR New Destinations*
nestreg: regress sei (prnewdest prothdest) (age2 age loginc married famsize highsch somecolled colled nchild) (vetstat employed ///
	selfemp homeown) (mwhitenonh fwhitenonh mwhitehisp mblacknonh fblacknonh mblackhisp fblackhisp mothracenonh fothracenonh ///
	mothracehisp fothracehisp) if bpl==110 & prdestinations==1 & subsample==0 [pweight=perwt]

*PR Other Destinations*
nestreg: regress sei (prnewdest prothdest) (age2 age loginc married famsize highsch somecolled colled nchild) (vetstat employed ///
	selfemp homeown) (mwhitenonh fwhitenonh mwhitehisp mblacknonh fblacknonh mblackhisp fblackhisp mothracenonh fothracenonh ///
	mothracehisp fothracehisp) if bpl==110 & prdestinations==2 & subsample==0 [pweight=perwt]
	
	
--break--

clear all 
exit	
