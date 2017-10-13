1   /*
2   
3   Note: This is the current version of this do-file, making "Digital.do" OBE
4   
5   */
6   
    //just setting the working directory
7	cd "C:\Users\Scott\Google Drive\OA\MBD\digital"
8	global util "C:\Users\Scott\Google Drive\data" 
9   

//Importing excel

//Formatting agility tab
10	import excel "Company and Sector Indicators_final list_1FEB" ///
11	, sheet(Agility) cellrange(A5) first clear 
12   ren B temp 
13   drop ? 
14   qui ds
15	foreach v in `r(varlist)' {
16	replace `v'=subinstr(`v',`"""',"",.)
17	local lab=`v' in 1
18	label var `v' "`lab'"
19	qui replace `v'="" in 1
20	qui compress `v'
21	}
22	drop in 1/3
23	drop if company=="" // 5. Drop if missing company
24	gen region="Middle East" if country=="Middle East"   //Generate addtional region data
25	order region, after(country)   //just soritng
26	replace temp=strtrim(temp) 
27	replace country=temp if temp!=""    //formatting the country variable
28	drop temp
29	ds country-company, not
30	foreach v in `r(varlist)' {
31	destring `v', replace ignore(",") force
32	ren `v' ag_`v'
33	}
34	replace company=stritrim(company)
35	replace company=strtrim(company)
36	replace company="Circle Health" if regexm(company,"Circle Healthcare")==1
37	sort company
38	save ag, replace
39   
//Formatting connectivity tab
40	import excel "Company and Sector Indicators_final list_1FEB" ///
41	, sheet("Connectivity") cellrange(A5) first clear
42	ren D subsector
43	gen region="Middle East" if country=="Middle East"
44	order region, after(country)
45	replace B=strtrim(B) 
46   replace country=B if B!="" 
47   drop ? 
48   qui ds
49   foreach v in `r(varlist)' {
50 replace `v'=subinstr(`v',`"""',"",.)
51 local lab=`v' in 1
52 label var `v' "`lab'"
53 qui replace `v'="" in 1
54 qui compress `v'
55 }
56 drop in 1/3
57 drop if company=="" // 5
58 ds country-company, not
59 foreach v in `r(varlist)' {
60 destring `v', replace ignore(",") force
61 ren `v' co_`v'
62 }
63 replace company=stritrim(company)
64 replace company=strtrim(company)
65 replace company="Circle Health" if regexm(company,"Circle Healthcare")==1
66 sort company
67 save conn, replace
68

//Formatting Openness and Transparency tab
69 import excel "Company and Sector Indicators_final list_1FEB" ///
70 , sheet("Openness and Transparency") cellrange(A5) first clear
71 gen region="Middle East" if country=="Middle East"
72 order region, after(country)
73 replace B=strtrim(B)
74 replace country=B if B!=""
75   drop ? 
76   qui ds
77	foreach v in `r(varlist)' {
78	replace `v'=subinstr(`v',`"""',"",.)
79	local lab=`v' in 1
80	label var `v' "`lab'"
81	qui replace `v'="" in 1
82	qui compress `v'
83	}
84	drop in 1/3
85	drop if company=="" // 5
86	ds country-company, not
87	foreach v in `r(varlist)' {
88	destring `v', replace ignore(",") force
89	ren `v' ot_`v'
90	}
91	replace company=stritrim(company)
92	replace company=strtrim(company)
93	replace company="Circle Health" if regexm(company,"Circle Healthcare")==1
94	sort company
95	save open, replace
96   

//Formatting Empowerment and Alignment tab
97	import excel "Company and Sector Indicators_final list_1FEB" ///
98	, sheet("Empowerment and Alignment") cellrange(A5) first clear
99	gen region="Middle East" if country=="Middle East"
100	order region, after(country)
101	replace B=strtrim(B) 102   replace country=B if B!="" 103   drop ? 104   qui ds
105	foreach v in `r(varlist)' {
106	replace `v'=subinstr(`v',`"""',"",.)
107	local lab=`v' in 1
108	label var `v' "`lab'"
109	qui replace `v'="" in 1
110	qui compress `v'
111	}
112	drop in 1/3
113	drop if company=="" // 5
114	ds country-company, not
115	foreach v in `r(varlist)' {
116	destring `v', replace ignore(",") force
117	ren `v' ea_`v'
118	}
119	replace company=stritrim(company)
120	replace company=strtrim(company)
121	replace company="Circle Health" if regexm(company,"Circle Healthcare")==1
122	sort company
123	save eanda, replace
124   

//Formatting Discipline and Focus tab
125	import excel "Company and Sector Indicators_final list_1FEB" ///
126	, sheet("Discipline and Focus") cellrange(A5) first clear
127	gen region="Middle East" if country=="Middle East" 128   order region, after(country)
131   drop ? 
132   qui ds
133 foreach v in `r(varlist)' {
134 replace `v'=subinstr(`v',`"""',"",.)
135 local lab=`v' in 1
136 label var `v' "`lab'"
137 qui replace `v'="" in 1
138 qui compress `v'
139 }
140 drop in 1/3
141 drop if company=="" // 5
142 ds country-company, not
143 foreach v in `r(varlist)' {
144 destring `v', replace ignore(",") force
145 ren `v' df_`v'
146 }
147 replace company=stritrim(company)
148 replace company=strtrim(company)
149	replace company="Circle Health" if regexm(company,"Circle Healthcare")==1
150	sort company
151	save dandf, replace
152   

//Formatting Digital readiness tab
153	import excel "Company and Sector Indicators_final list_1FEB" ///
154	, sheet("Digital readiness") cellrange(A5) first clear
155	gen region="Middle East" if country=="Middle East"
156	order region, after(country)
157	replace B=strtrim(B) 158   replace country=B if B!="" 159   drop ? 160   qui ds
161	foreach v in `r(varlist)' {
162	replace `v'=subinstr(`v',`"""',"",.)
163	local lab=`v' in 1
164	label var `v' "`lab'"
165	qui replace `v'="" in 1
166	qui compress `v'
167	}
168	drop in 1/3
169	drop if company=="" // 5
170	ds country-company, not
171	foreach v in `r(varlist)' {
172	destring `v', replace ignore(",") force
173	ren `v' dr_`v'
174	}
175	replace company=stritrim(company)
176	replace company=strtrim(company)
177	replace company="Circle Health" if regexm(company,"Circle Healthcare")==1
178	sort company
179	save digital, replace
180   
// Merge on company
182   
183	use ag, clear
184	qui merge company using conn open eanda dandf digital
drop if company=="Telefonica"	
*/	
replace sector=strtrim(sector)		
replace subsector=strtrim(subsector)	
sort company // list comp
// list comp di _N // 428 save digital		
	any country, clean any country sector		
		 subsector if country=="Turkey"	
		
	_1, replace	
	
use digital_1, clear qui ds country-compan		
	y, not		
local count: word count `r(varlist)'	
di "`count'" // 67		
ds *2
local count: word count `r(varlist)'	
di "`count'"		
* Note: Not all ~2 variables have a corresponding sector-level variable	
	
/*
185	drop _merge* 186   sort company
187	replace company="NTT Data Corporation" if regexm(company,"NTT Data Corporation")==1
188	replace company="Uniqure" if regexm(company,"uniQure")==1
189	/* Drop the extra-scope companies
190	drop if company=="BBVA"
191	drop if company=="Credit Suisse"
192	drop if company=="Medtronic"
193	drop if company=="Novo Nordisk"
194	drop if company=="Roche"
195	drop if company=="Bombardier"
196	drop if company=="Eaton"
197	drop if company=="Ericsson"
198	drop if company=="IntelSat"
199	drop if company=="Samsung"
200	drop if company=="Te coivity"
201   
202   
203   
204   
205   
206   
207   
208   
209   
210   
211   
212   
213   
214   
215   
216   
217   
218   
219   
220   
221   
222   Imputation
223   
224	Note: Ag and Co sections contain several commented blocs of code. These
225	are models to populate N=427 but are not needed when N=415 (2017-1-27)
226   
227   */
228   
229   qui do "$util\00 country-to-ifscode" 230   tab country if ifscode==.
231	ren region _region
232	gen year=2017
233	order year, after(ifscode)
234	qui do "$util\00 ifscode-to-region"
235	sort company
236	order region, before(_region)
237	sort ifscode year
238	qui merge ifscode year using "$util\WEO201610" ///
239	, keep(BCA_NGDPD LP GGX_NGDP NGDP NGDPPC PCPI PPPGDP PPPPC NGDPDPC ///
240	PCPIPCH GGXWDG_NGDP)
241	drop _merge* 242   sort company
243	drop if company==""
244	tab region, gen(iregion) label
245	encode region, gen(iregion)
246   
247	foreach v in PPPGDP NGDP PPPPC LP {
248	capture gen `v'ln=ln(`v')
249	local lab : variable label `v'
250	label var `v'ln "`lab' (ln)"
251	}
252   
253	encode sector, gen(isector)
254	encode subsector, gen(isubsector)
255   
256	*
257	* ag
258	*
259   
260	fsum ag_*
261	/*
262	Variable |        N     Mean       SD      Min      Max
263	------------------+---------------------------------------------
264	ag_cw_journey |      427     0.25     0.43     0.00     1.00  
265	ag_cw_improve |      428     0.31     0.46     0.00     1.00  
266	ag_gt_contingent |      424     9.60    14.86     0.00    52.02  
267	ag_ins_innovate |      428    56.75     3.56    51.00    62.00  
268	ag_ins_respond |      357    63.19     7.19    52.50    75.00  
269	ag_ins_product |      148    57.49     0.50    57.00    58.00  
270	ag_ins_innovate2 |      416    57.03     8.90    38.00    71.00  
271	ag_ins_respond2 |      416    63.19     6.36    49.00    73.00  
272	ag_ins_product2 |      386    64.74     8.71    39.00    74.00  
273	ag_lit_act |      428     3.17     0.94     1.50     4.00  
274	ag_ins_execlearn |      428    53.12     2.04    50.11    55.78  
275	ag_ins_success |      428    72.32     5.30    67.67    81.00  
276	ag_ins_quality |      428    78.23     3.92    72.00    83.00  
277	*/
278	summ ??_* // to check for possible correlates in imputation
279	// ag_ins_innovate ag_lit_act ea_cg_nps 
280	/*
281	hist ag_ins_innovate
282	hist ag_lit_act
283	hist ea_cg_nps
284	*/
285	codebook ag_gt_contingent
286	codebook ag_ins_innovate // ordinal 6
287	codebook ag_ins_respond // ordinal 5
288	codebook ag_lit_act // ordinal 3
289	codebook ea_cg_nps // ordinal 5
290   
291	* what is the unit for which ag_ins_innovate is averaged? sector
292	replace sector=strtrim(sector)
293	replace subsector=strtrim(subsector)
294	// table country sector, c(mean ag_ins_innovate)
295	sort country sector subsector ag_cw_journey
296	// browse isonum country region _region sector subsector company ag_cw_journey 297   * ag_ins_respond? sector -- missing healthcare
298   
299	* Replace missing 0/1 to 0
300	gen ag_cw_journey_=ag_cw_journey
301	replace ag_cw_journey_=0 if ag_cw_journey_==.
302	// gen ag_cw_improve_=ag_cw_improve
303	// replace ag_cw_improve_=0 if ag_cw_improve_==.
304   
305   // hist ag_gt_contingent 306   reg ag_gt_contingent ///
307	i.iregion##c.PPPPCln LPln BCA_NGDPD PCPIPCH GGX_NGDP ///
308	i.ag_ins_innovate i.ag_cw_journey i.ag_cw_improve /// i.iag_lit_act i.ea_cg_nps 
309	i.isector
310	predict temp
311	summ temp ag_gt_contingent
312	drop temp
313	gen ag_gt_contingent_pr=ag_gt_contingent*.01
314	glm ag_gt_contingent_pr ///
315	i.iregion##c.PPPPCln LPln BCA_NGDPD PCPIPCH GGX_NGDP ///
316	i.ag_ins_innovate i.ag_cw_journey_ i.ag_cw_improve ///
317	i.isector ///
318	, family(binomial) link(logit) robust
319	predict yhat_ag_gt_contingent_pr 320   summ yhat* ag_gt_contingent* 321   gen yhat_ag_gt_contingent=.
322	replace yhat_ag_gt_contingent=yhat_ag_gt_contingent_pr*100
323	gen ag_gt_contingent_=ag_gt_contingent
324	replace ag_gt_contingent_=yhat_ag_gt_contingent if ag_gt_contingent_==.
325	/*
326	hist ag_ins_innovate2
327	codebook ag_ins_innovate2 // miss 12
328	reg ag_ins_innovate2 ///
329	i.iregion##c.PPPPCln ///
330	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH 
331	gen ag_ins_innovate2_pr=ag_ins_innovate2*.01
332	glm ag_ins_innovate2_pr ///
333	i.iregion##c.PPPPCln ///
glm ag_ins_respond2_pr ///	
i.iregion##c.PPPPCln ///		
BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
, family(binomial) link(logit) robust	
predict yhat_ag_ins_respond2		
replace yhat_ag_ins_respond2=yhat_ag_ins_respond2*100
gen ag_ins_respond2_=ag_ins_respond2	
replace ag_ins_respond2_=yhat_ag_ins_respond2 if ag_ins_respond2_==.	
*/	
* populate missing healthcare in respond from full respond2	
	
