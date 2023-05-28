function z = fftconv(x, y)
z = ifft(fft([x zeros(1,length(y)-1)]).*fft([y zeros(1,length(x)-1)]));