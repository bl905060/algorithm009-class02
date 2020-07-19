学习笔记

* 高级动态规划
	* 动态规划复习（以及 递归、分治）
		* 递归
			* 人肉递归低效、很累
			* 找到最近最简单方法，将其拆解成可重复解决的问题
			* 数学归纳法思维
			* 本质：寻找重复性->计算机指令集
		* 动态规划
			* Simplifying a complicated problem by breaking it down into simpler sub-problems(in a recursive manner)
			* 分治+最优子结构：Divide & Conquer + Optimal substructure
			* 顺推形式：动态递推(顺推模版)
		* 关键点：动态规划和递归或者分治没有根本上的区别，重点在有无最优的子结构
		* 拥有共性：找到重复子问题
		* 差异性：最优子结构、中途可以淘汰次优解
	* 多种情况的动态规划的状态转移方程串讲
		* 爬楼梯问题
		* 不同路径问题
		* 打家劫舍问题
		* 最小路径和问题
		* 股票买卖问题
	* 进阶版动态规划的习题 
* 字符串
	* 字符串基础知识
	* 遍历字符串
	* 字符串比较
	* 字符串 匹配算法
		* 暴力法：O(mn)时间复杂度
		* Rabin-Karp算法：优化匹配子串，使用hash（滑动窗口方式hash函数）进行预判断加速
		* [KMP算法](https://www.bilibili.com/video/av11866460)
		* 课后了解：
			* Boyer-Moore算法
			* Sunday算法