tabstat ag_ins_respond ag_ins_respond2 , by(sector) s(mean)		
egen w_ag_ins_respond2 = wtmean(ag_ins_respond2), weight(NGDP) by(sector) egen wb_ag_ins_respond2 = wtmean(ag_ins_respond2), weight(NGDPPC) by(sector) egen wc_ag_ins_respond2 = wtmean(ag_ins_respond2), weight(PPPPC) by(sector) tabstat ag_ins_respond ag_ins_respond2 w_ag_ins_respond2 w?_ag_ins_respond2 /// , by(sector) s(mean) // varwidth(16)	
* NGDPPC weights produce the closest correspondence with the actual sector data	
gen ag_ins_respond_=ag_ins_respond
334	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
335	, family(binomial) link(logit) robust
336	predict yhat_ag_ins_innovate2
337	replace yhat_ag_ins_innovate2=yhat_ag_ins_innovate2*100
338	gen ag_ins_innovate2_=ag_ins_innovate2
339	replace ag_ins_innovate2_=yhat_ag_ins_innovate2 if ag_ins_innovate2_==.
340	summ ag_ins_innovate2*
341	*/
342	table country sector, c(mean ag_ins_respond)
343	table country sector, c(mean ag_ins_respond2) row
344	/*
345	reg ag_ins_respond2 ///
346	i.iregion##c.PPPPCln ///
347	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH 
348	gen ag_ins_respond2_pr=ag_ins_respond2*.01
349   
350   
351   
352   
353   
354   
355   
356   
357   
358   
359   
360   
361   
362   
363   
364   
365   
366   
367   
368   
369   
370   replace ag_ins_respond_=58.3 if ag_ins_respond_==. & sector=="Healthcare"
371   
372	// hist ag_ins_product
373	codebook ag_ins_product
374	table country sector, c(mean ag_ins_product)
375	table country sector, c(mean ag_ins_respond2) row
376	reg ag_ins_product2 ///
377	i.iregion##c.PPPPCln ///
378	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH
379	gen ag_ins_product2_pr=ag_ins_product2*.01
380	glm ag_ins_product2_pr ///
381	i.iregion##c.PPPPCln ///
382	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
383	, family(binomial) link(logit) robust
384	predict yhat_ag_ins_product2
385	replace yhat_ag_ins_product2=yhat_ag_ins_product2*100
386	gen ag_ins_product2_=ag_ins_product2
387	replace ag_ins_product2_=yhat_ag_ins_product2 if ag_ins_product2_==.
388   
389	egen w_ag_ins_product2 = wtmean(ag_ins_product2_), weight(NGDP) by(sector)
390	egen wb_ag_ins_product2 = wtmean(ag_ins_product2_), weight(NGDPPC) by(sector)
391	egen wc_ag_ins_product2 = wtmean(ag_ins_product2_), weight(PPPPC) by(sector)
392   
393	tabstat ag_ins_product ag_ins_product2_ w_ag_ins_product2 w?_ag_ins_product2 ///
394	, by(sector) s(mean) // varwidth(16)
395   
396	gen ag_ins_product_=ag_ins_product
397	replace ag_ins_product_=57.21 if sector=="Consumer"
398	replace ag_ins_product_=57.25 if sector=="Financials"
399	replace ag_ins_product_=57.20 if sector=="Healthcare"
400	replace ag_ins_product_=57.18 if sector=="Life Sciences"
401	count if ag_ins_product_==. // 0
402   
403   save digital_2, replace
404   
405	*
406	* Connectivity
407	*
408   
409	fsum co_*
410	/*
411	Variable |        N     Mean       SD      Min      
Max                                                                                        
412	-----------------+---------------------------------------------
413	co_cw_divers |      423     1.12     0.79     0.00     2.00  
414	co_goo_prodpart |      428     0.67     0.47     0.00     1.00  
415	co_lin_folemp |      406    13.29    27.69     0.29   507.40  
416	co_gt_ceo |      426    20.20    19.62     0.00    81.70  
417	co_ins_sharing |      428    64.75     4.19    56.30    70.00  
418	co_ins_coop |      357    62.21     4.48    57.00    69.00  
419	co_ins_comm |        0                                      
420	co_ins_sharing2 |      416    62.83     8.18    48.00    77.00  
421	co_ins_coop2 |      416    60.52     8.15    48.00    81.00  
422	co_ins_comm2 |       31    45.00     0.00    45.00    45.00  
423	co_cw_thlead |      428     0.38     0.49     0.00     1.00  
424	co_ins_wsupport |      428    56.23     2.95    52.33    61.00  
425	*/
426   
427   drop co_ins_comm* // insufficient observations
428   
429	// hist co_cw_divers
430	tostring co_ins_sharing, gen(sco_ins_sharing)
431	encode sco_ins_sharing, gen(ico_ins_sharing)
432	ologit co_cw_divers ///
433	i.ico_ins_sharing ///
434	ag_ins_innovate2 ag_ins_respond2 ag_ins_product2_ ///
435	i.iregion##c.PPPGDPln LPln BCA_NGDPD ///
436	i.isubsector
437	predict co_cw_divers_0 co_cw_divers_1 co_cw_divers_2
438	egen co_cw_divers_max=rowmax(co_cw_divers_?)
439	gen co_cw_divers_=co_cw_divers
440	forv i=0/2 {
441	replace co_cw_divers_=`i' if co_cw_divers_`i'==co_cw_divers_max & co_cw_divers_==.
442	}
 
443	/*
444	codebook co_goo_prodpart // binary, 12 miss
445	tabstat ///
446	co_cw_divers_ ///
447	co_ins_sharing ///
448	ag_ins_innovate2_ ///
449	iregion PPPGDPln LPln BCA_NGDPD ///
450	if co_goo_prodpart==., s(n)
451   
452	logit co_goo_prodpart ///
453	i.co_cw_divers_ ///
454	co_ins_sharing ///
455	ag_ins_innovate2_ ag_ins_product2_ ag_ins_respond2_ ///
456	i.iregion##c.PPPGDPln LPln BCA_NGDPD ///
457	// i.isector
458	predict yhat_co_goo_prodpart
459	codebook yhat_co_goo_prodpart
460	gen co_goo_prodpart_=co_goo_prodpart
461	replace co_goo_prodpart_=1 if co_goo_prodpart_==. & yhat_co_goo_prodpart>=.5 /// 462   	& yhat_co_goo_prodpart!=.
463	replace co_goo_prodpart_=0 if co_goo_prodpart_==. & yhat_co_goo_prodpart<.5
464	*/
465	// hist co_lin_folemp
466	gen co_lin_folempln=ln(co_lin_folemp)
467	// hist co_lin_folempln
468	reg co_lin_folempln /// 469   	i.co_cw_divers_ ///
470	co_ins_sharing ///
471	ag_ins_innovate2 ag_ins_product2_ ag_ins_respond2 ///
472	i.ag_cw_journey_ i.ag_cw_improve /// ag_gt_contingent_ ///
473	i.iregion##c.PPPPCln LPln ///
474	BCA_NGDPD PCPIPCH /// GGX_NGDP GGXWDG_NGDP 
475	i.isector /// i.isubsector
476	, robust
477	predict yhat_co_lin_folempln
478	summ *co_lin_folempln
479	gen co_lin_folemp_=co_lin_folemp
480	replace co_lin_folemp_=exp(yhat_co_lin_folempln) if co_lin_folemp_==.
481   
482	codebook co_gt_ceo
 
483	reg co_gt_ceo ///
484	/// co_ins_sharing ///
485	ag_ins_product2_ ag_ins_innovate2 ag_ins_respond2 ///
 
486	i.ag_cw_journey_ i.ag_cw_improve ag_gt_contingent ///
487	i.iregion PPPPCln ///
488	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
489	i.isector i.iregion
490	gen co_gt_ceo_pr=co_gt_ceo*.01
491	glm co_gt_ceo_pr ///
492	/// co_ins_sharing ///
493	ag_ins_product2_ ag_ins_innovate2 ag_ins_respond2 ///
494	i.ag_cw_journey_ i.ag_cw_improve ag_gt_contingent ///
495	i.iregion PPPPCln ///
496	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
497	i.isector i.iregion ///
 
498	, family(binomial) link(logit) robust
 
499	predict yhat_co_gt_ceo
500	summ yhat_co_gt_ceo co_gt_ceo
501	replace yhat_co_gt_ceo=yhat_co_gt_ceo*100
502	gen co_gt_ceo_=co_gt_ceo
503	replace co_gt_ceo_=yhat_co_gt_ceo if co_gt_ceo_==.
504	/*
505	hist co_ins_sharing2
506	reg co_ins_sharing2 ///
507	i.iregion##c.PPPPCln LPln ///
508	BCA_NGDPD GGXWDG_NGDP GGX_NGDP PCPIPCH //
509	predict temp
510	summ co_ins_sharing2 temp
511	ren temp yhat_co_ins_sharing2
512	gen co_ins_sharing2_=co_ins_sharing2
513	replace co_ins_sharing2_=yhat_co_ins_sharing2 if co_ins_sharing2_==.
514   
515   codebook co_ins_coop2 // 12 unique values between 48 and 81 516   reg co_ins_coop2 ///
517	i.iregion##c.PPPPCln LPln ///
518	BCA_NGDPD GGXWDG_NGDP GGX_NGDP PCPIPCH //
519	predict temp
520	summ co_ins_coop2 temp
521	ren temp yhat_co_ins_coop2
522	gen co_ins_coop2_=co_ins_coop2
523	replace co_ins_coop2_=yhat_co_ins_coop2 if co_ins_coop2_==.
524	*/
525	* generate ~coop (sector level) from tabstat of ~coop2_
526   
527	egen w_co_ins_coop2 = wtmean(co_ins_coop2), weight(NGDP) by(sector)
528	egen wb_co_ins_coop2 = wtmean(co_ins_coop2), weight(NGDPPC) by(sector)
529	egen wc_co_ins_coop2 = wtmean(co_ins_coop2), weight(PPPPC) by(sector) 530   
531	tabstat co_ins_coop co_ins_coop2 w_co_ins_coop2 w?_co_ins_coop2 ///
532	, by(sector) s(mean) // varwidth(16)
533   
534	gen co_ins_coop_=co_ins_coop
535	// replace co_ins_coop_=58.37 if sector=="Consumer"
536	// replace co_ins_coop_=58.39 if sector=="Financials"
537	replace co_ins_coop_=62.49 if sector=="Healthcare"
538	// replace co_ins_coop_=58.35 if sector=="Life Sciences"
539	count if co_ins_coop_==. // 0
540	/*
541	hist co_cw_thlead // binary
542	des co_cw_thlead
543	logit co_cw_thlead /// 544   	co_ins_sharing ///
545	ag_ins_product2_ ag_ins_innovate2_ ag_ins_respond2_ ///
546	i.ag_cw_journey_ i.ag_cw_improve_ ag_gt_contingent_ ///
547	i.iregion##c.PPPPCln ///
548	i.isector
549	predict yhat_co_cw_thlead
550	codebook yhat_co_cw_thlead
551	gen co_cw_thlead_=co_cw_thlead
552	replace co_cw_thlead_=1 if co_cw_thlead_==. & yhat_co_cw_thlead>=.5 /// 553   	& yhat_co_cw_thlead!=.
  ot_lin_foltemp |      354     0.43     0.41     0.00     2.24     ot_ins_chgcom |      282    57.89     1.60    55.50    60.00    ot_ins_solidea |        0                                         ot_ins_infond |      428    71.90     1.96    69.33    75.00    ot_ins_chgcom2 |      416    57.30     8.23    47.00    74.00   ot_ins_solidea2 |       31    57.00     0.00    57.00    57.00    ot_ins_infond2 |      416    72.26     7.67    55.00    85.00   ot_tw_tweff_raw |      428   134.82   669.56     0.00  9572.95       ot_tw_tweff |      428     0.04     0.13     0.00     1.00       ot_cm_comms |      428     5.25     3.09     0.50    10.00       ot_cm_negat |      428     5.67     2.88     1.50    10.00        ot_cm_lead |      428     6.52     2.60     1.00    10.00       ot_gt_comms |      428     0.84     0.37     0.00     1.00         ot_cw_csr |      428     0.69     0.46     0.00     1.00      ot_ins_ideas |      428    68.35     2.61    63.00    71.00  	
*/
drop ot_ins_solidea* // too few obs	
	
// hist ot_lin_foltemp list company sector su		
	bsector country ot_lin_foltemp if ot_lin_foltem	p>1 ///
