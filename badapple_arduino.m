obj=VideoReader('E:/badapple/badapple_1.mp4');%��ȡ��Ƶ
framecount=obj.NumberOfFrames;%��ȡ��֡��
fid=fopen('E:/badapple/arduino.bin','ab');%��������ļ�
for u=0:framecount%ѭ������ÿһ֡
    disp(u);
    frame=imresize(read(obj,u),[64,85]);%��ȡ��ǰ֡ͼ�񣬲�ѹ����85x64
    data_bin=frame(:,:,1)>127;%��ֵ��ͼ��
    data_bin=data_bin(:);%תΪ������
    len=length(data_bin);%��ȡ����������
    %һ���ֽ���8λ�����Կ��Ҫ��8�ı�����������85��Ҫ��3��0
    str=num2str(reshape([reshape(data_bin,64,len/64),zeros(64,3)]',8,(64*3+len)/8)');
     res=bin2dec(str);
     fwrite(fid,res,'uchar');
%      image(frame);%��image������ͼ
%      axis image off%���ֿ�߱ȣ�������������
%      getframe;%��ʾ���浽��Ļ
end
fclose(fid);