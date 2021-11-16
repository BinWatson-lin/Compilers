# 本程序的作用的将.l（用于Lex产生.c的文件）
# 一条龙从.l生成.out文件
# 运行格式: ./x.sh <filename>.l

if [ -z $1 ]
then
		echo "x.sh <filename>"
		exit
fi

filename=$1		# 赋值号两边不能有空格
echo -e "Input file is $filename...\n"

# 判断是否是.l文件
postfix=${filename#*.}
if [ $postfix != "l" ]
then
		echo -e "ERROR:unknow file type. script terminal!\n"
		exit
fi

# flex
if [ -r $filename ]
then
		echo "flex-part:compiler $filename ..."
		flex $filename
		echo "flex-part:complete!"
fi
echo -e "\n"

#gcc
yy_file="lex.yy.c"
#str='http://www.你的域名.com/cut-string.html'
#echo ${str#*//}
filename=${filename%.l*}
echo "gcc-part:start gcc outfile is $filename ..."
gcc -o $filename $yy_file -lfl


echo -e "\n"
echo "All Done!"

# echo "Shell 传递参数实例！";
# echo "执行的文件名：$0";
# echo "第一个参数为：$1";
# echo "第二个参数为：$2";
# echo "第三个参数为：$3";