554	replace co_cw_thlead_=0 if co_cw_thlead_==. & yhat_co_cw_thlead<.5
555	*/
556	save digital_3, replace
557   
558	*
559	* Openness and Transparency
560	*
561   
562   use digital_3, clear
563   
564	fsum ot_*
565	/*
566	Variable |        N     Mean       SD      Min      Max 
567	-----------------+---------------------------------------------
568	ot_fb_custpage |      428     1.13     0.90     0.00     2.00  
569   
570   
571   
572   
573   
574   
575   
576   
577   
578   
579   
580   
581   
582   
583   
584   
585   
586   
587   
588   
589   
590	& ot_lin_foltemp!=., clean noobs
 
591	replace ot_lin_foltemp=. if ot_lin_foltemp>3 // 2
592	// hist ot_lin_foltemp
593	summ ot_lin_foltemp
594	gen ot_lin_foltempln=ln(ot_lin_foltemp)
595	di 415-340 // 75
596	hist ot_lin_foltemp, nodraw name(temp1, replace)
597	hist ot_lin_foltempln, nodraw name(temp2, replace)
598	// graph combine temp1 temp2
599   
600	summ co_lin_folemp_
601	gen co_lin_folemp_ln=ln(co_lin_folemp_)
602	reg ot_lin_foltempln /// co_lin_folemp_ln /// /// co_ins_sharing ///
/// ag_ins_product2_ ag_ins_innovate2 ag_ins_respond2 /// i.ag_cw_journey_ ag_gt_contingent /// i.ag_cw_improve 
i.iregion##c.PPPPCln ///
BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH /// i.isector i.iregion
 
610	predict temp
611	summ ot_lin_foltempln temp
612	ren temp yhat_ot_lin_foltempln
613	gen ot_lin_foltemp_=ot_lin_foltemp
614	replace ot_lin_foltemp_=exp(yhat_ot_lin_foltempln) if ot_lin_foltemp_==.
615   
616   * ot_ins_chgcom from ot_ins_chgcom2
617   
618	// hist ot_ins_chgcom2
619	egen w_ot_ins_chgcom2 = wtmean(ot_ins_chgcom2), weight(NGDP) by(sector)
620	egen wb_ot_ins_chgcom2 = wtmean(ot_ins_chgcom2), weight(NGDPPC) by(sector)
621	egen wc_ot_ins_chgcom2 = wtmean(ot_ins_chgcom2), weight(PPPPC) by(sector)
622   
623	tabstat ot_ins_chgcom ot_ins_chgcom2 w_ot_ins_chgcom2 w?_ot_ins_chgcom2 ///
624	, by(sector) s(mean) // varwidth(16)
625   
626	gen ot_ins_chgcom_=ot_ins_chgcom
627	// replace ot_ins_chgcom_=58.37 if sector=="Consumer"
    ea_pwc_randd |      428     1.08     0.96     0.00     2.00        ea_goo_cdo |      428     0.32     0.71     0.00     2.00      ea_cw_custom |      428     0.65     0.48     0.00     1.00    ea_ins_contrib |      423    81.95     2.49    80.00    87.00     ea_ins_custom |      423    75.83     1.08    75.00    78.00     ea_ins_timely |      352    51.39     2.87    46.00    54.00       ea_ins_flat |      352    64.38     7.42    56.00    76.00       ea_ins_risk |      285    63.78     3.96    58.00    69.00     ea_ins_author |      423    72.32     1.24    71.00    74.00     ea_ins_better |      423    71.50     2.51    67.00    75.00    ea_ins_quality |      423    84.16     2.97    79.00    88.00   ea_ins_contrib2 |      416    80.35     4.82    72.00    88.00    ea_ins_custom2 |      416    73.22     7.98    52.00    83.00    ea_ins_timely2 |      416    47.98     7.91    36.00    64.00      ea_ins_flat2 |      416    60.74     7.18    49.00    72.00      ea_ins_risk2 |      416    59.36     6.43    48.00    71.00    ea_ins_author2 |      416    72.10     5.65    54.00    78.00    ea_ins_better2 |      416    68.98     5.04    60.00    76.00   ea_ins_quality2 |      416    83.28     4.90    68.00    87.00  	
*/	
628	// replace ot_ins_chgcom_=58.39 if sector=="Financials"
629	replace ot_ins_chgcom_=55.18 if sector=="Healthcare"
630	// replace ot_ins_chgcom_=58.35 if sector=="Life Sciences"
631	replace ot_ins_chgcom_=59.15 if sector=="Technology"
632	count if ot_ins_chgcom_==. // 0
633   
634	*
635	* Empowerment and alignment
636	*
637   
638	fsum ea_*
639	/*
640	Variable |        N     Mean       SD      Min      Max 
641	-----------------+---------------------------------------------
642	ea_cg_nps |      428    32.98     5.26    22.00    38.00  
643   
644   
645   
646   
647   
648   
649   
650   
651   
652   
653   
654   
655   
656   
657   
658   
659   
660   
661   
662   
663   
664   
 
665   * ea_ins_contrib from ea_ins_contrib2
666   
667	list company sector subsector country ea_ins_contrib* if ea_ins_contrib==., clean noobs
668	table country sector, c(mean ea_ins_contrib)
669	* the missing ones are all in Technology, where their peers have a score of 80, so use this
670	gen ea_ins_contrib_=ea_ins_contrib
671	replace ea_ins_contrib_=80 if ea_ins_contrib_==. & sector=="Technology"
672   
673   * ea_ins_custom
674   
675	list company sector subsector country ea_ins_custom* if ea_ins_custom==., clean noobs
676	table country sector, c(mean ea_ins_custom)
677	gen ea_ins_custom_=ea_ins_custom
678	replace ea_ins_custom_=76 if ea_ins_custom_==. & sector=="Technology"
679   
680	list company sector country ea_ins_contrib* ea_ins_author ea_ins_better ea_ins_quality ///
681	if ea_ins_contrib==., clean noobs
682   
683   * timely and flat, both from ~2
684   
685	list company sector subsector country ea_ins_timely* if ea_ins_timely==., clean noobs
686	table country sector, c(mean ea_ins_timely)
687	* the usual suspects for Technology; Healthcare is entirely missing
688	gen ea_ins_timely_=ea_ins_timely
689	replace ea_ins_timely_=54 if ea_ins_timely_==. & sector=="Technology"
690   
691	egen w_ea_ins_timely2 = wtmean(ea_ins_timely2), weight(NGDP) by(sector)
692	egen wb_ea_ins_timely2 = wtmean(ea_ins_timely2), weight(NGDPPC) by(sector)
693	egen wc_ea_ins_timely2 = wtmean(ea_ins_timely2), weight(PPPPC) by(sector)
694   
695	tabstat ea_ins_timely ea_ins_timely2 w_ea_ins_timely2 w?_ea_ins_timely2 ///
696	, by(sector) s(mean) // varwidth(16)
697   
698	// gen ea_ins_timely_=ea_ins_timely
699	// replace ea_ins_timely_=58.37 if sector=="Consumer"
700	// replace ea_ins_timely_=58.39 if sector=="Financials"
701	replace ea_ins_timely_=49.46 if sector=="Healthcare" & ea_ins_timely_==.
702	// replace ea_ins_timely_=58.35 if sector=="Life Sciences"
703	// replace ea_ins_timely_=59.15 if sector=="Technology"
704	count if ea_ins_timely_==. // 0
705   
706	list company sector subsector country ea_ins_flat* if ea_ins_flat==., clean noobs
707	table country sector, c(mean ea_ins_flat)
708	* the usual suspects for Technology; Healthcare is entirely missing
709	gen ea_ins_flat_=ea_ins_flat
710	replace ea_ins_flat_=57 if ea_ins_flat_==. & sector=="Technology"
711   
712	egen w_ea_ins_flat2 = wtmean(ea_ins_flat2), weight(NGDP) by(sector)
713	egen wb_ea_ins_flat2 = wtmean(ea_ins_flat2), weight(NGDPPC) by(sector)
714	egen wc_ea_ins_flat2 = wtmean(ea_ins_flat2), weight(PPPPC) by(sector)
715   
716	tabstat ea_ins_flat ea_ins_flat2 w_ea_ins_flat2 w?_ea_ins_flat2 ///
717	, by(sector) s(mean) // varwidth(16)
718   
719	// gen ea_ins_flat_=ea_ins_flat
720	// replace ea_ins_flat_=58.37 if sector=="Consumer"
721	// replace ea_ins_flat_=58.39 if sector=="Financials"
722	replace ea_ins_flat_=59.46 if sector=="Healthcare" & ea_ins_flat_==.
723	// replace ea_ins_flat_=58.35 if sector=="Life Sciences"
724	// replace ea_ins_flat_=59.15 if sector=="Technology"
725	count if ea_ins_flat_==. // 0
726   
727   * risk from risk2
728   
729	list company sector subsector country ea_ins_risk* if ea_ins_risk==., clean noobs
730	// missing healthcare and life sciences, plus the usual suspects
731	table country sector, c(mean ea_ins_risk)
732	gen ea_ins_risk_=ea_ins_risk
733	replace ea_ins_risk_=65 if ea_ins_risk_==. & sector=="Technology"
734   
735	egen w_ea_ins_risk2 = wtmean(ea_ins_risk2), weight(NGDP) by(sector)
736	egen wb_ea_ins_risk2 = wtmean(ea_ins_risk2), weight(NGDPPC) by(sector)
737	egen wc_ea_ins_risk2 = wtmean(ea_ins_risk2), weight(PPPPC) by(sector) 738   
739	tabstat ea_ins_risk ea_ins_risk2 w_ea_ins_risk2 w?_ea_ins_risk2 ///
740	, by(sector) s(mean) // varwidth(16)
741   
742	// gen ea_ins_risk_=ea_ins_risk
743	// replace ea_ins_risk_=58.37 if sector=="Consumer"
744	// replace ea_ins_risk_=58.39 if sector=="Financials"
745	replace ea_ins_risk_=61 if sector=="Healthcare" & ea_ins_risk_==.
746	replace ea_ins_risk_=61 if sector=="Life Sciences" & ea_ins_risk_==.
747	// replace ea_ins_risk_=59.15 if sector=="Technology"
748	count if ea_ins_risk_==. // 0
749   
750   * Author, better and quality --> probably the usual 5 suspects
751   
752	tabstat ea_ins_author ea_ins_better ea_ins_quality if sector=="Technology" ///
753	, by(country) s(mean)
754	/*
755	country |  ea_in~or  ea_in~er  ea_in~ty
756	---------------+------------------------------
757	Australia |        72        73        84
758	Brazil |        72        73        84
759	China |        72        73        84
760	France |        72        73        84
761	Germany |        72        73        84
762	India |        72        73        84763           Israel |         .         .         .
764	Japan |        72        73        84
765	Mexico |        72        73        84
766	Netherlands |        72        73        84767            Qatar |         .         .         .
768           Russia |        72        73        84 769     Saudi Arabia |         .         .         .
770           Turkey |        72        73        84 771              UAE |         .         .         .
772	UK |        72        73        84
773	USA |        72        73        84
774	*/
775	foreach v in author better quality {
 
776	gen ea_ins_`v'_=ea_ins_`v'
777	replace ea_ins_`v'_=72 if ea_ins_`v'_==. & sector=="Technology" /// 778   	& "`v'"=="author"
 
779	replace ea_ins_`v'_=73 if ea_ins_`v'_==. & sector=="Technology" ///
780	& "`v'"=="better"
781	replace ea_ins_`v'_=84 if ea_ins_`v'_==. & sector=="Technology" ///
 
782	& "`v'"=="quality"
783	}
784	*
 
785	* df and Focus
786	*
787   
788	fsum df_*
789	/*
790	Variable |        N     Mean       SD      Min      Max
791	-----------------+---------------------------------------------
792	df_cw_risklead |      428     0.16     0.36     0.00     1.00  
793	df_goo_ceo3 |      428     0.58     0.49     0.00     1.00  
794	df_ins_inform2 |      356    69.17     5.45    59.00    78.00  
795	df_ins_effic2 |       91    54.05    11.59    38.00    65.00  
796	df_ins_support2 |      327    65.42     8.61    50.00    80.00  
797	df_ins_account2 |      416    76.76     4.47    71.00    83.00  
798	df_ins_tsenio |      428    65.23     3.91    60.33    73.00  
799	df_ins_expect |      428    87.43     1.75    85.00    90.00  
800   
801   */
802   
803   drop df_ins_effic2 // too few obs
804   
805   // hist df_ins_inform2
806   
807	reg df_ins_inform2 ///
808	i.iregion##c.PPPPCln ///
809	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH
810	predict temp
811	summ df_ins_inform2 temp
812	ren temp yhat_df_ins_inform2
813	gen df_ins_inform2_=df_ins_inform2
814	replace df_ins_inform2_=yhat_df_ins_inform2 if df_ins_inform2_==.
815   
816   // hist df_ins_support2
817   
818	reg df_ins_support2 ///
819	i.iregion##c.PPPPCln ///
820	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH
821	predict temp
822	summ df_ins_support2 temp
823	ren temp yhat_df_ins_support2
824	gen df_ins_support2_=df_ins_support2
825	replace df_ins_support2_=yhat_df_ins_support2 if df_ins_support2_==.
826   
827   * NOTE: Never mind account2 -- we won't be using it (country-level data)
828   
829	*
830	* Digital readiness
831	*
832   
833	fsum dr_*
834	/*
835	Variable |        N     Mean       SD      Min      
Max                                                                                        
836	---------------+---------------------------------------------
837	dr_soc_active |      428     1.11     0.89     0.00     2.00  
838	dr_cw_engage |      428     0.35     0.48     0.00     1.00  
839	dr_bl_digacq |      428     0.15     0.36     0.00     1.00  
840	dr_cw_digstr |      428     0.63     0.86     0.00     2.00  
841	dr_cw_respons |      428     0.73     0.44     0.00     1.00  
842	*/
843   
844   label var company ""
845   
846	sort company
847	save digital_4, replace
848   
849   /*
850   
851   Now the specifically country level datasets, to be merged in later
852   
853   */
854   
855	foreach v in Agility Connectivity Openness_and_transparency Empowerment_and_alignment Discipline_and_focus Digital_readiness {
856	local a=subinstr("`v'","_"," ",.)
857	import excel "Country indicators_data sources_27JAN", sheet("`a'") /// 858   	cellrange(B3) first clear
863   
864   
865   
866   
867   
868   
869   
870   
871   
872   
873   
874   
875   
876   *
 
883	/*
884	ag IC_REG_COST_PC_ZS                Cost business start-up procedures (% GNI pcap)
885	co IT_CEL_SETS_P2                   Mobile cellular subscriptions (per 100 people)
886	co IT_NET_SECR_P6                   Secure Internet servers (per 1 million people)
887	ot IQ_CPA_PROP_XQ                   CPIA property rights rule-based governance  (1=low to 6=high)
888	dr FS_AST_PRVT_GD_ZS                Domestic credit to priv sector (% GDP)
889   
890	ot WGI_2015 // rq
891	df WGI_2015 // ps rl
892	*/
893   
894	use mengwen, clear
895	gen year=2015
896	qui tsset ifscode year
897	qui merge ifscode year using "$util\WDI201701", ///
898	keep(IC_REG_COST_PC_ZS IT_CEL_SETS_P2 IT_NET_SECR_P6 IQ_CPA_PROP_XQ FS_AST_PRVT_GD_ZS)
899	drop _merge*
900	tsset ifscode year
901	replace country=country[_n-1] if country=="" & ifscode==ifscode[_n-1]
902	gsort ifscode -year
903	replace country=country[_n-1] if country=="" & ifscode==ifscode[_n-1]
904	tsset ifscode year
905	keep if tin(2012,2017) // 10,920 deleted
906	drop if country=="" // 945 deleted
907	drop IQ_CPA_PROP_XQ // almost no data
908	ren IC_REG_COST_PC_ZS bussta //            Cost business start-up procedures (% GNI pcap) 909   ren IT_CEL_SETS_P2 mobcel //            Mobile cellular subscriptions (per 100 people)
910	ren IT_NET_SECR_P6	server //            Secure Internet servers (per 1 million people)
911	ren FS_AST_PRVT_GD_ZS credit //            Domestic credit to priv sector (% GDP) 912   foreach v of varlist credit-server { 913   	replace `v'=L.`v' if `v'==.
914	}
915	keep if year==2015
916	qui merge ifscode year using "$util\WGI_2015", keep(wgirq wgips wgirl)
917	drop _merge*
918	keep if year==2015
919	drop if country==""
920	order year
921	order bussta, after(patentpc)
922	order mobcel, after(webspeed)
923	order server, after(mobcel)
924	order credit, after(custorie)
925	order wgirq, before(privatepr)
926	order wgips, before(vulclim)
927	order wgirl, before(vulclim)
928	replace innotwo="0" if innotwo=="N"
929	replace innotwo="1" if innotwo=="Y"
930	destring innotwo, replace
931	qui ds year-country, not
932	foreach v in `r(varlist)' {
933	destring `v', replace ignore(",") force
934	}
935	drop fortrain webgdp // too few observations
936	fsum innotwo-webcreate, label
937	/*
938	Variable |        N     Mean       SD      Min      
Max                                                                                        
939	------------+---------------------------------------------
940	innotwo |       29     0.38     0.49     0.00     1.00  Forbes: Country includes two or more of the worlds most innovative cos
941	patentpc |       29   102.29   112.37     0.10   335.40  WEF: PCT patent applications (applications/million pop.)
942	bussta |       29     6.44     8.03     0.10    34.20  Cost business start-up procedures (% GNI pcap)
943	compol |       29     4.53     0.68     3.00     5.60  WEF: Effectivenss of anti-monopoly policy (1=ineffective; 7=extremely effective)
944	invfree |       29    66.55    23.80     0.00    95.00  Heritage: Financial restrictions e.g. capital controls
945	newtech |       29     5.18     0.67     3.70     6.10  WEF: Extent of new technology adoption by firms (1=not; 7=extensive)
946	webspeed |       27    11.68     5.76     3.20    27.00  Akamai: Internet speed (MbS)
947	mobcel |       29   123.00    29.23    78.84   187.35  Mobile cellular subscriptions (per 100 people)
948	server |       29   926.16   999.33     5.44  3100.05  Secure Internet servers (per 1 million people)
949	tariffs |       29     5.10     5.71     1.00    28.00  WEF: Trade-weighted average tariff rate
950	fdiav |       29     4.91     0.58     3.50     6.30  WEF: FDI brings new tech into country (1=not; 7=great extent)
951	wgirq |       29     0.80     0.95    -1.28     1.86  WGI: RegulatoryQuality
952	privatepr |       29    64.14    27.09    10.00    95.00  WEF: Private property rights
953	talentkeep |       29     4.23     1.20     2.20     6.30  WEF: Country attracts talent (1=no, the best leave; 7=yes, the brightest stay)
954	proftrain |       29     5.01     0.89     2.70     6.60  WEF: Professional training (1=not avail; 7=widely avail)
955	wrights |       28     3.25     1.53     1.00     5.00  ITUC: Worker protections (up=least protections)
956	insolve |       29    61.31    25.11     0.00    93.34  WBDB: Insolvency regime DTF
957	iprotect |       29     5.92     1.22     3.70     7.80  WEF: Strength of Investor Protection Index on a 0–10 (best) scale
958	wgips |       29     0.09     0.95    -1.72     1.41  WGI: PoliticalStabilityNoViolence
959	wgirl |       29     0.85     1.02    -0.95     2.04  WGI: RuleofLaw
960	vulclim |       29    66.29    10.06    46.40    81.30  ND Gain: Exposure to climate change (0-100 most exposed)
961	resilience |       29    68.60    23.94    29.00   100.00  FMG: Global Reslience Index (0-100 most resilient)
962	settotal |       25    43.49    16.11    19.90    95.40  GII: Science mfg eng constr % tertiary grads
963	govtech |       29     3.83     0.68     2.70     5.60  WEF: Govt purchases foster innov (1=not; 7=great extent)
964	custorie |       29     5.22     0.56     3.80     6.20  WEF: Customer-focus (1=poor; 7=extremely focused on customer)
965	credit |       28    99.82    47.75    26.47   194.41  Domestic credit to priv sector (% GDP)
966	mathsci |       29     4.64     0.88     2.60     5.90  WEF: Math/Science educ 
(1=poor; 7=excellent)
967	webcreate |       29    30.91    33.56     0.00   100.00  GII: Country top-level domains, Wikipedia page edits, Youtube uploads (all per c
order proftrain-iprotect, before(df_cw_risklead)	
order wgips-resilience, before(dr_soc_active) order settotal-webcreate, before(BCA_NGDPD) foreach v of varlist innotwo-newtech {	
ren	`v' ag_`v'		
} foreach	v of varli	st webspeed-fdiav {	
ren	`v' co_`v'		
} foreach	v of varli	st wgirq-talentkeep {	
ren	`v' ot_`v'		
} foreach	v of varli	st proftrain-iprotect {	
ren	`v' ea_`v'		
} foreach	v of varli	st wgips-resilience {	
ren	`v' df_`v'		
}			
foreach ren	v of varli `v' dr_`v'	st settotal-webcreate {	
			
}
968	*/
969	qui tsset ifscode year
970	// capture noi ren reslience resilience // this might have been fixed in the Excel doc, hence the "capture"
971	save mengwen_1, replace
972   
973	use digital_4, clear
974	replace year=2015 975   sort ifscode year
976	qui merge ifscode year using mengwen_1
977	drop _merge
978	sort ifscode year
979	order innotwo-newtech, before(co_cw_divers)
980	order webspeed-fdiav, before(ot_fb_custpage)
981	order wgirq-talentkeep, before(ea_cg_nps)
982   
983   
984   
985   
986   
987   
988   
989   
990   
991   
992   
993   
994   
995   
996   
997   
998   
999   1000   
1001   
1002   
1003   *
1004   
1005	* 
1006	* Impute the "Mengwen" set of country-specific variables
1007	*
1008   
1009   // hist co_webspeed 1010   reg co_webspeed ///
1011	i.iregion##c.PPPPCln ///
1012	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH
1013	predict temp
1014	summ co_webspeed temp
1015	drop temp
1016	gen co_webspeed_pr=co_webspeed*.01
1017	glm co_webspeed_pr ///
1018	i.iregion##c.PPPPCln ///
1019	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
1020	, family(binomial) link(logit) robust
1021	predict temp
1022	summ co_webspeed_pr temp
1023	ren temp yhat_co_webspeed_pr 1024   gen co_webspeed_=co_webspeed
1025   replace co_webspeed_=yhat_co_webspeed_pr*100 if co_webspeed_==.
1026   
1027	// hist ea_wrights
1028	list ifscode country ea_wrights if ea_wrights==. | country=="Germany"
1029	gen ea_wrights_=ea_wrights
1030	replace ea_wrights_=1 if ea_wrights==.
1031   
1032   // hist dr_settotal 1033   reg dr_settotal ///
1034	i.iregion##c.PPPPCln ///
1035	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH
1036	predict temp
1037	summ dr_settotal temp
1038	drop temp
1039	gen dr_settotal_pr=dr_settotal*.01
1040	glm dr_settotal_pr ///
1041	i.iregion##c.PPPPCln ///
1042	BCA_NGDPD GGXWDG_NGDP GGX_NGDP LPln PCPIPCH ///
1043	, family(binomial) link(logit) robust
1044	predict temp
1045	summ dr_settotal_pr temp
1046	ren temp yhat_dr_settotal_pr 1047   gen dr_settotal_=dr_settotal
1048   replace dr_settotal_=yhat_dr_settotal_pr*100 if dr_settotal_==.
1049   
1050	list ifscode country dr_credit if dr_credit==. | ifscode==111
1051	gen dr_credit_=dr_credit
1052	replace dr_credit_=188.83112 if dr_credit_==. & ifscode==156
1053   
1054   save digital_5, replace
1055   
1056   /*
1057   
1058   Arrange the variables 
1059   
1060	We want a shadow of every variable which indicates whether the observation is
1061	imputed (0/1); discarding the "~_" and leaving the native named variables as
1062	fully populated
1063   
1064	*/
1065	set varabbrev off, permanent // this is crucial
1066   
1067	use digital_5, clear
1068	drop sco_ins_sharing // string version of numeric variable
1069	qui ds ag_cw_journey-dr_webcreate
1070	foreach v in `r(varlist)' {
 
1071	gen imp_`v'=0
1072	label var imp_`v' "imputed `v' (0/1)" 1073   	qui replace imp_`v'=1 if `v'==.
 
1074	capture replace `v'=`v'_
1075	capture drop `v'_
1076	order imp_`v', before(BCA_NGDPD)
 
