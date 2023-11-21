function [ys_, params, info] = steadystate(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    params(10)=1;
    ys_(2)=1/params(1)-(1-params(2));
    ys_(12)=1/params(1)-1;
    ys_(11)=(1+params(11)-1/params(1))/params(5);
    ys_(14)=((1-params(1))^2-params(11)*params(1)*(1-params(1)))/(params(5)*params(1)^2);
    ys_(1)=(1-params(3))*(params(3)/ys_(2))^(params(3)/(1-params(3)));
    ys_(3)=params(1)*ys_(1)/(params(10)*(-params(6)));
    m_pss=ys_(3);
    ys_(4)=params(3)*(m_pss-ys_(12)*ys_(11))/(ys_(2)-params(2)*params(3));
    ys_(5)=ys_(4)*ys_(2)*(1-params(3))/(params(3)*ys_(1));
    ys_(10)=1;
    ys_(9)=1;
    ys_(8)=1;
    ys_(7)=1;
    ys_(6)=m_pss*ys_(7);
    ys_(13)=1;
    % Auxiliary equations
ys_(15)=(1+ys_(12))*ys_(13)*params(1)/(ys_(7)*ys_(3));
ys_(16)=ys_(7)*params(1)/(ys_(7)*ys_(3))*(ys_(2)+1-params(2));
end