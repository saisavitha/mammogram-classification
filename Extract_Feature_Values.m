function Feature_Values_Extracted = Extract_Feature_Values(Mat_Img)

Temp_X(256) = 0;

Temp_Y(256) = 0;

Param_Homogenity = 0; 

Param_Energy = 0; 

Param_Contrast = 0; 

Param_ASymmetry = 0; 

Param_Entropy = 0;

Param_Correlation = 0;

Param_FirstMoment = 0;

Param_SecondMoment = 0; 

Param_ThirdMoment = 0; 

Param_FouthMoment = 0; 

Total_Param_Val = sum(sum(Mat_Img));

for x1 = 1:size(Mat_Img, 1)

    for y1 = 1:size(Mat_Img, 2)

        Temp_X(x1) = Temp_X(x1) + Mat_Img(x1, y1);

        Temp_Y(y1) = Temp_Y(y1) + Mat_Img(x1, y1);

    end
    
end

Param_MeanX = mean(Temp_X);

Param_Std_DevX = std(Temp_X);

Param_MeanY = mean(Temp_Y);

Param_Std_DevY = std(Temp_Y);

for x2 = 1:size(Mat_Img, 1)

    for y2 = 1:size(Mat_Img, 2)

        Param_Homogenity = Param_Homogenity + (Mat_Img(x2, y2)/(1 + abs(x2 - y2)))/Total_Param_Val;

        Param_Energy = Param_Energy + (Mat_Img(x2, y2)*Mat_Img(x2, y2))/Total_Param_Val;

        Param_Contrast = Param_Contrast + (abs(x2 - y2)*Mat_Img(x2, y2))/Total_Param_Val;

        Param_ASymmetry = Param_ASymmetry + (abs(Mat_Img(x2, y2)- Mat_Img(y2, x2)))/Total_Param_Val;

        Param_Correlation = Param_Correlation + (x2 - Param_MeanX)*(y2 - Param_MeanY)*Mat_Img(x2, y2)/(Param_Std_DevX*Param_Std_DevY*Total_Param_Val);

        Param_FirstMoment = Param_FirstMoment + ((x2 - y2)*Mat_Img(x2, y2))/Total_Param_Val;

        Param_SecondMoment = Param_SecondMoment + (((x2 - y2)^2)*Mat_Img(x2, y2))/Total_Param_Val;

        Param_ThirdMoment = Param_ThirdMoment + (((x2 - y2)^3)*Mat_Img(x2, y2))/Total_Param_Val;

        Param_FouthMoment = Param_FouthMoment + (((x2 - y2)^4)*Mat_Img(x2, y2))/Total_Param_Val;

        if Mat_Img(x2, y2) ~= 0

            Param_Entropy = Param_Entropy - (Mat_Img(x2,y2)/Total_Param_Val)*log10(Mat_Img(x2,y2)/Total_Param_Val);

        end
        
    end
    
end

Param_ASymmetry = 1 - Param_ASymmetry;

F = struct('Homogeneity', Param_Homogenity, 'Energy', Param_Energy, 'Entropy', Param_Entropy, 'Contrast', Param_Contrast, 'Symmetry', Param_ASymmetry, 'Correlation', Param_Correlation, 'Moment1', Param_FirstMoment, 'Moment2', Param_SecondMoment, 'Moment3', Param_ThirdMoment, 'Moment4', Param_FouthMoment);

Feature_Values_Extracted = [Param_Homogenity Param_Energy Param_Entropy Param_Contrast Param_ASymmetry Param_Correlation Param_FirstMoment Param_SecondMoment Param_ThirdMoment Param_FouthMoment];