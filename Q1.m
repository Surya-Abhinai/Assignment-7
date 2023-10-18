alpha = 1+mod(231,3);
N = 300
a = hann(N);
b= rectwin(N);
c = hamming(N);
figure;
plot(a)
title("hanning")
xlabel("sample index")
ylabel("magnitude")
figure;
plot(b)
title("rectangular")
xlabel("sample index")
ylabel("magnitude")
figure;
plot(c)
title("hamming")
xlabel("sample index")
ylabel("magnitude")
bl = hann(N);
y = abs(fftshift(fft(bl,1024)))/N;
f = ((-length(y)/2:(length(y)/2-1)))/length(y);
b = 20*log(y);
figure;
plot(f,y)
title("spectrum N = 300")
xlabel("frequency")
ylabel("magnitude")
figure;
plot(f,b)
title("bode N = 300")
xlabel("frequency")
ylabel("magnitude")
