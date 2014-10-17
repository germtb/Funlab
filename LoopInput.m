function points = LoopInput( )
    points = [];
    while(true)
        point = input('Add data (click enter to exit loop)\n');
        if (isempty(point))
            break;
        else
            points = [points;point];
        end
    end
end

