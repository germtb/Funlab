% This function simply enables the usage of 'if' in a single expression,
% making possible its use in lambda functions. 
function If( condition,f)
    if (condition)
        f()
    end
end

