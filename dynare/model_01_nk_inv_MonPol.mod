
% command to run dynare and write
% a new file with all the choices:
% dynare NK_Inv_MonPol savemacro=NK_Inv_MonPol_FINAL.mod

% -------------------------------------------------- %
% MODEL OPTIONS                                      %
% -------------------------------------------------- %

% Productivity Shock ON/OFF
    @#define ZA_SHOCK    = 0

% Productivity Shock sign: +/-
    @#define ZA_POSITIVE = 1

% Monetary Shock ON/OFF
    @#define ZM_SHOCK    = 1

% Monetary Shock sign: +/-
    @#define ZM_POSITIVE = 1

% -------------------------------------------------- %
% ENDOGENOUS VARIABLES                               %
% -------------------------------------------------- %

var
  PIt       ${\tilde{\pi}}$     (long_name='Inflation Rate')
  Pt        ${\hat{P}}$         (long_name='Price Level')
  LAMt      ${\tilde{\lambda}}$ (long_name='Real Marginal Cost')
  Ct        ${\hat{C}}$         (long_name='Consumption')
  Lt        ${\hat{L}}$         (long_name='Labor')
  Rt        ${\hat{R}}$         (long_name='Interest Rate')
  Kt        ${\hat{K}}$         (long_name='Capital')
  It        ${\hat{I}}$         (long_name='Investment')
  Wt        ${\hat{W}}$         (long_name='Wage')
  ZAt       ${\hat{Z}^A}$       (long_name='Productivity')
  Yt        ${\hat{Y}}$         (long_name='Production')
  ZMt       ${\hat{Z}^M}$       (long_name='Monetary Policy')
  ;

% -------------------------------------------------- %
% LOCAL VARIABLES                                    %
% -------------------------------------------------- %

% the steady state variables are used as local variables for the linear model.

model_local_variable

% steady state variables used as locals:
    P
    PI
    ZA
    ZM
    R
    LAM
    W
    Y
    C
    K
    L
    I

% local variables:
    RHO % Steady State Discount Rate
    ;

% -------------------------------------------------- %
% EXOGENOUS VARIABLES                                %
% -------------------------------------------------- %

varexo
  epsilonA ${\varepsilon_A}$   (long_name='productivity shock')
  epsilonM ${\varepsilon_M}$   (long_name='monetary shock')
  ;

% -------------------------------------------------- %
% PARAMETERS                                         %
% -------------------------------------------------- %

parameters
 SIGMA   ${\sigma}$     (long_name='Relative Risk Aversion')
 PHI     ${\phi}$       (long_name='Labor Disutility Weight')  
 VARPHI  ${\varphi}$    (long_name='Marginal Disutility of Labor Supply')
 BETA    ${\beta}$      (long_name='Intertemporal Discount Factor')
 DELTA   ${\delta}$     (long_name='Depreciation Rate')
 ALPHA   ${\alpha}$     (long_name='Output Elasticity of Capital')
 PSI     ${\psi}$       (long_name='Elasticity of Substitution between Intermediate Goods')
 THETA   ${\theta}$     (long_name='Price Stickness Parameter')
 gammaR  ${\gamma_R}$   (long_name='Interest-Rate Smoothing Parameter')
 gammaPI ${\gamma_\pi}$ (long_name='Interest-Rate Sensitivity to Inflation')
 gammaY  ${\gamma_Y}$   (long_name='Interest-Rate Sensitivity to Product')
 % maybe it's a local var, right? RHO     ${\rho}$       (long_name='Steady State Discount Rate')
 rhoA    ${\rho_A}$     (long_name='Autoregressive Parameter of Productivity Shock')
 rhoM    ${\rho_M}$     (long_name='Autoregressive Parameter of Monetary Policy Shock')
 thetaC  ${\theta_C}$   (long_name='Consumption weight in Output')
 thetaI  ${\theta_I}$   (long_name='Investment weight in Output')

% -------------------------------------------------- % 
% standard errors of stochastic shocks               %
% -------------------------------------------------- %

 sigmaA ${\sigma_A}$   (long_name='Productivity-Shock Standard Error')
 sigmaM ${\sigma_M}$   (long_name='Monetary-Shock Standard Error')
 ;

% -------------------------------------------------- %
% parameters values                                  %
% -------------------------------------------------- % 

 SIGMA   = 2        ; % Relative Risk Aversion
 PHI     = 1        ; % Labor Disutility Weight
 VARPHI  = 1.5      ; % Marginal Disutility of Labor Supply
 BETA    = 0.985    ; % Intertemporal Discount Factor
 DELTA   = 0.025    ; % Depreciation Rate
 ALPHA   = 0.35     ; % Output Elasticity of Capital
 PSI     = 8        ; % Elasticity of Substitution between Intermediate Goods
 THETA   = 0.8      ; % Price Stickness Parameter
 gammaR  = 0.79     ; % Interest-Rate Smoothing Parameter
 gammaPI = 2.43     ; % Interest-Rate Sensitivity to Inflation
 gammaY  = 0.16     ; % Interest-Rate Sensitivity to Product
 % maybe it's a local var, right? RHO     = 1/(1+Rs); % Steady State Discount Rate
 rhoA    = 0.95     ; % Autoregressive Parameter of Productivity Shock
 rhoM    = 0.9      ; % Autoregressive Parameter of Monetary Policy Shock
 thetaC  = 0.8      ; % Consumption weight in Output
 thetaI  = 1-thetaC ; % Investment weight in Output
 
