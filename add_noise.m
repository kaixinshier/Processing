function [x, noise, h] = add_noise(s, snr, k)

N = length (s);

noise = randn(size(s));

h = fir1(31, 0.5);

noise_filt = filter(h, 1, noise);

h = randn(k, 1);

noise_filt = filter(h, 1, noise);

% h = rand(k, 1);

% d = filter(h, 1, noise);

signal_power = 1/N * sum(s .* s);

noise_power = 1/N * sum(noise_filt .* noise_filt);

noise_variance = signal_power / (10 ^ (snr/10));

noise_add = sqrt(noise_variance / noise_power) * noise_filt;

x = s + noise_add;

end