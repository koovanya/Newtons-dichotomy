function sigma_BSM(S0,K,r,T,Yield,C0,A,B,accuracy)
% A:sigma下限，B：sigma上限，error：精确度

% 计算A、B的中点C
C=(A+B)./2;

% 计算误差
error=blsprice(S0,K,r,T,C,Yield)-C0;

% 当误差的绝对值大于我们设置的精确度时，循环执行牛顿二分法
while abs(error)>accuracy
    % 已知sigma越大，期权价值越大
    if error>0
        B=C;
        C=(A+B)./2;
    elseif error<0
        A=C;
        C=(A+B)./2;
    end
    error=blsprice(S0,K,r,T,C,Yield)-C0;
end

disp(C)