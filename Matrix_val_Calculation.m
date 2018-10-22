function Mat_Val = Matrix_val_Calculation(Input_Img)

    Temp_X = 0;
    Temp_Y = 1;
    
    Mat_Val = zeros(256, 256); 
 
for i = 1:(size(Input_Img, 1) - Temp_X) 
    
    for j = 1:(size(Input_Img, 2) - Temp_Y)
            
        X_Val = Input_Img(i, j) + 1;
            
        Y_Val = Input_Img(i + Temp_X, j + Temp_Y) + 1;
            
        Mat_Val(X_Val, Y_Val) = Mat_Val(X_Val, Y_Val) + 1; 
    
    end
    
end
