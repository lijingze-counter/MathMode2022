
clear;
clc;
PathMat=[1,0,0,0,0,2,0,0,0,2;0,5,0,2,4,0,0,0,0,0;]
PathMat=PathMat'
PathMat=find(PathMat(:,1)==0)
