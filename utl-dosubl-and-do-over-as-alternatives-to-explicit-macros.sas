Dosubl and do over as alternatives to explicit macros                                                        
                                                                                                             
Problem:  Compute mean age by sex and overall and partition output into Males, Females and All               
                                                                                                             
   Three solutions                                                                                           
                                                                                                             
       a. Strickly macro postes in SAS Forum                                                                 
          Ronein                                                                                             
          https://communities.sas.com/t5/user/viewprofilepage/user-id/159549                                 
                                                                                                             
       b. do over (best because of logging at the source)                                                    
                                                                                                             
       c. d0subl (provides loggong and interactive processing                                                
                                                                                                             
                                                                                                             
github                                                                                                       
https://tinyurl.com/y3upxgzk                                                                                 
https://github.com/rogerjdeangelis/utl-dosubl-and-do-over-as-alternatives-to-explicit-macros                 
                                                                                                             
SAS Forum                                                                                                    
https://tinyurl.com/y4lfloz9                                                                                 
https://communities.sas.com/t5/SAS-Programming/Run-macro-for-each-argument-from-vector/m-p/670054            
                                                                                                             
/*                   _                                                                                       
(_)_ __  _ __  _   _| |_                                                                                     
| | `_ \| `_ \| | | | __|                                                                                    
| | | | | |_) | |_| | |_                                                                                     
|_|_| |_| .__/ \__,_|\__|                                                                                    
        |_|                                                                                                  
*/                                                                                                           
                                                                                                             
data t2001(where=(sex="M"))  t2004(where=(sex="F"))  t2005;                                                  
  set sashelp.class(obs=5 keep=name sex age);                                                                
run;quit;                                                                                                    
                                                                                                             
                                                                                                             
WORK.T2001 total obs=2                                                                                       
                                                                                                             
MALE STUDENTS                                                                                                
                                               _                                                             
Obs     NAME     SEX    AGE    _ __ ___   __ _| | ___  ___                                                   
                              | `_ ` _ \ / _` | |/ _ \/ __|                                                  
 1     James      M      12   | | | | | | (_| | |  __/\__ \                                                  
 2     Thomas     M      11   |_| |_| |_|\__,_|_|\___||___/                                                  
                                                                                                             
                                                                                                             
WORK.T2004 total obs=3                                                                                       
                                                                                                             
FEMALE STUDENTS                                                                                              
                                                                                                             
Obs     NAME     SEX    AGE     __                      _                                                    
                               / _| ___ _ __ ___   __ _| | ___  ___                                          
 1     Joyce      F      11   | |_ / _ \ `_ ` _ \ / _` | |/ _ \/ __|                                         
 2     Louise     F      12   |  _|  __/ | | | | | (_| | |  __/\__ \                                         
 3     Alice      F      13   |_|  \___|_| |_| |_|\__,_|_|\___||___/                                         
                                                                                                             
                                                                                                             
WORK.T2005 total obs=5                                                                                       
                                                                                                             
ALL STUDENTS                                                                                                 
                                                                                                             
Obs     NAME     SEX    AGE                                                                                  
                                                                                                             
 1     Joyce      F      11          _ _                                                                     
 2     Louise     F      12     __ _| | |                                                                    
 3     Alice      F      13    / _` | | |                                                                    
 4     James      M      12   | (_| | | |                                                                    
 5     Thomas     M      11    \__,_|_|_|                                                                    
                                                                                                             
/*           _               _                                                                               
  ___  _   _| |_ _ __  _   _| |_                                                                             
 / _ \| | | | __| `_ \| | | | __|                                                                            
| (_) | |_| | |_| |_) | |_| | |_                                                                             
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                            
                |_|                                                                                          
*/                                                                                                           
                                                                                                             
                                                                                                             
ONLY DOSUBL PRODUCES A LOG;                                                                                  
                                                                                                             
WORK.LOG total obs=3                                                                                         
                                                                                                             
  STATUS     YEAR                                                                                            
                                                                                                             
  Success    2001                                                                                            
  Success    2004                                                                                            
  Success    2005                                                                                            
                                                                                                             
                                                                                                             
MEANS                                                                                                        
                                                                                                             
WORK.SUMMARY2005 total obs=2                                                                                 
                                                                                                             
         AVG_AGE_         _ _                                                                                
  SEX      2005      __ _| | |                                                                               
                    / _` | | |                                                                               
   F       12.0    | (_| | | |                                                                               
   M       11.5     \__,_|_|_|                                                                               
                                                                                                             
                                                                                                             
WORK.SUMMARY2004 total obs=1                                                                                 
                      __                      _                                                              
         AVG_AGE_    / _| ___ _ __ ___   __ _| | ___  ___                                                    
  SEX      2004     | |_ / _ \ `_ ` _ \ / _` | |/ _ \/ __|                                                   
                    |  _|  __/ | | | | | (_| | |  __/\__ \                                                   
   F        12      |_|  \___|_| |_| |_|\__,_|_|\___||___/                                                   
                                                                                                             
                                                                                                             
WORK.SUMMARY2005 total obs=1                                                                                 
                                     _                                                                       
   AVG_AGE_          _ __ ___   __ _| | ___  ___                                                             
     2005           | `_ ` _ \ / _` | |/ _ \/ __|                                                            
                    | | | | | | (_| | |  __/\__ \                                                            
     11.8           |_| |_| |_|\__,_|_|\___||___/                                                            
                                                                                                             
/*         _       _   _                                                                                     
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                     
/ __|/ _ \| | | | | __| |/ _ \| `_ \/ __|                                                                    
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                    
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                    
 _                                                                                                           
| |__   __ _ ___  ___   _ __ ___   __ _  ___ _ __ ___                                                        
| `_ \ / _` / __|/ _ \ | `_ ` _ \ / _` |/ __| `__/ _ \                                                       
| |_) | (_| \__ \  __/ | | | | | | (_| | (__| | | (_) |                                                      
|_.__/ \__,_|___/\___| |_| |_| |_|\__,_|\___|_|  \___/                                                       
                                                                                                             
*/                                                                                                           
                                                                                                             
                                                                                                             
data t2001(where=(sex="M"))  t2004(where=(sex="F"))  t2005;                                                  
  set sashelp.class(obs=5 keep=name sex age);                                                                
run;quit;                                                                                                    
                                                                                                             
proc datasets lib=work;                                                                                      
  delete                                                                                                     
     SUMMARY2001                                                                                             
     SUMMARY2004                                                                                             
     SUMMARY2005                                                                                             
     ;                                                                                                       
run;quit;                                                                                                    
                                                                                                             
%macro RRR(yymm);                                                                                            
proc sql;                                                                                                    
     create table                                                                                            
          summary&YYMM.  as                                                                                  
     select                                                                                                  
          sex                                                                                                
         ,avg(age) as  avg_age_&YYMM.                                                                        
     from  t&YYMM.                                                                                           
     group by sex                                                                                            
;quit;                                                                                                       
%mend RRR;                                                                                                   
                                                                                                             
%let vector=2001 2004 2005;                                                                                  
%let k = %sysfunc(countw(&vector));                                                                          
                                                                                                             
%macro RUN_RRR;                                                                                              
    %do j=1 %to &k.;                                                                                         
        %let YYMM=%scan(&vector.,&j.,%str( ));                                                               
        %RRR(&YYMM.);                                                                                        
    %end;                                                                                                    
%mend RUN_RRR;                                                                                               
                                                                                                             
%RUN_RRR;                                                                                                    
                                                                                                             
/*   _                                                                                                       
  __| | ___     _____   _____ _ __                                                                           
 / _` |/ _ \   / _ \ \ / / _ \ `__|                                                                          
| (_| | (_) | | (_) \ V /  __/ |                                                                             
 \__,_|\___/   \___/ \_/ \___|_|                                                                             
                                                                                                             
*/                                                                                                           
                                                                                                             
data t2001(where=(sex="M"))  t2004(where=(sex="F"))  t2005;                                                  
  set sashelp.class(obs=5 keep=name sex age);                                                                
run;quit;                                                                                                    
                                                                                                             
proc datasets lib=work;                                                                                      
  delete                                                                                                     
     SUMMARY2001                                                                                             
     SUMMARY2004                                                                                             
     SUMMARY2005                                                                                             
     ;                                                                                                       
run;quit;                                                                                                    
                                                                                                             
%array(vec,values=2005 2001 2004);                                                                           
                                                                                                             
%do_over(vec,phrase=%str(                                                                                    
   proc sql;                                                                                                 
       create                                                                                                
          table summary? as                                                                                  
       select                                                                                                
          sex                                                                                                
         ,avg(age) as avg_age_?                                                                              
       from                                                                                                  
          t?                                                                                                 
       group                                                                                                 
          by sex                                                                                             
   ;quit;                                                                                                    
   ));                                                                                                       
                                                                                                             
/*   _                 _     _                                                                               
  __| | ___  ___ _   _| |__ | |                                                                              
 / _` |/ _ \/ __| | | | `_ \| |                                                                              
| (_| | (_) \__ \ |_| | |_) | |                                                                              
 \__,_|\___/|___/\__,_|_.__/|_|                                                                              
                                                                                                             
*/                                                                                                           
                                                                                                             
data t2001(where=(sex="M"))  t2004(where=(sex="F"))  t2005;                                                  
  set sashelp.class(obs=5 keep=name sex age);                                                                
run;quit;                                                                                                    
                                                                                                             
proc datasets lib=work;                                                                                      
  delete                                                                                                     
     SUMMARY2001                                                                                             
     SUMMARY2004                                                                                             
     SUMMARY2005                                                                                             
     ;                                                                                                       
run;quit;                                                                                                    
                                                                                                             
%let vector=2001 2004 2005;                                                                                  
                                                                                                             
data log(drop=vec rc i);                                                                                     
                                                                                                             
   retain vec "&vector" Status;;                                                                             
                                                                                                             
   do i=1 by 1 while(scan(vec,i) ne "");                                                                     
                                                                                                             
      year=scan(vec,i);                                                                                      
      call symputx("yr",year);                                                                               
                                                                                                             
      rc=dosubl('                                                                                            
          proc sql;                                                                                          
              create                                                                                         
                 table summary&yr as                                                                         
              select                                                                                         
                 sex                                                                                         
                ,avg(age) as avg_age_&yr                                                                     
              from                                                                                           
                 t&yr                                                                                        
              group                                                                                          
                 by sex                                                                                      
          ;quit;                                                                                             
          %let cc=&syserr;                                                                                   
          %put ## &=cc;                                                                                      
      ');                                                                                                    
                                                                                                             
      if symgetn('cc')=0 then status="Success";                                                              
      else status="Fail";                                                                                    
                                                                                                             
      output;                                                                                                
   end;                                                                                                      
                                                                                                             
                                                                                                             
stop;                                                                                                        
run;quit;                                                                                                    
                                                                                                             
                                                                                                             
