CC(1,:)=C(1,:);

figure
for i = 1:length(CC)
    title(' total peak point')
    plot(corr1(1, C(1,i)),'-bo')
    text(real(corr1(1, C(1,i))),imag(corr1(1, C(1,i))), num2str(i))
    xlim=[-100 100]
    grid on
    hold on
end

CC2=nonzeros(CC);
CC2=transpose(CC2); 

%% 각도 찾기
% CC5 : channel 1의 3번째 peak point, CC4 : 2번째 peak point, CC3 : 1번째 peak point
for i=1:length(CC2)
    x=real(corr1(1, CC2(1,i)));
    y=imag(corr1(1, CC2(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc5(1,i)=rad2deg(angle);
end

for i = 1:37
    arc55(1,i)=corr1(1,CC2(1,i))*exp(-1i*pi*abs(arc5(1,i))/180); 
    arc55(1,i+1)=corr1(1,CC2(1,i+1))*exp(-1i*pi*abs(arc5(1,i))/180); 
    
    arc55a(1,i)=atan2(imag(arc55(1,i)), real(arc55(1,i)));
    arc55a(1,i)=rad2deg(arc55a(1,i));
    
    arc55a(1,i+1)=atan2(imag(arc55(1,i+1)), real(arc55(1,i+1)));
    arc55a(1,i+1)=rad2deg(arc55a(1,i+1));
    
    cha(1,i)=arc55a(1,i+1)-arc55a(1,i);
    if abs(cha(1,i)) > 200
        cha(1,i)=-360+abs(cha(1,i))
    end
end

ha1=0;
for i=1:19
    if cha(1,i)>0
        cha(1,i)=cha(1,i)-360;
    end
    ha1=ha1+cha(1,i);
end
ha1=ha1/19;

ha2=0;
for i=21:37
    ha2=ha2+cha(1,i);
end
ha2=ha2/17;

change_corr1(1,:)=corr1(1,CC2(1,:));
change_corr12(1,:)=corr1(1,CC2(1,:));

total_cha=0;
for i=1:19
    total_cha=0;
    for jj=1:i
        total_cha=cha(1,i)+total_cha;
    end
    change_corr1(1,i+1)=corr1(1,CC2(1,i+1))*exp(1i*pi*abs(total_cha)/180);
end

for i=21:37
    total_cha=0;
    for jj=21:i
        total_cha=cha(1,i)+total_cha;
    end
    change_corr1(1,i+1)=corr1(1,CC2(1,i+1))*exp(1i*pi*abs(total_cha)/180);
end

%%
for i=1:19
    change_corr12(1,i+1)=corr1(1,CC2(1,i+1))*exp(1i*pi*abs(ha1*i)/180);
end

for i=21:37
    change_corr12(1,i+1)=corr1(1,CC2(1,i+1))*exp(1i*pi*abs(ha2*(i-20))/180);
end
%%

figure
for i = 1:20
    title(' total peak point')
    plot(change_corr12(1,i),'-ro')
    hold on
 
    text(real(change_corr12(1, i)),imag(change_corr12(1, i)), num2str(i));
   
    axis([-600 600 -600 600])
    legend('first')
    grid on
    hold on
end 

figure
for i = 1:18

    plot(change_corr12(1,20+i),'-bo')
  
    text(real(change_corr12(1, i+20)),imag(change_corr12(1, i+20)), num2str(i));
    axis([-600 600 -600 600])
    legend('second')
    grid on
    hold on
end 
%}

average=(ha1+ha2)/2