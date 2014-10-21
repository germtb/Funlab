function points = LoopInput(message)
    list = List([]);
    while(true)
        point = input([message ' (or click enter to exit loop)\n']);
        if (isempty(point))
            break;
        else
            list.Add(point);
        end
    end
    points = list.array;
end

