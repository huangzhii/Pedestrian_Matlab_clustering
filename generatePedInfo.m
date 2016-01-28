function ped_info = generatePedInfo()
ped_info = zeros(13, 100);
velocity = [1.5, 1.6, 1.2, 1.4, 1.0, 1.5, 1.3, 1.5, 1.4, 2.0];
heading = [90,90,90,90,90,90,90,270,270,270];
heading = [90,80,50,20,10,40,50,110,270,200];
acceleration = [0,0,0,0,0,0,0,0,0.1,-0.1];
range = [5.5,4,5.2,5,4.7,5.8,4.1,5.3,6,5.9];
theta = [316,312,313,314,317,309,305,45,40,48];
drotz = [0,0,0,0,0,0,0,0,0,0];
ped_dx = zeros(10,1);
ped_dy = zeros(10,1);
for i=1:10
    theta(i) = theta(i) * pi/180;
    ped_dx(i) = sin(theta(i))*range(i);
    ped_dy(i) = cos(theta(i))*range(i);
end
ped_dz = [0,0,0,0,0,0,0,0,0,0];

for i=1:100
    errorSize = 0.1; % if error = 0.1, random error will be 0.05
    random_error1 = (rand(1,1)-0.5) * errorSize; % random error
    random_error2 = (rand(1,1)-0.5) * errorSize; % random error
    random_error3 = (rand(1,1)-0.5) * errorSize; % random error
    random_error4 = (rand(1,1)-0.5) * errorSize; % random error
    random_error5 = (rand(1,1)-0.5) * pi/180 * 5; % random angle error: +-5
    random_error6 = (rand(1,1)-0.5) * errorSize; % random error
    random_error7 = (rand(1,1)-0.5) * errorSize; % random error
    
    pedID = floor((i-1)/10) + 1; % pedestrian ID: 1 ~ 10. For example, 10->1, 100->10
    ped_info(1,i) = pedID;
    ped_info(2,i) = 1; %Pedestrian type
    ped_info(3,i) = 1; % size
    ped_info(4,i) = 1; % color
    
    ped_info(5,i) = velocity(pedID) * (1 + random_error1);
    ped_info(6,i) = heading(pedID) * (1 + random_error2);
    ped_info(7,i) = acceleration(pedID) * (1 + random_error3);
    cur_range = range(pedID) * (1 + random_error4);
    cur_theta = theta(pedID) + random_error5;
    ped_info(8,i) = cur_range;
    ped_info(9,i) = cur_theta;
    ped_info(10,i) = drotz(pedID) * (1 + random_error6);
    ped_info(11,i) = sin(cur_theta) * cur_range;
    ped_info(12,i) = cos(cur_theta) * cur_range;
    ped_info(13,i) = ped_dz(pedID) * (1 + random_error7);
end
end