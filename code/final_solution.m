%2번 보정 된 값 : change_corr11
% kim heeseo

%% 2번 보정 된 후의 channel 1의 각도
for i=1:length(CC3)
    x=real(change_corr11(1, CC3(1,i)));
    y=imag(change_corr11(1, CC3(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc3w(1,i)=rad2deg(angle);
    
    x=real(change_corr11(1, CC4(1,i)));
    y=imag(change_corr11(1, CC4(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc4w(1,i)=rad2deg(angle);
    
    x=real(change_corr11(1, CC5(1,i)));
    y=imag(change_corr11(1, CC5(1,i)));
    angle=atan2(y,x);
    angle5(1,i)=angle;
    arc5w(1,i)=rad2deg(angle);
end

%% 2번 보정 된 후의 channel 3의 각도
for i=1:length(CC3)
    x=real(change_corr11(1, CC3q(1,i)));
    y=imag(change_corr11(1, CC3q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc3wq(1,i)=rad2deg(angle);
    
    x=real(change_corr11(1, CC4q(1,i)));
    y=imag(change_corr11(1, CC4q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc4wq(1,i)=rad2deg(angle);
    
    x=real(change_corr11(1, CC5q(1,i)));
    y=imag(change_corr11(1, CC5q(1,i)));
    angle=atan2(y,x);
    angle5(1,i)=angle;
    arc5wq(1,i)=rad2deg(angle);
end

%% channel 1, 3의 first point phase 차이
sum2=arc3w(1,:)+arc4w(1,:)+arc5w(1,:)+arc3wq(1,:)+arc4wq(1,:)+arc5wq(1,:);
sum3(1,1)=sum2(1,1);
for i = 2:length(sum2)
    sum3(1,1)=sum2(1,i)+sum3(1,1);
end
average=sum3/(16*6); % average value : channel 1, 3의 peak point(degree값)

average2=deg2rad(average); % average2값은 rad값

for i=1:length(arc5w)
    %channel 3
    arc3wqq(1,i)=average-arc3wq(1,i); %degree
    arc4wqq(1,i)=average-arc4wq(1,i);
    arc5wqq(1,i)=average-arc5wq(1,i);

    %channel 1 
    arc3wqqq(1,i)=average-arc3w(1,i);
    arc4wqqq(1,i)=average-arc4w(1,i);
    arc5wqqq(1,i)=average-arc5w(1,i);
end

change_corr111(1,:)=change_corr11(1,:);
%% change phase
for ii=1:length(arc5w)
    %channel 1 
    arc3wqqqw(1,ii)=deg2rad(arc3wqqq(1,ii));
    arc4wqqqw(1,ii)=deg2rad(arc4wqqq(1,ii));
    arc5wqqqw(1,ii)=deg2rad(arc5wqqq(1,ii));

    arc3wqqw(1,ii)=deg2rad(arc3wqq(1,ii));
    arc4wqqw(1,ii)=deg2rad(arc4wqq(1,ii));
    arc5wqqw(1,ii)=deg2rad(arc5wqq(1,ii));

    mean5a=pi/(arc3wqqq(1,ii));
    mean5a=rad2deg(mean5a);
    change_corr111(1,CC3(1,ii))=change_corr11(1, CC3(1,ii))*exp(1i*(pi)/mean5a);

    mean5a=pi/(arc4wqqq(1,ii));
    mean5a=rad2deg(mean5a);
    change_corr111(1,CC4(1,ii))=change_corr11(1, CC4(1,ii))*exp(1i*(pi)/mean5a);

    mean5a=pi/(arc5wqqq(1,ii));
    mean5a=rad2deg(mean5a);
    change_corr111(1,CC5(1,ii))=change_corr11(1, CC5(1,ii))*exp(1i*(pi)/mean5a);

%channel 3
   mean5a=pi/(arc3wqq(1,ii));
   mean5a=rad2deg(mean5a);
   change_corr111(1,CC3q(1,ii))=change_corr11(1, CC3q(1,ii))*exp(1i*(pi)/mean5a);

   mean5a=pi/(arc4wqq(1,ii));
   mean5a=rad2deg(mean5a);
   change_corr111(1,CC4q(1,ii))=change_corr11(1, CC4q(1,ii))*exp(1i*(pi)/mean5a);

   mean5a=pi/(arc5wqq(1,ii));
   mean5a=rad2deg(mean5a);
   change_corr111(1,CC5q(1,ii))=change_corr11(1, CC5q(1,ii))*exp(1i*(pi)/mean5a);

end


figure
for i = 1: length(CC3q)
    title('channel 3 - second peak point')
    plot(change_corr111(1, CC4q(1,i)),'-ro')
    plot(change_corr11(1, CC4q(1,i)),'-bo')
    title('changed phase version (channel 3)')
    xlim([-130 130]);
    ylim([-130 130]);

    x = linspace(-130,130,2);
    y=average2*x;
    plot(x,y);

    legend('sfhit before','shift after')
    grid on
    hold on
end

figure
for i = 1: length(CC3q)
    title('channel 3 - third peak point')
    plot(change_corr111(1, CC5q(1,i)),'-ro')
    plot(change_corr11(1, CC5q(1,i)),'-bo')
    title('changed phase version (channel 3)')
    xlim([-130 130]);
    ylim([-130 130]);

    x = linspace(-130,130,2);
    y=average2*x;
    plot(x,y);

    legend('sfhit before','shift after')
    grid on
    hold on
end

figure
for i = 1: length(CC3q)
    title('channel 3 - first peak point')
    plot(change_corr111(1, CC3q(1,i)),'-ro')
    plot(change_corr11(1, CC3q(1,i)),'-bo')
    title('changed phase version (channel 3)')
    xlim([-130 130]);
    ylim([-130 130]);

    x = linspace(-130,130,2);
    y=average2*x;
    plot(x,y);

    legend('sfhit before','shift after')
    grid on
    hold on
end

figure
for i = 1: length(CC3q)
    title('channel 3 - peak point')
    plot(change_corr111(1, CC3q(1,i)),'-ro')
    hold on
    plot(change_corr111(1, CC4q(1,i)),'-bo')
    hold on
    plot(change_corr111(1, CC5q(1,i)),'-ko')
    hold on

    x = linspace(-130,130,2);
    y=average2*x;
    plot(x,y);
    legend('first','second','third')
    grid on
    hold on
end

figure
for i = 1: length(CC3q)
    title('channel 1 - peak point')
    plot(change_corr111(1, CC3(1,i)),'-ro')
    hold on
    
    plot(change_corr111(1, CC4(1,i)),'-bo')
    hold on
    plot(change_corr111(1, CC5(1,i)),'-ko')
    hold on
    
    x = linspace(-130,130,2);
    y=average2*x;
    plot(x,y);

    legend('first','second','third')
    grid on
    hold on
end

figure
for i = 1: length(CC3q)
    title('total value')
    plot(change_corr111(1, CC3(1,i)),'-ro')
    plot(change_corr111(1, CC4(1,i)),'-bo')
    plot(change_corr111(1, CC5(1,i)),'-ko')
    
    plot(change_corr111(1, CC3q(1,i)),'-co')
    plot(change_corr111(1, CC4q(1,i)),'-go')
    plot(change_corr111(1, CC5q(1,i)),'-mo')

    x = linspace(-130,130,2);
    y=average2*x;
    plot(x,y);

    grid on
    hold on
end
