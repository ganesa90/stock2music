function stock2music(ticker)
data = hist_stock_data('08012016','08042016',ticker,'frequency','d');
val = flipud(data.Close);
val_d = diff(val);
base_note = 42;
[music, fs] = gen_note(base_note,0.5);
midinum = base_note;
pc = ceil(100*(val_d./val(1:end-1)));
for iter = 1:length(val_d)    
    if pc(iter) < -5 || pc(iter) > 5
        pc(iter) = 5;
    end
    midinum = midinum + pc(iter);
    [note, fs] = gen_note(midinum,0.3);
    music = [music note];
end
plot(val)
soundsc(music,fs)
end