1077	capture drop `v'_pr // the proportion version of the variable
 
1078	}
1079	*
1080	* Report the maxima and minima
1081	*
1082   
1083	qui ds ag_cw_journey-dr_webcreate
1084	fsum `r(varlist)', s(min max sd) // label
1085   
1086   /*
1087   
1088   We can now do factor analysis. 
1089   
1090	1. Z-score (append name with "z")
1091	2. Reverse Z-score as necc (append name with additional "r")
1092	3. Example factor analysis:
1093   
1094	global listpersfa civlibz conscz deathpenzr lgbtz rrgovzr rrsoczr marrapez pressfreezr freedomz immigz lgbz racialz
1095	polychoric $listpersfa
1096	display r(sum_w) 
1097	global enviro = r(sum_w)
1098	matrix r = r(R)
1099	factormat r, n($enviro) pcf 
1100	estat kmo 
1101	estat smc
1102	rotate 
1103   
1104   fsum $listpersfa, s(n) label
1105   
1106   http://www.talkstats.com/showthread.php/5180-Singular-correlation-matrix-problem
1107   
1108	NOTE: The factor analysis will generate our scoring coefficients for the retained
1109	factors. We will then add the globally pluasible worst and best company
1110	(bringing N to 417, up from 415) from vars_minmax.xlsx. We will then re-generate
1111	the z scores based on the N=417 dataset, and calculate the factors as the weighted
1112	sum of *those* z scores (weighted by the scoring coefficients).
1113   
SD                                                                             	            
------------------+---------------------------
    ag_cw_journey |      428     0.25     0.43  Are there any BoD or Senior Lea	dership 
roles focused on the customer journey? At
    ag_cw_improve |      428     0.31     0.46  Does company mission statement/ 
principles emphasize continual improvement? Lean
 ag_gt_contingent |      428     9.56    14.81  For each industy in a given cou	ntry, what 
is average interest in contingent work
  ag_ins_innovate |      428    56.75     3.56  The company is innovative in ho	w work is 
done (using new technologies or creativ
   ag_ins_respond |      428    62.38     6.81  The company is responding effec	tively to 
changes in the business environment
   ag_ins_product |      428    57.31     0.32  The company is innovative in de	veloping 
new products and services		
 ag_ins_innovate2 |      416    57.03     8.90  The company is innovative in ho	w work is 
done (using new technologies or creativ
  ag_ins_respond2 |      416    63.19     6.36  The company is responding effec	tively to 
changes in the business environment	
  ag_ins_product2 |      428    65.25     8.47  The company is innovative in de	veloping 
new products and services		
1114   */
1115   
1116	*
1117	* ag
1118	*
1119   
1120	qui ds ag_*
1121	global ag `r(varlist)'
1122	di "$ag"
1123   
1124   * check the standard deviations
1125   
1126	fsum $ag, s(sd) label
1127	/*
1128	Variable |        N     Mean       
1129   
1130   
1131   
1132   
1133   
1134   
1135   
1136   
1137   
1138   
1139	ag_lit_act |      428     3.17     0.94  Given the digital maturity of each sector, are decisions slow/deliberative or ni
1140	ag_ins_execlearn |      428    53.12     2.04  What % of senior executives have strong learning agility by sector and country 
1141	ag_ins_success |      428    72.32     5.30  I believe that the company will be successful over the next 2-3 years
1142	ag_ins_quality |      428    78.23     3.92  The company provides high quality products and services 
1143	ag_innotwo |      428     0.44     0.50  Forbes: Country includes two or more of the worlds most innovative cos
1144	ag_patentpc |      428    99.03   105.40  WEF: PCT patent applications (applications/million pop.)
1145	ag_bussta |      428     5.50     6.22  Cost business start-up procedures (% GNI pcap)
1146	ag_compol |      428     4.57     0.67  WEF: Effectivenss of anti-monopoly policy (1=ineffective; 7=extremely effective)
1147	ag_invfree |      428    65.14    21.92  Heritage: Financial restrictions e.g. capital controls
1148	ag_newtech |      428     5.17     0.59  WEF: Extent of new technology adoption by firms (1=not; 7=extensive)
1149	*/
1150	// hist ag_patentpc
1151	summ ag_patentpc
1152	gen ag_patentpcln=ln(ag_patentpc)
1153	// hist ag_patentpcln
1154	summ ag_patentpcln // use this one
1155	replace ag_patentpc=ln(ag_patentpc)
1156	drop ag_patentpcln
1157	ren ag_patentpc ag_patentpcln
1158	local lab : variable label ag_patentpcln
1159	label var ag_patentpcln "LN `lab'"
1160	qui ds ag_*
1161	global ag `r(varlist)'
1162	di "$ag"
1163   
1164   * check for high correlations
1165   
1166	pwcorr $ag
1167	/* OBE
1168	// ag_ins_inn~2 ag_ins_res~2 ag_patentpcln are problematic
1169	foreach v in ins_innovate2 ins_respond2 patentpcln {
1170	ren ag_`v' _ag_`v'
1171	}
1172	*/
1173   
1174   * Use the Insight sector averages, rather than the Insight country data (which seem flawed) 1175   
1176	foreach v in $ag {
1177	if substr("`v'",4,3)=="ins" & substr("`v'",-1,1)=="2" {
1178	ren `v' _`v'
1195   
1196   
1197   
1198   
1199   
1201   
1204	gen `v'zr=-1*`v'z
1205	local lab : variable label `v'z
1206	label var `v'zr "r `lab'"
 
1207	}
1208   
 
1209   * FA 
1210   
1211	di "$ag"
1212	global agfa ag_cw_journeyz ag_cw_improvez ag_gt_contingentz ag_ins_innovatez ///
1213	ag_ins_respondz ag_ins_productz ag_lit_actz ag_ins_execlearnz /// ag_ins_successz /// ag_ins_qualityz 
1214	ag_innotwoz ag_patentpclnz ag_busstazr ag_compolz ag_invfreez ag_newtechz
1215   
1216	/*
1217	polychoricpca $agfa
1218	mat eigen = r(eigenvalues)
1219	gen eigen = eigen[1,_n]
1220	g component=_n
1221	twoway line eigen component in 1/17, xla(1/17) sort ytitle(Eigenvalues) ///
1222	yline(1, lwidth(medium) lcolor(red)) xtitle(Number of components) ///
1223	title(Scree plot of eigenvalues after pca)
1224	*/
1225   
1226   polychoric $agfa 1227   display r(sum_w)
1228	global polyag = r(sum_w)
1229	matrix rag = r(R)
1230	factormat rag, n($polyag) pcf forcepsd
1231	estat kmo
1232	estat smc
1233	rotate
1234	fsum $agfa, s(n) label
1235   
1236	*
1237	* Connectivity
1238	*
fsum co_lin_folemp*, label  	
/*	
         Variable |        N     Mean       SD      Min      Max
------------------+---------------------------------------------		
    co_lin_folemp |      415    13.19    27.42     0.24   507.40  On LinkedIn, the ratio of followers to employees?	what is 
  co_lin_folempln |      393     2.13     0.91    -1.25     6.23   co_lin_folemp_ln |      415     2.12     0.91    -1.44     6.23  	
*/
* we want the imputed version of the logged variable replace co_lin_folemp=co_lin_folemp_ln drop co_lin_folempln co_lin_folemp_ln ren co_lin_folemp co_lin_folempln local lab : variable label co_lin_folempln label var co_lin_folempln "LN `lab'" * rename the extraneous variables	
foreach v in 0 1 2 max { ren co_cw_divers_`v'		
	_co_cw_divers_`v'	
} qui ds co_*	
global co `r(varlist)'
1239   
1240   * Use the Insight sector averages, rather than the Insight country data (which seem flawed) 1241   
1242	foreach v of varlist co_* {
1243	if substr("`v'",4,3)=="ins" & substr("`v'",-1,1)=="2" {
1244	ren `v' _`v'
1245	}
1246	}
1247   
1248	qui ds co_*
1249	global co `r(varlist)'
1250	di "$co"
1251   
1252   * check the standard deviations
1253   
1254   fsum $co, s(sd) label
1255   
1256   
1257   
1258   
1259   
1260   
1261   
1262   
1263   
1264   
1265   
1266   
1267   
1268   
1269   
1270   
1271   
1272   
1273   
1274   
1275   
 
1276	fsum $co, s(sd) label
1277	/*
1278	Variable |        N     Mean       SD  
1279	-----------------+---------------------------
1280	co_cw_divers |      428     1.11     0.80  How diverse is the board of directors? 0 = 
Local national men only
1281	co_goo_prodpart |      428     0.67     0.47  Within the last 12 months, has the company launched a product/service or a new p
1282	co_lin_folempln |      428     2.12     0.89  LN On LinkedIn, what is the ratio of followers to employees?
1283	co_gt_ceo |      428    20.18    19.58  What is the CEO's average interest over 12 months? i.e. how involved his s/he in
1284	co_ins_sharing |      428    64.75     4.19  There is effective sharing of ideas and resources across the company
1285	co_ins_coop |      428    62.26     4.10  There is good cooperation between departments in the company
1286	co_cw_thlead |      428     0.38     0.49  Does the company publish thought leadership? 0 = No, 1 = Yes
1287	co_ins_wsupport |      428    56.23     2.95  My work group receives high quality support from other parts of the company we d
1288	co_webspeed |      428    10.58     4.78  Akamai: Internet speed (MbS)
1289	co_mobcel |      428   117.59    24.35  Mobile cellular subscriptions (per 100 people)
1290	co_server |      428   852.75   880.78  Secure Internet servers (per 1 million people)
1291	co_tariffs |      428     4.71     4.30  WEF: Trade-weighted average tariff rate
1292	co_fdiav |      428     4.84     0.46  WEF: FDI brings new tech into country 
(1=not; 7=great extent)
1293	*/
1294	// hist co_gt_ceo
1295	summ co_gt_ceo // min zero; leave it
1296	// hist co_mobcel
1297	gen temp=ln(co_mobcel) 1298   // hist temp
1299	replace co_mobcel=temp
1300	drop temp
1301	ren co_mobcel co_mobcelln
1302	local lab : variable label co_mobcelln
1303	label var co_mobcelln "LN `lab'"
1304	summ co_server
1305	gen temp=ln(co_server) 1306   // hist temp
1307	replace co_server=temp
1308	drop temp
1309	ren co_server co_serverln
1310	local lab : variable label co_serverln
1311	label var co_serverln "LN `lab'"
1312	qui ds co_*
1313	global co `r(varlist)'
1314	fsum $co, s(sd) label
1315	/*
1316	Variable |        N     Mean       SD 
1317	-----------------+---------------------------
1318	co_cw_divers |      428     1.11     0.80  How diverse is the board of directors? 0 = 
Local national men only
1319	co_goo_prodpart |      428     0.67     0.47  Within the last 12 months, has the company launched a product/service or a new p
1320	co_lin_folempln |      428     2.12     0.89  LN On LinkedIn, what is the ratio of followers to employees?
1321	co_gt_ceo |      428    20.18    19.58  What is the CEO's average interest over 12 months? i.e. how involved his s/he in
1322	co_ins_sharing |      428    64.75     4.19  There is effective sharing of ideas and resources across the company
1323	co_ins_coop |      428    62.26     4.10  There is good cooperation between departments in the company
1324	co_cw_thlead |      428     0.38     0.49  Does the company publish thought leadership? 0 = No, 1 = Yes
1325	co_ins_wsupport |      428    56.23     2.95  My work group receives high quality support from other parts of the company we d
1326	co_webspeed |      428    10.58     4.78  Akamai: Internet speed (MbS)
1327	co_mobcelln |      428     4.75     0.21  LN Mobile cellular subscriptions (per 100 people)
1328	co_serverln |      428     5.57     1.98  LN Secure Internet servers (per 1 million people)
1329	co_tariffs |      428     4.71     4.30  WEF: Trade-weighted average tariff rate
1330	co_fdiav |      428     4.84     0.46  WEF: FDI brings new tech into country 
(1=not; 7=great extent)
1331	*/
1332   
1333   * Z score
1334   
1335	foreach v in $co {
1336	qui egen `v'z=std(`v')
1337	local lab : variable label `v'
1338	label var `v'z "z `lab'"
1339	}
1340   
1341   * Reverse as/if needed
1342   
1343	foreach v in co_tariffs {
1344	gen `v'zr=-1*`v'z
1345	local lab : variable label `v'z
1346	label var `v'zr "r `lab'"
1347	}
1348   
1349   * FA
1350   
1351	di "$co"
1352	global cofa co_cw_diversz co_goo_prodpartz co_lin_folemplnz co_gt_ceoz ///
1353	co_ins_sharingz co_ins_coopz co_cw_thleadz co_ins_wsupportz co_webspeedz co_mobcellnz co_serverlnz ///
1354	co_tariffszr co_fdiavz
1355   
1356   polychoric $cofa 1357   display r(sum_w)
1358	global polyco = r(sum_w)
1359	matrix rco = r(R)
1360	factormat rco, n($polyco) pcf forcepsd
1361	estat kmo
1362	estat smc
1363	rotate
1364	fsum $cofa, s(n) label
1365   
1366   save digital_6, replace
1367   
1368	*
1369	* Openness and transparency
1370	*
1371   
1372   use digital_6, clear
1373   
1374   * Use the Insight sector averages, rather than the Insight country data (which seem flawed) 1375   
1376	foreach v of varlist ot_* {
1377	if substr("`v'",4,3)=="ins" & substr("`v'",-1,1)=="2" {
1378	ren `v' _`v'
1381   
1385   
1387   
1389   
1391   
1392   
1393   
1401   label var ot_lin_foltempln "LN `lab'"
1402   
1403   // hist ot_privatepr
1404   
1405	qui ds ot_*
1406	global ot `r(varlist)'
1407	fsum $ot, s(sd) label
1408	/*
1409	Variable |        N     Mean       
SD                                                                                         
1410	------------------+---------------------------
1411	ot_fb_custpage |      428     1.13     0.90  Does the company have an active (i.e. posts min. once per week) customer-orienta
1412	ot_lin_foltempln |      428    -1.73     1.71  LN What is the ratio of following employees to total employees? 
1413	ot_ins_chgcom |      428    57.66     1.77  When changes are made where I work, communications are handled well
1414	ot_ins_infond |      428    71.90     1.96  I have the information I need to do my job well
1415	ot_tw_tweff |      428     0.04     0.13  How effective are the companies tweets? (Distance to sector  frontier scores)
1416	ot_cm_comms |      428     5.25     3.09  Low context (i.e. good, clear communication) to high context (i.e. messages are 
1417	ot_cm_negat |      428     5.67     2.88  Direct negative feedback, indirect negative feedback
1418	ot_cm_lead |      428     6.52     2.60  Leadership: spectrum of egalitarian to hierarchical
1419	ot_gt_comms |      428     0.84     0.37  Are comms largely proactive or reactive? 0 = trend line is volatile, 1 - trend l
1420	ot_cw_csr |      428     0.69     0.46  Does the company have a CSR program?
1421	ot_ins_ideas |      428    68.35     2.61  I have opportunities to have my ideas adopted and put into use
1422	ot_wgirq |      428     0.78     0.87  WGI: RegulatoryQuality
1423	ot_privatepr |      428    63.96    25.38  WEF: Private property rights
1424	ot_talentkeep |      428     4.21     1.09  WEF: Country attracts talent (1=no, the best leave; 7=yes, the brightest stay)
1425	*/
1426   
1427   * Z score
1428   
1429	foreach v in $ot {
1430	qui egen `v'z=std(`v')
1431	local lab : variable label `v'
1432	label var `v'z "z `lab'"
1433	}
1434   
1435   * Reverse as/if needed
1436   
1437   foreach v in ot_cm_comms ot_cm_negat ot_cm_lead { 1438   	gen `v'zr=-1*`v'z
1442   
1444   
1447   
1448   
1449   
 
1461   
1462	*
1463	* Empowerment and Alignment
1464	*
1465   
1466   use digital_7, clear
1467   
1468   * Use the Insight sector averages, rather than the Insight country data (which seem flawed) 1469   
1470	foreach v of varlist ea_* {
1471	if substr("`v'",4,3)=="ins" & substr("`v'",-1,1)=="2" {
1472	ren `v' _`v'
1473	}
1474	}
1475   
1476   * check variables
1477   
1478	qui ds ea_*
1479	global ea `r(varlist)'
1480	di "$ea"
1481	tabstat $ea, by(country) s(mean) f(%9.2f)
1482   
1483   * check the standard deviations
1484   
1485	fsum $ea, s(sd min) label
1486	/*
1487	Variable |        N     Mean       SD      Min 
1488	----------------+------------------------------------
1489	ea_cg_nps |      428    32.98     5.26    22.00  What is the average NPS? 
1490	ea_pwc_randd |      428     1.08     0.96     0.00  What is R&D spending as a % of revenue? 0 = under 2.5%, 1 = between 2.5% and 7.5
1491	ea_goo_cdo |      428     0.32     0.71     0.00  Does the company have a Chief Digital Officer, Chief Data Officer (CDO), Chief I
1492	ea_cw_custom |      428     0.65     0.48     0.00  Does the company's About us / CEO message statement include references to custom
1493	ea_ins_contrib |      428    81.93     2.48    80.00  I understand how my job contributes to the company's strategic priorities and go
1494	ea_ins_custom |      428    75.84     1.07    75.00  The company is customer focused (always seeking to understand and meet customer 
1495	ea_ins_timely |      428    51.10     2.71    46.00  In the company, decisions are generally made in a timely manner 
1496	ea_ins_flat |      428    63.48     7.01    56.00  In the company, decisions are generally made at the lowest level appropriate
1497	ea_ins_risk |      428    62.90     3.49    58.00  Employees are encouraged to take reasonable risks (e.g., try new ideas, new ways
1498	ea_ins_author |      428    72.31     1.24    71.00  I have enough authority to do my job well
1499	ea_ins_better |      428    71.52     2.50    67.00  I am encouraged to come up with new or better ways of doing things
1500	ea_ins_quality |      428    84.15     2.95    79.00  The people in my work group are committed to delivering high quality products an
1501	ea_proftrain |      428     5.04     0.82     2.70  WEF: Professional training (1=not 
1502	ea_wrights |      428     3.07     1.48     1.00  ITUC: Worker protections (up=least 
1503	ea_insolve |      428    66.95    22.35     0.00  WBDB: Insolvency regime DTF
1504	ea_iprotect |      428     6.12     0.95     3.70  WEF: Strength of Investor Protection Index on a 0–10 (best) scale
1505	*/
1506	// hist ea_insolve
1507   
1509   
1511   
1513   
1514   
1515   
1516   
1517   
1521	gen `v'zr=-1*`v'z
1522	local lab : variable label `v'z
1523	label var `v'zr "r `lab'"
 
1524	}
1525   
 
