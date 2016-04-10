function [x, fs] = gen_note(midinum,dur)
% Code to create a sginal for a midi note
% Code courtesy Atul Ingle - http://goo.gl/T6OWfp

% notename = cell2mat([colheaders(j), num2str(rowheaders(i))]);
freq = 8.1757989156*2^(midinum/12);
fs = 10000;
dur_zphs = ceil(freq*dur)/freq;
t = 0:1/fs:dur_zphs;
x = sin(2*pi*freq*t) + 0.3*sin(2*pi*2*freq*t) + 0.05*sin(2*pi*0.5*freq*t);
ampFac = (1 - (24/1.0621)*(log10(freq)-3.0621))*(freq <= 4000) + (freq>4000)*(4 + (3/(4-3.0621))*(log10(freq)-4));
x = x*ampFac;
end