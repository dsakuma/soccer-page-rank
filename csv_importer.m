% Begin CSV Import ============================================================================

    % strrep is used to strip the text qualifier out of each row. This is wrapped around the
    % call to textread, which brings the comma delimited data in row-by-row, and skips the 1st row,
    % which holds column field names.
    tic;
    data = strrep(
                    textread(
                                'data_example.csv'          % File name within current working directory
                                ,'%s'               % Each row is a single string
                                ,'delimiter', '\n'  % Each new row is delimited by the newline character
                            )
                    ,'"'
                    ,''
                );

    for i = 1:length(data)
        delimpos = findstr(data{i}, ",");

        start = 1;
        for j = 1:length(delimpos) + 1,

            if j < length(delimpos) + 1,
                csvfile{i,j} = data{i}(start:delimpos(j) - 1);
                start = delimpos(j) + 1;
            else
                csvfile{i,j} = data{i}(start:end);
            end

        end
    end

    % Return summary information to user
    printf('\nCSV load completed in -> %f seconds\nm rows returned = %d\nn columns = %d\n', toc, size(csvfile)(1), size(csvfile)(2));