1526   * FA
1527   
1528	di "$ea"
1529	global eafa ea_cg_npsz ea_goo_cdoz ea_cw_customz ea_ins_contribz /// ea_pwc_randdz ea_ins_customz ea_ins_timelyz 
1530	ea_ins_flatz ea_ins_betterz ea_ins_authorz /// ea_ins_riskz 
1531	ea_ins_qualityz ea_proftrainz ea_wrightszr ea_insolvez ea_iprotectz
1532   
1533	tabstat $eafa, by(country) s(mean) f(%9.1f)
1534	// ea_in~tz ea_i~erz	ea_i~orz	ea_i~tyz
1535	// the above seem to be highly correlated -- take out two, then three if necy
1536   
1537	global eafa ea_cg_npsz ea_goo_cdoz ea_cw_customz ea_ins_contribz /// ea_pwc_randdz ea_ins_customz ea_ins_timelyz 
1538	ea_ins_flatz /// ea_ins_betterz /// ea_ins_authorz /// ea_ins_riskz ea_ins_qualityz 
1539	ea_proftrainz ea_wrightszr ea_insolvez ea_iprotectz
1540   
1541   polychoric $eafa 1542   display r(sum_w)
1543	global polyea = r(sum_w)
1544	matrix rea = r(R)
1545	factormat rea, n($polyea) pcf forcepsd
1546	estat kmo
1547	estat smc
1548	rotate
1549	fsum $eafa, s(n) label
1550   
1551   save digital_8, replace
1552   
1553	*
1554	* df and Focus
di "$df"	
tabstat $df, by(country) s(mean) f(%9.2f)	
* check the standard deviations	
	
fsum $df, s(sd min) label	
/*
       Variable |        N     Mean       SD      	
Min                                                                            	            
----------------+------------------------------------
 df_cw_risklead |      428     0.16     0.36     0.00  Is a chief risk officer 	part of 
the leadership team? 0 = No, 1 = Yes
    df_goo_ceo3 |      428     0.58     0.49     0.00  Has the incumbent CEO se	rved for 
three years or more? 0 = No, 1 = Yes
  df_ins_tsenio |      428    65.23     3.91    60.33  I have trust and confide	nce in the 
company's senior leadership team
  df_ins_expect |      428    87.43     1.75    85.00  The company expects a hi	gh level 
of performance from its employees	
       df_wgips |      428     0.02     0.84    -1.72  WGI: PoliticalStabilityN	oViolence
       df_wgirl |      428     0.80     0.99    -0.95  WGI: RuleofLaw		
     df_vulclim |      428    66.92     9.74    46.40  ND Gain: Exposure to climate 
1555	*
1556   
1557   use digital_8, clear
1558   
1559   * Use the Insight sector averages, rather than the Insight country data (which seem flawed) 1560   
1561	foreach v of varlist df_* {
1562	if substr("`v'",4,3)=="ins" & substr("`v'",-1,1)=="2" {
1563	ren `v' _`v'
1564	}
1565	}
1566   
1567   * check variables
1568   
1569	qui ds df_*
1570	global df `r(varlist)'
1571   
1572   
1573   
1574   
1575   
1576   
1577   
1578   
1579   
1580   
1581   
1582   
1583   
1584   
1585   
1586   
change (0-100 most exposed)
1587	df_resilience |      428    68.09    21.83    29.00  FMG: Global Reslience Index (0-100 most resilient)
1588	*/
1589	// hist df_resilience
1590   
1591   * Z score
1592   
1593	foreach v in $df {
1594	qui egen `v'z=std(`v')
1595	local lab : variable label `v'
1596	label var `v'z "z `lab'"
1597	}
1598   
1599   * Reverse as/if needed
1600   
1601	foreach v in df_vulclim {
1602	gen `v'zr=-1*`v'z
1603	local lab : variable label `v'z
1604	label var `v'zr "r `lab'"
1605	}
1606   
1607   * FA
1608   
1609	di "$df"
1610	global dffa df_cw_riskleadz df_goo_ceo3z df_ins_tsenioz df_ins_expectz df_wgipsz ///
1611	df_wgirlz df_vulclimzr df_resiliencez
1612   
1613   polychoric $dffa 1614   display r(sum_w)
1615	global polydf = r(sum_w)
1616	matrix rdf = r(R)
1617	factormat rdf, n($polydf) pcf forcepsd
1618	estat kmo
1619	estat smc
1620	rotate
1621	fsum $dffa, s(n) label
}	
	
* check variables	
qui ds dr_*	
global dr `r(varlist)'	
di "$dr"
tabstat $dr, by(country) s(mean) f(%9.2f)	
* check the standard deviations	
	
fsum $dr, s(sd min) label	
/*
      Variable |        N     Mean       SD      Min  
---------------+------------------------------------
 dr_soc_active |      428     1.11     0.89     0.00  Is the company active on 	all three 
major social networks? 0 = 1 network, 1 = 2 n
  dr_cw_engage |      428     0.35     0.48     0.00  Can the company's product	/service 
be acquired and/or engaged with on the company	
  dr_bl_digacq |      428     0.15     0.36     0.00  In the last three years, 
company made an digital acquisitions or spin-of	has the 
1622   
1623   save digital_9, replace
1624   
1625	*
1626	* Digital Readiness
1627	*
1628   
1629   use digital_9, clear
1630   
1631   * Use the Insight sector averages, rather than the Insight country data (which seem flawed) 1632   
1633	foreach v of varlist dr_* {
1634	if substr("`v'",4,3)=="ins" & substr("`v'",-1,1)=="2" {
1635	ren `v' _`v'
1636	}
1637   
1638   
1639   
1640   
1641   
1642   
1643   
1644   
1645   
1646   
1647   
1648   
1649   
1650   
1651   
1652   
1653   
1654   
1655	dr_cw_digstr |      428     0.63     0.86     0.00  In the last two years, has the 
 
