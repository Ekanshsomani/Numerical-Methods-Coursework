%Starting the Script
%Section-1: Test For Random Variable With Uniform Discreet Distribution
max_value_1 = 100; %parameter-A for random function
mat_size_1 = [100 100];
disc= random('unid', max_value_1, mat_size_1);
[x, p, Discre] = ComputePDF(disc);

figure
if Discre==1
    stem(x, p, 'r');
else
    plot(x, p, 'g');
end
hold on
fplot(@(x) 1/max_value_1, 'b')
hold off


%Section-2: Test For Random Variable With Uniform Continuous Distribution
min_value_2 = 0;
max_value_2 = 100;
mat_size_2 = [100 100];
disc= random('Uniform', min_value_2, max_value_2, mat_size_2);
[x, p, Discre] = ComputePDF(disc);

figure
if Discre==1
    stem(x, p, 'r');
else
    plot(x, p, 'g');
end

hold on
fplot(@(x) 1/(max_value_2-min_value_2), 'b')
hold off
%}

%Section-3: Test For Random Variable With Uniform Continuous Distribution
mean = 5;
mat_size_3 = [100 100];
disc= random('Exponential', mean, mat_size_3);
[x, p, Discre] = ComputePDF(disc);

figure
if Discre==1
    stem(x, p, 'r');
else
    plot(x, p, 'g');
end
%fplot is behaving weirdly. Thus, not Ploting and comparing.
%{
hold on
fplot(@(x) mean*exp(-mean*x), 'b')
hold off
%}