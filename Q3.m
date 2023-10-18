alpha = 1+mod(231,3);
[x,Fs] = audioread("instru1.wav");
m = abs(fft(x));
F = (0:length(m)-1)*Fs/length(m);
figure;
plot(F,m)
title('instru1')
xlabel("FREQUENCY");
ylabel("AMPLITUDE");
fft1 = fft(x);
l1 = length(fft1);
mag1 = abs(fft1);
freq = (0:(l1-1))*(Fs/l1);
[~,peak] = max(mag1);
fund_f1 = freq(peak);

window_length = 100; % Length of the Hamming window (samples)
overlap = 10;        % Overlap between consecutive windows (samples)
window_length_2 = 150;
fund_f = 775;
l = fund_f-40;
h = fund_f+40;
[A,B,C,D] = butter(8,[l h]/(Fs/2),"bandpass");
d1 = designfilt("bandpassiir",FilterOrder=8,HalfPowerFrequency1=l,HalfPowerFrequency2=h,SampleRate=Fs);
sos = ss2sos(A,B,C,D);
fvt = fvtool(sos);
legend(fvt,"butter")

filtered_audio = filtfilt(d1,x);
audiowrite('filtered_audio.wav', filtered_audio, Fs);
sound(filtered_audio, Fs);

% Create and plot the spectrogram

figure;
spectrogram(x, hamming(window_length), overlap);
title('Spectrogram of instru1');

figure;
[x1,Fs] = audioread("filtered_audio.wav");
spectrogram(x1, hamming(window_length), overlap);
title('Spectrogram of filtered output');
