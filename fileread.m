function [Data] = fileread(name)
    fid = fopen(name, 'r');  % Open the file
    if fid == -1
        error('Error opening file.');
    end

    % Read all data as a single column vector
    Data = fscanf(fid, '%u');
    fclose(fid);  % Close the file

    % Remove last element if it's an extra zero
    if Data(end) == 0
        Data = Data(1:end-1);
    end

    % Ensure the data length is a multiple of 9
    numRows = length(Data) / 9;
    if mod(length(Data), 9) ~= 0
        error('Data dimensions are incorrect; check file formatting.');
    end

    % Reshape into correct row-major order (first 9 values = first row, etc.)
    Data = reshape(Data, 9, numRows)'; % Transpose to match expected format
end