@echo off
rem 把tcp 和 tce 的文档扫描单页,命名为 tcp0.pdf 和 tce0.pdf (1-9即可) 
rem 把照片放在photo目录
rem 拍照检查表命名为 拍照检查表.pdf 
rem 下载 7zip和pdftk

rem 修改下面４行代码 
set proj_date=20161219
set proj_name=本来生活
set tcp=0123456789XuZ
set tce=0123456789


rem 下面的代码无需修改　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


set tcpgd=%proj_date%-%tcp%.pdf
set tcegd=%proj_date%-%tce%.pdf
set tcpgd_cn=%proj_date%-%tcp%-%proj_name%-TCP工单.pdf
set tcegd_cn=%proj_date%-%tce%-%proj_name%-TCE工单.pdf
set photo_dir=%proj_date%-%tcp%-%proj_name%-照片


if %processor_architecture%==x86  set zip=7zip\app\7-Zip\7z.exe else  set zip=7zip\app\7-Zip64\7z.exe
set pdftk=pdftk\App\pdftkbuilder\pdftk.exe


rem 工单
%pdftk% tcp*.pdf cat output %tcpgd%  dont_ask   
%pdftk% tce*.pdf cat output %tcegd%  dont_ask   
move/Y %tcpgd% %tcpgd_cn% 
move/Y %tcegd% %tcegd_cn%  
rem 照片
if exist photo move/Y  photo  %photo_dir%  
if exist %photo_dir%   %zip% a -y %photo_dir%.zip %photo_dir%  
rem 拍照检查票表
if exist 拍照检查表.pdf move/Y 拍照检查表.pdf %proj_date%-%tcp%-%proj_name%-拍照检查表.pdf  

