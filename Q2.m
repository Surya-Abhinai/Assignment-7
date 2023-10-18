alpha = 1+mod(231,3);
n =21;
wn = (pi/(alpha+1))*1/pi;
b = fir1(n-1,wn,"low",hann(n));
c = fir1(n-1,wn,"low",rectwin(n));

figure;
impz(b)
title("Hanning window FIR filter")
xlabel("sample index")
ylabel("magnitude")
figure;
freqz(b)
title("bode Hanning FIR filter")
figure;
impz(c)
title("rectangular window FIR filter")
xlabel("sample index")
ylabel("magnitude")
hold on;
figure;
freqz(c)
title("bode rectangular FIR filter")
