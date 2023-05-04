%1,2,3/4,5,6
CCq(1,:)=C(1,:);
for i=1:length(C)
    if rem(i,6) == 1 | rem(i,6) == 2 | rem(i,6) == 3
        CCq(1,i)=0;
    end
end

CC2q=nonzeros(CCq);
CC2q=transpose(CC2q); 
%CC2가 1*48인 이유는 channel1, 3

CC3q(1,:)=CC2q(1,:);

%% channel 3의 first peak point
for i=1:length(C)
    if rem(i,3) == 2 | rem(i,3) == 0
        CC3q(1,i)=0;
    end
end
CC3q=nonzeros(CC3q);
CC3q=transpose(CC3q);
%CC3이 1*16인 이유는 channel 1의 3개의
%peak point에서 1번째 peak point를 추출하기 위해서

figure
for i = 1: length(CC3q)
    title('channel 3 - first peak point 값')
    plot(corr1(1, CC3q(1,i)),'-bo')
    title('channel 3 - first peak point 값')
    text(real(corr1(1, CC3q(1,i))),imag(corr1(1, CC3q(1,i))), num2str(i))
    hold on
end

%% channel 3의 second peak point
CC4q(1,:)=CC2q(1,:);
for i=1:length(C)
    if rem(i,3) == 1 | rem(i,3) == 0
        CC4q(1,i)=0;
    end
end
CC4q=nonzeros(CC4q);
CC4q=transpose(CC4q);

figure
for i = 1: length(CC4q)
    title('channel 3 - second peak point 값')
    plot(corr1(1, CC4q(1,i)),'-ro')
    text(real(corr1(1, CC4q(1,i))),imag(corr1(1, CC4q(1,i))), num2str(i))
    hold on
end

%% channel 3의 third peak point
CC5q(1,:)=CC2q(1,:);
for i=1:length(C)
    if rem(i,3) == 2 | rem(i,3) == 1
        CC5q(1,i)=0;
    end
end
CC5q=nonzeros(CC5q);
CC5q=transpose(CC5q);

figure
for i = 1: length(CC5q)
    title('channel 3 - thrid peak point 값')
    plot(corr1(1, CC5q(1,i)),'-bo')
    text(real(corr1(1, CC5q(1,i))),imag(corr1(1, CC5q(1,i))), num2str(i))
    hold on
end

