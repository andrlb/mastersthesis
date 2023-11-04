function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = REG_MODEL_remove_Pt.static_resid_tt(T, y, x, params);
end
residual = zeros(30, 1);
residual(1) = y(26);
residual(2) = y(27);
lhs = y(26);
rhs = params(2)*y(26)+y(28)*(1-params(7))*(1-params(2)*params(7))/params(7);
residual(3) = lhs - rhs;
lhs = y(27);
rhs = params(2)*y(27)+(1-params(2)*params(7))*(1-params(7))*y(29)/params(7);
residual(4) = lhs - rhs;
lhs = y(9);
rhs = (1-params(6))*y(9)+params(6)*y(14);
residual(5) = lhs - rhs;
lhs = y(10);
rhs = (1-params(6))*y(10)+params(6)*y(15);
residual(6) = lhs - rhs;
lhs = y(3)-y(5);
rhs = y(21)-y(20);
residual(7) = lhs - rhs;
lhs = y(4)-y(6);
rhs = y(21)-y(20);
residual(8) = lhs - rhs;
lhs = y(18);
rhs = y(1)+params(15)*y(20)+(1-params(15))*y(21);
residual(9) = lhs - rhs;
lhs = y(19);
rhs = y(2)+params(16)*y(20)+(1-params(16))*y(21);
residual(10) = lhs - rhs;
lhs = params(13)*y(7)-y(1)*(1-params(11));
rhs = y(24)-y(18);
residual(11) = lhs - rhs;
lhs = params(13)*y(8)-y(2)*(1-params(11));
rhs = y(24)-y(19);
residual(12) = lhs - rhs;
lhs = 0;
rhs = (1-params(2))*y(22);
residual(13) = lhs - rhs;
lhs = 0;
rhs = (1-params(2))*y(22);
residual(14) = lhs - rhs;
lhs = 0;
rhs = (y(23)-y(20))*T(17);
residual(15) = lhs - rhs;
lhs = 0;
rhs = T(17)*(y(23)-y(21));
residual(16) = lhs - rhs;
lhs = y(12);
rhs = y(16)+params(1)*y(9)+(1-params(1))*y(7);
residual(17) = lhs - rhs;
lhs = y(13);
rhs = y(17)+params(1)*y(10)+(1-params(1))*y(8);
residual(18) = lhs - rhs;
lhs = y(9)-y(7);
rhs = y(24)-y(23);
residual(19) = lhs - rhs;
lhs = y(10)-y(8);
rhs = y(24)-y(23);
residual(20) = lhs - rhs;
lhs = y(28);
rhs = params(1)*y(23)+(1-params(1))*y(24)-y(16)-y(20);
residual(21) = lhs - rhs;
lhs = y(29);
rhs = params(1)*y(23)+(1-params(1))*y(24)-y(17)-y(21);
residual(22) = lhs - rhs;
lhs = y(22);
rhs = y(22)*params(3)+(1-params(3))*(params(4)*y(25)+params(5)*y(11))+y(30);
residual(23) = lhs - rhs;
lhs = y(25);
rhs = T(14)*y(26)+y(27)*(1-T(14));
residual(24) = lhs - rhs;
lhs = y(11);
rhs = T(14)*y(12)+y(13)*(1-T(14));
residual(25) = lhs - rhs;
lhs = y(12);
rhs = T(15)*y(3)+T(16)*y(5)+y(14)*(1-T(15)-T(16));
residual(26) = lhs - rhs;
lhs = y(13);
rhs = (1-params(15))*T(12)/T(11)*y(4)+(1-params(16))*T(13)/T(11)*y(6)+y(15)*T(18);
residual(27) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(8)+x(1);
residual(28) = lhs - rhs;
lhs = y(17);
rhs = y(17)*params(9)+x(2);
residual(29) = lhs - rhs;
lhs = y(30);
rhs = y(30)*params(10)+x(3);
residual(30) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
