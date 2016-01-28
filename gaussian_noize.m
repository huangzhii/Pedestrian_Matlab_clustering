lat_rv = zeros(1,100)
lon_rv = zeros(1,100)
for i=1:100
    lat_rv(1,i) = random('norm', 0, 0.12)
    lon_rv(1,i) = random('norm', 0, 0.12)
end

% plot(lat_rv(1,1:100),lon_rv(1,1:100),'k.','MarkerSize',5);
% hold on

x = [21.08772,19.31870,21.77925,20.81878,20.24228,19.48133,21.62899,52.15906,50.29829,52.94230];
y = [35.62218,34.97598,31.85545,29.39045,29.34047,27.59524,23.55668,34.85670,32.75895,26.96788];
plot(x(1,1:10),y(1,1:10),'ro','MarkerSize',5);
hold on
lat_rv = zeros(1,100)
lon_rv = zeros(1,100)
for i=1:10
    for j = 1:10
    lat_rv(1,(i-1)*10+j) = random('norm', x(1,i), 0.5)
    lon_rv(1,(i-1)*10+j) = random('norm', y(1,i), 0.5)
    end
end
plot(lat_rv(1,1:100),lon_rv(1,1:100),'k*','MarkerSize',5);
hold off
