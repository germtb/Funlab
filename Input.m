function result = Input(predicate, message)
   
    result = input(message);

    while(predicate(result))
        result = input(message);    
    end
end

