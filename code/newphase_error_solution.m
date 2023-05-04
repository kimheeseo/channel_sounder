figure
for i = 1: length(C)
    title('peak point 찍은 값')
    plot(corr1(1, C(1,i)),'-o')
    
    hold on
end
%C값 1x96인 이유 : 16번 보내는 데, 1번 중 orginal의 channel1과 channel3의 값이 합쳐져서 보내도록 설정하였고,
% 각 채널마다 3개의 peak point가 출력되어서 1번에 6개의 corrleation peak값 추출되니까.

%1,2,3/4,5,6
CC(1,:)=C(1,:);
for i=1:length(C)
    if rem(i,6) == 4 | rem(i,6) == 5 | rem(i,6) == 0
        CC(1,i)=0;
    end
end

CC2=nonzeros(CC);
CC2=transpose(CC2); 
%CC2가 1*48인 이유는 channel1, 3

CC3(1,:)=CC2(1,:);

%% channel 1의 first peak point
for i=1:length(C)
    if rem(i,3) == 2 | rem(i,3) == 0
        CC3(1,i)=0;
    end
end
CC3=nonzeros(CC3);
CC3=transpose(CC3);
%CC3이 1*16인 이유는 channel 1의 3개의
%peak point에서 1번째 peak point를 추출하기 위해서

figure
for i = 1: length(CC3)
    title('channel 1 - first peak point')
    plot(corr1(1, CC3(1,i)),'-bo')
    text(real(corr1(1, CC3(1,i))),imag(corr1(1, CC3(1,i))), num2str(i))
    hold on
end

%% channel 1의 second peak point
CC4(1,:)=CC2(1,:);
for i=1:length(C)
    if rem(i,3) == 1 | rem(i,3) == 0
        CC4(1,i)=0;
    end
end
CC4=nonzeros(CC4);
CC4=transpose(CC4);

figure
for i = 1: length(CC4)
    title('channel 1 - second peak point')
    plot(corr1(1, CC4(1,i)),'-bo')
    text(real(corr1(1, CC4(1,i))),imag(corr1(1, CC4(1,i))), num2str(i))
    hold on
end

%% channel 1의 third peak point
CC5(1,:)=CC2(1,:);
for i=1:length(C)
    if rem(i,3) == 2 | rem(i,3) == 1
        CC5(1,i)=0;
    end
end
CC5=nonzeros(CC5);
CC5=transpose(CC5);

figure
for i = 1: length(CC5)
    title('channel 1 - third peak point')
    plot(corr1(1, CC5(1,i)),'-bo')
    text(real(corr1(1, CC5(1,i))),imag(corr1(1, CC5(1,i))), num2str(i))
    hold on
end

