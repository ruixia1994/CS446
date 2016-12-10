% Construct
layers = [imageInputLayer([28 28 1],'Normalization','none');
convolution2dLayer(5,20,'NumChannels',1);
reluLayer();
maxPooling2dLayer(2,'Stride',2);
fullyConnectedLayer(4); % output 7 for 100 characters?4 for 10 characters
softmaxLayer();
classificationLayer()];


%Initialize 
layers(5).Weights = randn([10 2880])*0.0001;
layers(5).Bias = randn([10 1])*0.0001+1;

%Define options
options = trainingOptions('sgdm','MaxEpochs',20,'InitialLearnRate',0.001)

%Train
trainedNet = trainNetwork(XTrain,YTrain,layers,options) 

%Test
[Ypred,scores] = classify(net,XTest)

%Evaluate
accuracy = sum(YTest == Ypred)/numel(YTest)
% %Confusion Matrix
% targets(:,1)=(TTest=='A');
% targets(:,2)=(TTest=='B');
% targets(:,3)=(TTest=='C');
% outputs(:,1)=(YTest=='A');
% outputs(:,2)=(YTest=='B');
% outputs(:,3)=(YTest=='C');
% 
% plotconfusion(double(targets'),double(outputs'))
