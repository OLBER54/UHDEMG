filename = 'binary_save_file.dat';
fid = fopen(filename, 'r');

s = dir(filename);
filesize = s.bytes;

% allocate space to read the entire file
data = zeros(filesize, 1, 'uint8');

% read the entire file
data = fread(fid, filesize, 'uint8=>uint8');
fclose(fid);

% convert the remaining data from bytes to 2-byte unsigned integers
data = typecast(data, 'uint16');
swapbytes(data);

% convert uint16 datatype to double datatype
data = double(data);

L = length(data);

data = reshape(data, 46, L/46);

timestamp = data(1,:)';
amplifier_data = data(2:33,:)';
auxiliary_data = data(34:36,:)';
boardADC_data = data(37:44,:)';
TTLin = data(45,:)';
TTLout = data(46,:)';