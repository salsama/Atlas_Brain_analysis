%-- 6/4/2025 05:32 PM --%
% تحميل البيانات
imds = imageDatastore('Data', 'LabelSource', 'foldernames');
% تقسيم البيانات إلى مجموعة تدريب واختبار
[imdsTrain, imdsTest] = splitEachLabel(imds, 0.7, 'randomized');
clc
clc
untitled2
%-- 6/4/2025 07:18 PM --%
untitled2
clc
untitled2
%-- 11/1/2025 08:19 PM --%
untitled
images.internal.nifti.niftiImage
%-- 11/1/2025 11:00 PM --%
untitled
untitled2
%-- 11/2/2025 09:59 AM --%
untitled2
%-- 11/2/2025 10:40 AM --%
untitled2
clc
untitled2
clc
addpath(genpath('/MATLAB Drive/Add-Ons/Collections/Tools for NIfTI and ANALYZE image'))
savepath
nii = load_nii('/MATLAB Drive/BNA_MPM_thr25_1.25mm.nii.gz');
view_nii(nii);
untitled2
clc
untitled2
gunzip('/MATLAB Drive/BNA_MPM_thr25_1.25mm.nii.gz')
nii = load_nii('/MATLAB Drive/BNA_MPM_thr25_1.25mm.nii');
view_nii(nii);
dir('/MATLAB Drive/BNA_MPM_thr25_1.25mm.*')
untitled2
clc
dir('/MATLAB Drive/BN_Atlas_freesurfer')
dir('/MATLAB Drive/BN_Atlas_freesurfer.zip')
unzip('/MATLAB Drive/BN_Atlas_freesurfer.zip', '/MATLAB Drive/BN_Atlas_freesurfer')
dir('/MATLAB Drive/BN_Atlas_freesurfer')
BN_Atlas_246_1mm.nii
BN_Atlas_AtlasLabels.txt
surf/
label/
img = imread('/MATLAB Drive/BN_Atlas_freesurfer/fsaverage_lh.tiff');
imshow(img);
dir('/MATLAB Drive/BN_Atlas_freesurfer')
dir('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer')
img = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh.tiff');
imshow(img);
img = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh.tiff');
imshow(img(:,:,1), []);   % عرض الطبقة الأولى كمجرد صورة رمادية
dir('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/*.tiff')
img = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_rh.tiff');
imshow(img(:,:,1), []);
title('Right Hemisphere');
dir('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/**/*.tiff')
[img, map] = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_inflated.gif', 1);
imshow(img, map);
title('Left Hemisphere Inflated Surface');
implay('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_inflated.mpg');
% السطح القشري العادي (غير المنتفخ)
[img, map] = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_pial.gif', 1);
imshow(img, map);
title('Left Hemisphere Pial Surface');
% فيديو الدوران حول السطح
implay('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_pial.mpg');
% فيديو السطح المنتفخ المتحرك
implay('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_inflated.mpg');
v = VideoReader('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_pial.mpg');
while hasFrame(v)
img = readFrame(v);
imshow(img);
title('Rotating Brain Surface');
pause(0.05);  % سرعة العرض (كل 0.05 ثانية)
end
[img, map] = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_inflated.gif', 'Frames', 'all');
imshow(img(:,:,1), map);
info = imfinfo('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_inflated.gif');
for k = 1:numel(info)
[img, map] = imread('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_inflated.gif', k);
imshow(img, map);
title(['Frame ' num2str(k)]);
pause(0.1);
end
v = VideoReader('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_pial.mpg');
while hasFrame(v)
img = readFrame(v);
imshow(img);
title('Rotating Brain Surface');
pause(0.05);  % سرعة العرض (كل 0.05 ثانية)
end
% حدد مسار الفيديو (يمكن تغييره لملف آخر مثل fsaverage_inflated.mpg)
v = VideoReader('/MATLAB Drive/BN_Atlas_freesurfer/BN_Atlas_freesurfer/fsaverage_lh_pial.mpg');
% أنشئ مجلد لحفظ الإطارات داخل MATLAB Drive
outputFolder = '/MATLAB Drive/BN_Frames';
if ~exist(outputFolder, 'dir')
mkdir(outputFolder);
end
% عداد الإطارات
frameNum = 1;
% قراءة كل إطار وحفظه كصورة منفصلة
while hasFrame(v)
img = readFrame(v);
filename = fullfile(outputFolder, sprintf('frame_%03d.png', frameNum));
imwrite(img, filename);
frameNum = frameNum + 1;
end
disp(['✅ تم استخراج ' num2str(frameNum-1) ' صورة بنجاح إلى: ' outputFolder]);
wordcloud(outputFolder(end,end));
title("outputFolder(end,end)");
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
for k = 1:length(frames)
img = imread(fullfile(frames(k).folder, frames(k).name));
imshow(img);
title(['Frame ' num2str(k)]);
pause(0.05);
end
frame_001 = imread("/MATLAB Drive/BN_Frames/frame_001.png");
frame_002 = imread("/MATLAB Drive/BN_Frames/frame_002.png");
frame_012 = imread("/MATLAB Drive/BN_Frames/frame_012.png");
frame_004 = imread("/MATLAB Drive/BN_Frames/frame_004.png");
frame_005 = imread("/MATLAB Drive/BN_Frames/frame_005.png");
frame_006 = imread("/MATLAB Drive/BN_Frames/frame_006.png");
frame_007 = imread("/MATLAB Drive/BN_Frames/frame_007.png");
frame_008 = imread("/MATLAB Drive/BN_Frames/frame_008.png");
frame_009 = imread("/MATLAB Drive/BN_Frames/frame_009.png");
frame_010 = imread("/MATLAB Drive/BN_Frames/frame_010.png");
frame_011 = imread("/MATLAB Drive/BN_Frames/frame_011.png");
frame_012_1 = imread("/MATLAB Drive/BN_Frames/frame_012.png");
frame_013 = imread("/MATLAB Drive/BN_Frames/frame_013.png");
frame_014 = imread("/MATLAB Drive/BN_Frames/frame_014.png");
frame_015 = imread("/MATLAB Drive/BN_Frames/frame_015.png");
frame_016 = imread("/MATLAB Drive/BN_Frames/frame_016.png");
frame_017 = imread("/MATLAB Drive/BN_Frames/frame_017.png");
frame_018 = imread("/MATLAB Drive/BN_Frames/frame_018.png");
frame_019 = imread("/MATLAB Drive/BN_Frames/frame_019.png");
frame_020 = imread("/MATLAB Drive/BN_Frames/frame_020.png");
frame_021 = imread("/MATLAB Drive/BN_Frames/frame_021.png");
frame_022 = imread("/MATLAB Drive/BN_Frames/frame_022.png");
frame_023 = imread("/MATLAB Drive/BN_Frames/frame_023.png");
frame_024 = imread("/MATLAB Drive/BN_Frames/frame_024.png");
frame_025 = imread("/MATLAB Drive/BN_Frames/frame_025.png");
frame_026 = imread("/MATLAB Drive/BN_Frames/frame_026.png");
frame_027 = imread("/MATLAB Drive/BN_Frames/frame_027.png");
frame_028 = imread("/MATLAB Drive/BN_Frames/frame_028.png");
frame_029 = imread("/MATLAB Drive/BN_Frames/frame_029.png");
frame_030 = imread("/MATLAB Drive/BN_Frames/frame_030.png");
frame_031 = imread("/MATLAB Drive/BN_Frames/frame_031.png");
frame_032 = imread("/MATLAB Drive/BN_Frames/frame_032.png");
frame_033 = imread("/MATLAB Drive/BN_Frames/frame_033.png");
frame_034 = imread("/MATLAB Drive/BN_Frames/frame_034.png");
frame_035 = imread("/MATLAB Drive/BN_Frames/frame_035.png");
dir('/MATLAB Drive/**/frame_*.png')
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
% اختيار إطار معين للتحليل (مثلاً الإطار رقم 40)
img = imread(fullfile(frames(40).folder, frames(40).name));
gray = rgb2gray(img);       % تحويل إلى صورة رمادية
% تحسين التباين
gray = imadjust(gray);
% استخراج الحواف (edges)
edges = edge(gray, 'Canny');
% عرض النتائج
figure;
subplot(1,2,1);
imshow(gray);
title('Original Grayscale Frame');
subplot(1,2,2);
imshow(edges);
title('Detected Brain Edges (Canny)');
stepz(frameNum(end,end),'ctf');
ylabel("frameNum(end,end)");
title("frameNum(end,end)");
legend("show");
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
% اختيار إطار معين للتحليل (مثلاً الإطار رقم 40)
img = imread(fullfile(frames(40).folder, frames(40).name));
gray = rgb2gray(img);       % تحويل إلى صورة رمادية
% تحسين التباين
gray = imadjust(gray);
% استخراج الحواف (edges)
edges = edge(gray, 'Canny');
% عرض النتائج
figure;
subplot(1,2,1);
imshow(gray);
title('Original Grayscale Frame');
subplot(1,2,2);
imshow(edges);
title('Detected Brain Edges (Canny)');
bw = imfill(edges, 'holes');           % ملء المناطق المغلقة
labeled = bwlabel(bw);                % ترقيم كل منطقة
stats = regionprops(labeled, 'Area', 'Centroid', 'Perimeter');
% عرض بعض الإحصاءات
disp(['عدد المناطق المكتشفة: ' num2str(length(stats))]);
areas = [stats.Area];
perimeters = [stats.Perimeter];
figure;
scatter(areas, perimeters, 'filled');
xlabel('Area');
ylabel('Perimeter');
title('Region Feature Distribution');
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
mean_vals = zeros(length(frames),1);
std_vals  = zeros(length(frames),1);
for k = 1:length(frames)
img = rgb2gray(imread(fullfile(frames(k).folder, frames(k).name)));
mean_vals(k) = mean(img(:));     % المتوسط العام للسطوع
std_vals(k)  = std(double(img(:))); % الانحراف المعياري (تغير الإضاءة)
end
% رسم النتائج
figure;
subplot(2,1,1);
plot(mean_vals, 'LineWidth', 2);
xlabel('Frame Number');
ylabel('Mean Intensity');
title('Average Brightness per Frame');
subplot(2,1,2);
plot(std_vals, 'LineWidth', 2, 'Color', [0.85 0.33 0.1]);
xlabel('Frame Number');
ylabel('Standard Deviation');
title('Contrast Variability per Frame');
img = imread(fullfile(frames(40).folder, frames(40).name));
gray = rgb2gray(img);
L = imsegkmeans(gray, 3);   % تقسيم الصورة إلى 3 مجموعات
imshow(label2rgb(L));
title('K-means Clustering of Brain Regions');
T = table((1:length(mean_vals))', mean_vals, std_vals, ...
'VariableNames', {'Frame','Mean_Brightness','Std_Contrast'});
writetable(T, '/MATLAB Drive/BN_Frames/Frame_Stats.xlsx');
disp('✅ تم حفظ الإحصاءات في ملف Frame_Stats.xlsx');
% قراءة كل الإطارات
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
% إنشاء مجلد لحفظ النتائج
outputFolder = '/MATLAB Drive/BN_Frames_Spatial';
if ~exist(outputFolder, 'dir')
mkdir(outputFolder);
end
for k = 1:length(frames)
% قراءة الصورة الأصلية وتحويلها إلى رمادية
img = imread(fullfile(frames(k).folder, frames(k).name));
gray = rgb2gray(img);
% استخراج الحواف باستخدام خوارزمية Canny
edges = edge(gray, 'Canny');
% تحويل النتيجة إلى صورة ملونة لسهولة العرض
edges_rgb = cat(3, uint8(edges)*255, uint8(edges)*255, uint8(edges)*255);
% إنشاء صورة مركبة: الأصل + الحواف
combined = [img, edges_rgb];
% حفظ الصورة الناتجة
filename = fullfile(outputFolder, sprintf('edges_%03d.png', k));
imwrite(combined, filename);
disp(['✅ تم إنشاء الصورة: ' filename]);
end
disp('🎉 تم إنشاء جميع صور الحواف بنجاح!');
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
outputFolder = '/MATLAB Drive/BN_Frames_Kmeans';
if ~exist(outputFolder, 'dir')
mkdir(outputFolder);
end
for k = 1:length(frames)
img = imread(fullfile(frames(k).folder, frames(k).name));
gray = rgb2gray(img);
% تطبيق خوارزمية K-means لتقسيم الصورة إلى 3 مناطق
L = imsegkmeans(gray, 3);
% تحويل النتيجة إلى صورة ملونة
seg_img = label2rgb(L);
% حفظ الصورة الناتجة
filename = fullfile(outputFolder, sprintf('kmeans_%03d.png', k));
imwrite(seg_img, filename);
disp(['✅ تم إنشاء الصورة: ' filename]);
end
disp('🎉 تم إنشاء جميع صور K-means بنجاح!');
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
areas = [];
perims = [];
for k = 1:length(frames)
img = rgb2gray(imread(fullfile(frames(k).folder, frames(k).name)));
bw = imbinarize(imadjust(img));
bw = imfill(bw, 'holes');
L = bwlabel(bw);
stats = regionprops(L, 'Area', 'Perimeter');
meanArea = mean([stats.Area]);
meanPerim = mean([stats.Perimeter]);
areas(k) = meanArea;
perims(k) = meanPerim;
end
T = table((1:length(frames))', areas', perims', 'VariableNames', {'Frame','MeanArea','MeanPerimeter'});
writetable(T, '/MATLAB Drive/BN_Frames_Spatial_Stats.xlsx');
disp('📊 تم حفظ إحصاءات المناطق في ملف Excel داخل MATLAB Drive!');
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
areas = [];
perims = [];
for k = 1:length(frames)
img = rgb2gray(imread(fullfile(frames(k).folder, frames(k).name)));
bw = imbinarize(imadjust(img));
bw = imfill(bw, 'holes');
L = bwlabel(bw);
stats = regionprops(L, 'Area', 'Perimeter');
meanArea = mean([stats.Area]);
meanPerim = mean([stats.Perimeter]);
areas(k) = meanArea;
perims(k) = meanPerim;
end
T = table((1:length(frames))', areas', perims', 'VariableNames', {'Frame','MeanArea','MeanPerimeter'});
writetable(T, '/MATLAB Drive/BN_Frames_Spatial_Stats.xlsx');
disp('📊 تم حفظ إحصاءات المناطق في ملف Excel داخل MATLAB Drive!');
dir('/MATLAB Drive/**/*.xlsx')
% مجلدات الإدخال والإخراج
origFolder   = '/MATLAB Drive/BN_Frames';
edgesFolder  = '/MATLAB Drive/BN_Frames_Spatial';
kmeansFolder = '/MATLAB Drive/BN_Frames_Kmeans';
outputFolder = '/MATLAB Drive/BN_Frames_Combined';
% إنشاء مجلد الإخراج إن لم يكن موجودًا
if ~exist(outputFolder, 'dir')
mkdir(outputFolder);
end
% الحصول على قائمة الإطارات الأصلية
frames = dir(fullfile(origFolder, 'frame_*.png'));
for k = 1:length(frames)
% أسماء الملفات المقابلة في المجلدات الثلاثة
fname = sprintf('frame_%03d.png', k);
fname_edges = sprintf('edges_%03d.png', k);
fname_kmeans = sprintf('kmeans_%03d.png', k);
% قراءة الصور (مع التحقق من وجودها)
origPath   = fullfile(origFolder, fname);
edgesPath  = fullfile(edgesFolder, fname_edges);
kmeansPath = fullfile(kmeansFolder, fname_kmeans);
if isfile(origPath) && isfile(edgesPath) && isfile(kmeansPath)
orig   = imread(origPath);
edges  = imread(edgesPath);
kmeans = imread(kmeansPath);
% توحيد الأحجام إذا اختلفت (لضمان الدمج الصحيح)
targetSize = [size(orig,1), size(orig,2)];
edges  = imresize(edges, targetSize);
kmeans = imresize(kmeans, targetSize);
% دمج الصور أفقياً (صف واحد)
combined = [orig, edges, kmeans];
% حفظ النتيجة
outPath = fullfile(outputFolder, sprintf('combined_%03d.png', k));
imwrite(combined, outPath);
disp(['✅ تم إنشاء الصورة المدمجة: ' outPath]);
else
warning(['⚠️ بعض الملفات مفقودة عند الإطار رقم ' num2str(k)]);
end
end
disp('🎉 تم إنشاء جميع الصور المدمجة بنجاح في المجلد BN_Frames_Combined!');
frames = dir('/MATLAB Drive/BN_Frames_Spatial/edges_*.png');
edge_pixels = zeros(length(frames),1);
for k = 1:length(frames)
img = imread(fullfile(frames(k).folder, frames(k).name));
gray = rgb2gray(img);
edges = imbinarize(gray);
edge_pixels(k) = sum(edges(:));  % عدد النقاط الحدّية
end
plot(edge_pixels);
xlabel('Frame Number');
ylabel('Edge Pixel Count');
title('Edge Density per Frame');
frames = dir('/MATLAB Drive/BN_Frames_Kmeans/kmeans_*.png');
cluster_pixels = zeros(length(frames),3);
for k = 1:length(frames)
img = imread(fullfile(frames(k).folder, frames(k).name));
gray = rgb2gray(img);
L = imsegkmeans(gray,3);
for c = 1:3
cluster_pixels(k,c) = sum(L(:)==c);
end
end
% رسم كل cluster كمنحنى
plot(cluster_pixels);
xlabel('Frame Number');
ylabel('Pixel Count per Cluster');
legend('Cluster 1','Cluster 2','Cluster 3');
title('K-means Region Sizes across Frames');
frames = dir('/MATLAB Drive/BN_Frames/frame_*.png');
areas = zeros(length(frames),1);
perims = zeros(length(frames),1);
for k = 1:length(frames)
img = rgb2gray(imread(fullfile(frames(k).folder, frames(k).name)));
bw = imbinarize(imadjust(img));
bw = imfill(bw,'holes');
L = bwlabel(bw);
stats = regionprops(L,'Area','Perimeter');
if ~isempty(stats)
areas(k) = mean([stats.Area]);
perims(k) = mean([stats.Perimeter]);
end
end
T = table((1:length(frames))', areas, perims, ...
'VariableNames', {'Frame','MeanArea','MeanPerimeter'});
writetable(T,'/MATLAB Drive/BN_Frames_Spatial_Stats.xlsx');
plot(areas,'LineWidth',2);
xlabel('Frame'); ylabel('Mean Area');
title('Change in Brain Region Area over Time');
% ===============================
% 🔍 Full Quantitative Analysis of Brain Frames
% ===============================
% --- 0. Setup ---
inputFolder = '/MATLAB Drive/BN_Frames';
outputFolder = '/MATLAB Drive/BN_Results';
if ~exist(outputFolder, 'dir')
mkdir(outputFolder);
end
frames = dir(fullfile(inputFolder, 'frame_*.png'));
numFrames = length(frames);
% --- 1. Initialize result arrays ---
EdgePixels   = zeros(numFrames,1);
Cluster1     = zeros(numFrames,1);
Cluster2     = zeros(numFrames,1);
Cluster3     = zeros(numFrames,1);
MeanArea     = zeros(numFrames,1);
MeanPerimeter= zeros(numFrames,1);
% --- 2. Loop through each frame ---
for k = 1:numFrames
fprintf('Processing frame %d of %d...\n', k, numFrames);
% Read and convert to grayscale
img = imread(fullfile(frames(k).folder, frames(k).name));
gray = rgb2gray(img);
% === Edge Analysis ===
edges = edge(gray, 'Canny');
EdgePixels(k) = sum(edges(:));   % count of edge pixels
% === K-Means Segmentation ===
L = imsegkmeans(gray, 3);        % 3 clusters
Cluster1(k) = sum(L(:)==1);
Cluster2(k) = sum(L(:)==2);
Cluster3(k) = sum(L(:)==3);
% === Region Properties ===
bw = imbinarize(imadjust(gray));
bw = imfill(bw,'holes');
Lb = bwlabel(bw);
stats = regionprops(Lb,'Area','Perimeter');
if ~isempty(stats)
MeanArea(k) = mean([stats.Area]);
MeanPerimeter(k) = mean([stats.Perimeter]);
else
MeanArea(k) = NaN;
MeanPerimeter(k) = NaN;
end
end
% --- 3. Create results table ---
Frame = (1:numFrames)';
T = table(Frame, EdgePixels, Cluster1, Cluster2, Cluster3, ...
MeanArea, MeanPerimeter);
% --- 4. Save to Excel ---
excelFile = fullfile(outputFolder, 'BN_Frames_Analysis_Results.xlsx');
writetable(T, excelFile);
disp(['✅ Results saved to Excel: ' excelFile]);
% --- 5. Generate Plots ---
figure('Name','Quantitative Analysis','Position',[100 100 1000 800]);
subplot(3,1,1);
plot(Frame, EdgePixels, 'LineWidth',2);
title('Edge Pixel Count per Frame');
xlabel('Frame'); ylabel('Edges Count');
subplot(3,1,2);
plot(Frame, [Cluster1 Cluster2 Cluster3], 'LineWidth',2);
legend('Cluster 1','Cluster 2','Cluster 3');
title('K-means Cluster Pixel Counts');
xlabel('Frame'); ylabel('Pixel Count');
subplot(3,1,3);
yyaxis left
plot(Frame, MeanArea, 'b-', 'LineWidth',2);
ylabel('Mean Area');
yyaxis right
plot(Frame, MeanPerimeter, 'r--', 'LineWidth',2);
ylabel('Mean Perimeter');
xlabel('Frame');
title('Region Properties Across Frames');
% --- 6. Save the figure as PNG ---
saveas(gcf, fullfile(outputFolder, 'BN_Frames_Analysis_Plots.png'));
disp('📊 Plots saved as PNG in BN_Results folder.');
disp('🎉 Full quantitative analysis completed successfully!');
load T; % أو استخدم الجدول T الناتج من الكود السابق
figure;
plot(T.MeanArea, T.MeanPerimeter, 'bo', 'MarkerFaceColor','r');
xlabel('Mean Area'); ylabel('Mean Perimeter');
title('Correlation between Area and Perimeter');
grid on;
T = readtable('/MATLAB Drive/BN_Results/BN_Frames_Analysis_Results.xlsx');
figure;
plot(T.MeanArea, T.MeanPerimeter, 'bo', 'MarkerFaceColor','r');
xlabel('Mean Area');
ylabel('Mean Perimeter');
title('Correlation between Area and Perimeter');
grid on;
% ============================================
% 🎨 Full Visualization Suite for Brain Frame Analysis
% ============================================
clc; clear; close all;
% --- 0. Load Data ---
dataFile = '/MATLAB Drive/BN_Results/BN_Frames_Analysis_Results.xlsx';
if ~isfile(dataFile)
error('❌ File not found: %s', dataFile);
end
T = readtable(dataFile);
disp('✅ Data loaded successfully.');
% --- 1. Create Results Folder ---
visFolder = '/MATLAB Drive/BN_Results/Visualizations';
if ~exist(visFolder, 'dir')
mkdir(visFolder);
end
% --- 2. Correlation Plot ---
figure;
plot(T.MeanArea, T.MeanPerimeter, 'bo', 'MarkerFaceColor','r');
xlabel('Mean Area'); ylabel('Mean Perimeter');
title('Correlation between Area and Perimeter');
grid on;
saveas(gcf, fullfile(visFolder, '1_CorrelationPlot.png'));
% --- 3. Scatter Matrix ---
figure;
plotmatrix(T{:,2:end});
title('Variable Correlation Matrix');
saveas(gcf, fullfile(visFolder, '2_ScatterMatrix.png'));
% --- 4. Moving Average / Trend ---
window = 5;
moving_avg = movmean(T.MeanArea, window);
figure;
plot(T.Frame, T.MeanArea, 'Color',[0.6 0.6 0.6]);
hold on;
plot(T.Frame, moving_avg, 'r-', 'LineWidth',2);
xlabel('Frame'); ylabel('Mean Area');
title('Mean Area Trend (Moving Average)');
legend('Raw Data','Smoothed Trend');
grid on;
saveas(gcf, fullfile(visFolder, '3_MovingAverage.png'));
% --- 5. Heatmap ---
data = [T.EdgePixels, T.MeanArea, T.MeanPerimeter];
figure;
heatmap({'Edges','Area','Perimeter'}, string(T.Frame), data, 'Colormap', parula);
title('Heatmap of Quantitative Metrics across Frames');
saveas(gcf, fullfile(visFolder, '4_Heatmap.png'));
% --- 6. Histogram & Distribution ---
figure;
subplot(1,2,1);
histogram(T.MeanArea, 30);
xlabel('Mean Area'); ylabel('Count');
title('Distribution of Mean Area');
subplot(1,2,2);
histogram(T.EdgePixels, 30);
xlabel('Edge Pixels'); ylabel('Count');
title('Distribution of Edge Density');
saveas(gcf, fullfile(visFolder, '5_Histograms.png'));
% --- 7. 3D Surface Plot ---
figure;
surf([T.Cluster1 T.Cluster2 T.Cluster3]);
xlabel('Cluster'); ylabel('Frame'); zlabel('Pixel Count');
title('3D Surface of K-means Clusters');
colormap turbo;
saveas(gcf, fullfile(visFolder, '6_3DSurface.png'));
% --- 8. Parallel Coordinates Plot ---
figure;
parallelcoords(T{:,2:end}, 'Group',[], 'Labels', T.Properties.VariableNames(2:end));
title('Parallel Coordinate Plot of Brain Frame Metrics');
saveas(gcf, fullfile(visFolder, '7_ParallelCoordinates.png'));
% --- 9. Boxplot ---
figure;
boxplot([T.EdgePixels, T.MeanArea, T.MeanPerimeter], ...
'Labels',{'Edges','Area','Perimeter'});
ylabel('Value');
title('Value Distribution Comparison');
saveas(gcf, fullfile(visFolder, '8_Boxplot.png'));
% --- 10. Save Completion Message ---
disp('🎉 All visualizations created and saved successfully!');
disp(['📁 Saved in: ' visFolder]);
%-- 11/9/2025 10:48 PM --%

File > Export > Download As 

