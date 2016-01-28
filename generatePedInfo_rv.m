% function ped_info = generatePedInfo_rv()
    ped_info = zeros(7, 100);

    x = [21.08772,19.31870,21.77925,20.81878,20.24228,19.48133,21.62899,52.15906,50.29829,52.94230];
    y = [35.62218,34.97598,31.85545,29.39045,29.34047,27.59524,23.55668,34.85670,32.75895,26.96788];
    z = [0,0,0,0,0,0,0,0,0,0];
    velocity = [1.5, 1.4, 1.6, 1.3, 1.3, 1.5, 1.5, 1.5, 1.4, 1.5];
    acceleration = [0.1,0,-0.1,0.1,0.1,0,0,0.1,0,0];
    heading = [270.30,90.23,89.97,269.19,269.53,269.20,268.95,89.43,270.24,257.81];
    %senderID = [1,2,3,4,5,6,7,8,9,10];
    plot(x(1,:),y(1,:),'rx',...
         'MarkerSize',10,'LineWidth',3);
    hold on;

    for i=1:10 %each vehicle
        for j=1:10 %each vehicle detect pedestrians
            x_rv = random('norm', x(1,j), 0.7);
            y_rv = random('norm', y(1,j), 0.7);
            z_rv = random('norm', z(1,j), 0.5);
            velocity_rv = random('norm', velocity(1,j), 0.5);
            acceleration_rv = random('norm', acceleration(1,j), 0.5);
            heading_rv = random('norm', heading(1,j), 0.5);
            %You can generate a vector or matrix of random numbers from a variety of distributions
            %using the "random" function. Different distributions take different parameters in the call,
            %but the x = random('norm', mu, std); call it has a mean of mu and standard deviation of std.
            %So, x = random('norm', 0, 2.5) gives a random number from a population with a mean of zero
            %and std of 2.5. Additional parameters determine the size of x,
            %e.g., x = random('norm', 0, 2.5, 10 , 10); gives a 10 by 10 matrix.

            pedID = (i-1)*10 + j;
            % pedestrian ID:
            %  --           --
            % | 1  11 ... 91  |
            % | 2  12     92  |
            % | 3  13     93  |
            % | .  .      .   |
            % | .  .      .   |
            % | 10 20 ... 100 |
            %  --           --
            ped_info(1, pedID) = x_rv;
            ped_info(2, pedID) = y_rv;
            ped_info(3, pedID) = z_rv;
            ped_info(4, pedID) = velocity_rv;
            ped_info(5, pedID) = acceleration_rv;
            ped_info(6, pedID) = heading_rv;
            ped_info(7, pedID) = i; % vehicle ID
        end
    end
    ped_array = transpose(ped_info);
    ped_array_noID = ped_array(:,1:6);
    scatter3(ped_array(1:100,1), ped_array(1:100,2), ped_array(1:100,6), 'ob');
    hold on
    %kmedoids start
    [idx1,C1] = kmedoids(ped_array_noID,10);
    C1 = transpose(C1);
    plot(C1(1,:),C1(2,:),'kx',...
         'MarkerSize',15,'LineWidth',3);
    hold off;
    
% end