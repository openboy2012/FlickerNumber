# FlickerNumber
flicker number like alipay use UILabel category

##Effect 1
![](http://ipa-download.qiniudn.com/flicke a format number.gif)  
##Effect 2
![](http://ipa-download.qiniudn.com/flicker a attribute number.gif)  
##Effect 3
![](http://ipa-download.qiniudn.com/flicker a float number.gif)  
##Effect 4
![](http://ipa-download.qiniudn.com/flicker a integer number.gif)  

How to use
----
1.pod search FlickerNumber.  
2.clone the master then copy the files in Classes document to your project.  

import the header 'UILabel+FlickerNumber.h'  
you can use any category methods in initilized UILabel.you will see the the flicker number effect.  
the category method support format string & attributed text; e.g. 'dd_setNumber:format:' & 'dd_setNumber:attributes:';  
you can also control the flicker duration time; e.g. 'dd_setNumber:duration:'.  

中文解释
====
闪动的数字用UILabel的分类实现

如何使用
----
1.用Pod搜索FlickerNumber。  
2.克隆该项目master到本地，然后复制项目中的Classes的Category文件到你的项目中去。  

导入头文件‘UILabel+FlickerNumber’；  
使用分类中的扩展方法以后你就可以看到闪动的数字了，类似支付宝的余额宝的闪动数字。   
本工具支持格式化数字显示和属性字符串处理，例如 “dd_setNumber:format:” 和 “dd_setNumber:attributes:”方法；  
当然也可以控制闪动的持续时间，例如 “dd_setNumber:duration:”。  

LICENSE(软件许可)
====

Copyright (c) 2015 FlickerNumber <dongjia_9251@126.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
