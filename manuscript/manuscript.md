---
title: "Who Cares About Crackdowns? Exploring the Role of Trust in Individual Philanthropy"
short-title: "Who Cares About Crackdowns?"
author:
- name: Suparna Chaudhry
  affiliation: Lewis & Clark College
  url: http://www.suparnachaudhry.com/
  email: schaudhry@lclark.edu
- name: Marc Dotson
  affiliation: Brigham Young University
  url: https://marriottschool.byu.edu/directory/details?id=50683
  email: marc_dotson@byu.edu
- name: Andrew Heiss
  affiliation: Georgia State University
  url: https://www.andrewheiss.com/
  email: aheiss@gsu.edu
date: "September 24, 2020"
published: Working paper.
git-repo: https://example.com
abstract: >-
  Over the past two decades, international non-governmental organizations (INGOs) have faced increasing legal scrutiny and repression abroad. As a result, official aid to INGOs in repressive countries has reduced. NGOs thus need access to a diverse array of funds and may need to increase fundraising from private donors. Which demographic and experiential factors influence the decision of individuals to donate to legally besieged NGOs? We investigate this question using a market simulation based on a nationally representative conjoint survey experiment conducted on individuals with a history of charitable giving. We find that trust in political institutions and charities is enormously influential in shaping donor preferences. Donor profiles with high levels of social trust are likely to donate to human rights INGOs with friendly relationships with host governments, but that support evaporates if INGOs face criticism or crackdown. In contrast, donor profiles with lower levels of social trust prefer to donate to organizations that do face criticism or crackdown abroad. Our findings have practical implications for INGOs that aim to raise funds from the general public amid closing civic space. 
reference-section-title: References
toc: false
mainfont: Lora
sansfont: IBM Plex Sans
---

<!-- manuscript.md is generated from manuscript.Rmd. Only edit the .Rmd file, *not* the .md file. -->

In its 2016 annual report, Human Rights Watch claimed that civil society was under more aggressive attack than at any time in recent memory. Governments across the globe have cracked down on civil society organizations (CSOs) and non-governmental organizations (NGOs)—a phenomenon known as "closing civic space" [@CarothersBrechenmacher:2014; @CIVICUS:2017].[^NGOdef] As part of this phenomenon, NGOs face strong legal and bureaucratic obstacles to their work. Legal restrictions, or what we refer to as legal crackdowns, are a core part of these efforts. These crackdowns create barriers to entry, funding, and advocacy for NGOs in an effort to control, obstruct, and repress these organizations.

As a result of these legal crackdowns, foreign aid channeled through NGOs has decreased considerably in repressive countries [@Brechenmacher:2017; @ChaudhryHeiss:2018; @DupuyPrakash:2018]. While this has negatively impacted funding flows from public organizations like United States Agency for International Development (USAID) and Organisation for Economic Cooperation and Development (OECD) funding agencies, philanthropy from private donors, in particular, foundations, appears to not be as adversely affected [@McGill:2018]. Given this trend of closing civic space, INGOs need to maintain access to multiple sources of funding, including individual donors. 

Individual private donations are a critical source of INGO funding. Total private philanthropy in the United States has grown substantially over time, reaching more than \$400 billion in 2018 (@fig:giving-aggregate). In 2018, private giving to NGOs working specifically in international affairs reached \$22.08 billion, and international affairs-focused organizations are one of only two categories of organizations that have continued experiencing substantial growth in giving [@givingusa:2019].[^intlaffairs] Most of this growth is driven by individuals making small-scale or micro-donations.[^smalldonors] In 2017, 70% of donations to international affairs NGOs came from individuals, rising to 86% in 2018.  But relying on individual donors means that NGOs must consider individual preferences when fundraising. Which individual donor characteristics and attributes are most salient for INGOs interested in maximizing philanthropy at a time when they are facing increasingly hostile environments abroad? What kinds of donors are more or less likely to consider an INGO's host country political environment when making the decision to donate? 

