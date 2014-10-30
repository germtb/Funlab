% Enumerable is an immutable functional collection appropiate for querying
% and calculations.
classdef Enumerable < handle

    
  
    properties(GetAccess = public, SetAccess = protected)
        array
    end
    
	
	
    methods(Static)  
        
        function Enum = Empty()
            Enum = Enumerable([]);
        end
        
    end
    
    methods
    
        function Enum = Enumerable(array)
           Enum.array = array; 
        end
        
        function count = Count(obj) 
            count = numel(obj.array);
        end
        
        function ForEach(obj,f)
            for i = 1:obj.Count()
                f(obj.array(i))
            end    
        end
        
%       Hic sunt dracones
        function E = Map(obj,f)
            tempList = List([]);
            for i = 1:obj.Count()
               tempList.Add(f(obj.array(i)));
            end
            E = tempList.ToEnumerable();
        end
        
        function acc = Reduce(obj,f,initialValue)
            acc = initialValue;
            for i = 1:obj.Count()
                acc = f(acc,obj.array(i));
            end
        end
        
        function Enum = Filter(obj,predicate)
            list = List([]);
            obj.ForEach(@(i) If(predicate(i),@() list.Add(i)));
            Enum = list.ToEnumerable();
        end
        
        function E = Concat(obj,item)
           E = Enumerable([obj.array,item]);
        end
        
        function result = All(obj,f)
            And = @(b1,b2) b1 && b2;
            result = obj.Map(f).Reduce(And,true);
        end
        
        function result = Any(obj,f)
            Or = @(b1,b2) b1 || b2;
            result = obj.Map(f).Reduce(Or,false);
        end
        
        function result = ToArray(obj)
            result = obj.array;
        end
        
        function result = Average(obj)
            result = obj.Reduce(@(i,j)i+j,0.)/obj.Count();
        end
        
        function result = Sum(obj)
           result = obj.Reduce(@(i,j)i+j,0.);
        end
        
        function zip = Zip(obj,enumerable,zipFunc)
            list = List([]);
            for i = 1:obj.Count()
                list.Add(zipFunc(obj.array(i),enumerable.array(i)));
            end
            zip = list.ToEnumerable();
        end
        
        function list = ToList(obj)
            list = List(obj.array);
        end
        
        function head = Head(obj)
           head = obj.array(1);
        end
        
        function last = Last(obj)
           last = obj.array(obj.Count());
        end
        
        function bounds = Bounds(obj)
            bounds = [obj.Head(),obj.Last()];
        end
  
    end
    
end
