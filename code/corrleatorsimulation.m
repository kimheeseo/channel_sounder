clear all
clc
load('1.mat')
data_in=data;
RANGE=0.1;
data_type=1;

MSEQ_LENGTH =2^10-1;
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
pilot3 = [MSEQ MSEQ MSEQ];

% upsampling
pilot1_up = zeros(1, MSEQ_LENGTH*RX_NSAMP);
pilot1_up(1:RX_NSAMP:RX_NSAMP*MSEQ_LENGTH) = pilot1;
pilot3_up = zeros(1, 3*MSEQ_LENGTH*RX_NSAMP);
pilot3_up(1:RX_NSAMP:3*RX_NSAMP*MSEQ_LENGTH) = pilot3;

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

% RX1
        if index_max_RX1-(9+1)*delta > 0 && index_max_RX1+(9+1)*delta < length(corr1(1,:))
        elseif index_max_RX1-(9+1)*delta < 0
            ss_index_max_RX1 = [index_max_RX1+(15-1/2)*delta:index_max_RX1+(15+1/2)*delta];
            index_max_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_max_RX1))));
        elseif index_max_RX1+(9+1)*delta > length(corr1(1,:))
            ss_index_max_RX1 = [index_max_RX1-(15+1/2)*delta:index_max_RX1-(15-1/2)*delta];
            index_max_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_max_RX1))));
        end
        
        ss_index_peak1_RX1 = [index_max_RX1-ceil((9+1/3)*delta):index_max_RX1-ceil((9-1/3)*delta)];
        ss_index_peak2_RX1 = [index_max_RX1-ceil((6+1/3)*delta):index_max_RX1-ceil((6-1/3)*delta)];
        ss_index_peak3_RX1 = [index_max_RX1-ceil((3+1/3)*delta):index_max_RX1-ceil((3-1/3)*delta)];
        ss_index_peak4_RX1 = [index_max_RX1+ceil((3-1/3)*delta):index_max_RX1+ceil((3+1/3)*delta)];
        ss_index_peak5_RX1 = [index_max_RX1+ceil((6-1/3)*delta):index_max_RX1+ceil((6+1/3)*delta)];
        ss_index_peak6_RX1 = [index_max_RX1+ceil((9-1/3)*delta):index_max_RX1+ceil((9+1/3)*delta)];
        
        index_peak1_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_peak1_RX1))));
        index_peak2_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_peak2_RX1))));
        index_peak3_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_peak3_RX1))));
        index_peak4_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_peak4_RX1))));
        index_peak5_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_peak5_RX1))));
        index_peak6_RX1 = find(abs(corr1(1,:)) == max(abs(corr1(1,ss_index_peak6_RX1))));
        
        ss_index_peak_RX1 = [index_peak1_RX1 index_peak2_RX1 index_peak3_RX1 index_peak4_RX1 index_peak5_RX1 index_peak6_RX1];
        switch find(abs(corr1(1,ss_index_peak_RX1)) == min(abs(corr1(1,ss_index_peak_RX1))))
            case 1
                index_max1_RX1 = index_peak2_RX1;
                index_max2_RX1 = index_peak3_RX1;
                index_max3_RX1 = index_max_RX1;
                index_max4_RX1 = index_peak4_RX1;
            case 2
                index_max1_RX1 = index_peak3_RX1;
                index_max2_RX1 = index_max_RX1;
                index_max3_RX1 = index_peak4_RX1;
                index_max4_RX1 = index_peak5_RX1;
            case 3
                index_max1_RX1 = index_max_RX1;
                index_max2_RX1 = index_peak4_RX1;
                index_max3_RX1 = index_peak5_RX1;
                index_max4_RX1 = index_peak6_RX1;
            case 4
                index_max1_RX1 = index_peak1_RX1;
                index_max2_RX1 = index_peak2_RX1;
                index_max3_RX1 = index_peak3_RX1;
                index_max4_RX1 = index_max_RX1;
            case 5
                index_max1_RX1 = index_peak2_RX1;
                index_max2_RX1 = index_peak3_RX1;
                index_max3_RX1 = index_max_RX1;
                index_max4_RX1 = index_peak4_RX1;
            case 6
                index_max1_RX1 = index_peak3_RX1;
                index_max2_RX1 = index_max_RX1;
                index_max3_RX1 = index_peak4_RX1;
                index_max4_RX1 = index_peak5_RX1;
        end
        index_max(1,:) = [index_max1_RX1 index_max2_RX1 index_max3_RX1 index_max4_RX1];
        
        ss_index_max1 = [index_max1_RX1-delta/2:index_max1_RX1+delta/2];
        ss_index_max2 = [index_max2_RX1-delta/2:index_max2_RX1+delta/2];
        ss_index_max3 = [index_max3_RX1-delta/2:index_max3_RX1+delta/2];
        ss_index_max4 = [index_max4_RX1-delta/2:index_max4_RX1+delta/2];
        
        % RX2
        index_max1_RX2 = find(abs(corr1(2,:)) == max(abs(corr1(2,ss_index_max1))));
        index_max2_RX2 = find(abs(corr1(2,:)) == max(abs(corr1(2,ss_index_max2))));
        index_max3_RX2 = find(abs(corr1(2,:)) == max(abs(corr1(2,ss_index_max3))));
        index_max4_RX2 = find(abs(corr1(2,:)) == max(abs(corr1(2,ss_index_max4))));
        index_max(2,:) = [index_max1_RX2 index_max2_RX2 index_max3_RX2 index_max4_RX2];
        
        % RX3
        index_max1_RX3 = find(abs(corr1(3,:)) == max(abs(corr1(3,ss_index_max1))));
        index_max2_RX3 = find(abs(corr1(3,:)) == max(abs(corr1(3,ss_index_max2))));
        index_max3_RX3 = find(abs(corr1(3,:)) == max(abs(corr1(3,ss_index_max3))));
        index_max4_RX3 = find(abs(corr1(3,:)) == max(abs(corr1(3,ss_index_max4))));
        index_max(3,:) = [index_max1_RX3 index_max2_RX3 index_max3_RX3 index_max4_RX3];
        
        % RX4
        index_max1_RX4 = find(abs(corr1(4,:)) == max(abs(corr1(4,ss_index_max1))));
        index_max2_RX4 = find(abs(corr1(4,:)) == max(abs(corr1(4,ss_index_max2))));
        index_max3_RX4 = find(abs(corr1(4,:)) == max(abs(corr1(4,ss_index_max3))));
        index_max4_RX4 = find(abs(corr1(4,:)) == max(abs(corr1(4,ss_index_max4))));
        index_max(4,:) = [index_max1_RX4 index_max2_RX4 index_max3_RX4 index_max4_RX4];
        plot(abs(corr1(1,:)))
