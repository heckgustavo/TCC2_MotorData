function rpm = get_rpm(pulses)
    fs = (1/pulses.Sample_Interval);
    rpm = tachorpm(pulses.values, fs, 'PulsesPerRev',50);
end