% -------------------------------------------------- % 
% standard errors values                             %
% -------------------------------------------------- %

 sigmaA = 0.01   ; % Productivity-Shock Standard Error
 sigmaM = 0.01   ; % Monetary-Shock Standard Error

% -------------------------------------------------- %
% MODEL                                              %
% -------------------------------------------------- %

model(linear);

% First, the steady state variables as local varibles, for the log-linear use:

#Ps   = 1 ;
#PIs  = 1 ;
#ZAs  = 1 ;
#ZMs  = 1 ;
#Rs   = Ps*(1/BETA-(1-DELTA)) ;
#LAMs = Ps*(PSI-1)/PSI ;
#Ws   = (1-ALPHA)*(LAMs*ZAs*(ALPHA/Rs)^ALPHA)^(1/(1-ALPHA)) ;
#Ys   = ((Ws/(PHI*Ps))*((Ws/((1-ALPHA)*LAMs))^PSI)*(Rs/(Rs-DELTA*ALPHA*LAMs))^SIGMA)^(1/(PSI+SIGMA)) ;
#Cs   = ((Ws/(PHI*Ps))*((1-ALPHA)*Ys*LAMs/Ws)^(-PSI))^(1/SIGMA) ;
#Ks   = ALPHA*Ys*LAMs/Rs ;
#Ls   = (1-ALPHA)*Ys*LAMs/Ws ;
#Is   = DELTA*Ks ;
#RHO  = 1/(1+Rs) ;

% -------------------------------------------------- % 
% MODEL EQUATIONS                                    %
% -------------------------------------------------- %

% Second, the log-linear model:

% 01 %
[name='Gross Inflation Rate']
PIt = Pt - Pt(-1) ;

% 02 %
[name='New Keynesian Phillips Curve']
PIt = RHO * PIt(+1) + LAMt*(1-THETA)*(1-THETA*RHO)/THETA ;

% 03 %
[name='Labor Supply']
VARPHI*Lt + SIGMA*Ct = Wt - Pt ;

% 04 %
[name='Household Euler Equation']
Ct(+1) - Ct = (Rt(+1)-Pt(+1))*BETA*Rs/(SIGMA*Ps) ;

% 05 %
[name='Law of Motion for Capital']
Kt = (1-DELTA)*Kt(-1) + DELTA*It ;

% 06 %
[name='Real Marginal Cost']
LAMt = ALPHA*Rt + (1-ALPHA)*Wt - ZAt - Pt ;

% 07 %
[name='Production Function']
Yt = ZAt + ALPHA*Kt(-1) + (1-ALPHA)*Lt ;

% 08 %
[name='Marginal Rates of Substitution of Factors']
Kt(-1) - Lt = Wt - Rt ;

% 09 %
[name='Market Clearing Condition']
Yt = thetaC*Ct + thetaI*It ;

% 10 %
[name='Monetary Policy']
Rt = gammaR*Rt(-1) + (1 - gammaR)*(gammaPI*PIt + gammaY*Yt) + ZMt ;

% 11 %
[name='Productivity Shock']
@#if ZA_POSITIVE == 1
     ZAt = rhoA*ZAt(-1) + epsilonA ;
     @#else
     ZAt = rhoA*ZAt(-1) - epsilonA ;
     @#endif

% 12 %
[name='Monetary Shock']
@#if ZM_POSITIVE == 1
     ZMt = rhoM*ZMt(-1) + epsilonM ;
     @#else
     ZMt = rhoM*ZMt(-1) - epsilonM ;
     @#endif

end;

% -------------------------------------------------- % 
% STEADY STATE                                       %
% -------------------------------------------------- % 

steady_state_model ;

% in the log-linear model, all steady state variables are zero (the variation is zero):

  PIt  = 0 ;
  Pt   = 0 ;
  LAMt = 0 ;
  Ct   = 0 ;
  Lt   = 0 ;
  Rt   = 0 ;
  Kt   = 0 ;
  It   = 0 ;
  Wt   = 0 ;
  ZAt  = 0 ;
  Yt   = 0 ;
  ZMt  = 0 ;

end;

% compute the steady state
steady;
check(qz_zero_threshold=1e-20);

% -------------------------------------------------- % 
% SHOCKS                                             %
% -------------------------------------------------- % 

shocks; 

% Productivity Shock
@#if ZA_SHOCK == 1
     var    epsilonA;
     stderr sigmaA;
@#endif

% Monetary Shock
@#if ZM_SHOCK == 1
     var    epsilonM;
     stderr sigmaM;
@#endif

end;

stoch_simul(irf=100, order=1, qz_zero_threshold=1e-20) ZAt ZMt Yt Pt PIt LAMt Ct Lt Rt Kt It Wt ;

% -------------------------------------------------- % 
% LATEX OUTPUT                                       %
% -------------------------------------------------- % 

write_latex_definitions;
write_latex_parameter_table;
write_latex_original_model;
write_latex_dynamic_model;
write_latex_static_model;
write_latex_steady_state_model;
collect_latex_files;