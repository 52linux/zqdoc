@echo off
rem ��tcp �� tce ���ĵ�ɨ�赥ҳ,����Ϊ tcp0.pdf �� tce0.pdf (1-9����) 
rem ����Ƭ����photoĿ¼
rem ���ռ�������Ϊ ���ռ���.pdf 
 

set proj_date=20161219
set proj_name=��������
set tcp=0123456789XuZ
set tce=0123456789


set tcpgd=%proj_date%-%tcp%.pdf
set tcegd=%proj_date%-%tce%.pdf

set tcpgd_cn=%proj_date%-%tcp%-%proj_name%-TCP����.pdf
set tcegd_cn=%proj_date%-%tce%-%proj_name%-TCE����.pdf


set photo_dir=%proj_date%-%tcp%-%proj_name%-��Ƭ

if %processor_architecture%==x86  set zip=7zip\app\7-Zip\7z.exe
if %processor_architecture%==x64  set zip=7zip\app\7-Zip64\7z.exe
set pdftk=pdftk\App\pdftkbuilder\pdftk.exe



%pdftk% tcp*.pdf cat output %tcpgd%  dont_ask   
%pdftk% tce*.pdf cat output %tcegd%  dont_ask   
move/Y %tcpgd% %tcpgd_cn% 
move/Y %tcegd% %tcegd_cn%  
if exist photo move/Y  photo  %photo_dir%  
%zip% a -y %photo_dir%.zip %photo_dir% 
if exist ���ռ���.pdf move/Y ���ռ���.pdf %proj_date%-%tcp%-%proj_name%-���ռ���.pdf  



 