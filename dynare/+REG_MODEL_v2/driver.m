%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'REG_MODEL_v2';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'e_A1'};
M_.exo_names_tex(1) = {'{\varepsilon_{A1}}'};
M_.exo_names_long(1) = {'productivity shock 1'};
M_.exo_names(2) = {'e_A2'};
M_.exo_names_tex(2) = {'{\varepsilon_{A2}}'};
M_.exo_names_long(2) = {'productivity shock 2'};
M_.exo_names(3) = {'e_M'};
M_.exo_names_tex(3) = {'{\varepsilon_{M}}'};
M_.exo_names_long(3) = {'monetary shock'};
M_.endo_names = cell(31,1);
M_.endo_names_tex = cell(31,1);
M_.endo_names_long = cell(31,1);
M_.endo_names(1) = {'C1t'};
M_.endo_names_tex(1) = {'{\hat{C}_{1}}'};
M_.endo_names_long(1) = {'Consumption aggregation of region 1'};
M_.endo_names(2) = {'C2t'};
M_.endo_names_tex(2) = {'{\hat{C}_{2}}'};
M_.endo_names_long(2) = {'Consumption aggregation of region 2'};
M_.endo_names(3) = {'C11t'};
M_.endo_names_tex(3) = {'{\hat{C}_{1 1}}'};
M_.endo_names_long(3) = {'Comsumption of good 1 in region 1'};
M_.endo_names(4) = {'C21t'};
M_.endo_names_tex(4) = {'{\hat{C}_{2 1}}'};
M_.endo_names_long(4) = {'Comsumption of good 1 in region 2'};
M_.endo_names(5) = {'C12t'};
M_.endo_names_tex(5) = {'{\hat{C}_{1 2}}'};
M_.endo_names_long(5) = {'Comsumption of good 2 in region 1'};
M_.endo_names(6) = {'C22t'};
M_.endo_names_tex(6) = {'{\hat{C}_{2 2}}'};
M_.endo_names_long(6) = {'Comsumption of good 2 in region 2'};
M_.endo_names(7) = {'L1t'};
M_.endo_names_tex(7) = {'{\hat{L}_{1}}'};
M_.endo_names_long(7) = {'Labor in region 1'};
M_.endo_names(8) = {'L2t'};
M_.endo_names_tex(8) = {'{\hat{L}_{2}}'};
M_.endo_names_long(8) = {'Labor in region 2'};
M_.endo_names(9) = {'K1t'};
M_.endo_names_tex(9) = {'{\hat{K}_{1}}'};
M_.endo_names_long(9) = {'Capital in region 1'};
M_.endo_names(10) = {'K2t'};
M_.endo_names_tex(10) = {'{\hat{K}_{2}}'};
M_.endo_names_long(10) = {'Capital in region 2'};
M_.endo_names(11) = {'Yt'};
M_.endo_names_tex(11) = {'{\hat{Y}}'};
M_.endo_names_long(11) = {'Total Production'};
M_.endo_names(12) = {'Y1t'};
M_.endo_names_tex(12) = {'{\hat{Y}_{1}}'};
M_.endo_names_long(12) = {'Production of region 1'};
M_.endo_names(13) = {'Y2t'};
M_.endo_names_tex(13) = {'{\hat{Y}_{2}}'};
M_.endo_names_long(13) = {'Production of region 2'};
M_.endo_names(14) = {'I1t'};
M_.endo_names_tex(14) = {'{\hat{I}_{1}}'};
M_.endo_names_long(14) = {'Investment in region 1'};
M_.endo_names(15) = {'I2t'};
M_.endo_names_tex(15) = {'{\hat{I}_{2}}'};
M_.endo_names_long(15) = {'Investment in region 2'};
M_.endo_names(16) = {'ZA1t'};
M_.endo_names_tex(16) = {'{\hat{Z}_{A1}}'};
M_.endo_names_long(16) = {'Production technology level of region 1'};
M_.endo_names(17) = {'ZA2t'};
M_.endo_names_tex(17) = {'{\hat{Z}_{A2}}'};
M_.endo_names_long(17) = {'Production technology level of region 2'};
M_.endo_names(18) = {'E1t'};
M_.endo_names_tex(18) = {'{\hat{\mathscr{E}}_{1}}'};
M_.endo_names_long(18) = {'Total expense of region 1'};
M_.endo_names(19) = {'E2t'};
M_.endo_names_tex(19) = {'{\hat{\mathscr{E}}_{2}}'};
M_.endo_names_long(19) = {'Total expense of region 2'};
M_.endo_names(20) = {'Pt'};
M_.endo_names_tex(20) = {'{\hat{P}}'};
M_.endo_names_long(20) = {'National price level'};
M_.endo_names(21) = {'P1t'};
M_.endo_names_tex(21) = {'{\hat{P}_{1}}'};
M_.endo_names_long(21) = {'Price level of region 1'};
M_.endo_names(22) = {'P2t'};
M_.endo_names_tex(22) = {'{\hat{P}_{2}}'};
M_.endo_names_long(22) = {'Price level of region 2'};
M_.endo_names(23) = {'Rt'};
M_.endo_names_tex(23) = {'{\hat{R}}'};
M_.endo_names_long(23) = {'Interest rate'};
M_.endo_names(24) = {'RKt'};
M_.endo_names_tex(24) = {'{\hat{R}_{K}}'};
M_.endo_names_long(24) = {'Return on capital'};
M_.endo_names(25) = {'Wt'};
M_.endo_names_tex(25) = {'{\hat{W}}'};
M_.endo_names_long(25) = {'Wages'};
M_.endo_names(26) = {'pit'};
M_.endo_names_tex(26) = {'{\hat{\pi}}'};
M_.endo_names_long(26) = {'National gross inflation rate'};
M_.endo_names(27) = {'pi1t'};
M_.endo_names_tex(27) = {'{\hat{\pi}_{1}}'};
M_.endo_names_long(27) = {'Gross inflation rate in region 1'};
M_.endo_names(28) = {'pi2t'};
M_.endo_names_tex(28) = {'{\hat{\pi}_{2}}'};
M_.endo_names_long(28) = {'Gross inflation rate in region 2'};
M_.endo_names(29) = {'lambda1t'};
M_.endo_names_tex(29) = {'{\hat{\lambda}_{1}}'};
M_.endo_names_long(29) = {'Marginal cost in region 1'};
M_.endo_names(30) = {'lambda2t'};
M_.endo_names_tex(30) = {'{\hat{\lambda}_{2}}'};
M_.endo_names_long(30) = {'Marginal cost in region 2'};
M_.endo_names(31) = {'ZMt'};
M_.endo_names_tex(31) = {'{\hat{Z}_M}'};
M_.endo_names_long(31) = {'Monetary Policy'};
M_.endo_partitions = struct();
M_.param_names = cell(19,1);
M_.param_names_tex = cell(19,1);
M_.param_names_long = cell(19,1);
M_.param_names(1) = {'alppha'};
M_.param_names_tex(1) = {'{\alpha}'};
M_.param_names_long(1) = {'capital elasticity of production'};
M_.param_names(2) = {'betta'};
M_.param_names_tex(2) = {'{\beta}'};
M_.param_names_long(2) = {'intertemporal discount factor'};
M_.param_names(3) = {'gammaR'};
M_.param_names_tex(3) = {'{\gamma_{R}}'};
M_.param_names_long(3) = {'interest-rate smoothing parameter'};
M_.param_names(4) = {'gammapi'};
M_.param_names_tex(4) = {'{\gamma_{pi}}'};
M_.param_names_long(4) = {'interest-rate sensitivity in relation to inflation'};
M_.param_names(5) = {'gammaY'};
M_.param_names_tex(5) = {'{\gamma_{Y}}'};
M_.param_names_long(5) = {'interest-rate sensitivity in relation to product'};
M_.param_names(6) = {'dellta'};
M_.param_names_tex(6) = {'{\delta}'};
M_.param_names_long(6) = {'capital depreciation rate'};
M_.param_names(7) = {'thetta'};
M_.param_names_tex(7) = {'{\theta}'};
M_.param_names_long(7) = {'price stickiness parameter'};
M_.param_names(8) = {'rhoA1'};
M_.param_names_tex(8) = {'{\rho_{A1}}'};
M_.param_names_long(8) = {'autoregressive parameter of productivity in region 1'};
M_.param_names(9) = {'rhoA2'};
M_.param_names_tex(9) = {'{\rho_{A2}}'};
M_.param_names_long(9) = {'autoregressive parameter of productivity in region 2'};
M_.param_names(10) = {'rhoM'};
M_.param_names_tex(10) = {'{\rho_{M}}'};
M_.param_names_long(10) = {'autoregressive parameter of monetary policy'};
M_.param_names(11) = {'siggma'};
M_.param_names_tex(11) = {'{\sigma}'};
M_.param_names_long(11) = {'relative risk aversion coefficient'};
M_.param_names(12) = {'phhi'};
M_.param_names_tex(12) = {'{\phi}'};
M_.param_names_long(12) = {'relative labor weight in utility'};
M_.param_names(13) = {'varphhi'};
M_.param_names_tex(13) = {'{\varphi}'};
M_.param_names_long(13) = {'marginal disutility of labor supply'};
M_.param_names(14) = {'pssi'};
M_.param_names_tex(14) = {'{\psi}'};
M_.param_names_long(14) = {'elasticity of substitution between intermediate goods'};
M_.param_names(15) = {'omega11'};
M_.param_names_tex(15) = {'{\omega_{11}}'};
M_.param_names_long(15) = {'weight of good 1 in consumption composition of region 1'};
M_.param_names(16) = {'omega21'};
M_.param_names_tex(16) = {'{\omega_{21}}'};
M_.param_names_long(16) = {'weight of good 1 in consumption composition of region 2'};
M_.param_names(17) = {'sigmaA1'};
M_.param_names_tex(17) = {'{\sigma_{A1}}'};
M_.param_names_long(17) = {'Standard Error of productivity shock 1'};
M_.param_names(18) = {'sigmaA2'};
M_.param_names_tex(18) = {'{\sigma_{A2}}'};
M_.param_names_long(18) = {'Standard Error of productivity shock 2'};
M_.param_names(19) = {'sigmaM'};
M_.param_names_tex(19) = {'{\sigma_M}'};
M_.param_names_long(19) = {'Standard Error of monetary shock'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 31;
M_.param_nbr = 19;
M_.orig_endo_nbr = 31;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 31;
M_.eq_nbr = 31;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 10 41;
 0 11 42;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 1 18 0;
 2 19 0;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 3 25 0;
 4 26 0;
 0 27 43;
 0 28 44;
 5 29 0;
 6 30 45;
 7 31 46;
 8 32 0;
 0 33 47;
 0 34 0;
 0 35 0;
 0 36 48;
 0 37 49;
 0 38 0;
 0 39 0;
 9 40 0;]';
