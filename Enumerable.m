classdef Enumerable < handle

    properties(GetAccess = public, SetAccess = private)
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
        
        function E = Map(obj,f)
           E = Enumerable(arrayfun(f,obj.array));
        end
        
        function acc = Reduce(obj,f,initialValue)
            acc = initialValue;
            for i = 1:obj.Count()
                acc = f(acc,obj.array(i));
            end
        end
        
        function E = Filter(obj,predicate)
            E = Enumerable([]);
            obj.ForEach(@(i) If(predicate(i),@() E.Add(i)));
        end
        
        function Add(obj,item)
           obj.array = [obj.array,item]; 
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
            zip = Enumerable([]);
            for i = 1:obj.Count()
                zip.Add(zipFunc(obj.array(i),enumerable.array(i)));
            end
        end
                
    end
    
end
