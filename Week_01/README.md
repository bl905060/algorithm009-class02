学习笔记

* 数组
	* 内存地址连续，可直接通过内存地址随机访问，时间复杂度O(1)。	* 插入、删除操作需要移动整个数组，时间复杂度O(n)。
	* 时间复杂度：
		* prepend: O(1)（正常n，可优化至1）
		* append: O(1)
		* lookup: O(1)
		* insert: O(n)
		* delete: O(n)
* 链表
	* 类型：单链表、双链表、循环（单、双）列表
	* 内存地址不连续，不能随机访问，时间复杂度O(n)。
	* 插入、删除操作只需要修改指针，时间复杂度O(1)。
	* 时间复杂度：
		* preprend: O(1)
		* append: O(1)
		* lookup: O(n)
		* insert: O(1)
		* delete: O(1)
* 跳表
	* 特殊性：链表+索引（空间换时间，可建立多极索引）
	* 插入、删除、搜索的时间复杂度均为O(logn)，插入、删除时可能会需要更新索引信息。
	* 空间复杂度：O(n)
	* 注意：其主要思想是通过升维的方式提升性能，升维提升性的思路也可以用于其他场景。
* 栈
	* 特性：先入后出（Last in - First out）
	* 时间复杂度：
		* 添加、删除：O(1)
		* 搜索：O(n)
* 队列
	* 特性：先入先出（First in - First out）
	* 时间复杂度：
		* 添加、删除：O(1)
		* 搜索：O(n)
	* 特殊类型：双端队列，优先级队列
		* 双端队列：队列+栈的结合体（Double-End Queue:Deque）
			* 特性：可分别从两端进行添加、删除操作
			* 时间复杂度：
				* 添加、删除：O(1)
				* 搜索：O(n)
		*  优先队列：内部元素保持某一种有序性（比如，大小）
			* 时间复杂度：
				* 插入：O(1)
				* 取出操作：O(logn)
			* 底层具体实现（多样、复杂）：heap、bst、avl、treap...
			* 一般性实现：bst
				* 访问、搜索、插入、删除时间复杂度：O(logn)