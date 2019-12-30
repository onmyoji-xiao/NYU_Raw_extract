datasetDir = 'J:/NYU';
sceneName = 'bedrooms_part1/bedroom_0001';
targetDir='J:/NYU/RawData';
sceneDir =[datasetDir,'/',sceneName];

frameList = get_synched_frames(sceneDir);
n=0;
mkdir([targetDir,'/',sceneName,'/rgb']);
mkdir([targetDir,'/',sceneName,'/depth']);
for ii = 1:numel(frameList)
  imgRgb = imread([sceneDir,'/', frameList(ii).rawRgbFilename]);
  n=n+1;
  name=num2str(n);
  imwrite(imgRgb,[targetDir,'/',sceneName,'/rgb/',name, '.jpg']);
  imgDepthRaw = swapbytes(imread([sceneDir '/' frameList(ii).rawDepthFilename]));
  disp(name);
  imgDepthProj = project_depth_map(imgDepthRaw, imgRgb);

  ori_data = mat2gray(imgDepthProj);
  imwrite(ori_data,[targetDir,'/',sceneName,'/depth/',name, '.jpg'] );
 
  pause(0.01);
end
