function[ds] = read_tektronix_csv( filename )
%READ_TEKTRONIX_CSV Reads an tektronix oscilloscope .CSV file into a struct
%
%   DATA = READ_TEKTRONIX_CSV(FILENAME) returns a struct as DATA with all
%   parameters read from the file with FILENAME. Each parameter read from
%   the file becomes a field in the struct, with the time and samples
%   vectors stored as TIME and VALUES.
%   TIME and VALUES are converted and stored as double with STR2DOUBLE.
%   Setup parameters are converted to double. If STR2DOUBLE returns NAN
%   for a particular parameter, its value is stored as a string.
%
%   Example usage:
%   data = read_tektronix_csv('F0000CH1.CSV');
%   plot(data.time, data.values)
%   xlabel(data.Horizontal_Units)
%   ylabel(data.Vertical_Units)
%   title(data.Source)
%   
%   Discover additional parameters with: fieldnames(data) or disp(data)
%
%   Notes: Spaces in setup parameters are replaced with underscores to form
%          valid struct fieldnames.
%          Multi-channel captures are stored/read from separate files.

%   Tested with files created on a TDS2000 series Tektronix Oscilloscope
%   File format:
%   column 1 contains headers for the setup parameters, where
%   colunm 2 contains the setup values
%   column 3 is empty
%   column 4 is the time vector (relative to the trigger)
%   column 5 is the samples vector
%
%   Created by W VISSER, DECEMBER 2013

[fid message] = fopen(filename);
if fid <0
    error(['Unable to open file: ' message]);
    return;
end

%build data_struct
line = 0;
ds.time = zeros(2500,1);    % pre-allocate the default amount of space
ds.values = zeros(2500,1);  % for speed improvements

%read each line from the file, one by one
while 1
    s = fgetl(fid);
    %break at EOF
    if ~ischar(s),   break,   end;
    line = line + 1;
    % break string into columns
    [c1, remain] = strtok(s, ',');   
    [c2, remain] = strtok(remain, ',');   
    [c3, remain] = strtok(remain, ',');   
    [c4, remain] = strtok(remain, ',');   
    [c5, remain] = strtok(remain, ',');   
    
    if ~isempty(c1)
        % convert to number if possible
        temp = str2double(c2);
        if ~isnan(temp)
            c2 = temp;
        end
        ds.(strrep(c1, ' ','_')) = c2;
    end
    if ~isempty(c3)
        warning('unexpected data in column 3 at line %d: %s',line, c3)
    end
    ds.time(line) = str2double(c4);
    ds.values(line) = str2double(c5);
    if ~isempty(remain)
        warning('unexpected data after column 5 at line %d: %s',line, c3)
    end
end
% if for some reason, the file contains less than the pre-allocated default
% amount of samples, trim the vectors. The vectors will auto-grow if needed
if line < 2500
    ds.time = ds.time(1:line);
    ds.values = ds.values(1:line);
end

function [token, remain] = strtok(str, del)
%STRTOK Nested function override MATLAB built-in strtok.
% Does not group consecutive delimiters as one delimiter,
% so that empty tokens are returned as an empty string
    k = strfind(str,del);
    if k>0
        token = str(1:k-1);
        remain = str(k+1:end);
    else
        token = str;
        remain = '';
    end
end
end