company publically revealed plans in a digital st
1656	dr_cw_respons |      428     0.73     0.44     0.00  Is the corporate website mobile-enabled?
1657	dr_settotal |      428    43.68    17.04    19.90  GII: Science mfg eng constr % tertiary grads
1658	dr_govtech |      428     3.83     0.61     2.70  WEF: Govt purchases foster innov (1=not; 7=great extent)
1659	dr_custorie |      428     5.18     0.53     3.80  WEF: Customer-focus (1=poor; 7=extremely focused on customer)
1660	dr_credit |      428   105.27    49.40    26.47  Domestic credit to priv sector (% GDP)
1661	dr_mathsci |      428     4.52     0.88     2.60  WEF: Math/Science educ (1=poor; 
7=excellent)
1662	dr_webcreate |      428    31.16    37.08     0.00  GII: Country top-level domains, Wikipedia page edits, Youtube uploads (all per c
1663	*/
1664	// hist dr_settotal
1665	// hist dr_credit
1666	foreach v in settotal credit {
1667	replace dr_`v'=ln(dr_`v')
1668	ren dr_`v' dr_`v'ln
1669	local lab : variable label dr_`v'ln
1670	label var dr_`v'ln "LN `lab'"
1671	}
1672	// hist dr_settotalln
1673	// hist dr_creditln
1674	qui ds dr_*
1675	global dr `r(varlist)'
1676	di "$dr"
1677   
1678   * Z score
1679   
1680	foreach v in $dr {
1681	qui egen `v'z=std(`v')
1682	local lab : variable label `v'
1683	label var `v'z "z `lab'"
1684	}
1685   
1686	* Reverse as/if needed
1687	/*
1688	foreach v in dr_vulclim {
1689	gen `v'zr=-1*`v'z
1690	local lab : variable label `v'z
1691	label var `v'zr "r `lab'"
1692	}
1693	*/
1694	* FA
1695   
1696	di "$dr"
1697	global drfa dr_soc_activez dr_cw_engagez dr_bl_digacqz dr_cw_digstrz ///
1698	dr_cw_responsz dr_settotallnz dr_govtechz dr_custoriez dr_creditlnz dr_mathsciz
1699   
1709   
1711   
1712   /*
1713   
1715   
1716   */
1717   
1721   fsum $agfa, s(N) label
1722   
1723	qui factormat rco, n($polyco) pcf forcepsd
1724	rotate
1725	predict co1 co2 co3 co4 // co5
1726	fsum $cofa, s(N) label
1727   
1728	qui factormat rot, n($polyot) pcf forcepsd
1729	rotate
1730	predict ot1 ot2 ot3 ot4
1731	fsum $otfa, s(N) label
1732   
1733	qui factormat rea, n($polyea) pcf forcepsd
1734	rotate
1735	predict ea1 ea2 ea3
1736	fsum $eafa, s(N) label
1737   
1738	qui factormat rdf, n($polydf) pcf forcepsd
1739	rotate
1740	predict df1 df2 df3
1741	fsum $dffa, s(N) label
1742   
1743	qui factormat rdr, n($polydr) pcf forcepsd
1744	rotate
1745	predict dr1 dr2 dr3
1746	fsum $drfa, s(N) label
1747   
1748   /*
1749   
1750   Import the global plausible minima and maxima
1751   
1752   */
1753   
1754	import excel using vars_minmax, sheet(minmax) cellrange(A2) first clear
1755	ren A _varname
1756	ren Min plaus_min
1757	ren Max plaus_max 1758   drop ?
1759	drop if plaus_min ==.
1760	xpose, clear varname 1761   order _varname
1762	ren _varname company
1763	gen year=2015
1764	sort company year
1765	save minmax, replace
1766   
1767   /*
1768   
1769   Import the factor scoring coefficients
1775   
1776   
1777   
1778   
1779   
1780   
1781   
1782   
1783   
1784   
1785   
1786   
1787   
1788   
1789   
1790   
1791   
1795   	sort year
1796   	save sc_`v', replace
1797   	}
1798   
1799   /*
1800   
1801   Bring it all together
1802   
1803   */
1804   
1805	use digital_10, clear
1806	tab year
1807	sort company year
1808	qui merge company year using minmax
1809	drop _merge
1810	sort company
1811	di _N // should be 417
1812	sort year
1813	qui merge year using sc_ag sc_co sc_ot sc_ea sc_df sc_dr
1814	drop _merge* 1815   sort company
1816   di _N
1817   
1818   * Report scoring coefficients and find ones which are negative
1819   
1820   fsum sc_* in 1, s(mean) label
1821   
1822   /*
1823   
1824   Calculate another set of Z scores, WITH the global plausible min/max observations (N=417)
1825   
1826   Restate the global variables here
1827   
1828   */
1829   
1830	global ag ag_cw_journey ag_cw_improve ag_gt_contingent ag_ins_innovate ///
1831	ag_ins_respond ag_ins_product ag_lit_act ag_ins_execlearn ag_ins_success ///
1832	ag_ins_quality ag_innotwo ag_patentpcln ag_bussta ag_compol ag_invfree ag_newtech
df_wgirl df_vulclim df_resilience	
global dr dr_soc_active dr_cw_engage dr_bl_digacq dr_cw_digstr dr_cw_respons /// dr_settotalln dr_govtech dr_custorie dr_creditln dr_mathsci dr_webcreate global allvars $ag $co $ot $ea $df $dr	
di "$allvars"		
	
* Do the 2 fictitious companies have data for all the variables?	
	
fsum $allvars, s(N) label	
* Populate the 2 fake company ln(X) vars where necessary
foreach v in ag_patentpc co_lin_folemp co_mobcel co_server ot_lin_foltemp dr_set dr_credit { replace `v'ln=ln(`v') if `v'ln==.
}	total
	