M_.nstatic = 15;
M_.nfwrd   = 7;
M_.npred   = 7;
M_.nboth   = 2;
M_.nsfwrd   = 9;
M_.nspred   = 9;
M_.ndynamic   = 16;
M_.dynamic_tmp_nbr = [15; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Regional Gross Inflation Rate' ;
  2 , 'name' , 'pi2t' ;
  3 , 'name' , 'New Keynesian Phillips Curve' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'Law of Motion for Capital' ;
  6 , 'name' , 'K2t' ;
  7 , 'name' , 'Regional Consumption' ;
  8 , 'name' , 'C2t' ;
  9 , 'name' , 'Regional Consumption Levels' ;
  10 , 'name' , 'Total Expenses' ;
  11 , 'name' , 'E2t' ;
  12 , 'name' , 'Labor Supply' ;
  13 , 'name' , '13' ;
  14 , 'name' , 'Euler equation for the bonds return' ;
  15 , 'name' , '15' ;
  16 , 'name' , 'Euler equation for the capital return' ;
  17 , 'name' , '17' ;
  18 , 'name' , 'Production Function' ;
  19 , 'name' , 'Y2t' ;
  20 , 'name' , 'Capital and Labor Levels' ;
  21 , 'name' , 'Marginal Cost' ;
  22 , 'name' , 'lambda2t' ;
  23 , 'name' , 'Monetary Policy' ;
  24 , 'name' , 'National Gross Inflation Rate' ;
  25 , 'name' , 'National Price Level' ;
  26 , 'name' , 'Market Clearing Condition' ;
  27 , 'name' , 'Regional Market Clearing Condition' ;
  28 , 'name' , '28' ;
  29 , 'name' , 'Productivity Shock' ;
  30 , 'name' , 'ZA2t' ;
  31 , 'name' , 'Monetary Shock' ;
};
M_.mapping.C1t.eqidx = [7 10 12 14 16 27 ];
M_.mapping.C2t.eqidx = [8 11 13 15 17 28 ];
M_.mapping.C11t.eqidx = [7 9 ];
M_.mapping.C21t.eqidx = [8 9 ];
M_.mapping.C12t.eqidx = [7 9 ];
M_.mapping.C22t.eqidx = [8 9 ];
M_.mapping.L1t.eqidx = [12 18 20 ];
M_.mapping.L2t.eqidx = [13 19 20 ];
M_.mapping.K1t.eqidx = [5 18 20 ];
M_.mapping.K2t.eqidx = [6 19 20 ];
M_.mapping.Yt.eqidx = [23 26 ];
M_.mapping.Y1t.eqidx = [18 26 27 ];
M_.mapping.Y2t.eqidx = [19 26 28 ];
M_.mapping.I1t.eqidx = [5 27 ];
M_.mapping.I2t.eqidx = [6 28 ];
M_.mapping.ZA1t.eqidx = [18 21 29 ];
M_.mapping.ZA2t.eqidx = [19 22 30 ];
M_.mapping.E1t.eqidx = [10 12 14 16 ];
M_.mapping.E2t.eqidx = [11 13 15 17 ];
M_.mapping.Pt.eqidx = [24 25 ];
M_.mapping.P1t.eqidx = [1 10 11 16 21 25 ];
M_.mapping.P2t.eqidx = [2 10 11 17 22 25 ];
M_.mapping.Rt.eqidx = [14 15 23 ];
M_.mapping.RKt.eqidx = [16 17 21 22 ];
M_.mapping.Wt.eqidx = [12 13 21 22 ];
M_.mapping.pit.eqidx = [23 24 ];
M_.mapping.pi1t.eqidx = [1 3 ];
M_.mapping.pi2t.eqidx = [2 4 ];
M_.mapping.lambda1t.eqidx = [3 21 ];
M_.mapping.lambda2t.eqidx = [4 22 ];
M_.mapping.ZMt.eqidx = [23 31 ];
M_.mapping.e_A1.eqidx = [29 ];
M_.mapping.e_A2.eqidx = [30 ];
M_.mapping.e_M.eqidx = [31 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [9 10 16 17 20 21 22 23 31 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(31, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(19, 1);
M_.endo_trends = struct('deflator', cell(31, 1), 'log_deflator', cell(31, 1), 'growth_factor', cell(31, 1), 'log_growth_factor', cell(31, 1));
M_.NNZDerivatives = [119; 0; -1; ];
M_.static_tmp_nbr = [15; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.35;
alppha = M_.params(1);
M_.params(2) = 0.985;
betta = M_.params(2);
M_.params(3) = 0.79;
gammaR = M_.params(3);
M_.params(4) = 2.43;
gammapi = M_.params(4);
M_.params(5) = 0.16;
gammaY = M_.params(5);
M_.params(6) = 0.025;
dellta = M_.params(6);
M_.params(7) = 0.8;
thetta = M_.params(7);
M_.params(8) = 0.95;
rhoA1 = M_.params(8);
M_.params(9) = 0.90;
rhoA2 = M_.params(9);
M_.params(10) = 0.9;
rhoM = M_.params(10);
M_.params(11) = 2;
siggma = M_.params(11);
M_.params(12) = 1;
phhi = M_.params(12);
M_.params(13) = 1.5;
varphhi = M_.params(13);
M_.params(14) = 8;
pssi = M_.params(14);
M_.params(15) = 0.8;
omega11 = M_.params(15);
M_.params(16) = 0.4;
omega21 = M_.params(16);
M_.params(17) = 0.01;
sigmaA1 = M_.params(17);
M_.params(18) = 0.01;
sigmaA2 = M_.params(18);
M_.params(19) = 0.01;
sigmaM = M_.params(19);
steady;
options_.qz_zero_threshold = 1e-20;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(3, 3) = (M_.params(19))^2;
options_.irf = 100;
options_.order = 1;
options_.qz_zero_threshold = 1e-20;
var_list_ = {'ZMt';'ZA1t';'Rt';'RKt';'Wt';'C1t';'L1t';'K1t';'Y1t';'I1t';'P1t';'pi1t'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
write_latex_definitions;
write_latex_parameter_table;
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'REG_MODEL_v2_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end