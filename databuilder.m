function test = databuilder(N)
if N <= 1
    N = 3;
end

for i = 1:N
    mean = -10 + 20 * rand(1);
    sigma = 0 + 5 * rand(1);
    x = -10:0.1:10;
    z = (x - 3)/ 1.5;
    expected = 1 / (sqrt(2*pi)*1.5) * exp(-0.5 * z.^2);
    test(i).mu = mean;
    test(i).sigma = sigma;
    test(i).x = x;
    test(i).y = expected;
end

end