file_path = '/media/jiashu/Data/Peal_Test/2/';% 图像文件夹路径
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有png格式的图像
img_num = length(img_path_list);%获取图像总数量
targetPath = '/media/jiashu/Data/Canny/Test/';
if img_num > 0 %有满足条件的图像
    for j = 1:img_num %逐一读取图像
        num=1;
        image_name = img_path_list(j).name;% 图像名
        image = imread(strcat(file_path,image_name));
        fprintf('%s\n',strcat(file_path,image_name));% 显示正在处理的图像名
        targetfile = strcat(targetPath,image_name);
        fprintf('%s\n',targetfile);
        imwrite(1-edge(imgaussfilt(rgb2gray(imread(strcat(file_path,image_name))), 2),'Canny'),targetfile);
    end
end