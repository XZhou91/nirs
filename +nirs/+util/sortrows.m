function [sorted_var,sorted_ind] = sortrows( vars , columns )
% Preprocessor for sortrows() that handles cell entries by taking the mean
tmp_vars = vars;
num_col = length(columns);
for i = 1:num_col
    coldata = tmp_vars.(columns{i});
    if iscell(coldata)
        newcoldata = nan(size(coldata));
        for j = 1:length(newcoldata)
            newcoldata(j) = nanmean(coldata{j});
        end
        tmp_vars.(columns{i}) = newcoldata;
    end
end

[~,sorted_ind] = sortrows(tmp_vars,columns);
sorted_var = vars(sorted_ind,:);

end