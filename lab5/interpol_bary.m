function t = interpol_bary(x, y, s)
    n = length(x);

    w = zeros(size(x));
    for i = 1 : n
        w(i) = 1 ./ prod([x(i) - [x(1:i-1), x(i+1:n)]]);
    end

    m = length(s);

    num = sum(repmat(w, m, 1) ./ (repmat(s, 1, n) - repmat(x, m, 1)) .* repmat(y, m, 1), 2);
    den = sum(repmat(w, m, 1) ./ (repmat(s, 1, n) - repmat(x, m, 1)), 2);
    t = num ./ den;


    [idy,locs] = ismember(x,s);
    t(locs(locs ~= 0)) = y(idy);
end