 iOS_StartBackgroundTask

一般App在按下Home键被挂起后，这是App的 backgroundTimeRemaining 也就是后台运行时间大约只有3分钟，如果在退出App后，过十几二十分钟或者更长的时间再回到App，App就会回到刚打开时的状态，也就是首页。有的项目在被挂起后需要在后台运行一段时间，使有足够的时间来完成与服务器对接的操作，或者需要一直运行的需求。如果需要，则在App被挂起后，申请后台，来延长后台运行时间。
--------------------- 
作者：iOS开发-上海 
来源：CSDN 
原文：https://blog.csdn.net/jiaxin_1105/article/details/84106468 
版权声明：本文为博主原创文章，转载请附上博文链接！
