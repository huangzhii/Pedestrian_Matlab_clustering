ped_info = generatePedInfo(); % Func generatePedInfo()
plot(ped_info(11,1:10),ped_info(12,1:10),'k.','MarkerSize',5);
hold on
plot(ped_info(11,11:20),ped_info(12,11:20),'m.','MarkerSize',5);
hold on
plot(ped_info(11,21:30),ped_info(12,21:30),'r.','MarkerSize',5);
hold on
plot(ped_info(11,31:40),ped_info(12,31:40),'b.','MarkerSize',5);
hold on
plot(ped_info(11,41:50),ped_info(12,41:50),'g.','MarkerSize',5);
hold on
plot(ped_info(11,51:60),ped_info(12,51:60),'ko','MarkerSize',5);
hold on
plot(ped_info(11,61:70),ped_info(12,61:70),'mo','MarkerSize',5);
hold on
plot(ped_info(11,71:80),ped_info(12,71:80),'ro','MarkerSize',5);
hold on
plot(ped_info(11,81:90),ped_info(12,81:90),'bo','MarkerSize',5);
hold on
plot(ped_info(11,91:100),ped_info(12,91:100),'go','MarkerSize',5);
axis([-10,10,0,6]);
hold on
title 'Pedestrians';
xlabel 'road x (m)';
ylabel 'road y (m)';


%kmeans start
[idx,C] = kmeans(transpose(ped_info),10);
% idx is a vector of predicted cluster indices corrresponding to the observations in ped_info.
% C is a 10-by-params matrix containing the final centroid locations.
C = transpose(C);
plot(C(11,:),C(12,:),'kx',...
     'MarkerSize',15,'LineWidth',3);
hold off
