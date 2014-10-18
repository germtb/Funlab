function list = SplitStringBy(string,separator)
    list = List([]);
    wordBuffer = List([]);
    for i = 1:numel(string)
        if strcmp(string(i),separator)
            if wordBuffer.Count() > 0
                list.Add(List(wordBuffer.array));
                wordBuffer.Clear();
            end
        else
            wordBuffer.Add(string(i));
        end
        
        if i == numel(string) && wordBuffer.Count() > 0
            list.Add(List(wordBuffer.array));
            wordBuffer.Clear();
        end
    end
end

