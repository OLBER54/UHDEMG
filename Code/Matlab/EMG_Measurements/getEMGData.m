function Cdata = getEMGData(filename,offsetStart,offsetEnd)
  fname = filename;
  fid = fopen(fname, "r");
  if (fid < 0), error("Cannot open %s", fname); end

  % Read all lines
  lines = {};
  k = 0;
  while (!feof(fid))
    s = fgetl(fid);
    if (!ischar(s)), break; end
    k++; lines{k,1} = s;
  end
  fclose(fid);

  % Detect delimiter from header (comma vs semicolon)
  hdr = lines{1};
  if (numel(strfind(hdr, ";")) > numel(strfind(hdr, ",")))
    delim = ";";
  else
    delim = ",";
  end

  % Split into cells
  rows = cellfun(@(x) strsplit(x, delim), lines, "UniformOutput", false);

  % Make it a rectangular cell matrix (pads missing fields)
  nrows = numel(rows);
  ncols = max(cellfun(@numel, rows));
  C = cell(nrows, ncols);
  C(:) = {""};
  for i = 1:nrows
    r = rows{i};
    C(i, 1:numel(r)) = r;
  end

  % Remove header if you want:
  header = C(1:2,:);
  Cdata  = C(offsetStart:end-offsetEnd,:);
end

