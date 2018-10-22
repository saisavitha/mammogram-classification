function [Prepared_Set] = Prepare_Feature_Set(Mat_Val)
 

 
Size_Val(size(Mat_Val, 1))= 0;
Param1 = 0; 
Param2 = 0; 
Param3 = 0;
Param4 = 0;
 
Level_Val = (size(Mat_Val, 1)^2);
 
for i = 1:size(Mat_Val, 1)
    
    for j = 1:size(Mat_Val, 2)
        
        Size_Val(abs(i - j) + 1) = Size_Val(abs(i - j) + 1) + double(Mat_Val(i, j));     
    
    end
    
end
 
clear i
 
for i = 1:size(Mat_Val, 1)
    
    Param1 = Param1 + (Size_Val(i)^2)/Level_Val;
    
    Param2 = Param2 + ((i - 1)^2)*Size_Val(i)/Level_Val;
    
    Param4 = Param4 + (i - 1)*Size_Val(i)/Level_Val;
    
    if ~(Size_Val(i) == 0)
        
        Param3 = Param3 - (Size_Val(i)/Level_Val)*log10(Size_Val(i)/Level_Val);
    
    end
    
end


Prepared_Set_Label = ['Parameter1 ','Parameter2 ','Parameter3 ', 'Parameter4 '];

Prepared_Set=[Param1, Param2, Param4, Param3];