![Aggregate philanthropic giving in the United States, 1977–2017. Source: Giving USA.](output/figures/giving_aggregate.pdf){#fig:giving-aggregate}

Existing scholarship on the determinants of individual-level philanthropy to domestic causes is robust across a variety of contexts. But the dynamics of *international* giving to NGOs are under-examined in the literature on individual donor attributes and preferences.[^exceptions] Motivating individuals to donate to international causes is hard as the number of recipients are large and far removed from the donor [@CasaleBaumann:2015, 100]. And research on the determinants of philanthropy for international causes—particularly towards organizations working in challenging environments—is still in its infancy due to the absence of expansive and high-quality data [@greenhill2013]. While previous work has looked at how organizational attributes of nonprofits affect donors' willingness to donate internationally [@todo:CITEOURPAPERTODIFFERENTIATE), we have yet to uncover demographic traits and experiences that motivate or deter individuals to donate during shrinking civic space.

We explore this question using a simulated market for philanthropic donations, based on data from a nationally representative sample of individuals in the United States who regularly donate to charity. We adapt methods used in marketing research to generate dozens of distinct simulated personas that represent typical donor profiles, and we vary these personas along different dimensions of demographic, political, and social attributes. We find that specific individual characteristics help shape donor preferences for donating to international NGOs, and that an INGO's target issue area and its relationship with host government interact strongly with these characteristics. Personas with high levels of trust in political and charitable institutions and who are actively engaged in charity and volunteerism prefer donating to human rights organizations that have friendly relationships with their host governments. In contrast, personas with low levels of social trust eschew both human rights organizations *and* any type of NGO with friendly relationships with host governments, preferring instead to donate to NGOs facing more restrictions and working on less contentious issues like emergency response and refugee relief. This may indicate that donors with high trust and support for NGOs could be fair-weather friends that drop their support when their preferred organizations meet resistance abroad.

This study contributes to both to scholarship and practice in public policy, nonprofits, and philanthropy. Individual giving abroad can help bridge socioeconomic disparities worldwide, especially given the stark inequality in global distribution of income. Knowledge of demographic traits and its impact on funding can help nonprofits craft more effective and targeted marketing strategies [@Rajan:2009, 414]. Most NGOs working internationally have previously relied on government and foundation funding. But with shrinking civic space, these groups may need to readjust their fundraising strategies towards individuals. Framing is important in this regard—how people process information affects their willingness to donate.[^framing] However, existing research is unclear about which frames are effective when making appeals to individual donors considering international philanthropy. Since our study looks at multiple organizational and host country factors, our results can help NGOs frame their appeals.

More broadly, while research in public policy examines giving to NGOs, philanthropy is not seen as relevant by international relations as a discipline [@youde2019]. However, philanthropy—particularly donations received by INGOs—can help us understand changes in the dynamics of global governance. Private individuals exercise power and influence in unique ways that differ from other non-state actors. As @youde2019 [p. 44] points out, it changes our conceptions of individuals being passive recipients to active entities that are not merely objects of governance. Thus, it can shed light on the changing logic of global governance.

Below, we first examine the state of the existing literature on the key drivers of individual giving. We then describe our survey experiment and simulation methods and explore the results. We conclude with a discussion of the implications our findings have on general INGO funding in the age of constrained civil society space.


# Sustaining civil society organizations abroad

Foreign aid to civil society—and NGOs in particular—has steadily increased over time. Many government and foundation donors perceive NGOs as nimbler and less bureaucratic than governments. In countries with weak institutions and poor governance, where direct aid transfers to governments raise issues of misuse and bureaucratic inefficiency, donors specifically seek out NGOs for projects [@Dietrich2013]. 

## Sources of funding

Thousands of INGOs in the Global South receive funds from a variety of public and private sources each year. Public funds—or traditional donor aid—channel money from official aid agencies through a variety of bilateral and multilateral institutions. Private sources include foundations, private corporations, and individuals. While INGOs have not been passive in responding to the crackdown on civil society, they face increasing obstacles from a funding perspective. Official donors have reduced the amount of aid channeled to countries with legal restrictions [@DupuyPrakash:2018] and have redirected funds within restrictive countries, decreasing funds for politically sensitive causes in favor of tamer issues that are more compatible with the governments of those countries [@ChaudhryHeiss:2018]. However, private funding towards international nonprofits has not been as adversely affected. Many foundations have continued channeling funds to countries with hostile legal environments [@NeedlesWolcheckSato:2018].

The advent of funding restrictions on NGOs globally and a subsequent decline in government and foundation funding has made the role and value of individual philanthropy in sustaining NGOs even clearer.[^phildef] NGOs need access to a diverse array of funds and individual donations to international affairs organizations have steadily increased over the past two decades. Moreover, in the United States donations from individuals have far outstripped foundation and corporate giving. In 2018, individual donations amounted to \$292 billion, compared to \$76 billion from foundations and \$20 billion from corporations [@NPT]. Given that a majority of research is restricted to elite high net-worth donors[^highnetworth] [@USTrust2014], these figures show that it is imperative to understand motivations and attributes of small-scale donors as well.

## Key drivers of individual-level philanthropy

A vast literature on philanthropy looks at organizational-level factors that motivate individuals to donate [@TBPrakash:2017]. However, donation decisions are not determined solely by a recipient organization's characteristics. Donors have personality traits, preferences, and experiences that make them more or less likely to engage in philanthropy. Substantial research has looked at the determinants of donating to local—rather than international—causes, including four main attributes: social capital, the role of higher education, levels of religiosity, wealth, and national group attachment.

Social capital, particularly associational capital, or "the networks of formal and informal relationships to which people are associated," is often considered an important indicator of giving [@havens2007, 240]. Volunteering exposes individuals to the need for donations, making them feel more compelled to donate [@hossainlamb2012]. Those who participate in a variety of associations are both more likely to donate as well as make larger donations [@hossainlamb2017].

Higher education also influences charitable-giving decisions as it fosters prosocial motivations. Education brings people into social networks that entail a higher level of solicitations, which is vital in giving to international causes [@BekkersWiepking:2011]. Education also helps determine the kinds of causes that people donate to globally. @Micklewright:2009 show that higher education matters more for donating to international relief organizations than donating to domestic organizations. 
 
A number of NGOs facing crackdowns abroad also work on issues that may be seen as "contentious," including human rights, elections, corruption, advocacy, media freedom—issues that may have a harder time attracting funds due to their non-essential nature when compared to causes like health, education, sanitation, and social services. However, additional education has been shown to increase abstract thinking [@wiepkingmaas, 1978], which may be necessary to donate to causes that do not have quantifiable goals. This is particularly important for organizations with more "contentious" causes as part of their missions [@Bush:2015].

Religiosity is also a significant predictor of the likelihood and level of giving. People who regularly attend religious services are more likely to have prosocial values, face a stronger norm of charitable giving, and may feel pressure to conform that group and community standard [@wiepking2010]. Regular attendance may also strengthen individuals' beliefs in organizations' missions.

Finally, recent research looks at how a sense of ethnonationalism and national group attachment affects the decision to donate to domestic and international charities. Looking at UK respondents, @hartrobson2019 find that whereas nationalists have a preference for domestic charities, they are not necessarily averse to donating to international causes, whereas internationalists have a strong preference for donating to causes and groups working abroad. 

Which of these characteristics matter when deciding to donate to an INGO, particularly when an organization faces legal crackdown abroad? Overall, individuals with higher levels of income, education, and greater religious proclivities are not only more likely to give internationally, but also give higher amounts [@Rajan:2009; @CasaleBaumann:2015]. Additionally, we posit that other related characteristics such as civic and associational engagement and social trust also influence the decision to donate. 

We explore this question using a conjoint survey experiment conducted with a nationally representative sample in the U.S. Importantly, because there is so little research about international donations during legal crackdown by host governments, our analysis and results are exploratory and descriptive. Accordingly, we do not test specific hypotheses or theories. However, we do talk about causal effects given the that we conduct an experiment that varies organizational characteristics in order to elicit opinions from respondents (i.e. specific attributes and features cause different aggregate effects). Instead, we structure our analysis around broader themes from the existing literature and investigate how donors' (1) demographic characteristics, (2) public affairs knowledge and experience, and (3) levels of trust in government, charitable work, and associational life change their donation preferences across different organizational issue areas, relationships with host governments, and funding sources. Our innovative experimental approach provides rich quantitative details of individual and organizational characteristics simultaneously and reveals unique insights into donor motivations that both confirm and expand previous research.


# Data and methods

## Conjoint survey experiment

We use a conjoint survey experiment to simultaneously study the effects of organizational characteristics and individual attributes on individuals' preferences to donate to a nonprofit organization. Conjoint analysis allow us to elicit donor preferences without forcing respondents to explicitly state their exact preferences. This kind of analysis is commonly used in marketing research to reveal consumer preferences for different mixes of products, and has become increasingly popular in political science and public policy [@KnudsenJohannesson:2019]. Because we are interested in exploring the complexity behind the decision to donate, we apply conjoint methods to the study of nonprofits and philanthropy.

In our experiment, we presented respondents with four randomly selected international nonprofit organizations with four randomly assigned features.^[See the appendix for a copy of the survey.] We included organizations that are associated with a range of contentious and noncontentious issues: Amnesty International, Greenpeace, Oxfam, and the International Committee of the Red Cross. Because of their strong name recognition, these organizations (and others like World Vision, the World Wildlife Fund, and Médecins Sans Frontières) are commonly used in experimental surveys on philanthropy [@FaulknerTruongRomaniuk:2015].



-----------------------------------------------------------------------------------------------------------------------------
Organization            Issue area           Organizational practices   Funding sources        Relationship with government  
----------------------- -------------------- -------------------------- ---------------------- ------------------------------
Amnesty International   Emergency response   Financial transparency     Small private donors   Friendly                      

Greenpeace              Environment          Accountability             Wealthy donors         Criticized                    

Oxfam                   Human rights                                    Government grants      Crackdown                     

Red Cross               Refugee relief                                                                                       
-----------------------------------------------------------------------------------------------------------------------------

Table: Organization attributes varied in the experiment {#tbl:organization-attributes-full}


We then displayed four hypothetical organizations based on random combinations of features , including one of four issue areas, one of two organizational practices, one of three funding sources, and one of three relationships with host governments (see @tbl:organization-attributes-full; see also Q3.1 in the survey text in the appendix). Respondents saw twelve sets of four hypothetical combinations of organizational features, and because our partial fractional factorial design resulted in 288 (4 × 4 × 2 × 3 × 3) possible combinations of organizations and features, no single respondent was offered every combination. Not every combination necessarily reflected reality—for instance, a respondent might have been asked to compare a fictional Amesty International that focuses on environmental issues and that is funded by private donations with a Greenpeace that focuses on human rights and that is funded by government grants. It is not important that these features align with true organizational characteristics, since the goal of these repeated hypothetical questions is to identify which attributes are the most salient for donors. 

In June 2019, we recruited survey respondents through Centiment, a commercial provider of high quality non-probability opt-in survey panels. Centiment ensures panel quality by actively recruiting representative samples of the US population and rewards participants with monetary incentives. To participate in the study, respondents were first screened based on their charitable activities. Those who indicated that they gave to charity once every few years or never were disqualified. After screening, we collected a sample of 1,016 respondents, which is sufficient for model estimation.[^sample-size]

\newpage



------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                   Response                                          N      %   
---------------------------------- ----------------------------------------------- ----------------------------------------------- ----- -------
Demographics                       Gender                                          Male                                             517   50.9% 

                                                                                   Female                                           485   47.7% 

                                                                                   Transgender                                       8    0.8%  

                                                                                   Prefer not to say                                 3    0.3%  

                                                                                   Other                                             3    0.3%  

                                   Age                                             Less than 2017 national median (36)              179   17.6% 

                                                                                   More than median                                 837   82.4% 

                                   Marital status                                  Married                                          403   39.7% 

                                                                                   Widowed                                          21    2.1%  

                                                                                   Divorced                                         104   10.2% 

                                                                                   Separated                                        35    3.4%  

                                                                                   Never married                                    453   44.6% 

                                   Education                                       Less than high school                            25    2.5%  

                                                                                   High school graduate                             270   26.6% 

                                                                                   Some college                                     287   28.2% 

                                                                                   2 year degree                                    138   13.6% 

                                                                                   4 year degree                                    206   20.3% 

                                                                                   Graduate or professional degree                  82    8.1%  

                                                                                   Doctorate                                         8    0.8%  

                                   Income                                          Less than 2017 national median ($61,372)         585   57.6% 

                                                                                   More than median                                 431   42.4% 

Attitudes toward charity           Frequency of donating to charity                More than once a month, less than once a year    566   55.7% 

                                                                                   At least once a month                            450   44.3% 

                                   Amount of donations to charity last year        $1-$49                                           337   33.2% 

                                                                                   $50-$99                                          245   24.1% 

                                                                                   $100-$499                                        233   22.9% 

                                                                                   $500-$999                                        107   10.5% 

                                                                                   $1000-$4,999                                     65    6.4%  

                                                                                   $5000-$9,999                                     18    1.8%  

                                                                                   $10,000+                                         11    1.1%  

                                   Importance of trusting charities                1 (not important)                                 7    0.7%  

                                                                                   2                                                 9    0.9%  

                                                                                   3                                                21    2.1%  

                                                                                   4                                                98    9.6%  

                                                                                   5                                                168   16.5% 

                                                                                   6                                                157   15.5% 

                                                                                   7 (important)                                    556   54.7% 

                                   Level of trust in charities                     1 (no trust)                                     14    1.4%  

                                                                                   2                                                20    2.0%  

                                                                                   3                                                68    6.7%  

                                                                                   4                                                257   25.3% 

                                                                                   5                                                328   32.3% 

                                                                                   6                                                169   16.6% 

                                                                                   7 (complete trust)                               160   15.7% 

                                   Frequency of volunteering                       Haven't volunteered in past 12 months            423   41.6% 

                                                                                   Rarely                                           20    2.0%  

                                                                                   More than once a month, less than once a year    322   31.7% 

                                                                                   At least once a month                            251   24.7% 

Politics, ideology, and religion   Frequency of following national news            Rarely                                           88    8.7%  

                                                                                   Once a week                                      216   21.3% 

                                                                                   At least once a day                              712   70.1% 

                                   Traveled to a developing country                Yes                                              250   24.6% 

                                                                                   No                                               766   75.4% 

                                   Voted in last election                          Yes                                              742   73.0% 

                                                                                   No                                               274   27.0% 

                                   Trust in political institutions and the state   1 (no trust)                                     123   12.1% 

                                                                                   2                                                155   15.3% 

                                                                                   3                                                207   20.4% 

                                                                                   4                                                276   27.2% 

                                                                                   5                                                151   14.9% 

                                                                                   6                                                49    4.8%  

                                                                                   7 (complete trust)                               55    5.4%  

                                   Political ideology                              1 (extremely liberal)                            87    8.6%  

                                                                                   2                                                87    8.6%  

                                                                                   3                                                112   11.0% 

                                                                                   4                                                363   35.7% 

                                                                                   5                                                175   17.2% 

                                                                                   6                                                80    7.9%  

                                                                                   7 (extremely conservative)                       112   11.0% 

                                   Involvement in activist causes                  Not involved                                     569   56.0% 

                                                                                   Involved                                         447   44.0% 

                                   Frequency of attending religious services       Not sure                                         11    1.1%  

                                                                                   Rarely                                           600   59.1% 

                                                                                   At least once a month                            405   39.9% 

                                   Importance of religion                          Not important                                    338   33.3% 

                                                                                   Important                                        678   66.7% 
------------------------------------------------------------------------------------------------------------------------------------------------

Table: Summary of individual respondent characteristics {#tbl:sample-details}


@tbl:sample-details provides a summary of the individual characteristics of survey respondents. Because we limited the sample to people who regularly make charitable contributions, most respondents have a favorable opinion of nonprofits and charities, with more than half reporting a 5 or greater level of trust in charities (on a 7-point scale). Moreover, nearly 90% indicated that it is important to trust charities. Additionally, the majority of respondents volunteer at least once a year, donate to charity at least once a year, and give between \$1–\$999 annually. Most rarely attend church, but feel that religion is important. Respondents are also civically engaged (three quarters voted in the last election) and follow national news closely (70% follow the news daily). Respondents are fairly balanced ideologically, with the majority reporting a 3, 4, or 5 on a 7-point scale of liberal–conservative political ideology.

We analyze the effect of different combinations of organizational features and individual respondent attributes with a two-stage hierarchical Bayesian multinomial logit model.[^model-details] Simply put, the first level of the model predicts individual donor preferences for various combinations of features (e.g. the combination of human rights issues, financial transparency, government funding, and government crackdown), while the second level of the model uses these fitted preferences to predict the ultimate choice of donation.

## Simulated philanthropy market

In this paper, we look at which kinds of donors are more or less likely to consider an NGO's issue area, funding sources, and relationships with host governments when deciding to donate. Disentangling the effect of every individual level-characteristics measured in the survey on every combination of organizational characteristics presented in the conjoint experiment is unwieldy and near impossible. Given the organizational attributes presented in our experiment, and the possible individual characteristics that respondents could select, there are billions of possible combinations and iterations of organizational and individual attributes—many of which rarely occur in the actual population of potential donors. To more fully explore the relationships between different organizational- and individual-level attributes, we turn to simulation methods that allow us to examine the impact of multiple covariates at simultaneously. To simplify the possible combinations of individual characteristics, we generate 32 distinct personas with attributes that vary along different dimensions of demographics, politics and public affairs experience, and social attitudes (see @tbl:persona-attributes). We also generate 24 simulated organizations that vary by issue area, relationship with host government, and source of funding (see @tbl:organization-attributes).



-------------------------------------------------------------------------------------------------
Demographics                    Politics and public affairs      Social views                    
------------------------------- -------------------------------- --------------------------------
High income ($100,000), male    Semi liberal (2), follows        High social trust: Trusts       
                                national and international       political institutions, trusts  
                                news often, has traveled         charities, thinks people        
                                internationally                  should be more charitable,      
                                                                 frequently volunteers, donates  
                                                                 once a month, has a history of  
                                                                 personal activism, is a member  
                                                                 of an association               

Medium income ($50,000), male   Semi conservative (5), follows   Low social trust: Does not      
                                news, has traveled               trust political institutions    
                                                                 or charities, thinks people     
                                                                 should be less charitable,      
                                                                 does not volunteer or donate    
                                                                 often, has no history of        
                                                                 personal activism, is not a     
                                                                 member of an association        

High income, female             Semi liberal, does not follow                                    
                                news, has not traveled                                           

Medium income, female           Semi conservative, does not                                      
                                follow news, has not traveled                                    
-------------------------------------------------------------------------------------------------

Table: Individual attributes varied in the simulation, resulting in 32 persona profiles {#tbl:persona-attributes}




--------------------------------------------------------------------------
Issue area           Relationship with government   Funding               
-------------------- ------------------------------ ----------------------
Emergency response   Friendly                       Small private donors  

Environment          Criticized                     Government grants     

Human rights         Crackdown                                            

Refugee relief                                                            
--------------------------------------------------------------------------

Table: Organization attributes varied in the simulation, resulting in 24 hypothetical organizations {#tbl:organization-attributes}


We then combine these different scenarios of donor and organization attributes with the coefficients from a multinomial multilevel regression model to calculate the probability that each simulated persona has of giving to specific combinations of organizational attributes. Any individual characteristics that we do not explicitly vary in @tbl:persona-attributes are held at their means or modal values from the survey sample. @tbl:sim-output provides an example of the simulation output, showing how two different personas are predicted to allocate donations to organizations with various characteristics. The proportion of donations from each persona sums to 100%, as every persona is guaranteed to make a donation.



--------------------------------------------------------------------------------------------
Organization                      Persona 2: Lower Income Male,   Persona 31: Higher Income 
                                     Liberal that Reads and       Female, Conservative that 
                                   Travels, Trusts and Donates     Doesn't Read or Travel,  
                                                                   Doesn't Trust or Donate  
-------------------------------- ------------------------------- ---------------------------
Org 1: Emergency Response,                    5.5%                          0.3%            
Small Donors, Friendly                                                                      

Org 2: Environment, Small                     2.3%                          0.1%            
Donors, Friendly                                                                            

Org 3: Human Rights, Small                    20.9%                         0.1%            
Donors, Friendly                                                                            

…                                               …                             …             

Org 7: Human Rights, Grants,                  17.9%                         0.2%            
Friendly                                                                                    

Org 8: Refugee Relief, Grants,                6.2%                          0.6%            
Friendly                                                                                    

Org 9: Emergency Response,                    1.5%                          10.4%           
Small Donors, Criticized                                                                    

…                                               …                             …             

Org 16: Refugee Relief,                       1.7%                          21.3%           
Grants, Criticized                                                                          

Org 17: Emergency Response,                   1.3%                          2.7%            
Small Donors, Crackdown                                                                     

…                                               …                             …             

**Total**                                     100%                          100%            
--------------------------------------------------------------------------------------------

Table: Sample output from the simulation {#tbl:sim-output}


Relying on simulation methods offers useful analytic benefits. Rather than interpret individual marginal effects from a regression model, we can explore multiple moving parts from the same model simultaneously to understand how individual characteristics interact with each other. This allows us to more fully explore our key research questions and see which kinds of donors are more or less likely to consider specific organizational attributes when deciding to donate, and which donor characteristics are associated with the propensity to donate. Importantly, each persona is an artificial construct. While some survey respondents might match an exact persona profile, others may not. This is acceptable in simulations as each combination of persona characteristics is plausible in the real world.


# Results

These simulated findings are more abstract than the results from an ordinary survey sample. But by using simulations, we can discover interesting patterns of donor preferences when faced with organizations focusing on a variety of issues, funding sources, and legal restrictions abroad. Our market simulation reveals which combination of organizational features each persona is most likely to express a preference for donation to. We examine the results of the simulation in three stages, looking at how personas with different (1) demographic characteristics, (2) public affairs knowledge and experience, and (3) levels of trust in government, charitable work, and associational life change their donation preferences across different organizational issue areas, relationships with host governments, and funding sources.

## Demographics

We begin by looking at differences in donation preferences across a range of basic demographic characteristics. The three panels of @fig:demographics shows the average predicted market share for different organizational issue areas, relationships with governments, and funding sources. Though we varied gender across the different personas, gender has no significant effect on any of the simulated outcomes—men and women follow nearly identical patterns across all organizational and individual characteristics. As such, in @fig:demographics, we only vary income. Personas with high income earn \$100,000 a year, while those with less income earn \$50,000 annually.

![Average predicted donation market shares across all personas, segmented by individual persona income and organizational issue area, relationship with host government, and funding sources](output/figures/income-all.pdf){#fig:demographics}

Wealthier personas respond better to human rights organizations over refugee assistance and environmental advocacy organizations, while personas that earn less money tend to prefer donating to refugee and environmental organizations. As we explore below, this is likely because income correlates with interest in public affairs and political activity—individuals who are wealthier arguably have more time and resources to follow the news and be continuously engaged in their communities and in other activist causes. 

There are also sizable income-based differences across different NGO host-country relationships. Wealthier donors are more likely to prefer donating to organizations that are criticized by their host governments. This falls in line with their preference for human rights organizations which have more contentious missions and are more likely to receive government criticism. This support, however, appears to evaporate as civil society crackdown intensifies. High income personas are the least likely demographic to prefer donating to NGOs under crackdown. Their lower income counterparts, on the other hand, are generally unfazed by NGOs' relationships with government, maintaining the same average market share across all three types of host country relationships. Finally, as seen in the right panel of @fig:demographics, there are no sizable differences in donation preferences by income across different forms of NGO funding. Income thus appears to influence preferences particularly for NGOs facing criticism and crackdown abroad—wealthier donors are perhaps fair-weather friends that are more likely to pull their support when an organization's work becomes more difficult.

*(TODO: I'll need ≈150 words to describe education and religiosity results)*

## Public affairs knowledge, experience, and social trust

We next look at how differences in public affairs knowledge, experience, and political ideology influence a persona's propensity to donate to an organization. We vary personas along two dimensions: (1) political ideology, with semi liberal and semi conservative political leanings (2 and 5 on a 7-point scale), and (2) knowledge and experience with public affairs and the news, with personas that either follow national and international news and that have travelled abroad or personas that do not follow the news or travel. 

We combine these dimensions with an additional set of donor characteristics that vary a persona's level of social trust. Personas with high levels of trust have high trust in political institutions and charities, think people should be more charitable, frequently volunteer, donate to charity once a month, have a history of political activism, and are members of an association. Personas with low levels of trust have the opposite characteristics: they do not trust political institutions or charities, rarely donate or volunteer, and are not members of associations. 

![Average predicted donation market shares across all personas, segmented by persona public affairs knowledge, political ideology, and social trust across different NGO issue areas](output/figures/issue-social.pdf){#fig:issue-social}

@fig:issue-social, @fig:relationship-social, and @fig:funding-social show the results of the market simulation across these three dimensions of persona characteristics, varying public affairs knowledge, political ideology, and social trust. Personas respond differently to organizational issue areas. In @fig:issue-social, those who follow the news and travel abroad are more likely to prefer donating to human rights organizations than their less knowledgeable and less traveled counterparts. Personas who do not follow the news or travel show a greater preference for emergency response and refugee relief organization, similar to the income effects seen previously. There are no strong ideological effects across issue areas. Both conservative and liberal personas tend to follow similar patterns of preference across NGO issue. 

Social trust plays a substantial role in determining simulated market share, however. Those who trust social and charitable institutions are very likely to prefer donating to human rights organizations, regardless of their public affairs knowledge or political leanings. In all circumstances, those with high levels of trust have between a 7–10% chance of donating to a human rights organization, on average. Personas with low levels of trust, on the other hand, strongly avoid human rights organizations and prefer instead to donate to refugee and emergency response NGOs. The difference is substantial—a liberal persona with high levels of public affairs knowledge and experience will give to a human rights organization 10% of the time, on average if they have high levels of trust, but less than 3% of the time if they are less trusting. Trust in charities and institutions is a key factor in deciding to donate to more contentious human rights organizations.

![Average predicted donation market shares across all personas, segmented by persona public affairs knowledge, political ideology, and social trust across different NGO–host government relationships](output/figures/relationship-social.pdf){#fig:relationship-social}

@fig:relationship-social shows how personas respond to different NGO–host government relationships. Public affairs knowledge and experience has little effect on donor preferences, as the average market shares are roughly identical across the two columns of the figure. Persona preferences toward friendly, criticized, and legally suppressed organizations do not change much across different ideological views. The strongest, most overriding factor in determining donor preferences when considering an organization's relationship with its host country is social trust. Personas with high levels of social trust are overwhelmingly most likely to donate to organizations with friendly relationships with their host governments, while those with low levels of trust avoid friendly NGOs almost entirely. 

This stark difference in attitudes towards friendly NGOs likely reflects the underlying levels of trust in the model. For those who trust charities to do the right thing and have a positive influence on society, a friendly relationship with a host government is a manifestation of that belief and a sign that the organization is living up to its idea. Once the organization faces criticism or crackdown, however, support deteriorates rapidly, since such a crackdown could be perceived as a violation of the persona's trust in the charity—that is, the organization must be doing something wrong to deserve criticism. Personas with low levels of trust, on the other hand, eschew friendly organizations entirely and are far more willing to donate to organizations facing criticism and crackdown, likely because they do not assume that charities must always be above reproach. The global crackdown on NGOs could thus counterintuitively sour NGOs' most trusting donors.


## Concerns about inference and generalizability

Given the nature of conjoint experiments, the randomly presented organizations may have influenced respondent choices. All four organizations are well known, and it is likely that participant responses reflect prior beliefs and news coverage about Amnesty, Oxfam, Greenpeace, and the Red Cross. For instance, in February 2018, news broke about sexual abuse and misconduct at Oxfam and several other well known organizations, including Amnesty International and Save the Children. This potentially strengthened a narrative that the nonprofit sector suffers from governance failures [@Phillips:2019]. As such, it could be argued that respondents may be less likely to select Oxfam or Amnesty because of these scandals. 

However, we remain doubtful that the above news would impact our U.S. respondents' beliefs about these four organizations, as evidence about the effect of these scandals is mixed. Using data from Twitter, @ScurlockDolsakPrakash:2020 find that while Oxfam's reputation suffered for at least six months after the scandal (but has since recovered), other NGOs facing scandals, such as Save the Children, were able to recover more quickly. More broadly, the effect of scandals was mixed—while reputational damage can lead to decline in donations and grants, organizations can become more resilient and durable after a public relations recovery. 

Additionally, we remain skeptical that this scandal affected U.S. donors, given Oxfam is based in the UK and lack of awareness about INGOs is well-documented (CITE). Rather, lack of trust towards overseas NGOs, particularly aid and developmental agencies often results due to donors perceiving INGOs as having low personal relevance [@FaulknerTruongRomaniuk:2015]. We failed to find any systematic evidence that the Oxfam scandal influenced perceptions of the nonprofit sector, likely because the story had far less news coverage in the U.S.  Many individual donors have a preference to donate locally and they lack sufficient knowledge to make an informed decision about donating internationally. Overall, the literature suggests that for INGO fundraising, lack of awareness is a much larger issue than specific scandals or other knowledge of specific organizational characteristics that might reduce donor trust and confidence.

The survey conducted among a random sample of U.S. residents with a prior history of charitable giving, also raises questions about generalizability external validity. Public expectations about the role of the public, private, and nonprofit sectors differ by country. In the U.S., for instance, NGOs often receive substantial funding through government grants, while those in the UK and France, such as Amnesty International and Médecins Sans Frontières, receive minimal government funding [@Stroup:2012]. This could imply that donors in UK and France may have very different preferences when choosing to donate to government or privately-funded organizations. As such, more comparative research is needed to see if our results would also replicate cross-nationally.

There is also notable country-based variation in general patterns of philanthropy. Though charitable giving is highest in the U.S, such donations are overwhelmingly directed at local and religious causes. This pattern does not hold for many European countries. In the UK, international aid is one of the largest targets of giving (26%). Other countries prioritize international philanthopy even more, such as Germany (74%), Belgium (61%), and Switzerland (43%) [@Milner:2017]. Thus, if crackdown on INGOs abroad can elicit the effects found in this paper among U.S. respondents, the results provide much reason for optimism for pursuing individual philanthropy towards INGOs in Europe as well. However, more comparative research is required in order to confirm these trends.


# Implications and conclusion

The global crackdown on civil society and the consequent decline of official development assistance has made the role of philanthropy in sustaining INGOs clear. INGOs need access to multiple sources of funding, and the value of individual-level philanthropy is still relatively under-explored. While existing research has examined the impact of organizational-level factors on individual giving as well as giving to local causes, in this paper, we specifically look at the demographic traits of those who are likely to donate to INGOs facing hostile environments abroad. We find several important trends from our simulated market for philanthropy. On average, human rights organizations tend to attract personas who are wealthier, follow national and international news, and travel abroad. Donors who are less wealthy, follow the news less often, and do not travel are more attracted to organizations working on less contentious like emergency response and refugee relief. 

More importantly, we find that trust in political institutions and in charitable organizations matters substantially in shaping donor preferences. Personas with high levels of social and charitable trust prefer donating to human rights organizations that have friendly relationships with their host governments, while personas with low trust are drawn more to emergency response and refugee relief organizations with unfriendly relationships with their host governments. Personas with low social trust rarely prefer to donate to any type of organization with friendly host-country relationships, while personas with high social trust tend to avoid organizations with unfriendly relationships. This could imply that donors that are the most trusting and involved might be fair-weather friends that drop their support when charities face government criticism and crackdown.

The above results have important implications for NGOs as they navigate a shriking civic space and consider the use of different frames to tailor their fundraising appeals to individual donors. Our survey finds that at least for some kinds of individuals, NGOs may benefit from publicizing when they are targets of government crackdown, including that information in their fundraising appeals. However, the bigger challenge may be addressing concerns of donors with low levels of trust. More broadly, studies from a range of countries show that levels of giving are lowest for refugee and asylum organizations, as well as for overseas and development organizations. Rather, donors giving to international causes tend to support international disaster relief and religious groups [@RobsonHart:2020]. However, the former are precisely the organizations facing crackdown. More research is needed to answer how these organizations can appeal to broader array of potential foreign donors to increase levels of charitable-giving towards them. 

To be clear, research on international giving by individuals, especially in the era of closing civic space, is not meant to find answers that can act as substitutes for strategic policy responses, especially by official aid donors and foundations. However, many NGOs are under immediate threat, and individual-level philanthropy can help support these organizations. Existing initiatives such as the Lifeline Embattled CSO Assistance Funds provide models for channeling such funds. In the face of legal crackdowns abroad, individual doations are an important additional funding source for besieged NGOs.

\newpage

# Appendix: Survey experiment


## Consent 

***Q1.1***: You have been invited to participate in an academic research survey about international nongovernmental organizations. This study is being conducted by Suparna Chaudhry from Christopher Newport University and Andrew Heiss and Marc Dotson from Brigham Young University. If you qualify to complete the survey, it should take about **10 minutes** to complete.

Your participation in this study is entirely voluntary and you are free to skip any question or withdraw from the experiment at any time. You will not be asked to provide any personal information, and your answers will remain anonymous. There are no reasonably foreseeable risks or discomforts associated with participating in this study. **There will be questions designed to check that you're paying attention to the details of the experiment. If you answer these incorrectly, the survey will end early and you may not receive compensation.**

You will receive no direct benefits from participating in this research study.
 
If you have any questions at any time about the study or the procedures, you can contact Suparna Chaudhry (suparna.chaudhry@cnu.edu; Reiff Center for Human Rights and Conflict Resolution, Christopher Newport University, Newport News, VA 23606) or Andrew Heiss (andrew_heiss@byu.edu; Romney Institute of Public Management, Brigham Young University, Provo, UT 84602). This research has been reviewed by the Institutional Review Board (IRB) at Christopher Newport University (757-594-7461; IRB@cnu.edu) and the IRB administrator at Brigham Young University (801-422-1461; irb@byu.edu).
 
By clicking "Yes" below you are indicating that you are at least 18 years old, have read and understood this consent form and agree to participate in this research study. Please print a copy of this page for your records.

I have read the above information, and I consent to take part in the study.

:   Single answer

    - Yes
    - No

**Terminate if Q1.1 == "No"**

---

## First demographic section

*Q2.1*: How often do you follow national news? 

:   Single answer

    - Multiple times a day
    - Every day
    - Once a week
    - Hardly ever
    - Never

*Q2.2*: How often do you follow international news? 

:   Single answer

    - Always
    - Sometimes
    - Never
    
*Q2.3*: Which mediums do you use to follow news? (Select all that apply.)

:   Multiple answers allowed

    - TV
    - Print 
    - Online (excluding social media) 
    - Social media
    - Radio
    - Email newsletters
    - News app

*Q2.4*: Some people seem to follow what's going on in government and public affairs most of the time, whether there's an election going on or not. Others aren't that interested. How often would you say you follow what's going on in government and public affairs?

:   Single answer

    - Most of the time
    - Some of the time
    - Only now and then
    - Hardly at all

*Q2.5*: How often do you donate to charity (with either cash or in-kind)?

:   Single answer

    - Once a week
    - Once a month
    - Once every three months
    - Once every six months
    - Once a year
    - Once every few years
    - Never

**Terminate if Q2.5 == "Once every few years" OR Q2.5 == "Never"**

*Q2.6*: How much did you donate to charity last year?

:   Single answer

    - \$1 to \$49
    - \$50 to \$99
    - \$100 to \$499
    - \$500 to \$999
    - \$1000 to \$4,999
    - \$5000 to \$9,999
    - \$10,000 or more

*Q2.7*: On a scale of not at all important (1) to essential (7), how important is it for you to trust charities?

:   Single answer

    - 1 (Not at all important)
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7 (Essential)

*Q2.8*: On a scale of no trust at all (1) to complete trust (7), how much do you trust charities?

:   Single answer

    - 1 (No trust at all)
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7 (Complete trust)

*Q2.9*: Have you volunteered in the past 12 months?

:   Single answer

    - Yes
    - No

**Display Q2.10 if Q2.9 == "Yes"**

*Q2.10*: How often do you volunteer?

:   Single answer

    - Once a week
    - Once a month
    - Once every three months
    - Once every six months
    - Once a year
    - Once every few years

*Q2.11*: Please select blue from the following list:

:   Single answer

    - Red
    - Yellow
    - Blue
    - Green

**Terminate if Q2.11 != "Blue"**

---

## Conjoint explanation

*Q3.1*: In the following set of questions, we will ask you to select organizations you would donate to. The following terms will be important. Please read through this list carefully.
   
**Organizations:**

- *Amnesty International*: A London-based non-governmental organization known for its focus on human rights.
- *Greenpeace*: An independent, nonprofit, global campaigning organization known for using non-violent, creative confrontation to expose global environmental problems and their causes.
- *Oxfam*: An international group known for providing help to poor countries and disaster areas, with a focus on helping create lasting solutions to the injustice of poverty. 
- *Red Cross*: An international organization known for caring for the wounded, sick, and homeless in wartime and following natural disasters.
 
**Issue areas:**

- *Emergency response*: Respond to situations that pose an immediate risk to health, life, property, or the environment.
- *Environment*: Protecting the natural world and the impact of human activity on its condition.
- *Human rights*: Protect the inalienable fundamental rights to which a person is inherently entitled simply because he or she is a human being.
- *Refugee relief*: Provide relief for those who have been forced to flee his or her country because of persecution, war or violence.  
 
**Organizational practices:**

- *Financial transparency*: Organization discloses information regarding its donations and financial allocations in a timely and reliable manner.
- *Accountability*: Organization undergoes a regular third-party audit to ensure that it is meeting its program goals and obligations. 

**Funding sources:**

- *Funded primarily by many small private donations*: Funds by individuals who make small independent contributions.
- *Funded primarily by a handful of wealthy private donors*: Funds by wealthy individuals or families, who receive tax deductions for donations.
- *Funded primarily by government grants*: Non-repayable funds gifted by a government department.

**Relationship with host government:**

- *Friendly relationship with government*: Organization has a friendly relationship with its host government.
- *Criticized by government*: Organization faces public condemnation from the government.
- *Under government crackdown*: Host government has undertaken official action to limit or stop the organization. 

*Q3.2*: For each of the next 12 questions, imagine you are selecting an organization you will donate to and that each of the listed organizations exists.

---

## Conjoint questions

*Q4.1–12*: Which of the following organizations would you donate to?

:   Single option or "none" selected

    |                                   | Option 1 | Option 2 | Option 3 | None |
    | --------------------------------- | :------: | :------: | :------: | :--: |
    | Organization                      |  Random  |  Random  |  Random  |  —   |
    | Issue area                        |  Random  |  Random  |  Random  |  —   |
    | Financial transparency            |  Random  |  Random  |  Random  |  —   |
    | Accountability                    |  Random  |  Random  |  Random  |  —   |
    | Funding sources                   |  Random  |  Random  |  Random  |  —   |
    | Relationship with host government |  Random  |  Random  |  Random  |  —   |

---

## Additional demographic questions

*Q5.1*: Did you vote in the last election?

:   Single answer

    - Yes
    - No

*Q5.2*: On a scale of extremely liberal (1) to extremely conservative (7), how would you describe your political views?

:   Single answer

    - 1 (Extremely liberal)
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7 (Extremely conservative)

*Q5.3*: Here is a list of different types of voluntary organizations. For each organization, indicate whether you are an active member, an inactive member, or not a member of that type of organization:

:   Matrix table

    |                                         | Active member | Inactive member | Don't belong |
    | --------------------------------------- | :-----------: | :-------------: | :----------: |
    | Church or religious organization        |       •       |        •        |      •       |
    | Sport or recreational organization      |       •       |        •        |      •       |
    | Art, music, or educational organization |       •       |        •        |      •       |
    | Labor union                             |       •       |        •        |      •       |
    | Political party                         |       •       |        •        |      •       |
    | Environmental organization              |       •       |        •        |      •       |
    | Professional association                |       •       |        •        |      •       |
    | Humanitarian or charitable organization |       •       |        •        |      •       |
    | Consumer organization                   |       •       |        •        |      •       |
    | Other organization                      |       •       |        •        |      •       |

*Q5.4*: Historically, how involved have you been in activist causes?

:   Single answer

    - Extremely involved
    - Very involved
    - Moderately involved
    - Slightly involved
    - Never involved

*Q5.5*: Historically, how involved has your family been in activist causes?

:   Single answer

    - Extremely involved
    - Very involved
    - Moderately involved
    - Slightly involved
    - Never involved

*Q5.6*: On a scale of no trust (1) to complete trust (7), how much do you trust political institutions and the state?

:   Single answer

    - 1 (No trust)
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7 (Complete trust)
 
*Q5.7*: Have you ever traveled to a developing country? 

:   Single answer

    - Yes
    - No

*Q5.8*: How often do you attend religious or worship services, not including weddings and funerals?

:   Single answer

    - More than once a week
    - Once a week
    - Once or twice a month
    - A few times a year
    - Seldom
    - Never
    - Don't know

*Q5.9*: How important is religion in your life?

:   Single answer

    - Extremely important
    - Very important
    - Moderately important
    - Slightly important
    - Not at all important

*Q5.10*: What is your current religion, if any?

:   Single answer

    - Catholic (including Roman Catholic and Orthodox)
    - Protestant (United Church of Canada, Anglican, Orthodox, Baptist, Lutheran)
    - Christian Orthodox
    - Jewish
    - Muslim
    - Sikh
    - Hindu
    - Buddhist
    - Atheist (do not believe in God)
    - Other: _________

*Q5.11*: On a scale of strongly agree (1) to strongly disagree (7), rate your response to the following statement: People should be more charitable towards others in society.

:   Single answer

    - 1 (Strongly agree)
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7 (Strongly disagree)

*Q5.12*: What is your gender?

:   Single answer

    - Male
    - Female
    - Transgender
    - Prefer not to say
    - Other: _________

*Q5.13*: Are you now married, widowed, divorced, separated, or never married?

:   Single answer

    - Married
    - Widowed
    - Divorced
    - Separated
    - Never married

*Q5.14*: What is the highest degree or level of school you have completed?

:   Single answer

    - Less than high school
    - High school graduate
    - Some college
    - 2 year degree
    - 4 year degree 
    - Graduate or professional degree
    - Doctorate

*Q5.15*: What is your annual household income before taxes?

:   Single answer

    - Less than \$10,000
    - \$10,000 to \$19,999
    - \$20,000 to \$29,999
    - \$30,000 to \$39,999
    - \$40,000 to \$49,999
    - \$50,000 to \$59,999
    - \$60,000 to \$69,999
    - \$70,000 to \$79,999
    - \$80,000 to \$89,999
    - \$90,000 to \$99,999
    - \$100,000 to \$149,999
    - \$150,000 to \$199,999
    - \$200,000 to \$299,999
    - \$300,000 or more

*Q5.16*: Choose one or more races that you consider yourself to be:

:   Multiple answers allowed

    - White
    - Black or African American
    - American Indian or Alaska Native
    - Asian
    - Native Hawaiian or Pacific Islander
    - Other: _________

*Q5.17*: How old are you?

:   Single answer

    - Under 18
    - 18 - 24
    - 25 - 34
    - 35 - 44
    - 45 - 54
    - 55 - 64
    - 65 - 74
    - 75 - 84
    - 85 or older

*Q5.18*: What is your ZIP code?

:   Text field

\newpage

[^smalldonors]: Micro-donations refer to donations between $0.25–$10; small donors are individuals who donate up to $50 [@SaxtonWang:2014].

[^NGOdef]: Broadly speaking, NGOs are any local, national, or international not-for-profit, voluntary organization. They can be domestic (i.e. an NGO that operates entirely in a single state), or international (INGOs). INGOs are composed of members from two or more countries and are organized to advance their members' international goals and provide services to citizens of other states through routine transactions with states, private actors, and international institutions [@Tarrow:2001, 12].

[^exceptions]: For exceptions, see @Micklewright:2009 on the UK; @Rajan:2009 on Canada; @wiepking2010 on the Netherlands; @CasaleBaumann:2015 on the U.S.

[^highnetworth]: High-net worth households are have greater than \$200,000 in annual household income and/or have more than \$1,000,000 in assets, excluding primary residence.

[^phildef]: We use philanthropy to connote voluntary giving by an individual or group to promote the common good. While it can include grants given by foundations and corporations to nonprofit organizations, our focus here is on individual giving.

[^framing]: Framing is the process through which actors present information to influence perceptions or behavior. Previous research has shown that which frames are employed can have a significant effect on individuals' attitudes and behaviors [@BenfordSnow:2000; @ChongDruckman:2007].

[^intlaffairs]: Giving USA defines the sector of international affairs to include any nonprofit organization working in international development, international relief services, disaster relief, international human rights, international peace and security, foreign policy research and analysis, and international exchange programs.

[^sample-size]: A sample size of at least 500 respondents is typical when using conjoint data in a hierarchical Bayesian model. We doubled this amount because we are interested in analyzing subpopulations of respondents, which requires a larger sample.

[^model-details]:	Specifically, 

    $$
    \begin{aligned}
    \beta &\sim \operatorname{Multivariate} \mathcal{N}(Z \Gamma, \xi) \\
    y &\sim \operatorname{Multinomial\ logit}(X \beta, \varepsilon)
    \end{aligned}
    $$

    where $y$ = which alternative the respondent chooses to donate to, $X$ = design matrix of attribute levels (i.e. organizations, issue areas, organizational practices, funding sources, and government relations), $\beta$ = latent individual preferences for the attribute levels, $Z$ = matrix of individual-level covariates (i.e. demographics, political knowledge, attitudes towards charity, etc.), $\Gamma$ = matrix of coefficients mapping individual-level covariates onto the latent individual-level preferences, and $\varepsilon$ and $\xi$ = errors. 
