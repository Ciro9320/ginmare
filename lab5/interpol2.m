function t = interpol2(x, y, s)
    % Input:
    %         x,y  vettori di ascisse cui si associa il polinomio interpolatore "p_n"
    %         s    vettore di ascisse in cui valutare il polinomio interpolatore
    % Output:
    t=zeros(size(s));

    L=zeros(length(x),1);
    
    for j=1:length(s)
        for i=1:length(x)
            L(i)=(prod(s(j)-x(1:i-1))*prod(s(j)-x(i+1:end)))/(prod(x(i)-x(1:i-1))*prod(x(i)-x(i+1:end)));
        end
        t(j)=y*L;
    end    
end