foreach v in $allvars { qui egen `v'_z=std(		
	`v')	
1833   
1834	global co co_cw_divers co_goo_prodpart co_lin_folempln co_gt_ceo co_ins_sharing ///
1835	co_ins_coop co_cw_thlead co_ins_wsupport co_webspeed co_mobcelln co_serverln ///
1836	co_tariffs co_fdiav
1837   
1838	global ot ot_fb_custpage ot_lin_foltempln ot_ins_chgcom ot_ins_infond ot_tw_tweff ///
1839	ot_cm_comms ot_cm_negat ot_cm_lead ot_gt_comms ot_cw_csr ot_ins_ideas ot_wgirq ///
1840	ot_privatepr ot_talentkeep
1841   
1842	global ea ea_cg_nps ea_pwc_randd ea_goo_cdo ea_cw_custom ea_ins_contrib ///
1843	ea_ins_custom ea_ins_timely ea_ins_flat ea_ins_risk ea_ins_author ea_ins_better ///
1844	ea_ins_quality ea_proftrain ea_wrights ea_insolve ea_iprotect
1845   
1846   global df df_cw_risklead df_goo_ceo3 df_ins_tsenio df_ins_expect df_wgips ///
1847   
1848   
1849   
1850   
1851   
1852   
1853   
1854   
1855   
1856   
1857   
1858   
1859   
1860   
1861   
1862   
1863   
1864   
1865   
1866   
1867	local lab : variable label `v'
1868	label var `v'_z "z `lab'"
1869	}
1870   
1871   global reverse ag_bussta co_tariffs ot_cm_comms ot_cm_negat ot_cm_lead ea_wrights df_vulclim
1872   
1873   foreach v in $reverse { 1874   	gen `v'_zr=-1*`v'_z
1875	local lab : variable label `v'_z
1876	label var `v'_zr "r `lab'"
1877	}
1878	*
1879   
1880   /*
1881   
1882   Each factor is the scoring-coefficient-weighted sum of standardized variables
1883   
1884   */
1885   
1886	foreach v in ag co ot ea df dr {
1888   	ds `v'_*_z
1889   	foreach j in `r(varlist)' {
1890   	local k=subinstr("`j'","_z","z",1)
1887	forv i=1/7 {
 
1891	capture noi gen `v'f`i'w_`j'=`j'*sc_`v'`i'_`k'
1892	capture noi la var `v'f`i'w_`j' "`j' weighted by scoring coef for `v' factor 
`i'"
1893	}
1894	capture ds `v'_*_zr
1895	foreach j in `r(varlist)' {
1896	local k=subinstr("`j'","_zr","zr",1)
1897	capture noi gen `v'f`i'w_`j'=`j'*sc_`v'`i'_`k'
1898	capture noi la var `v'f`i'w_`j' "`j' weighted by scoring coef for `v' factor 
`i'"
1899	}
1900	capture noi egen f`i'_`v'=rowtotal(`v'f`i'w_*) // if regexm(company,"plaus_")==0
1901	capture noi la var f`i'_`v' "Sum of weighted variables for `v' factor `i'"
 
1902	}
The result is that our ostensible worst is no long scoring the worst in the sub	 index
*/
foreach v in ag co ot ea df dr {	
egen idx_`v'=rowtotal(f?_`v') // if regexm(company,"plaus_")==0	
la var idx_`v' "Raw `v' index" }	
// graph matrix idx_?? if regexm(company,"plaus_")==0 , half	
// graph export matrix.png, replace	
save digital_11, replace	
	
use digital_11, clear	
fsum idx_??, s(sd)		
/*
 Variable |        N     Mean       	
SD                                                                             	            
----------+---------------------------
1903	}
1904	*
1905	/*
 
1906	browse company f?_*
1907	browse company f2_ag sc_ag2* agf2* ag_*_z*
1908	*/
1909	/*
1910   
1911   Create the sub-indices
1912   
1913	Problem: We multiply the scoring coefficient by the standardized observation -- this means
1914	we get some big positive numbers when the sc is big and negative and the observation is negative
1915   
1916   
1917   
1918   
1919   
1920   
1921   
1922   
1923   
1924   
1925   
1926   
1927   
1928   
1929   
1930   
1931   
1932   
1933   
1934   
1935	idx_ag |      415    -0.01     1.98  
 
1936	idx_co |      415     0.00     1.87  
1937	idx_ot |      415    -0.00     1.88  
1938	idx_ea |      415     0.00     1.38  
1939	idx_df |      415     0.00     1.22  
1940	idx_dr |      415    -0.00     1.61  
1941	*/
1942	foreach v in ag co ot ea df dr {
1943	qui summ idx_`v'
1944	gen index_`v'=(idx_`v'-r(min))/(r(max)-r(min))*100
1945	la var index_`v' "`v' index, 0-100 best"
1946	}
1947	fsum index_?? if regexm(company,"plaus_")==0, s(sd min max)
1948	/*
1949	browse company index_??
1950	*/
1951   
1952   
1953   /*
1954   
1955   Create the DSI
1956   
1957   */
1958   
1959	egen DSIraw=rowtotal(idx_??)
1960	la var DSIraw "Raw DSI, mean=0"
1961	summ DSIraw
1962	gen DSI=(DSIraw-r(min))/(r(max)-r(min))*100
1963	la var DSI "DSI, 0-100 best"
1964	fsum index_* DSI* if regexm(company,"plaus_")==0, s(N min max sd)
1965	/*
1966	browse company f?_* idx_?? index_* DSI*
1967	*/
1968   
1969   /*
1970   
1971   Create the country averages, and re-scale
1972   
1973   */
1974   
1975	// replace ifscode=998 if regexm(company,"plaus_min")==1 // otherwise won't make it into average
1976	// replace ifscode=999 if regexm(company,"plaus_max")==1 // otherwise won't make it into average
1977	foreach v of varlist idx_?? {
 
1978	bysort ifscode: egen `v'_country=mean(`v') // if regexm(company,"plaus_")==0
1979	local a=substr("`v'",-2,2)
1980	la var `v'_country "Raw `a' index, country average"
 
1981	summ `v'_country
1982	replace `v'_country=r(min)-r(sd) if regexm(company,"plaus_min")==1
1983	replace `v'_country=r(max)+r(sd) if regexm(company,"plaus_max")==1
 
1984	}
 
1985	foreach v of varlist idx_??_country {
1986	local a=substr("`v'",5,2)
1987	qui summ `v'
1988	gen index_`a'_country=(`v'-r(min))/(r(max)-r(min))*100
1989	la var index_`a'_country "`a' index, country average, 0-100 best"
1990	}
1991	egen DSIraw_country=rowtotal(idx_??_country) // if regexm(company,"plaus_")==0
1992	la var DSIraw_country "Raw DSI, country level, mean=0"
1993	summ DSIraw_country
1994	gen DSI_country=(DSIraw_country-r(min))/(r(max)-r(min))*100
1995	la var DSI_country "DSI, country level, 0-100 best"
1996	fsum index_*_country DSI_country if regexm(company,"plaus_")==0, s(N min max)
1997   
1998	egen tagifs=tag(ifscode)
1999	la var tagifs "One observation of ifscode"
2000	egen tagsec=tag(sector)
2001	la var tagsec "One observation of sector"
2002	replace tagifs=1 if regexm(company,"plaus_")==1
2003	replace tagsec=1 if regexm(company,"plaus_")==1 2004   /*
2005	browse company country *_country if tagifs==1
2006	*/
2007	/*
2008   
2009   Create the sector averages, and re-scale
2010   
2011   */
2012   
2013	foreach v of varlist idx_?? {
2014	bysort sector: egen `v'_sector=mean(`v') // if regexm(company,"plaus_")==0
2015	local a=substr("`v'",-2,2)
2016	la var `v'_sector "Raw `a' index, sector average"
2017	summ `v'_sector
2018	replace `v'_sector=r(min)-r(sd) if regexm(company,"plaus_min")==1
2019	replace `v'_sector=r(max)+r(sd) if regexm(company,"plaus_max")==1
2020	}
2021	foreach v of varlist idx_??_sector {
2022	qui summ `v'
2023	local a=substr("`v'",5,2)
2024	gen index_`a'_sector=(`v'-r(min))/(r(max)-r(min))*100
2025	la var index_`a'_sector "`a' index, sector average, 0-100 best"
2026	}
2027	egen DSIraw_sector=rowtotal(idx_??_sector) // if regexm(company,"plaus_")==0
2028	la var DSIraw_sector "Raw DSI, sector level, mean=0"
2029	summ DSIraw_sector
2030	gen DSI_sector=(DSIraw_sector-r(min))/(r(max)-r(min))*100
2031	la var DSI_sector "DSI, sector level, 0-100 best"
2032   
2033	table country sector, c(mean DSI_country mean DSI_sector) f(%9.0f)
2034	sort company
2035	save digital_12, replace
2036   
2037   /*
2038   
2039   Export the lot into Excel
2040   
2041   */
2042   
2043   use digital_12, clear
2044   
2045   * Convert everything to string, insert row at top, put label in row
2046   
2047	qui ds
2048	foreach v in `r(varlist)' {
2049	tostring `v', replace force
2050	}
2051	sort company 2052   gen sort=_n
2053	local a=_N+1
2054	set obs `a'
2055	replace sort=0.5 in `a'
2056	sort sort
2057	drop sort
2058	qui ds
2059	foreach v in `r(varlist)' {
2060	local lab : variable label `v'
2061	qui replace `v'="`lab'" in 1
2062	}
2063	save digital_12s, replace
2064   
2065	export excel company country region sector subsector DSI DSIraw index_?? idx_?? ///
2066	using DSI_20170202.xlsx if regexm(company,"plaus_")==0, sheet("DSI") first(var) sheetrep
2067	egen tag=tag(ifscode)
2068	replace tag=1 in 1
2069	export excel country region DSI_country DSIraw_country index_??_country idx_??_country ///
2070	using DSI_20170202.xlsx if tag==1, sheet("DSI country avg") first(var) sheetrep
2071	drop tag
2072	egen tag=tag(sector)
2073	replace tag=1 in 1
2074	export excel sector DSI_sector DSIraw_sector index_??_sector idx_??_sector ///
2075	using DSI_20170202.xlsx if tag==1, sheet("DSI sector avg") first(var) sheetrep
2076	drop tag
2077   
2078	foreach v in ag co ot ea df dr {
2079	capture noi export excel company country region sector subsector index_`v' ///
2080	idx_`v' f?_`v' ${`v'} imp_`v'_* `v'_*_z `v'_*_zr ///
2081	using DSI_20170202.xlsx, sheet("`v' vars") first(var) sheetrep
2082	if _rc!=0 {
2083	export excel company country region sector subsector index_`v' ///
 
2084	idx_`v' f?_`v' ${`v'} imp_`v'_* `v'_*_z /// `v'_*_zr ///
2085	using DSI_20170202.xlsx, sheet("`v' vars") first(var) sheetrep
2086	}
 
2087	}
2088	*
2089   
 
2090   /*
2091   
2092   Analyse it
2093   
2094   */
2095   
2096   use digital_12, clear
2097   
2098   // graph matrix DSI index_?? if tag==1
2099   
2100	/*
2101	browse company index_??
2102	*/
2103   
2104   
2105	twoway ///
2106	(scatter DSI index_ag if iregion==1, mcolor(blue)) ///
2107	(scatter DSI index_ag if iregion==2, mcolor(red)) ///
2108	(scatter DSI index_ag if iregion==3, mcolor(green)) ///
2109	(scatter DSI index_ag if iregion==4, mcolor(orange)) ///
2110	(scatter DSI index_ag if iregion==5, mcolor(cyan)) ///
2111	(scatter DSI index_ag if iregion==6 ///
2112	, xti("Agility") mcolor(pink) legend(off) name(DSI_ag, replace))
2113   
2114	twoway ///
2115	(scatter DSI index_co if iregion==1, mcolor(blue)) ///
2116	(scatter DSI index_co if iregion==2, mcolor(red)) ///
(scatter DSI index_ea	if	iregion==1, mcolor(blue)) ///	
(scatter DSI index_ea	if	iregion==2, mcolor(red)) ///	
(scatter DSI index_ea	if	iregion==3, mcolor(green)) ///	
(scatter DSI index_ea	if	iregion==4, mcolor(orange)) ///	
(scatter DSI index_ea	if	iregion==5, mcolor(cyan)) ///	
(scatter DSI index_ea	if	iregion==6 ///	
, xti("Empowerment and Alignment") mcolor(pink) legend(off) name(DSI_ea, re	place))
twoway ///
(scatter DSI index_df	if	iregion==1, mcolor(blue)) ///	
(scatter DSI index_df	if	iregion==2, mcolor(red)) ///	
(scatter DSI index_df	if	iregion==3, mcolor(green)) ///	
(scatter DSI index_df	if	iregion==4, mcolor(orange)) ///	
(scatter DSI index_df	if	iregion==5, mcolor(cyan)) ///	
(scatter DSI index_df	if	iregion==6 ///	
, xti("Discipline and Focus") mcolor(pink) legend(off) name(DSI_df, replace) twoway ///	)
(scatter DSI index_dr if iregion==1, mcolor(blue)) ///	
(scatter DSI index_dr if iregion==2, mcolor(red)) ///
2117	(scatter DSI index_co if iregion==3, mcolor(green)) ///
2118	(scatter DSI index_co if iregion==4, mcolor(orange)) ///
2119	(scatter DSI index_co if iregion==5, mcolor(cyan)) ///
2120	(scatter DSI index_co if iregion==6 ///
2121	, xti("Connectivity") mcolor(pink) legend(off) name(DSI_co, replace))
2122   
2123	twoway ///
2124	(scatter DSI index_ot if iregion==1, mcolor(blue)) ///
2125	(scatter DSI index_ot if iregion==2, mcolor(red)) ///
2126	(scatter DSI index_ot if iregion==3, mcolor(green)) ///
2127	(scatter DSI index_ot if iregion==4, mcolor(orange)) ///
2128	(scatter DSI index_ot if iregion==5, mcolor(cyan)) ///
2129	(scatter DSI index_ot if iregion==6 ///
2130	, xti("Openness and Transparency") mcolor(pink) legend(off) name(DSI_ot, replace)) 2131   
2132   twoway ///
2133   
2134   
2135   
2136   
2137   
2138   
2139   
2140   
2141   
2142   
2143   
2144   
2145   
2146   
2147   
2148   
2149   
2150   
2151   
2152   
2153	(scatter DSI index_dr if iregion==3, mcolor(green)) ///
2154	(scatter DSI index_dr if iregion==4, mcolor(orange)) ///
 
2155	(scatter DSI index_dr if iregion==5, mcolor(cyan)) ///
2156	(scatter DSI index_dr if iregion==6 ///
2157	, xti("Digital Readiness") mcolor(pink) legend(off) name(DSI_dr, replace))
2158   
2159	graph combine DSI_ag DSI_co DSI_ot DSI_ea DSI_df DSI_dr
2160	graph export DSI_6.png, replace
2161	graph export DSI_6.pdf, replace
2162	graph close
2163	graph display DSI_ag
2164	graph export DSI_ag.png, replace
2165	graph export DSI_ag.pdf, replace
2166	graph close
2167   
2168	tabstat DSI, by(subsector) s(mean n) la(32) f(%9.1f)
2169	tabstat DSI, by(sector) s(mean n) la(32) f(%9.1f)
2170   
2171   
2172   /*
2173   
2174   Import the financial data
2175   
2176   */
2177   
2178	import excel "KF financial data_3FEB", sheet("Company Financial performance") ///
2179	cellrange(E6) first clear 2180   drop ?
2181	gen temp=.
2182	replace listed=strtrim(listed)
2183	replace temp=0 if listed=="N"
2184	replace temp=1 if listed=="Y"
2185	// browse if temp==. //, clean noobs
2186	drop if company==""
2187	qui ds
2188	foreach v in `r(varlist)' {
2189	local lab=`v' in 1
2190	label var `v' "`lab'"
2191	}
2192	drop in 1
2193	destring listed, replace force
2194	replace listed=temp
2195	drop temp
2196	foreach v of varlist revenue-rassets {
2197	destring `v', replace ignore(",") force
2198	}
2199	fsum revenue-rassets, s(n) label 2200   replace company=strtrim(company)
2201	replace company=subinstr(company,"  "," ",.)
2202	replace company="Uniqure" if company=="uniQure"
2203	replace company="Circle Health" if company=="Circle Healthcare"
2204	replace company="NTT Data Corporation" if regexm(company,"NTT")==1
2205	sort company
2206	gen temp=substr(finyear,4,.)
2207	replace temp=subinstr(temp," ","",.)
2208	list temp in 1/3
2209	gen fydate=date(temp,"DMY")
2210	format fydate %td
2211	list finyear temp fydate in 1/10 2212   gen year=.
2213	replace year=2014 if fydate<d(1jun2015)
2214	replace year=2015 if fydate>=d(1jun2015)
2215	replace year=2016 if fydate>=d(1jun2016) & fydate!=.
2216	replace market=strtrim(market)
2217	sort market year
2218	save financials, replace
2219   
2220	import excel "KF financial data_3FEB", sheet("Stock exchanges") cellrange(C3) first clear
2221	drop in 1
2222	replace market=strtrim(market)
2223	qui reshape long PE requity rassets, i(market) j(year) string
2224	ren PE PE_mkt
2225	ren requity requity_mkt
2226	ren rassets rassets_mkt
2227	foreach v of varlist year *_mkt {
2228	destring `v', replace ignore(",") force
2229	}
2230	sort market year
2231	save markets, replace
2232   
2233	import excel "KF financial data_3FEB", sheet("MSCI sector index") cellrange(C3) first clear
2234	drop in 1
2235	replace sector=strproper(sector)
2236	qui ds sector_msci-sectick, not
2237	foreach v in `r(varlist)' {
2238	destring `v', replace
2239	}
2240	qui reshape long PE_sec requity_sec rassets_sec, i(sector) j(year)
2241	sort sector year
2242	save sectors, replace 2243   
2244	use financials, clear
2245	qui merge market year using markets
2246	drop _merge
2247	sort market year
2248	replace listed=0 if company!="" & listed==.
2249	/*
2250	browse company listed market marketname markettick year PE* requity_* if listed!=0 2251   */
2252	sort company
2253	qui merge company using digital_12
2254	drop _merge
2255	sort sector year
2256	qui merge sector year using sectors
2257	drop _merge
2258	sort company year
2259   
2260   qui do "$util\00 country-to-ifscode" 2261   tab country if ifscode==.
2262	sort ifscode year
2263	foreach v in BCA_NGDPD LP GGX_NGDP NGDP NGDPPC PCPI PPPGDP PPPPC NGDPDPC ///
2264	PCPIPCH GGXWDG_NGDP NGDP_R {
2265	qui merge ifscode year using "$util\WEO201610", keep(`v') update
reg requity index_?? requity_mkt requity_sec d.NGDP_Rln d.PCPIln	
outreg2 using results1, excel nose
reg rassets DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if rassets>-100 outreg2 using results1, excel nose
reg rassets index_?? rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if rassets>-100 outreg2 using results1, excel nose
reg revenue DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if revenue<500 outreg2 using results1, excel nose
reg revenue index_?? rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if revenue<500 outreg2 using results1, excel nose
reg EBITDA DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if EBITDA>-200 outreg2 using results1, excel nose
reg EBITDA index_?? rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if EBITDA>-200 outreg2 using results1, excel nose	
reg PEln DSI PE_mktln PE_sec d.NGDP_Rln d.PCPIln	
outreg2 using results1, excel nose
2266	drop _merge
2267	qui sort ifscode year
2268	}
2269	order NGDP_R, after(PPPPC)
2270	foreach v in PPPGDP NGDP PPPPC LP NGDP_R PCPI {
2271	capture replace `v'ln=ln(`v')
2272	capture gen `v'ln=ln(`v')
2273	}
2274	*
2275	foreach v in PE PE_mkt {
2276	gen `v'ln=ln(`v')
2277	}
2278   
2279	reg requity DSI requity_mkt requity_sec d.NGDP_Rln d.PCPIln
2280	outreg2 using results1, replace excel nose
2281   
2282   
2283   
2284   
2285   
2286   
2287   
2288   
2289   
2290   
2291   
2292   
2293   
2294   
2295   
2296   
2297   
2298   
2299   
2300   
2301	reg PEln index_?? PE_mktln PE_sec d.NGDP_Rln d.PCPIln
2302	outreg2 using results1, excel nose
2303   
2304	reg margin DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if margin>-300
2305	outreg2 using results1, excel nose
2306	reg margin i.iregion1##c.DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if margin>-300
2307	outreg2 using results1, excel nose
2308	reg margin index_?? rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if margin>-300 2309   outreg2 using results1, excel nose
2310	reg margin i.iregion1##c.index_ag index_co index_ot index_ea index_df index_dr ///
2311	rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if margin>-300
2312	outreg2 using results1, excel nose
2313   
2314	hist margin if margin>-300
2315	graph export hist_margin.png, replace
2316	reg margin DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if margin>-300 ///
2317	, robust
2318   
2319   /*
2320   
2321   Interactions or inclusions of sector variables
2322   
2323   */
2324   
2325	fsum DSI*sector idx_??_sector index_??_sector tagsec, label
2326	/*
2327	Variable |        N     Mean       SD      Min      
Max                                                                                        
2328	-----------------+---------------------------------------------
2329	DSIraw_sector |      430     0.01     4.52   -12.50    14.28  Raw DSI, sector level, mean=0
2330	DSI_sector |      430    46.73    16.86     0.00   100.00  DSI, sector level, 0-100 best
2331	idx_ag_sector |      430    -0.00     0.87    -1.65     2.45  Raw ag index, sector average
2332	idx_co_sector |      430     0.00     1.02    -2.05     3.08  Raw co index, sector average
 index_df_sector |      430    47.41    20.59     0.00   100.00  df index, sect	or 
average, 0-100 best		
 index_dr_sector |      430    64.29    13.49     0.00   100.00  dr index, sect	or 
average, 0-100 best		
          tagsec |      430     0.02     0.14     0.00     1.00  One observatio
*/
tab sector if company!="", gen(isector) label	n of sector
reg PEln i.isector##c.DSI PE_mktln PE_sec d.NGDP_Rln d.PCPIln	
outreg2 using results2, replace excel nose
reg PEln i.isector##c.index_ag i.isector##c.index_co i.isector##c.index_ea ///
i.isector##c.index_ot i.isector##c.index_df i.isector##c.index_dr ///
PE_mktln PE_sec d.NGDP_Rln d.PCPIln outreg2 using results2, excel nose
reg margin i.isector##c.DSI rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if marg outreg2 using results2, excel nose	in>-300
reg margin i.isector##c.index_ag i.isector##c.index_co i.isector##c.index_ea ///	
i.isector##c.index_ot i.isector##c.index_df i.isector##c.index_dr ///	
rassets_mkt rassets_sec d.NGDP_Rln d.PCPIln if margin>-300	
2333	idx_ot_sector |      430     0.00     1.07    -2.44     2.74  Raw ot index, sector average
2334	idx_ea_sector |      430     0.00     0.56    -1.31     1.59  Raw ea index, sector average
2335	idx_df_sector |      430    -0.00     1.25    -2.89     3.20  Raw df index, sector average
2336	idx_dr_sector |      430     0.01     0.46    -2.16     1.21  Raw dr index, sector average
2337	index_ag_sector |      430    40.22    21.28     0.00   100.00  ag index, sector average, 0-100 best
2338	index_co_sector |      430    39.99    19.78     0.00   100.00  co index, sector average, 0-100 best
2339	index_ot_sector |      430    47.21    20.62     0.00   100.00  ot index, sector average, 0-100 best
2340	index_ea_sector |      430    45.14    19.21     0.00   100.00  ea index, sector average, 0-100 best
2341   
2342   
2343   
2344   
2345   
2346   
2347   
2348   
2349   
2350   
2351   
2352   
2353   
2354   
2355   
2356   
2357   
2358   
2359   
2360   outreg2 using results2, excel nose
 
2361   
2362   /*
2363   
2364	"Based on the regressions you’ve done so far, do you know which category/categories 
2365	are most important to digital sustainability? Does this change by sector?"
2366   
2367   Can't do this. But, can try to show whether sector-index is moving in same way as MSCI index
2368   
2369   */
2370   
2371   // browse sector *_sec *_sector if tagsec==1 // , clean noobs
2372   
2373   gen sectoryear=sector+" "+string(year) 2374   egen tagsecyear=tag(sector year) 2375   gen PE_sec_full=1 if PE_sec!=.
2376	gen DSI_sector_full=1 if DSI_sector!=.
2377	egen tagsecfull=tag(sector PE_sec_full DSI_sector_full)
2378	twoway ///
2379	(scatter PE_sec DSI_sector if tagsecyear==1 ///
2380	, xla(20(10)80) mlab(sectoryear) mlabp(11) yti("") subti("Price/Earnings")) ///
2381	(lfit PE_sec DSI_sector if tagsecyear==1 , name(PEs, replace) legend(off))
2382	twoway ///
2383	(scatter requity_sec DSI_sector if tagsecyear==1 ///
2384	, xla(20(10)80) mlab(sectoryear) mlabp(11) yti("") subti("Return on Equity") ) ///
2385	(lfit requity_sec DSI_sector if tagsecyear==1 , name(reqs, replace) legend(off))
2386	twoway ///
2387	(scatter rassets_sec DSI_sector if tagsecyear==1 ///
2388	, xla(20(10)80) mlab(sectoryear) mlabp(11) yti("") /// xsc(log) ///
2389	subti("Return on Assets") ) ///
2390	(lfit rassets_sec DSI_sector if tagsecyear==1 & sectoryear!="Financials 2015" ///
2391	, name(rasss, replace) legend(off) note("Note: Line of best fit exclused Financials 2015"))
2392	// list sectoryear PE_sec DSI_sector if tagsecyear==1, clean noobs
2393	graph combine PEs reqs rasss
2394	graph export sectorplots.png, replace
2395	graph draw rasss
else if "`v'"=="ea" {	
local a="Empowerment and Alignment" }	
else if "`v'"=="df" {		
local a="Discipline and Focus" }	
else if "`v'"=="dr" {		
local a="Digital Readiness" }	
twoway ///		
(scatter PE_sec index_`v'_sector if tagsecyear==1 & sectoryear!="Financials	 2015" ///
, ysc(log) xti("`a'") mlab(sectoryear) yti("") ) ///		
(lfit PE_sec index_`v'_sector, nodraw legend(off) name(temp`v', replace)) }	
graph combine tempag tempco tempot tempea tempdf tempdr ///	
, subtitle("Price/Earnings")	
graph export PE.png, replace		
	
foreach v in ag co ot ea df dr {	
if "`v'"=="ag" { local a="Agi		
	lity"
2396	graph export rasss.png, replace
2397	graph close
2398   
2399   save digital_13, replace
2400   
2401	foreach v in ag co ot ea df dr {
 
2402	if "`v'"=="ag" {
2403	local a="Agility"
2404	}
 
2405	else if "`v'"=="co" {
2406	local a="Connectivity"
2407	}
 
2408	else if "`v'"=="ot" {
2409	local a="Openness and Transparency"
2410	}
 
2411   
2412   
2413   
2414   
2415   
2416   
2417   
2418   
2419   
2420   
2421   
2422   
2423   
2424   
2425   
2426   
2427   
2428   
2429   
2430   
2431   
2432   	} 2433   	else if "`v'"=="co" {
2434	local a="Connectivity"
2435	}
 
2436	else if "`v'"=="ot" {
2437	local a="Openness and Transparency"
2438	}
 
2439	else if "`v'"=="ea" {
2440	local a="Empowerment and Alignment"
2441	}
2442	else if "`v'"=="df" {
2443	local a="Discipline and Focus"
2444	}
2445	else if "`v'"=="dr" {
2446	local a="Digital Readiness"
2447	}
2448	twoway ///
2449	(scatter requity_sec index_`v'_sector if tagsecyear==1 & sectoryear!="Financials 2015" ///
2450	, ysc(log) xti("`a'") mlab(sectoryear) yti("") nodraw) ///
2451	(lfit requity_sec index_`v'_sector, legend(off) name(temp`v', replace))
2452	}
2453	graph combine tempag tempco tempot tempea tempdf tempdr ///
2454	, subtitle("Return on Equity (%)")
2455	graph export roe.png, replace
2456   
2458   	if "`v'"=="ag" {
2459   	local a="Agility"
2460   	}
2461   	else if "`v'"=="co" {
2462   	local a="Connectivity"
2463   	}
2464   	else if "`v'"=="ot" {
2465   	local a="Openness and Transparency"
2466   	}
2467   	else if "`v'"=="ea" {
2468   	local a="Empowerment and Alignment"
2469   	}
2470   	else if "`v'"=="df" {
2471   	local a="Discipline and Focus"
2472   	}
2473   	else if "`v'"=="dr" {
2474   	local a="Digital Readiness"
2475   	}
2476   	twoway ///
2477	(scatter rassets_sec index_`v'_sector if tagsecyear==1 & sectoryear!="Financials 2015" ///
2478	, ysc(log) xti("`a'") mlab(sectoryear) yti("")) ///
2479	(lfit rassets_sec index_`v'_sector, legend(off) nodraw name(temp`v', replace))2480	}
2457   foreach v in ag co ot ea df dr {
2481	graph combine tempag tempco tempot tempea tempdf tempdr ///
2482	, subtitle("Return on Assets (%)")
2485   
2486   /*
2487   
2489   
2490   */
2492   /*
2505	(scatter margin DSI if isector==4 & margin>-300, mcolor(orange)) ///
2506	(scatter margin DSI if isector==5 & margin>-300, mcolor(cyan)) ///
2507	(scatter margin DSI if isector==6 & margin>-300, mcolor(pink)) ///
2508	(lfit margin DSI if margin>-300, ///
2509	xti("DSI") yti("Gross profit margin (%)") legend(lab(1 "Consumer")lab(2 "Financials") lab(3 "Healthcare") ///
2510	lab(4 "Industrials")lab(5 "Life Sciences")lab(6 "Technology") rows(2)) ///
2511	name(gpm_dsi, replace))
2512	graph export gpm_dsi.png, replace
2513   
2514	foreach v in ag co ot ea df dr {
 
2515	if "`v'"=="ag" {
2516	local a="Agility"
2517	}
 
2518	else if "`v'"=="co" {
2519	local a="Connectivity"
2520	}
2521	else if "`v'"=="ot" {
2522	local a="Openness and Transparency"
2523	}
2524	else if "`v'"=="ea" {
2525	local a="Empowerment and Alignment"
2526	}
2527	else if "`v'"=="df" {
2528	local a="Discipline and Focus"
2529	}
2530	else if "`v'"=="dr" {
2531	local a="Digital Readiness"
2532	}
2533	twoway ///
2534	(scatter margin index_`v' if isector==1 & margin>-300, mcolor(blue)) ///
2535	(scatter margin index_`v' if isector==2 & margin>-300, mcolor(red)) ///
2536	(scatter margin index_`v' if isector==3 & margin>-300, mcolor(green)) ///
2537	(scatter margin index_`v' if isector==4 & margin>-300, mcolor(orange)) ///
2538	(scatter margin index_`v' if isector==5 & margin>-300, mcolor(cyan)) ///
2539	(scatter margin index_`v' if isector==6 & margin>-300, mcolor(pink)) /// 2540   	(lfit margin index_`v' if margin>-300, yti("Gross profit margin, %") ///
2541	xti("`a'") legend(lab(1 "Consumer")lab(2 "Financials")lab(3 "Healthcare") ///
2542	lab(4 "Industrials")lab(5 "Life Sciences")lab(6 "Technology") rows(2)) ///
2543	name(gpm_`v', replace))
2544	graph export gpm_`v'.png, replace
2545	}
2546	graph close
2547   
2548   tabstat PE, by(sector) s(min)
2549   
2550	twoway ///
2551	(scatter PE DSI if isector==1 & PE<250 & PE>2, mcolor(blue)) ///
2552	(scatter PE DSI if isector==2 & PE<250 & PE>2, mcolor(red)) ///
2553	(scatter PE DSI if isector==3 & PE<250 & PE>2, mcolor(green)) ///
2554	(scatter PE DSI if isector==4 & PE<250 & PE>2, mcolor(orange)) ///
2555	(scatter PE DSI if isector==5 & PE<250 & PE>2, mcolor(cyan)) /// 2556   (scatter PE DSI if isector==6 & PE<250 & PE>2, mcolor(pink)) ///
2557   (lfit PE DSI if
2558   
2559   
2560   
2562   
2564   
2565   	local a="Agility"
2566   
2567	else if "`v'"=="co" {
2568	local a="Connectivity"
2569   
2570   	else if "`v'"=="ot" {
2571   
2572   
2573   	ese if "`v'"=="ea" {
2574   
2575   
2576	else if "`v'"=="df" {
2577	local a="Discipline and Focus"
 
2578	}
2579	else if "`v'"=="dr" {
2580	local a="Digital Readiness"
2581	}
2582	twoway ///
2583	(scatter PE index_`v' if isector==1 & PE<250 & PE>2, mcolor(blue)) ///
2584	(scatter PE index_`v' if isector==2 & PE<250 & PE>2, mcolor(red)) ///
2585	(scatter PE index_`v' if isector==3 & PE<250 & PE>2, mcolor(green)) ///
2586	(scatter PE index_`v' if isector==4 & PE<250 & PE>2, mcolor(orange)) ///
2587	(scatter PE index_`v' if isector==5 & PE<250 & PE>2, mcolor(cyan)) ///
2588	(scatter PE index_`v' if isector==6 & PE<250 & PE>2, mcolor(pink)) ///
2589	(lfit PE index_`v' if PE<250 & PE>2, yti("Price-earnings ratio") ///
2590	xti("`a'") legend(lab(1 "Consumer")lab(2 "Financials")lab(3 "Healthcare") ///
2591	lab(4 "Industrials")lab(5 "Life Sciences")lab(6 "Technology") rows(2)) ///
2592	ysc(log) ylab(5 10 25 50 100) name(pe_`v', replace))
2593	graph export pe_`v'.png, replace
2594	}
2595	graph close
2596   
2597   /*
2598   
2599   Create the sub-sector averages, and re-scale
2600   
2601   */
2602   
2603	use digital_13, clear
2604	foreach v of varlist idx_?? {
2605	bysort subsector: egen `v'_subsector=mean(`v')
2606	local a=substr("`v'",-2,2)
2607	la var `v'_subsector "Raw `a' index, subsector average"
2608	summ `v'_subsector
2609	replace `v'_subsector=r(min)-r(sd) if regexm(company,"plaus_min")==1
2610	replace `v'_subsector=r(max)+r(sd) if regexm(company,"plaus_max")==1
2611	}
2612	foreach v of varlist idx_??_subsector {
2613	qui summ `v'
2614	local a=substr("`v'",5,2)
qui ds	
foreach v in `r(varlist)' {		
qui tostring `v', replace force }	
sort company	
gen sort=_n	
local a=_N+1	
set obs `a'	
replace sort=0.5 in `a'	
sort sort drop sort qui ds	
foreach v in `r(varlist)' {		
local lab : variable label `v' qui replace `v'="`lab'" in 1
}	
save digital_14s, replace	
	
egen tag=tag(subsector)		
export excel subsector DSI_subsector DSIraw_subsector index_*_subsector idx_??_s
///	ubsector
2615	gen index_`a'_subsector=(`v'-r(min))/(r(max)-r(min))*100
2616	la var index_`a'_subsector "`a' index, subsector average, 0-100 best"
2617	}
2618	egen DSIraw_subsector=rowtotal(idx_??_subsector) // if regexm(company,"plaus_")==0
2619	la var DSIraw_subsector "Raw DSI, subsector level, mean=0"
2620	summ DSIraw_subsector
2621	gen DSI_subsector=(DSIraw_subsector-r(min))/(r(max)-r(min))*100
2622	la var DSI_subsector "DSI, subsector level, 0-100 best" 2623   
2624	table country subsector, c(mean DSI_subsector) f(%9.0f)
2625	sort company
2626	save digital_14, replace
2627   
2628   * Convert everything to string, insert row at top, put label in row
2629   
2630   
2631   
2632   
2633   
2634   
2635   
2636   
2637   
2638   
2639   
2640   
2641   
2642   
2643   
2644   
2645   
2646   
2647   
2648   
2649   
2650	using DSI_20170202.xlsx if tag==1, sheet("Subsectors") first(var) sheetrep
2651	drop tag
2652   
2653   /*
2654   
2655   Quintile analysis of margin – how do they do on the sub-indices?
2656   
2657   */
2658   
2659	/*
2660	hist margin if margin>-300
2661	graph export marginhist.png, replace
2662	graph close
2663	*/
2664	use digital_14, clear
2665	tabstat margin if margin>-300, s(q)
2666	summ margin if margin>-300
2667	di 96.3--6.85 // 103.15
2668	di 103.15/5
2669	egen margin5=cut(margin), at(-6.85(20.63)96.3) label 2670   scatter margin5 margin if margin>-100 2671   summ margin if margin5!=.
2672   la var margin5 "quintiles of margin"
2673   
2674	tabstat idx_??, by(margin5) s(mean)
2675	bys margin5: fsum ag_*_z*, s(mean) label
2676	tabstat f?_ag, by(margin5) s(mean)
2677   
2678	twoway ///
2679	(scatter margin f1_ag if margin5==0) ///
2680	(scatter margin f1_ag if margin5==1) ///
2681	(scatter margin f1_ag if margin5==2) ///
2682	(scatter margin f1_ag if margin5==3) ///
2683	(scatter margin f1_ag if margin5==4 ///
2684	, legend(lab(1 "Group 1")lab(2 "Group3")lab(3 "Group 3")lab(4 "Group 4") ///
2685	lab(5 "Group 5") rows(1)))
2686   
2687	reg margin f?_ag if margin>-300
      ag_newtechz |   3.191139   4.555833     0.70   0.485    -5.795982    12.1	7826
   ag_patentpclnz |   7.934025    3.83672     2.07   0.040     .3654706    15.5	0258
      ag_invfreez |   2.426596   2.727733     0.89   0.375    -2.954302    7.80	7494
       ag_compolz |  -7.850305   3.797641    -2.07   0.040    -15.34177   -.358	8406
      ag_lit_actz |    3.85918   2.114144     1.83   0.070    -.3113121    8.02	9673
ag_ins_execlearnz |   1.434765   2.313006     0.62   0.536    -3.128014    5.99	7545
            _cons |   43.18872   1.756664    24.59   0.000     39.72341    46.6	5402
-------------------------------------------------------------------------------	----
*/
twoway ///
(scatter margin ag_lit_actz	if	margin5==0) ///	
(scatter margin ag_lit_actz	if	margin5==1) ///	
(scatter margin ag_lit_actz	if	margin5==2) ///	
(scatter margin ag_lit_actz	if	margin5==3) ///	
(scatter margin ag_lit_actz if margin5==4 ///
, legend(lab(1 "Group 1")lab(2 "Group3")lab(3 "Group 3")lab(4 "Group 4") ///	
lab(5 "Group 5") rows(1)))	
	
bys margin5: fsum ag_patentpclnz if margin>-300, s(mean n) label  
2688	* within ag, f1 and f2 positively associated with margin, f2 slightly larger effect
2689	reg margin ///
2690	ag_newtechz ag_patentpclnz ag_invfreez ag_compolz ag_lit_actz ag_ins_execlearnz ///
2691	if margin>-300
2692	/*
2693	Source |       SS           df       MS      Number of obs   =       195
2694	-------------+----------------------------------   F(6, 188)       =      4.15
2695	Model |  13015.8003         6  2169.30004   Prob > F        =    0.0006
2696	Residual |  98215.5965       188  522.423386   R-squared       =    0.1170
2697	-------------+----------------------------------   Adj R-squared   =    0.0888
2698	Total |  111231.397       194  573.357716   Root MSE        =    22.857
2699   
2700	-----------------------------------------------------------------------------------
2701	margin |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
2702	------------------+----------------------------------------------------------------
2703   
2704   
2705   
2706   
2707   
2708   
2709   
2710   
2711   
2712   
2713   
2714   
2715   
2716   
2717   
2718   
2719   
2720   
2721   
2722   
2723   
2724	tabstat ag_patentpcln, by(margin5) s(mean n)
2725	tabstat ag_lit_act, by(margin5) s(mean n)
2726	des ag_patentpcln ag_lit_act
2727   
2728	reg margin f?_co if margin>-300
2729	/*
2730	Source |       SS           df       MS      Number of obs   =       195
2731	-------------+----------------------------------   F(4, 190)       =     17.93
2732	Model |  30481.4616         4   7620.3654   Prob > F        =    0.0000
2733	Residual |  80749.9352       190  424.999659   R-squared       =    0.2740
2734	-------------+----------------------------------   Adj R-squared   =    0.2588
2735	Total |  111231.397       194  573.357716   Root MSE        =    20.616
2736   
2737	------------------------------------------------------------------------------
2738	margin |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
2739	-------------+----------------------------------------------------------------
2740	f1_co |    2.24985   1.723036     1.31   0.193    -1.148888    5.648588
2741	f2_co |   19.69687   2.569064     7.67   0.000     14.62932    24.76442
2742	f3_co |   4.974759   1.849079     2.69   0.008     1.327399    8.622119
2743	f4_co |   3.157126    1.83106     1.72   0.086     -.454691    6.768943
2744	_cons |   51.65652    1.93658    26.67   0.000     47.83656    55.47648
2745	*/
2746	reg margin co_ins_sharingz co_ins_wsupportz co_ins_coopz if margin>-300
2747	des co_ins_sharingz co_ins_coopz
2748	tabstat co_ins_sharing co_ins_coop, by(margin5) s(mean)
2749   
2750	reg margin f?_ot if margin>-300 // f1 f3 f4
2751	reg margin ot_ins_infondz ot_ins_chgcomz ot_lin_foltemplnz if margin>-300
2752	tabstat ot_ins_infond ot_lin_foltempln, by(margin5) s(mean)
2753   
2754	reg margin f?_ea if margin>-300
2755	reg margin ea_insolvez ea_proftrainz ea_wrightszr ea_ins_flatz ea_ins_contribz ///
2756	if margin>-300
2757	tabstat ea_proftrain ea_wrights ea_ins_contrib, by(margin5) s(mean)
2758   
2759	reg margin f?_df if margin>-300
2760	tabstat df_ins_expect, by(margin5) s(mean n)
2761   
2762	reg margin f?_dr if margin>-300
2763	reg margin dr_mathsciz dr_custoriez dr_creditlnz dr_govtechz dr_webcreatez ///
2764	if margin>-300
2765	reg margin dr_cw_digstrz dr_soc_activez dr_bl_digacqz dr_cw_engagez dr_cw_responsz ///
2766	if margin>-300
2767	tabstat dr_mathsci dr_cw_respons, by(margin5) s(mean)
2768   
2769   
2770   
2771   
2772   
2773   
2774   
2775   
2776   