%% arc5a, arc5b
% 각각의 peak point들의 phase 변화도 파악
for i=1:length(CC5q)
    x=real(corr1(1, CC5q(1,i)));
    y=imag(corr1(1, CC5q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc5q(1,i)=rad2deg(angle);
    
    if arc5q(1,i)<0
        arc5q(1,i)=arc5q(1,i)+360;
    end
end

for i=1:length(CC5q)-1
    cha5q(1,i)=abs(arc5q(1,i+1)-arc5q(1,i));
end

%위상차 평균
mean5q=mean(cha5q);

%% change phase
for ii=2:length(CC5q)
    if mean5q<90
        change_corr1(1,CC5q(1,ii))=corr1(1, CC5q(1,ii))*exp(1i*(ii-1)*(pi)*mean5q/180);
    end

    if mean5q>90
        change_corr1(1,CC5q(1,ii))=corr1(1, CC5q(1,ii))*exp(-1i*(ii-1)*(pi)*mean5q/180);
    end
end

for i=1:length(CC5q)
    x=real(change_corr1(1, CC5q(1,i)));
    y=imag(change_corr1(1, CC5q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc55q(1,i)=rad2deg(angle);

    if arc55q(1,i)<0
       arc55q(1,i)=arc55q(1,i)+360; 
    end
end

if arc55q(1,1)<135
    harry=135-arc55q(1,1);
    arc55q(1,:)=arc55q+harry;
end

for i = 1:length(arc55q)
    if arc55q(1,i)>360
        arc55q(1,i)=arc55q(1,i)-360;
    end
end

for i=1:length(CC5q)-1
    cha55q(1,i)=abs(arc55q(1,i+1)-arc55q(1,i));
end

%위상차 평균
mean55q=mean(cha55q);

%% change phase
for ii=2:length(CC5q)
    if mean55q<90
        change_corr11(1,CC5q(1,ii))=change_corr1(1, CC5q(1,ii))*exp(1i*(ii-1)*(pi)*mean55q/180);
    end

    if mean55q>90
        change_corr11(1,CC5q(1,ii))=change_corr1(1, CC5q(1,ii))*exp(-1i*(ii-1)*(pi)*mean55q/180);
    end    
end

figure
for i = 1: length(CC5q)
    %title(j+1,'번째')
    plot(change_corr1(1, CC5q(1,i)),'-ro')
    plot(change_corr11(1, CC5q(1,i)),'-bo')
    plot(corr1(1, CC5q(1,i)),'-ko')

    text(real(change_corr1(1, CC5q(1,i))),imag(change_corr1(1, CC5q(1,i))), num2str(i))  
    text(real(change_corr11(1, CC5q(1,i))),imag(change_corr11(1, CC5q(1,i))), num2str(i))
    text(real(corr1(1, CC5q(1,i))),imag(corr1(1, CC5q(1,i))), num2str(i))  
    
    legend('before solution','first solution','second solution')
    title('channel 3-third point')
    grid on    
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

figure
for i = 1: length(CC5q)
    %title(j+1,'번째')
    plot(corr1(1, CC5q(1,i)),'-ko')
    text(real(corr1(1, CC5q(1,i))),imag(corr1(1, CC5q(1,i))), num2str(i))  
    title('before solution')
    grid on    
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

%% arc4a, arc4b
for i=1:length(CC4q)
    x=real(corr1(1, CC4q(1,i)));
    y=imag(corr1(1, CC4q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc4q(1,i)=rad2deg(angle);
    if arc4q(1,i)<0
        arc4q(1,i)=arc4q(1,i)+360;
    end
end

for i=1:length(CC4q)-1
    cha4q(1,i)=abs(arc4q(1,i+1)-arc4q(1,i));
end

%위상차 평균
mean4q=mean(cha4q);

%% change phase
for ii=2:length(CC4q)
    if mean4q < 90
        change_corr1(1,CC4q(1,ii))=corr1(1, CC4q(1,ii))*exp(1i*(ii-1)*(pi)*mean4q/180);
    end
    if mean4q > 90
        change_corr1(1,CC4q(1,ii))=corr1(1, CC4q(1,ii))*exp(-1i*(ii-1)*(pi)*mean4q/180);
    end
end

for i=1:length(CC4q)
    x=real(change_corr1(1, CC4q(1,i)));
    y=imag(change_corr1(1, CC4q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc44q(1,i)=rad2deg(angle);
    if arc44q(1,i) <0
        arc44q(1,i)=arc44q(1,i)+360;
    end
end

if arc44q(1,1)<135
    harry=135-arc44q(1,1);
    arc44q(1,:)=arc44q+harry;
end

for i=1:length(arc44q)
    if arc44q(1,i)>360
        arc44q(1,i)=arc44q(1,i)-360;
    end
end

for i=1:length(CC4q)-1
    cha44q(1,i)=abs(arc44q(1,i+1)-arc44q(1,i));
end

%위상차 평균
mean44q=mean(cha44q);

%% change phase
for ii=2:length(CC4q)
    if mean44q <90
        change_corr11(1,CC4q(1,ii))=change_corr1(1, CC4q(1,ii))*exp(1i*(ii-1)*(pi)*mean44q/180);
    end
    if mean44q >90
        change_corr11(1,CC4q(1,ii))=change_corr1(1, CC4q(1,ii))*exp(-1i*(ii-1)*(pi)*mean44q/180);
    end
end

figure
for i = 1: length(CC4q)
    %title(j+1,'번째')
    plot(change_corr1(1, CC4q(1,i)),'-ro')
    plot(change_corr11(1, CC4q(1,i)),'-bo')
    plot(corr1(1, CC4q(1,i)),'-ko')

    text(real(change_corr1(1, CC4q(1,i))),imag(change_corr1(1, CC4q(1,i))), num2str(i))  
    text(real(change_corr11(1, CC4q(1,i))),imag(change_corr11(1, CC4q(1,i))), num2str(i))
    text(real(corr1(1, CC4q(1,i))),imag(corr1(1, CC4q(1,i))), num2str(i))  
    
    legend('before solution','first solution','second solution')
    title('channel 3 - second point')
    grid on    
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

%% arc3a, arc3b
for i=1:length(CC3q)
    x=real(corr1(1, CC3q(1,i)));
    y=imag(corr1(1, CC3q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc3q(1,i)=rad2deg(angle);

    if arc3q(1,i)<0
        arc3q(1,i)=arc3q(1,i)+360;
    end    
end

for i=1:length(CC3q)-1
    cha3q(1,i)=abs(arc3q(1,i+1)-arc3q(1,i));
end

%위상차 평균
mean3q=mean(cha3q);

%% change phase
for ii=2:length(CC3q)
    if mean3q<90
        change_corr1(1,CC3q(1,ii))=corr1(1, CC3q(1,ii))*exp(1i*(ii-1)*(pi)*mean3q/180);
    end
    if mean3q>90
        change_corr1(1,CC3q(1,ii))=corr1(1, CC3q(1,ii))*exp(-1i*(ii-1)*(pi)*mean3q/180);
    end   
end

for i=1:length(CC3q)
    x=real(change_corr1(1, CC3q(1,i)));
    y=imag(change_corr1(1, CC3q(1,i)));
    angle=atan2(y,x);
    angle2(1,i)=angle;
    arc33q(1,i)=rad2deg(angle);

    if arc33q(1,i)<0
        arc33q(1,i)=arc33q(1,i)+360;
    end
end

for i=1:length(CC3q)-1
    cha33q(1,i)=abs(arc33q(1,i+1)-arc33q(1,i));
end

%위상차 평균
mean33q=mean(cha33q);

%% change phase
for ii=2:length(CC3q)
    if mean33q<90
        change_corr11(1,CC3q(1,ii))=change_corr1(1, CC3q(1,ii))*exp(1i*(ii-1)*(pi)*mean33q/180);
    end
    if mean33q>90
        change_corr11(1,CC3q(1,ii))=change_corr1(1, CC3q(1,ii))*exp(-1i*(ii-1)*(pi)*mean33q/180);
    end    
end

figure
for i = 1: length(CC3q)
    %title(j+1,'번째')
    plot(change_corr1(1, CC3q(1,i)),'-ro')
    plot(change_corr11(1, CC3q(1,i)),'-bo')
    plot(corr1(1, CC3q(1,i)),'-ko')

    text(real(change_corr1(1, CC3q(1,i))),imag(change_corr1(1, CC3q(1,i))), num2str(i))  
    text(real(change_corr11(1, CC3q(1,i))),imag(change_corr11(1, CC3q(1,i))), num2str(i))
    text(real(corr1(1, CC3q(1,i))),imag(corr1(1, CC3q(1,i))), num2str(i))  
    
    legend('before solution','first solution','second solution')
    title('channel 3 - first point')
    grid on
    xlim([-130, 130]);
    ylim([-130, 130]);
    hold on
end

%% 전체 중 channel 3 변화

figure
for i = 1: length(CC2q)
    plot(change_corr11(1, CC2q(1,i)),'-o')
    title('changed phase version (channel 3)')
    xlim([-130, 130]);
    ylim([-130, 130]);
    grid on
    hold on
end

%% total

figure
for i = 1: length(C)
    plot(change_corr11(1, C(1,i)),'-o')
    title('total value')
    xlim([-130, 130]);
    ylim([-130, 130]);
    grid on
    hold on
end