%% arc5a, arc5b
% 각각의 peak point들의 phase 변화도 파악
for i=1:length(CC5)
    x=real(corr1(1, CC5(1,i)));
    y=imag(corr1(1, CC5(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc5(1,i)=rad2deg(angle);
    if arc5(1,i)<0
        arc5(1,i)=arc5(1,i)+360;
    end
end

for i=1:length(CC5)-1
    cha5(1,i)=abs(arc5(1,i+1)-arc5(1,i));
end

%위상차 평균
mean5=mean(cha5);

change_corr1(1,:)=corr1(1,:);
change_corr11(1,:)=corr1(1,:);
%% change phase
for ii=2:length(CC5)
    change_corr1(1,CC5(1,ii))=corr1(1, CC5(1,ii))*exp(-1i*(ii-1)*pi*mean5/180);
end

for i=1:length(CC5)
    x=real(change_corr1(1, CC5(1,i)));
    y=imag(change_corr1(1, CC5(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc55(1,i)=rad2deg(angle);
    if arc55(1,i)<0
        arc55(1,i)=arc55(1,i)+360;
    end
end

for i=1:length(CC5)-1
    cha55(1,i)=abs(arc55(1,i+1)-arc55(1,i));
end

%위상차 평균
%cha55=abs(cha55);
mean55=mean(cha55);
%mean55=pi/mean55;
%mean55=rad2deg(mean55);

%% change phase
for ii=2:length(CC5)
    if mean55 <90
        change_corr11(1,CC5(1,ii))=change_corr1(1, CC5(1,ii))*exp(1i*(ii-1)*pi*mean55/180);
    end

    if mean55 >90
        change_corr11(1,CC5(1,ii))=change_corr1(1, CC5(1,ii))*exp(-1i*(ii-1)*pi*mean55/180);
    end    

end

figure
for i = 1: length(CC5)
    %title(j+1,'번째')
    plot(change_corr1(1, CC5(1,i)),'-ro')
    plot(change_corr11(1, CC5(1,i)),'-bo')
    plot(corr1(1, CC5(1,i)),'-ko')

    text(real(change_corr1(1, CC5(1,i))),imag(change_corr1(1, CC5(1,i))), num2str(i))  
    text(real(change_corr11(1, CC5(1,i))),imag(change_corr11(1, CC5(1,i))), num2str(i))
    text(real(corr1(1, CC5(1,i))),imag(corr1(1, CC5(1,i))), num2str(i))  
    
    legend('before solution','first solution','second solution')
    title('channel 1-third point')
    grid on    
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

figure
for i = 1: length(CC5)
    %title(j+1,'번째')
    plot(corr1(1, CC5(1,i)),'-ko')
    text(real(corr1(1, CC5(1,i))),imag(corr1(1, CC5(1,i))), num2str(i))  
    title('before solution')
    grid on    
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

%% arc4a, arc4b
for i=1:length(CC4)
    x=real(corr1(1, CC4(1,i)));
    y=imag(corr1(1, CC4(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc4(1,i)=rad2deg(angle);
    if arc4(1,i)<0
        arc4(1,i)=arc4(1,i)+360;
    end
end

for i=1:length(CC4)-1
    cha4(1,i)=abs(arc4(1,i+1)-arc4(1,i));
end

%위상차 평균
%cha55=abs(cha55);
mean4=mean(cha4);
%mean55=pi/mean55;
%mean55=rad2deg(mean55);

%% change phase
for ii=2:length(CC4)
    if mean4 <90
        change_corr1(1,CC4(1,ii))=corr1(1, CC4(1,ii))*exp(1i*(ii-1)*(pi)*mean4/180);
    end
    if mean4 >90
        change_corr1(1,CC4(1,ii))=corr1(1, CC4(1,ii))*exp(-1i*(ii-1)*(pi)*mean4/180);
    end
end

for i=1:length(CC4)
    x=real(change_corr1(1, CC4(1,i)));
    y=imag(change_corr1(1, CC4(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc44(1,i)=rad2deg(angle);
    if arc44(1,i)<0
        arc44(1,i)=arc44(1,i)+360;
    end
end

for i=1:length(CC4)-1
    cha44(1,i)=abs(arc44(1,i+1)-arc44(1,i));
end

%위상차 평균
%cha55=abs(cha55);
mean44=mean(cha44);
%mean55=pi/mean55;
%mean55=rad2deg(mean55);

%% change phase
for ii=2:length(CC4)
    if mean44 >90
        change_corr11(1,CC4(1,ii))=change_corr1(1, CC4(1,ii))*exp(-1i*(ii-1)*(pi)*mean44/180);
    end

    if mean44 <90
        change_corr11(1,CC4(1,ii))=change_corr1(1, CC4(1,ii))*exp(1i*(ii-1)*(pi)*mean44/180);
    end    
end

figure
for i = 1: length(CC4)
    %title(j+1,'번째')
    plot(change_corr1(1, CC4(1,i)),'-ro')
    plot(change_corr11(1, CC4(1,i)),'-bo')
    plot(corr1(1, CC4(1,i)),'-ko')

    text(real(change_corr1(1, CC4(1,i))),imag(change_corr1(1, CC4(1,i))), num2str(i))  
    text(real(change_corr11(1, CC4(1,i))),imag(change_corr11(1, CC4(1,i))), num2str(i))
    text(real(corr1(1, CC4(1,i))),imag(corr1(1, CC4(1,i))), num2str(i))  
    
    legend('before solution','first solution','second solution')
    title('channel 1 - second point')
    grid on    
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

%% arc3a, arc3b
for i=1:length(CC3)
    x=real(corr1(1, CC3(1,i)));
    y=imag(corr1(1, CC3(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc3(1,i)=rad2deg(angle);
    if arc3(1,i)<0
        arc3(1,i)=arc3(1,i)+360;
    end
end

for i=1:length(CC3)-1
    cha3(1,i)=abs(arc3(1,i+1)-arc3(1,i));
end

%위상차 평균
%cha55=abs(cha55);
mean3=mean(cha3);
%mean55=pi/mean55;
%mean55=rad2deg(mean55);

%% change phase
for ii=2:length(CC3)
    if mean3<90
        change_corr1(1,CC3(1,ii))=corr1(1, CC3(1,ii))*exp(1i*(ii-1)*(pi)*mean3/180);
    end

    if mean3>90
        change_corr1(1,CC3(1,ii))=corr1(1, CC3(1,ii))*exp(-1i*(ii-1)*(pi)*mean3/180);
    end    

end

for i=1:length(CC3)
    x=real(change_corr1(1, CC3(1,i)));
    y=imag(change_corr1(1, CC3(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc33(1,i)=rad2deg(angle);
    if arc33(1,i)<0
        arc33(1,i)=arc33(1,i)+360;
    end
end

for i=1:length(CC3)-1
    cha33(1,i)=abs(arc33(1,i+1)-arc33(1,i));
end

%위상차 평균
%cha55=abs(cha55);
mean33=mean(cha33);
%mean55=pi/mean55;
%mean55=rad2deg(mean55);

%% change phase
for ii=2:length(CC3)
    if mean33 > 90
        change_corr11(1,CC3(1,ii))=change_corr1(1, CC3(1,ii))*exp(-1i*(ii-1)*(pi)*mean33/180);
    end

    if mean33 < 90
        change_corr11(1,CC3(1,ii))=change_corr1(1, CC3(1,ii))*exp(1i*(ii-1)*(pi)*mean33/180);
    end    
end

figure
for i = 1: length(CC3)
    %title(j+1,'번째')
    plot(change_corr1(1, CC3(1,i)),'-ro')
    plot(change_corr11(1, CC3(1,i)),'-bo')
    plot(corr1(1, CC3(1,i)),'-ko')

    text(real(change_corr1(1, CC3(1,i))),imag(change_corr1(1, CC3(1,i))), num2str(i))  
    text(real(change_corr11(1, CC3(1,i))),imag(change_corr11(1, CC3(1,i))), num2str(i))
    text(real(corr1(1, CC3(1,i))),imag(corr1(1, CC3(1,i))), num2str(i))  
    
    legend('before solution','first solution','second solution')
    title('channel 1 - first point')
    grid on
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

%% 전체 중 channel 1 변화

figure
for i = 1: length(CC2)
    %title(j+1,'번째')
    plot(change_corr11(1, CC2(1,i)),'-o')
    title('changed phase version (channel 1)')
    xlim([-130, 130]);
    ylim([-130, 130]);
    grid on
    hold on
end

