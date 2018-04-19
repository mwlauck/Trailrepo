function [I] = Simpson(x,y)
%The function takes two 1xn arrays and computes the itegral using the
%simpson 1/3 rule and if neccisary will use the trapazoidal rule for the
%last interval
%   x=x variable
%   y= fuciton varrable evaluated at x
%   I= intergral of points from x1 to xend

[rx,cx]=size(x);
[ry,cy]=size(y);
%checks that matrix is a 1 by something or something by 1 matrix
if rx && ry==1
elseif cx && cy~=1
    error('Must be a 1x(n) matrix or (n)x1 matrix')
end
%swiches collum array to row arrray
if cx && cy == 1
    x=x';
    y=y';
end
%checks that length of arrays are the same
if length(x)~=length(y)
    error('Make sure inputs are the same length')
end
%checks if x matrix is equaly spaced
newxspacing=linspace(x(1),x(end),length(x));
tol = 10^(-12);%error between for error in floaring point numbers
if sum(abs(x-newxspacing))>tol%sum of absolute value of x - what x evely spaced would be) 
    error('x input is not equaly spaced')
end
%checks if there is an even amount of points and therfore will have to use
%trapaziodal rule
r=rem(length(x),2);
if r==0
    warning('The trapezoidal rule has to be used on the last interval')
end

%finding intergal
I=0;
if length(x)==1%if array is 1x1 the integral is 0
    I=0;
elseif length(x)==2 %use trap rule if only 2 points are provided
        xSpacing=x(2)-x(1);
        I=I+(y(end)+y(end-1))/2*xSpacing;
elseif r==0 %if there is an even number of points use simpson 1/3 and trap rule on last part
    xSpacing=x(2)-x(1);
    itter=(length(y)/2)-1;%how many itteration of simpsons 1/3 rule will be used
    for n=1:itter
        I=I+(xSpacing*(y(2*n-1)+4*y(2*n)+y(2*n+1))/3);
    end
    %trapazoid rule on last part
    I=I+(y(end)+y(end-1))/2*xSpacing;
else
    xSpacing=x(2)-x(1);
    itter=((length(y)-1)/2);%how many itteration of simpsons 1/3 rule will be used
    for n=1:itter
        I=I+(xSpacing*(y(2*n-1)+4*y(2*n)+y(2*n+1))/3);
    end
end
end

