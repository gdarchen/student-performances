function boxPlot(D, width, lineWidth, verbose)
% boxPlot  Make a box and whisker plot
%
% Synopsis:  boxPlot(D)
%            boxPlot(D,width)
%            boxPlot(D,width,lineWidth)
%
% Input:  D = matrix of data, with data sets in columns
%             [m,n] = size(D) ==>  m values in each of n categories
%             D can contain NaNs which are ignored in the computation of
%             the quartiles.
%         width = width of each box.  Default: width=1
%         lineWidth = user-specfied line width for box and whiskers.  The
%                     median is drawn with twice this line thickness
%                     Default:  lineWidth = current default LineWidth
%                        lineWidth = get(gcf,'DefaultLineLineWidt');
%         verbose = flag to turn on printing of summary data.
%                   Default:  verbose = false ==> no printing
%
% Example:
%           Y = randn(200,7) + repmat(randperm(7)-3,200,1);
%           boxPlot(Y)
%
% Downloaded from MATLAB-Central on 2009-10-18, Original code by Shane Lin
% Modified by Gerald Recktenwald, gerry@me.pdx.edu, on 2009-10-19

if nargin<2 || isempty(width),  width = 1;  end
if nargin<3 || isempth(lineWidth)
  lineWidth = get(gcf,'DefaultLineLineWidth');
end
if nargin<4, verbose=false;  end

[Q,Outliers] = getQuartiles(D);
drawBox(Q, Outliers, width, lineWidth);

