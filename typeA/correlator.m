clear all
clc
load('1.mat')
data_in=data;
RANGE=0.1;
data_type=1;

MSEQ_LENGTH =2^12-1;
RX_NSAMP = 10;
SAMPLING_RATE = 200;
IF = 70;
% delta = MSEQ_LENGTH*RX_NSAMP;
ROLLOFF = 0.35;
GROUP_DELAY = 1;
while(norm(rcosfir(ROLLOFF,[-GROUP_DELAY GROUP_DELAY],RX_NSAMP,1,'sqrt')')^2 < 0.9999)
    GROUP_DELAY = GROUP_DELAY + 1;
end

PATTERN_LENGTH = length(data_in(1,:));

switch data_type
    case 0 % raw dataj
        % Convert raw data to voltage
        DATA = (1-data_in/16)/2048*RANGE;
    case 1 % voltage 
        DATA = data_in;
end

% AC coupling
DATA = DATA - mean(DATA,2)*ones(1,PATTERN_LENGTH);

% IF downconversion
n = [1:PATTERN_LENGTH];
DATA_base = DATA.*(ones(4,1)*exp(j*2*pi*(IF)/SAMPLING_RATE*n));

% Correlation ( MSEQ with  one period) 
MSEQ = mseq(2,log2(MSEQ_LENGTH+1))';
pilot1 = MSEQ;
pilot3 = [MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ MSEQ];

% upsampling
pilot1_up = zeros(1, MSEQ_LENGTH*RX_NSAMP);
pilot1_up(1:RX_NSAMP:RX_NSAMP*MSEQ_LENGTH) = pilot1;
pilot3_up = zeros(1, 20*MSEQ_LENGTH*RX_NSAMP);
pilot3_up(1:RX_NSAMP:20*RX_NSAMP*MSEQ_LENGTH) = pilot3;

Rx_Filter = rcosfir(ROLLOFF,[-GROUP_DELAY GROUP_DELAY],RX_NSAMP,1,'sqrt')';
pilot1_filtered = fftconv(pilot1_up, Rx_Filter.');
pilot3_filtered = fftconv(pilot3_up, Rx_Filter.');

% sequence matched filtering
tic
corr1(1,:) = fftconv(DATA_base(1,:),fliplr(pilot1_filtered));
corr1(2,:) = fftconv(DATA_base(2,:),fliplr(pilot1_filtered));
corr1(3,:) = fftconv(DATA_base(3,:),fliplr(pilot1_filtered));
corr1(4,:) = fftconv(DATA_base(4,:),fliplr(pilot1_filtered));
corr3 = fftconv(DATA_base(1,:),fliplr(pilot3_filtered));
toc

delta = MSEQ_LENGTH*RX_NSAMP;
index_max_RX1 = find(abs(corr3(1,:)) == max(abs(corr3(1,:))))-delta;

          figure;
        plot(abs(corr1(1,:)));
        new_DATA_base=DATA_base;

       %% 보정후 작업
       for i = 1: 19
           new_DATA_base(1,CC2(1,i)+1:CC2(1,i+1))=DATA_base(1,CC2(1,i)+1:CC2(1,i+1))*exp(1i*pi*abs(ha1*i)/180);
       end
       
       for i = 21:39
           new_DATA_base(1,CC2(1,i)+1:CC2(1,i+1))=DATA_base(1,CC2(1,i)+1:CC2(1,i+1))*exp(1i*pi*abs(ha1*(i-20))/180);
       end       
       new_corr111(1,:) = fftconv(new_DATA_base(1,:),fliplr(pilot1_filtered));
       figure;
        plot(abs(new_corr111(1,:)));
        title('new-version peak point')
        
        % change_corr1 : error_solution, change_corr11 : error_solution2
        
       max_change_corr1=sqrt((real(new_corr111(1,C(1,1))))^2+(imag(new_corr111(1,C(1,1))))^2);
       hit_point=1;
       for iqi=1:length(C)
        max=sqrt((real(new_corr111(1,C(1,iqi))))^2+(imag(new_corr111(1,C(1,iqi))))^2);
        if max>max_change_corr1
            hit_point=iqi;
            max_change_corr1=max;
        end
       end
     
       %%
       for tx = 1:1 % TX
            for rx = 1:1 % RX
                index_min = CC2(1,hit_point);
                %H(4*(tx-1)+rx,:) = new_corr111(rx,[index_min-delta/2:index_min+delta/2]);
                H(4*(tx-1)+rx,:) = fftshift(fft(new_corr111(rx, index_min-delta/2:index_min+delta/2)));
                 %subplot(1,4,4*(tx-1)+rx);
                 figure
                 plot([1:length(H)],abs(H(4*(tx-1)+rx,:)))
                 %plot([1:length(H)], fftshift(fft(H(4*(tx-1)+rx,:))));
                 %plot([1:length(H)], (fft(H(4*(tx-1)+rx,:))));
                 %hoho=(fft(H(4*(tx-1)+rx,:)));
                 %plot([1:length(H)], (fft(H(4*(tx-1)+rx,:))));
            end % rx
       end % tx
        data_out=H;
        csvwrite('typeA.csv',[real(H(1,:)); imag(H(1,:))])
        %csvwrite('without_IF3_RF3.csv',[real(H(1,:)); imag(H(1,:))])
        %clear 'corr1'
%         save([pathname,'corr\',num2str(count),'_corr'], 'H'); % H라는 variable의 값을 숫자_corr이라는 이름으로 저장함.e
end