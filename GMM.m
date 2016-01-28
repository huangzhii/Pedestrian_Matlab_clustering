MU1 = [1 2];
SIGMA1 = [2 0; 0 .5];
MU2 = [-3 -5];
SIGMA2 = [1 0; 0 1];
X = [mvnrnd(MU1,SIGMA1,1000);mvnrnd(MU2,SIGMA2,1000)];

scatter(X(:,1),X(:,2),10,'.')
hold on
options = statset('Display','final');
obj = fitgmdist(X,2,'Options',options);
h = ezcontour(@(x,y)pdf(obj,[x y]),[-8 6],[-8 6]);