if verbose
  fprintf('\nQuartiles\n');
  fprintf('   j     Max       Q3       Q2       Q1      Min     NO\n');
  for j=1:size(Q,2)
    if isempty(Outliers{j})
      nout = 0;
    else
      nout = length(Outliers{j});
    end
    fprintf('%4d  %7.4f  %7.4f  %7.4f  %7.4f  %7.4f  %4d\n',j,Q(:,j)',nout);
  end
end


% ============================================
function [Q,Outliers] = getQuartiles(D)
% getQuartiles  Find quartiles and outliers for a box-and-whisker plot
%               Only works for data sets with same number of data points
%               for each category
%
% Synopsis:  [Q,Outliers] = getQuartiles(D)
%
% Input: D = matrix of data, with data sets in columns
%            [m,n] = size(D) ==>  m values in each of n categories
%
% Output:  Q = matrix of quartiles.  size(Q) = [5,n].  Values in each
%              column of Q are in descending magnitude:
%                Q(1,j) = maximum value in category j
%                Q(2,j) = third quartile (q3)
%                Q(3,j) = second quartile (a.k.a. median, q2)
%                Q(4,j) = first quartile (q1)
%                Q(5,j) = minimum value in category j
%              The minimum (Q(5,j)) and maximum (Q(1,j)) are adjusted
%              to exclude values that are greater than q3 + 1.5*IQR
%              and less than q1 - 1.5*IQR

Q = zeros(5,size(D,2));
Outliers = cell(size(D,2));

% -- Work through columns of D.  Code does not vectorize
%    because NaNs are removed, which causes the effective
%    length of each column to vary.
for j=1:size(D,2)
  x = D(:,j);
  x( isnan(x) ) = [];    %  remove NaNs
  % x = sort(x);

  % -- Compute Quartiles
  q2 = median(x);
  q1 = median( x(x<q2) );   %  Q1 is median of lower half.
  q3 = median( x(x>q2) );   %  Q3 is median of upper half.
  IQR = q3-q1;              %  Inter-quartile range
  qmax = max(x);            %  Tentative max
  qmin = min(x);            %  and min for boxplot

  % -- Outliers for boxplot are 1.5*IQR above Q3 and 1.5*IQR below Q1
  klow  = x < (q1-1.5*IQR);
  khigh = x > (q3+1.5*IQR);
  iout = find( klow | khigh );
  if isempty(iout)
    Outliers{j} = [];
  else
    Outliers{j} = x(iout);
    if any(klow)
      qmin = min( x(~klow) );
    end
    if any(khigh)
      qmax = max( x(~khigh) );
    end
  end
  Q(:,j) = [qmax; q3; q2; q1; qmin]; 
end

% ============================================
function drawBox(Q, Outliers, width, lineWidth)
% drawBox  Create the box-and-whisker plot from quartile data
%
% Synopsis:  drawBox(Q, Outliers, lineWidth, width)
%
% Input:  Q = matrix of quartiles created by getQuartiles
%         Outliers = cell array of outliers for the box-and-whisker plot
%                    See getQuartiles
%         width = dimension used to specify the width of each box.  Use width=1
%         lineWidth = user-specfied line width for box and whiskers.  The
%                     median is drawn with twice this line thickness

% -- Set up a NaN-separated list of values for each box
%    19 points for each box & whisker pair.  20th point
%    is separatore between
n = size(Q,2);   %  number of boxes.  Data for each box in column of Q
ib = 1:n;
hwidth = (1-1/(1+n))/(1+9/(width+3));   %  half-width of box
qwidth = hwidth/2;                      %  quarter-width
ewidth = qwidth/2;                      %  eighth-width

nbpt = 20;
xb = zeros(n*nbpt,1);   yb = xb;
xb(1:nbpt:end)  = ib - ewidth;      yb(1:nbpt:end) = Q(5,:);    %  min left
xb(2:nbpt:end)  = ib + ewidth;      yb(2:nbpt:end) = Q(5,:);    %  min right
xb(3:nbpt:end)  = ib;               yb(3:nbpt:end) = Q(5,:);    %  min middle
xb(4:nbpt:end)  = ib;               yb(4:nbpt:end) = Q(4,:);    %  Q3 middle
xb(5:nbpt:end)  = ib + hwidth;      yb(5:nbpt:end) = Q(4,:);    %  Q3 right
xb(6:nbpt:end)  = ib + qwidth;      yb(6:nbpt:end) = Q(3,:);    %  Q2 right midwaist
xb(7:nbpt:end)  = ib - qwidth;      yb(7:nbpt:end) = Q(3,:);    %  Q2 left midwaist
xb(8:nbpt:end)  = ib - hwidth;      yb(8:nbpt:end) = Q(2,:);    %  Q1 left
xb(9:nbpt:end)  = ib;               yb(9:nbpt:end) = Q(2,:);    %  Q1 mid
xb(10:nbpt:end) = ib;               yb(10:nbpt:end) = Q(1,:);   %  max mid
xb(11:nbpt:end) = ib - ewidth;      yb(11:nbpt:end) = Q(1,:);   %  max left
xb(12:nbpt:end) = ib + ewidth;      yb(12:nbpt:end) = Q(1,:);   %  max right
xb(13:nbpt:end) = ib;               yb(13:nbpt:end) = Q(1,:);   %  max mid
xb(14:nbpt:end) = ib;               yb(14:nbpt:end) = Q(2,:);   %  Q1 mid
xb(15:nbpt:end) = ib + hwidth;      yb(15:nbpt:end) = Q(2,:);   %  Q1 right
xb(16:nbpt:end) = ib + qwidth;      yb(16:nbpt:end) = Q(3,:);   %  Q2 right midwaist
xb(17:nbpt:end) = ib - qwidth;      yb(17:nbpt:end) = Q(3,:);   %  Q2 left midwaist
xb(18:nbpt:end) = ib - hwidth;      yb(18:nbpt:end) = Q(4,:);   %  Q1 left
xb(19:nbpt:end) = ib;               yb(19:nbpt:end) = Q(4,:);   %  Q2 mid
xb(20:nbpt:end) = NaN;              yb(20:nbpt:end) = NaN;      %  skip to next box

% -- Plot the basic box
plot(xb,yb,'Linewidth',lineWidth);

% -- Add medians as thick lines
xm = zeros(n*3,1);  ym = xm;
xm(1:3:end) = ib - qwidth;   ym(1:3:end) = Q(3,:);
xm(2:3:end) = ib + qwidth;   ym(2:3:end) = Q(3,:);
xm(3:3:end) = NaN;           ym(3:3:end) = NaN;
hold('on');
plot(xm,ym,'Linewidth',2*lineWidth);

% -- Add outliers, if there are any
for j=1:size(Q,2)
  if any( Outliers{j} )
    nout = length(Outliers{j});
    plot(j*ones(nout,1),Outliers{j},'o');
  end
end
hold('off');