% List inherits from enumerable, but is a mutable class. It is prefered in 
% situations where a collection should change oftenly.
classdef List < Enumerable

    methods
        
        function list = List(array)
            list = list@Enumerable(array);
        end
        
        function Add(obj,items)
            obj.array = [obj.array,items];
        end
        
        function item = Get(obj,index)
            item = (obj.array(index));
        end
        
        function Remove(obj,index)
            if (index == 1)
                obj.array = obj.array(2:obj.Count());
            elseif(index == obj.Count())
                obj.array = obj.array(1:obj.Count()-1);
            else
                obj.array = [obj.array(1:index-1),obj.array(index+1:obj.Count())];
            end
        end
        
        function enumerable = ToEnumerable(obj)
            enumerable = Enumerable(obj.array);
        end
        
    end
    
end

